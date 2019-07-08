/******************************************************************************
 *                        _   _           _           
 *                       | | | |_   _  __| |_ __ __ _ 
 *                       | |_| | | | |/ _` | '__/ _` |
 *                       |  _  | |_| | (_| | | | (_| |
 *                       |_| |_|\__, |\__,_|_|  \__,_|
 *                              |___/                 
 *   
 *   Multiple Controller adapter for MSX
 *   Author: Daniel Jose Viana
 *   License:GPL V2.0
 *   
 *   Versions:
 *   0.1 - 29/Jun/2019 - Basic Release
 *   
 *   Note: Code optimized for AVR
 *   
 ******************************************************************************
*/

//#define DEBUG 1


/******************************************************************************
                  _                   _                         _   
             _ __(_)_ _    __ _ _____(_)__ _ _ _  _ __  ___ _ _| |_ 
            | '_ \ | ' \  / _` (_-<_-< / _` | ' \| '  \/ -_) ' \  _|
            | .__/_|_||_| \__,_/__/__/_\__, |_||_|_|_|_\___|_||_\__|
            |_|                        |___/ 

Arduino
/AVR    Function
 0/PD0  Nintendo 64 1 wire Clock/Data
 1/PD1  TXD for serial debug             
 2/PD2  MSX Pulse input (INT0)             
 3/PD3  Dualshock ATT / SNES Latch / Shift Register Latch (Sega) 
 4/PD4  Dualshock CLK / SNES Clock / Shift Register Clock (Sega) 
 5/PD5  Dualshock CMD /            / Sega SELECT    
 6/PD6  Dualshock DATA      
 7/PD7  Dualshock ACK     
 8/PB0  MSX UP    (output)           
 9/PB1  MSX DOWN  (output)             
10/PB2  MSX LEFT  (output)             
11/PB3  MSX RIGHT (output)             
12/PB4  MSX TRGA  (output)            
13/PB5  MSX TRGB  (output)             
A0/PC0  Shift Register Data (Sega)   
A1/PC1  SNES Data   
A2/PC2  Mouse DAT           
A3/PC3  Mouse CLK           
A4/PC4  OLED display I2C SCL / WII nunchuck I2C SCL       
A5/PC5  OLED display I2C SDA / WII nunchuck I2C SDA      
*/




/******************************************************************************
 *                    _ _ _                    _           
 *                   | (_) |__  _ __ __ _ _ __(_) ___  ___ 
 *                   | | | '_ \| '__/ _` | '__| |/ _ \/ __|
 *                   | | | |_) | | | (_| | |  | |  __/\__ \
 *                   |_|_|_.__/|_|  \__,_|_|  |_|\___||___/
 *
*/

///////////////////////////////////////////////////////////////////////////////
// Common Libraries
#include <Wire.h>


///////////////////////////////////////////////////////////////////////////////
// SSD1306 Ascii library by William Greiman
// https://github.com/greiman/SSD1306Ascii
#include "SSD1306Ascii.h"
#include "SSD1306AsciiAvrI2c.h"
#define I2C_ADDRESS 0x3C // 0X3C+SA0 - 0x3C or 0x3D
SSD1306AsciiAvrI2c oled;

///////////////////////////////////////////////////////////////////////////////
// Dualshock library by Bill Porter
// https://github.com/madsci1016/Arduino-PS2X
#include <PS2X_lib.h>
PS2X ps2x; // create PS2 Controller Class
const int PSX_ATT = 3;
const int PSX_CLK = 4;
const int PSX_CMD = 5;
const int PSX_DAT = 6;
//const int PSX_ACK = 7;

///////////////////////////////////////////////////////////////////////////////
// PS/2 device library by Chris J. Kiick (Mouse/Keyboard)
// https://github.com/dpavlin/Arduino-projects/tree/master/libraries/ps2
#include <ps2.h>
#define Mouse_DAT 16   // A2
#define Mouse_CLK 17   // A3
PS2 mouse(Mouse_CLK, Mouse_DAT);// Define Arduino pins used in format: CLK , DATA


///////////////////////////////////////////////////////////////////////////////
// PS/2 mouse to MSX by NYYRIKKI 2014 
//
#define mdMOUSE             1  // 1 = Mouse (Compatibility mode)  
#define mdEXT_MOUSE         2  // 2 = Extended mouse only
#define mdEXT_MOUSE_AND_JOY 3  // 3 = Extended mouse + Joystick
#define mdMOUSE_AS_JOY      4  // 4 = Joystick
#define mdTRACKBALL         5  // 5 = Trackball
#define mdTOUCHPAD          6  // 6 = Touchpad

#define JoyPin1  8 // PB0 UP
#define JoyPin2  9 // PB1 DOWN
#define JoyPin3 10 // PB2 LEFT
#define JoyPin4 11 // PB3 RIGHT
#define JoyPin6 12 // PB4 TRIGGER A
#define JoyPin7 13 // PB5 TRIGGER B
#define JoyPin8  2 // PD2 PULSE
long time; // No C


///////////////////////////////////////////////////////////////////////////////
// Nintendo 64 device library by NicoHood
// https://www.github.com/NicoHood/Nintendo
#include "Nintendo.h"
#define N64 0   // PD0
#define GCUBE 7 // PD7
CN64Controller N64Controller(N64);// Define a N64 Controller
CGamecubeController GamecubeController(GCUBE);// Define a Gamecube Controller


///////////////////////////////////////////////////////////////////////////////
// NES/SNES reading from Digi-SNES
// https://github.com/Danjovic/Digi-Snes/blob/master/Digi-SNES.ino
const int NES_CLOCK = 3;
const int NES_LATCH = 4; 
const int NES_DATA =  15; // A1

///////////////////////////////////////////////////////////////////////////////
// Sega Genesis interface through shift register by Danjovic
const int SEGA_CLOCK  = 3;
const int SEGA_LATCH =  4;
const int SEGA_SELECT = 5;
const int SEGA_DATA =  14; // A0

#define _3B 0
#define _6B 1


///////////////////////////////////////////////////////////////////////////////
// MSX controller functions by Danjovic
#define MSX_PORT PORTB
#define MSX_DDR  DDRB

#define MSX_UP    0  // PB0
#define MSX_DOWN  1  // PB1
#define MSX_LEFT  2  // PB2
#define MSX_RIGHT 3  // PB3
#define MSX_TRGA  4  // PB4
#define MSX_TRGB  5  // PB5

//uint8_t msx_buttons  = 0xff;  // no button pressed
static volatile uint8_t msx_paddle_1_2   = 0; // Pin 1 - UP      
static volatile uint8_t msx_paddle_3_4   = 0; // Pin 1 - DOWN      
static volatile uint8_t msx_paddle_5_6   = 0; // Pin 1 - LEFT    
static volatile uint8_t msx_paddle_7_8   = 0; // Pin 1 - RIGHT    
static volatile uint8_t msx_paddle_9_10  = 0; // Pin 1 - TRIGGER A   
static volatile uint8_t msx_paddle_11_12 = 0; // Pin 1 - TRIGGER B      

///////////////////////////////////////////////////////////////////////////////
// Supported devices
enum DEVICE {
  NONE=0,
  NES,
  SNES,
  NINTENDO64,
  GAMECUBE,
  NUNCHUCK,
  SEGA3B,
  SEGA6B,
  MASTER,
  PSONE_DIGITAL,  // TODO
  DUALSHOCK,
  GUITAR,
  MOUSE,     
  EXT_MOUSE,
  EXT_MOUSE_AND_JOY,
  MOUSE_AS_JOY,
  TRACKBALL,
  TOUCHPAD  
  } ;


DEVICE Detected = NONE; 


/******************************************************************************
 *                               _                __ __  
 *                      ___  ___| |_ _   _ _ __  / / \ \ 
 *                     / __|/ _ \ __| | | | '_ \| |   | |
 *                     \__ \  __/ |_| |_| | |_) | |   | |
 *                     |___/\___|\__|\__,_| .__/| |   | |
 *                                        |_|    \_\ /_/ 
*/
void setup() {

  // AVR Specific
  // timer 1: free run, prescaler 1024
  TCCR1A = 0;  
  TCCR1B = (1<<CS12) | (1<<CS10);
  
  Wire.begin();
  Wire.setClock(400000L);
  oled.begin(&Adafruit128x64, I2C_ADDRESS);
  oled.setFont(ZevvPeep8x16);
  oled.clear();
  oled.print(" Hydra for MSX\n");
  oled.print("press \"A\" button\n");

  
  // Wait for device to be detected 
  while (! Detected ) {
    // Try NES/SNES devices
    Detected = Test_for_NES_SNES() ;
    if (Detected) break;

    // Try Nintendo64 device
    Detected = Test_for_N64() ;
    if (Detected) break;    

    // Try Gamecube device
    Detected = Test_for_Gamecube() ;
    if (Detected) break;     

    // Try WII nunchuck device
    Detected = Test_for_Nunchuck() ;
    if (Detected) break;     

    // Try SEGA devices 
    Detected = Test_for_Sega();
    if (Detected) break;

    // Try SONY devices
    Detected = Test_for_Sony();
    if (Detected) break;

    // Try PS/2 mouse
    Detected = Test_for_Mouse();
    if (Detected) break;   
 } // while (! Detected )

  oled.setRow(2);
  oled.setCol(0);  
  oled.clearToEOL();
  oled.print("Initializing..");

#ifdef DEBUG
  Serial.begin(9600);
  Serial.print("Detected:");
  Serial.println(Detected,DEC);
#endif
 
  
  } // Setup ()


/******************************************************************************
 *                        _                    __ __  
 *                       | | ___   ___  _ __  / / \ \ 
 *                       | |/ _ \ / _ \| '_ \| |   | |
 *                       | | (_) | (_) | |_) | |   | |
 *                       |_|\___/ \___/| .__/| |   | |
 *                                     |_|    \_\ /_/ 
*/

void loop() {
  switch (Detected) {
    case NES:               do_NES();
    case SNES:              do_SNES();
    case NINTENDO64:        do_N64();
    case GAMECUBE:          do_Gamecube();
    case NUNCHUCK:          do_Wii();
    case SEGA3B:            do_Genesis(_3B);
    case SEGA6B:            do_Genesis(_6B);
    case MASTER:            do_MasterSystem();
    case PSONE_DIGITAL:     do_PSX1();
    case DUALSHOCK:         do_PSX2();
    case GUITAR:            do_Guitar();
    case MOUSE:             do_mouse(mdMOUSE);    
    case EXT_MOUSE:         do_mouse(mdEXT_MOUSE);
    case EXT_MOUSE_AND_JOY: do_mouse(mdEXT_MOUSE_AND_JOY);
    case MOUSE_AS_JOY:      do_mouse(mdMOUSE_AS_JOY);
    case TRACKBALL:         do_mouse(mdTRACKBALL);
    case TOUCHPAD:          do_mouse(mdTOUCHPAD); 

    }
   // default action
  oled.setCol(0);  
  oled.clearToEOL();
  oled.print("Unknown Error"); 
  for (;;); // never return  
}



/******************************************************************************
 *                  ___ ___  _ __ ___  _ __ ___   ___  _ __  
 *                 / __/ _ \| '_ ` _ \| '_ ` _ \ / _ \| '_ \ 
 *                | (_| (_) | | | | | | | | | | | (_) | | | |
 *                 \___\___/|_| |_| |_|_| |_| |_|\___/|_| |_|                                                        
 *                  __                  _   _                 
 *                 / _|_   _ _ __   ___| |_(_) ___  _ __  ___ 
 *                | |_| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
 *                |  _| |_| | | | | (__| |_| | (_) | | | \__ \
 *                |_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
 *
*/

///////////////////////////////////////////////////////////////////////////////
// 
// Autofire Modulator
//
#define autofiremod() ((TCNT1H & 0x03)==0) // turn on/off at 7.62Hz (16MHz/1024) / 2^(3+8)
//boolean autofiremod(void) {
//  return true;
//  
//  }


///////////////////////////////////////////////////////////////////////////////
// 
// Read NES/SNES data (16 bits)
//
uint16_t Read_NES_SNES_data(void) {

  uint16_t buttons=0;
  uint8_t  i;

  // configure pins 
  pinMode(NES_CLOCK,OUTPUT);
  pinMode(NES_LATCH,OUTPUT);
  pinMode(NES_DATA,INPUT_PULLUP);
  
  digitalWrite(NES_CLOCK,HIGH);

  //latch buttons state. After latching, button B state is ready at data output
  digitalWrite(NES_LATCH, HIGH);
  delayMicroseconds(12);
  digitalWrite(NES_LATCH, LOW);
  digitalWrite(NES_CLOCK,LOW);

  for (i=0; i<16;i++) { // iterate through all bits
    // shift in a bit
    if (!digitalRead(NES_DATA)) buttons |=1; 
    buttons<<=1;
    
    // pulse clock 
    delayMicroseconds(6);
    digitalWrite(NES_CLOCK, HIGH);
    delayMicroseconds(6);
    digitalWrite(NES_CLOCK, LOW);    
  }
    
  // Return Clock signal to idle level.
  digitalWrite(NES_CLOCK,HIGH);
  delayMicroseconds(12);
  
  // return pins to float
  pinMode(NES_CLOCK,INPUT_PULLUP);
  pinMode(NES_LATCH,INPUT_PULLUP);
 
  return buttons;
  }



///////////////////////////////////////////////////////////////////////////////
//
// Read SEGA controller through CD4021 shift register
//
uint8_t Read_Sega(uint8_t sel) {

  uint8_t temp;
  // configure pins
  pinMode(SEGA_LATCH,OUTPUT);
  pinMode(SEGA_CLOCK,OUTPUT);
  pinMode(SEGA_SELECT,OUTPUT);  
  pinMode(SEGA_DATA,INPUT_PULLUP);  

  // set SELECT line level
  if (sel) digitalWrite(SEGA_SELECT,HIGH); else digitalWrite(SEGA_SELECT,LOW);

  // latch data
  digitalWrite(SEGA_LATCH,HIGH);
  delayMicroseconds(20);
  digitalWrite(SEGA_LATCH,LOW);
 
  // shift data in  
  temp = shiftIn(SEGA_DATA,SEGA_CLOCK,MSBFIRST);
  return temp;
  }


///////////////////////////////////////////////////////////////////
//
// Populate MSX
//
inline void populate_MSX(uint8_t buttons) { 
  MSX_PORT = buttons;
  MSX_DDR  = ~buttons;
  }


///////////////////////////////////////////////////////////////////
//
// Cycle paddles 
//
void cycle_MSX_paddles(void) {
  uint8_t i,j;
  uint8_t buttons = ~MSX_DDR; // save button state

  populate_MSX(0xff); // start by rising all pins 
  for (i=0;i<255;i--){
    j=0;    
    if (i<msx_paddle_1_2  ) j |= (1<<0);  
    if (i<msx_paddle_3_4  ) j |= (1<<1); 
    if (i<msx_paddle_5_6  ) j |= (1<<2);         
    if (i<msx_paddle_7_8  ) j |= (1<<3); 
    if (i<msx_paddle_9_10 ) j |= (1<<4); 
    if (i<msx_paddle_11_12) j |= (1<<5);
    populate_MSX(j);

    if (j==0) break;
    delayMicroseconds(5);
    }  // hand tune to 12us
    
    delayMicroseconds(50); // allow some time for Z80 to detect the end of timing 

    populate_MSX(buttons); 
  
  }

///////////////////////////////////////////////////////////////////
//  Mouse functions
//

// Set Mouse Speed
void MouseSpeed(char C)
{
  mouse.write(0xf3);   // Set sample rate
  mouse.read();        // ack
  mouse.write(C);      // Max sample rate
  mouse.read();        // ack
}

// Read buttons
uint8_t getmstat(void) {
  uint8_t temp;
  mouse.write(0xeb);   // give me data!
  mouse.read();        // ignore ack
  temp = mouse.read(); // Read Emulation mode from buttons
  mouse.read();        // ignore X
  mouse.read();        // ignore Y 
  return temp;
}

// Send data as a pair of nibbles to MSX - used by MOUSE routines
inline void sendMSX(char c)
// Optimized for Atmel328
// NOTE: Fixed pins!
//
//  0xf0 = 1 1 1 1.0 0 0 0      
//      &  k k k k 0 0 0 0   k = keep bits 
//         0 0 0 0/7/6/5/4  ~(c>>4)
//      |  k k k k/7/6/5/4  
{
    while (digitalRead(JoyPin8)==LOW) {if (millis()>time) return;};
    ((MSX_DDR & 0xf0) | ~(c>>4));  // high nibble

    while (digitalRead(JoyPin8)==HIGH) {if (millis()>time) return;};
    ((MSX_DDR & 0xf0) | ~(c<<4));  // low nibble
}  

// 

inline void JoyHigh()
// Optimized for Atmel328
// NOTE: Fixed pins!
{
     MSX_DDR=(MSX_DDR & 0xf0);
}



/******************************************************************************
 *                     _      _            _   _             
 *                  __| | ___| |_ ___  ___| |_(_) ___  _ __  
 *                 / _` |/ _ \ __/ _ \/ __| __| |/ _ \| '_ \ 
 *                | (_| |  __/ ||  __/ (__| |_| | (_) | | | |
 *                 \__,_|\___|\__\___|\___|\__|_|\___/|_| |_|
 *
*/

///////////////////////////////////////////////////////////////////
//
// Test NES and SNES devices
//
DEVICE Test_for_NES_SNES(void) {
  uint16_t raw_buttons;

  raw_buttons = Read_NES_SNES_data();

  if ((raw_buttons|0x00ff)  == 0x7fff) return NES;
  if ( raw_buttons == 0xff7f) return SNES;
  return NONE;
  };



///////////////////////////////////////////////////////////////////
//
// Test for Master System, 3-button and 6-button controllers
//  
DEVICE Test_for_Sega(void) {
  uint8_t temp;

  // configure SELECT pin
  pinMode(SEGA_SELECT,OUTPUT);

  // generate first rising edge, long timeout
  digitalWrite(SEGA_SELECT,LOW);
  delay(20); // Make sure internal counters have timed out
  digitalWrite(SEGA_SELECT,HIGH);

  // generate second rising edge, timeout < 1ms
  digitalWrite(SEGA_SELECT,LOW);  
  delayMicroseconds(20);  
  digitalWrite(SEGA_SELECT,HIGH);


  // with Sel=LOW after second rising edge:
  // D7 D6 D5 D4 D3 D2 D1 D0
  // x  x  B  A  RG LF DW UP  -> Master System  
  // x  x  ST A  0  0  DW UP  -> 3 Button
  // x  x  ST A  0  0  0  0   -> 6 Button
  

  // Now read data with SELECT line LOW, mask upper bits
  temp = Read_Sega(LOW) & 0x3F;
  
  // Test for 6 button model+A button // D7 D6 D5 D4 D3 D2 D1 D0    
  if (temp == 0x20 ) return SEGA6B;   // 0  0  1  0  0  0  0  0

  // Test for 3 button model+A button // D7 D6 D5 D4 D3 D2 D1 D0    
  if (temp == 0x23 ) return SEGA3B;   // 0  0  1  0  0  0  1  1

  // Test for Master Sytem + A button // D7 D6 D5 D4 D3 D2 D1 D0    
  if (temp == 0x2f ) return MASTER;   // 0  0  1  0  1  1  1  1  

  // None of the above,  
  return NONE;
  };
// end of Test_for_Sega



///////////////////////////////////////////////////////////////////  
//
// Test Dualshock and Guitar controller
//
DEVICE Test_for_Sony(void) {
  uint8_t error,temp;

  //setup GamePad(clock, command, attention, data) pins, check for error
  error = ps2x.config_gamepad(PSX_CLK,PSX_CMD,PSX_ATT,PSX_DAT);   
  if (error) return NONE; // return status <>0 means error

  
  temp = ps2x.readType();

  if (temp==1) {  // Dualshock
    ps2x.read_gamepad(false, 0); //read controller and set large motor to spin at 'vibrate' speed
    if(ps2x.Button(PSB_GREEN)) return DUALSHOCK;  // triangle is A button 
    
    } else if (temp==2) {  // Guitar
      ps2x.read_gamepad(); //read controller
      if(ps2x.ButtonPressed(GREEN_FRET)) return GUITAR; // Green fret is A button for guitar
      }

  // none of the above
  return NONE;
  };
// end of Test_for_Sony




 
///////////////////////////////////////////////////////////////////
//
// Test Nintendo 64 devices
//
DEVICE Test_for_N64(void) {
  if ( N64Controller.read()) {
    auto status = N64Controller.getStatus();
    auto report = N64Controller.getReport();
    if ((status.device!=NINTENDO_DEVICE_N64_NONE) && (report.a))
       return NINTENDO64;
    } 
  return NONE; 
  };

 
///////////////////////////////////////////////////////////////////
//
// Test Gamecube controller
//
DEVICE Test_for_Gamecube(void) {
  if ( GamecubeController.read()) {
    auto status = GamecubeController.getStatus();
    auto report = GamecubeController.getReport();
    if ((status.device!=NINTENDO_DEVICE_GC_NONE) && (report.a))
       return GAMECUBE;
    } 
  return NONE; 
  };

 
///////////////////////////////////////////////////////////////////
//
// Test Wii Nunchuck
//
DEVICE Test_for_Nunchuck(void) {
  return NONE; 
  };

///////////////////////////////////////////////////////////////////
//
// Test for PS/2 Mouse
//
DEVICE Test_for_Mouse(void) {
  uint8_t temp,mode;
  
  mouse.write(0xff);   // reset
  if (mouse.read() != 0xFA) return NONE;  // ack byte
  if (mouse.read() != 0xAA) return NONE;  // Self-test passed
  mouse.read();        // Mouse ID, ignore

  mouse.write(0xf0);   // Set remote mode
  if (mouse.read() != 0xFA) return NONE;  // ack byte

  // bit 7   6   5   4   3   2   1   0
  //     Yof Xof Ysg Xsg 1   Mid Rgt Lft

  temp = getmstat() & 0x07; // Get L+M+R button status
  mode = NONE;
  
  #define MID (1<<2)
  #define RGT (1<<1)
  #define LFT (1<<0)

 //  Mouse mode depends upon button status during detection at startup
 //  MIDDLE  RIGHT  LEFT    Mode
 //    0      0      0      NONE 
 //    0      0      1      MOUSE_COMPATIBLE
 //    0      1      0      EXTENDED_MOUSE
 //    0      1      1      EXTENDED_MOUSE_AND_JOY
 //    1      0      0      JOYSTICK
 //    1      0      1      TRACKBALL
 //    1      1      0      TOUCHPAD
 //    1      1      1      NONE 
 //

  // 
  switch (temp) {    
    case 0:       mode = NONE              ; break;
    case LFT:     mode = MOUSE             ; break; // COMPATIBLE MOUSE
    case RGT:     mode = EXT_MOUSE         ; break; 
    case LFT+RGT: mode = EXT_MOUSE_AND_JOY ; break;
    case MID:     mode = MOUSE_AS_JOY      ; break; // EMULATED JOYSTICK
    case MID+LFT: mode = TRACKBALL         ; break;
    case MID+RGT: mode = TOUCHPAD          ; break;
    }
  
  return mode;
  };



/******************************************************************************
 *                                          _   _             
 *                  _____  _____  ___ _   _| |_(_) ___  _ __  
 *                 / _ \ \/ / _ \/ __| | | | __| |/ _ \| '_ \ 
 *                |  __/>  <  __/ (__| |_| | |_| | (_) | | | |
 *                 \___/_/\_\___|\___|\__,_|\__|_|\___/|_| |_|
 *
*/

///////////////////////////////////////////////////////////////////
// 
// Master System
//
void do_MasterSystem(void) {
  uint8_t temp;
  for (;;) {
    temp = Read_Sega(HIGH);
    populate_MSX(temp);
    delay(5);
    }
  }

///////////////////////////////////////////////////////////////////
//
// Nintendo (NES)
//
void do_NES(void) {
  uint8_t NES_buttons,msx_buttons;

  for (;;) {
  // 7  6  5  4  3  2  1  0
  // A  B  ST SL UP DW LF RG
  
  NES_buttons = Read_NES_SNES_data()>>8; // Read data, take only 8 msbits
  NES_buttons = ~NES_buttons;            // make active bit=1
  
  msx_buttons = 0xff;                    // none select
  

  if (NES_buttons & (1<<7)) msx_buttons &= ~(1<<MSX_TRGA);
  if (NES_buttons & (1<<6)) msx_buttons &= ~(1<<MSX_TRGB);

  if (NES_buttons & (1<<3)) msx_buttons &= ~(1<<MSX_UP);
  if (NES_buttons & (1<<2)) msx_buttons &= ~(1<<MSX_DOWN);
  if (NES_buttons & (1<<1)) msx_buttons &= ~(1<<MSX_LEFT);
  if (NES_buttons & (1<<0)) msx_buttons &= ~(1<<MSX_RIGHT);

  // Don't activate START if either LEFT or RIGTH are activated  
  if (msx_buttons & ((1<<MSX_LEFT) | (1<<MSX_RIGHT)) ==0) {
    if (NES_buttons & (1<<5)) 
       msx_buttons &= ~((1<<MSX_LEFT) | (1<<MSX_RIGHT) ); // start
    }

  // Don't activate SELECT if either UP or DOWN are activated  
  if (msx_buttons  & ((1<<MSX_UP) | (1<<MSX_DOWN)) ==0) {
    if (NES_buttons & (1<<4)) 
       msx_buttons &= ~((1<<MSX_UP) | (1<<MSX_DOWN) ); // select
    }
   
  populate_MSX(msx_buttons);
  delay(5);
  } // for (;;)
}
 
///////////////////////////////////////////////////////////////////
//
// Super Nintendo
//
void do_SNES(void) {
  uint16_t SNES_buttons;
  uint8_t  msx_buttons;
  
  for (;;) {
  // 15 14 13 12 11 10  9  8  7  6  5  4  3  2  1  0
  // B  Y  ST SL UP DW LF RG  A  X  L  R  1  1  1  1
  
  SNES_buttons = Read_NES_SNES_data(); // read data
  SNES_buttons = ~SNES_buttons;        // make active bit=1

  msx_buttons = 0xff;                    // none select

  if (SNES_buttons & (1<<7 )) msx_buttons &= ~(1<<MSX_TRGA);  // A
  if (SNES_buttons & (1<<15)) msx_buttons &= ~(1<<MSX_TRGB);  // B

  if ((SNES_buttons & (1<<6 )) && autofiremod() ) msx_buttons &= ~(1<<MSX_TRGA);  // X
  if ((SNES_buttons & (1<<14)) && autofiremod() ) msx_buttons &= ~(1<<MSX_TRGB);  // Y

  if (SNES_buttons & (1<<11)) msx_buttons &= ~(1<<MSX_UP);    // UP
  if (SNES_buttons & (1<<10)) msx_buttons &= ~(1<<MSX_DOWN);  // DOWN
  if (SNES_buttons & (1<<9 )) msx_buttons &= ~(1<<MSX_LEFT);  // LEFT
  if (SNES_buttons & (1<<8 )) msx_buttons &= ~(1<<MSX_RIGHT); // RIGHT


  // Don't activate L shoulder if RIGTH is activated 
  if ((msx_buttons & (1<<MSX_RIGHT)) ==0) {
    if (SNES_buttons & (1<<5 )) 
       msx_buttons &= ~((1<<MSX_UP) | (1<<MSX_LEFT) ); // L Shoulder
  }

  // Don't activate R shoulder if LEFT is activated 
  if ((msx_buttons & (1<<MSX_LEFT)) ==0) {
    if (SNES_buttons & (1<<4 ))
       msx_buttons &= ~((1<<MSX_UP) | (1<<MSX_RIGHT) ); // R Shoulder
  }
  
  // Don't activate START if either LEFT or RIGTH are activated  
  if (msx_buttons & ((1<<MSX_LEFT) | (1<<MSX_RIGHT)) ==0) {
    if (SNES_buttons & (1<<5)) 
       msx_buttons &= ~((1<<MSX_LEFT) | (1<<MSX_RIGHT) ); // start
    }

  // Don't activate SELECT if either UP or DOWN are activated  
  if (msx_buttons  & ((1<<MSX_UP) | (1<<MSX_DOWN)) ==0) {
    if (SNES_buttons & (1<<4)) 
       msx_buttons &= ~((1<<MSX_UP) | (1<<MSX_DOWN) ); // select
    }
    
  populate_MSX(msx_buttons);
  delay(5);
  } // for (;;)

}

///////////////////////////////////////////////////////////////////
//
//
void do_Genesis(uint8_t mode) {

#define SEGA_SAMPLES 8    
  uint8_t sample[SEGA_SAMPLES];
  uint8_t i,msx_buttons;

  for (;;){

    // configure SELECT pin
    pinMode(SEGA_SELECT,OUTPUT);
    digitalWrite(SEGA_SELECT,HIGH);
    delay(5); // Make sure internal timers have timed out
  
    // sample controller data
    for (i=0;i<SEGA_SAMPLES;i++) {
      sample[i] = Read_Sega( (i&0x01) ); // sample toggling SEL line
      delayMicroseconds(20);  
      }
    //      bit   0  1  2  3  4  5  6  7
    // sample[0]  UP DW LO LO A  ST 1  1
    // sample[1]  UP DW LF RG B  C  1  1
    // sample[4]  LO LO LO LO A  ST 1  1 
    // sample[5]  Z  Y  X  MD HI HI 1  1
  
    msx_buttons = 0xff; // none select
  
    // fill common buttons for 3/6 buttons
    sample[0]=~sample[0]; // make active bit=1
    sample[1]=~sample[1]; // make active bit=1
  
    if (sample[0] & (1<<4)) msx_buttons &= ~(1<<MSX_TRGA);  // A
  
    if (sample[1] & (1<<0)) msx_buttons &= ~(1<<MSX_UP);    // UP
    if (sample[1] & (1<<1)) msx_buttons &= ~(1<<MSX_DOWN);  // DOWN
    if (sample[1] & (1<<2)) msx_buttons &= ~(1<<MSX_LEFT);  // LEFT
    if (sample[1] & (1<<3)) msx_buttons &= ~(1<<MSX_RIGHT); // RIGHT
  
    if (sample[1] & (1<<4)) msx_buttons &= ~(1<<MSX_TRGB);  // B
    if (sample[1] & (1<<5)) msx_buttons &= ~( (1<<MSX_TRGA) | (1<<MSX_TRGB) );  // C
  
    // Don't activate START if either LEFT or RIGTH are activated  
    if (msx_buttons & ((1<<MSX_LEFT) | (1<<MSX_RIGHT)) ==0) {
      if (sample[0] & (1<<5)) 
         msx_buttons &= ~((1<<MSX_LEFT) | (1<<MSX_RIGHT) ); // start
      }    
  
    // do 6 button specific (test again for 6 button though)  
    if ( (mode==_6B) && ((sample[4]|0xf0)==0xf0)) { 
        sample[5]=~sample[5]; // make active bit=1
        
        if ((sample[5] & (1<<2)) && autofiremod() ) msx_buttons &= ~(1<<MSX_TRGA);  // X
        if ((sample[5] & (1<<1)) && autofiremod() ) msx_buttons &= ~(1<<MSX_TRGB);  // Y
        if ((sample[5] & (1<<0)) && autofiremod() ) msx_buttons &= ~( (1<<MSX_TRGA) | (1<<MSX_TRGB) );  // Z
        
        // Don't activate MODE (SELECT) if either UP or DOWN are activated  
        if (msx_buttons  & ((1<<MSX_UP) | (1<<MSX_DOWN)) ==0) {
          if (sample[5] & (1<<3)) 
             msx_buttons &= ~((1<<MSX_UP) | (1<<MSX_DOWN) ); // select
          }
    }
  
    populate_MSX(msx_buttons);
    delay(5);
  } // for (;;)
}


///////////////////////////////////////////////////////////////////
//
//
void do_N64(void) {
  uint8_t msx_buttons;
  for (;;) {
    
    msx_buttons = 0xff; // none select

    if ( N64Controller.read()) {  // sample/check controller presence
      auto status = N64Controller.getStatus();
      auto report = N64Controller.getReport();
      if (status.device!=NINTENDO_DEVICE_N64_NONE) { 
        // fill buttons
        // Directional
        if (report.dup   ) msx_buttons &= ~(1<<MSX_UP);    // UP
        if (report.ddown ) msx_buttons &= ~(1<<MSX_DOWN);  // DOWN
        if (report.dleft ) msx_buttons &= ~(1<<MSX_LEFT);  // LEFT
        if (report.dright) msx_buttons &= ~(1<<MSX_RIGHT); // RIGHT

        // Digital Equivalent
        //  From center: up and right is positive, down and left is negative.

        // Don't activate UP if MSX DOWN is activated 
        if ((msx_buttons & (1<<MSX_DOWN)) ==0) {
          if (report.yAxis >  16 ) 
             msx_buttons &= ~(1<<MSX_UP);    // UP
             }
             
        // Don't activate DOWN if MSX UP is activated 
        if ((msx_buttons & (1<<MSX_UP)) ==0) {
          if (report.yAxis < -16 ) 
             msx_buttons &= ~(1<<MSX_DOWN);  // DOWN
             }        
        
        // Don't activate LEFT if MSX RIGHT is activated 
        if ((msx_buttons & (1<<MSX_RIGHT)) ==0) {
          if (report.xAxis < -16 ) msx_buttons &= ~(1<<MSX_LEFT);  // LEFT
             }          
        
        // Don't activate RIGHT if MSX LEFT is activated 
        if ((msx_buttons & (1<<MSX_LEFT)) ==0) {
          if (report.xAxis >  16 ) 
             msx_buttons &= ~(1<<MSX_RIGHT); // RIGHT
             }


        // Trigger buttons
        if (report.a) msx_buttons &= ~(1<<MSX_TRGA);  // A
        if (report.b) msx_buttons &= ~(1<<MSX_TRGB);  // B
        if ((report.z) && autofiremod() ) msx_buttons &= ~(1<<MSX_TRGA);  // Z

        // Shoulder buttons
        // Don't activate L shoulder if RIGTH is activated 
        if ((msx_buttons & (1<<MSX_RIGHT)) ==0) {
          if (report.l) 
             msx_buttons &= ~((1<<MSX_UP) | (1<<MSX_LEFT) ); // L Shoulder
             }
      
        // Don't activate R shoulder if LEFT is activated 
        if ((msx_buttons & (1<<MSX_LEFT)) ==0) {
          if (report.r)
             msx_buttons &= ~((1<<MSX_UP) | (1<<MSX_RIGHT) ); // R Shoulder
             }

        // C buttons
        // Don't activate C UP if MSX DOWN is activated 
        if ((msx_buttons & (1<<MSX_DOWN)) ==0) {
          if (report.cup) 
             msx_buttons &= ~((1<<MSX_TRGA) | (1<<MSX_UP) ); // C UP
             }
             
        // Don't activate C DOWN if MSX UP is activated 
        if ((msx_buttons & (1<<MSX_UP)) ==0) {
          if (report.cdown) 
             msx_buttons &= ~((1<<MSX_TRGA) | (1<<MSX_DOWN) ); // C DOWN
             }

        // Don't activate C LEFT if MSX RIGHT is activated 
        if ((msx_buttons & (1<<MSX_RIGHT)) ==0) {
          if (report.cleft) 
             msx_buttons &= ~((1<<MSX_TRGA) | (1<<MSX_LEFT) ); // C LEFT
             }
             
        // Don't activate C RIGHT if MSX LEFT is activated 
        if ((msx_buttons & (1<<MSX_LEFT)) ==0) {
          if (report.cright) 
             msx_buttons &= ~((1<<MSX_TRGA) | (1<<MSX_RIGHT) ); // C RIGHT
             }


        // START button
        // Don't activate START if either LEFT or RIGTH are activated  
        if (msx_buttons & ((1<<MSX_LEFT) | (1<<MSX_RIGHT)) ==0) {
          if (report.start) 
             msx_buttons &= ~((1<<MSX_LEFT) | (1<<MSX_RIGHT) ); // start
          } 
        

        // fill Analog values (convert to unsigned) 
        msx_paddle_5_6 = (uint8_t) (128+report.xAxis);
        msx_paddle_1_2 = (uint8_t) (128+report.yAxis);   
            
      } // if device is known
    } // if controller.read()


        
    populate_MSX(msx_buttons);
    delay(5);
    } // for (;;)
}

  
///////////////////////////////////////////////////////////////////
//
//
void do_Gamecube(void) {
  uint8_t msx_buttons;

//     Bit 7   6   5   4   3   2   1   0  
//Byte 0   0   0   0   ST  Y   X   B   A
//Byte 1   1   L   R   Z   Up  Dw  Rg  Lf
//Byte 2   Joystick X Value (8 bit)  
//Byte 3   Joystick Y Value (8 bit)
//Byte 4   C-Stick X Value (8 bit)
//Byte 5   C-Stick Y Value (8 bit)
//Byte 6   Left Button Value (8 bit) - may be 4-bit mode also?
//Byte 7   Right Button Value (8 bit) - may be 4-bit mode also?

  
  for (;;) {
    populate_MSX(msx_buttons);
    delay(5);
    } // for (;;)
}

///////////////////////////////////////////////////////////////////
//
//
void do_Wii(void) {
  uint8_t msx_buttons;
  for (;;) {
    populate_MSX(msx_buttons);
    delay(5);
    } // for (;;)
}



///////////////////////////////////////////////////////////////////
//
//
void do_PSX1(void) {
  uint8_t msx_buttons;
  for (;;) {
    populate_MSX(msx_buttons);
    delay(5);
    } // for (;;)
}
    
///////////////////////////////////////////////////////////////////
//
//
void do_PSX2(void) {
  uint8_t msx_buttons;
  for (;;) {
    populate_MSX(msx_buttons);
    delay(5);
    } // for (;;)
}
 
///////////////////////////////////////////////////////////////////
//
//
void do_Guitar(void) {
  uint8_t msx_buttons;
  for (;;) {
    populate_MSX(msx_buttons);
    delay(5);
    } // for (;;)
}
 
///////////////////////////////////////////////////////////////////
//
//
void do_mouse(uint8_t EmuMode) {
  uint8_t msx_buttons;
  char rx=0,ry=0,rz=0,scale=20,MouseID=0, TimeOut=40;
  char x=0,y=0,z=0,mx=0,my=0;
  char slx=0,sly=0;
  char olimit=60, ilimit=50, solimit=0, silimit=0, mstat=0, StatCnt=0, but34=0,lx=0,ly=0;
  int SI=0,SO=0,jx=0,jy=0;
  long time; // No C

  
  // Initialize mouse
  mouse.write(0xff);   // reset
  mouse.read();        // ack byte
  mouse.read();        // Self-test passed
  mouse.read();        // Mouse ID
  mouse.write(0xf0);   // remote mode
  mouse.read();        // ack

  // Attempt to enter Microsoft 5 button mode
  // by setting Speed sequentially at 200,200,80 cpi
  MouseSpeed(200);  
  MouseSpeed(200);
  MouseSpeed(80);


  mouse.write(0xf2);   // Get device ID
  mouse.read();        // ack
  MouseID = mouse.read(); // Mouse ID
  if (MouseID != 4) {     //Response 04 if 5-button scrolling mouse
     MouseSpeed(200);    // if fails, fall back to scrolling type
     MouseSpeed(100);    // by setting Speed sequentially at 200,100,80 cpi
     MouseSpeed(80);

     mouse.write(0xf2);        // Get device ID
     mouse.read();             // ack
     MouseID = mouse.read();   // Mouse ID
     }

  MouseSpeed(200);     // 

  mouse.write(0xe8);   // Set Resolution
  mouse.read();        // ack
  mouse.write(2);      // 4 counts/mm
  mouse.read();        // ack  


  /////////////////////////////////////////////////////////
  //
  // run the loop() from NYYRIKKI mouse adapter
  //
  for (;;) { 
    StatCnt++;
    if (StatCnt==50) StatCnt=0;

    mouse.write(0xeb);    // give me data!
    mouse.read();         // ignore ack
    mstat = mouse.read(); // Read buttons

    rx = mouse.read();
    ry = mouse.read();

    if (MouseID==3) {
    rz=mouse.read();
    }
    if (MouseID==4) {
    rz=mouse.read();
    but34=(rz>>3) & 6;
    rz=rz & 15;
    if (rz & 8) {rz = rz|240;}
    }
    x = x+rx;
    y = y-ry;
    z = z-rz;

  // Buttons
    if (EmuMode==6) { // Touchpad
     if(mstat&1) pinMode(JoyPin4,OUTPUT); else pinMode(JoyPin4,INPUT);
     if(mstat&2) pinMode(JoyPin1,INPUT); else pinMode(JoyPin1,OUTPUT);
    } else { // Others
     if(mstat&1) pinMode(JoyPin6,OUTPUT); else pinMode(JoyPin6,INPUT);
     if(mstat&2) pinMode(JoyPin7,OUTPUT); else pinMode(JoyPin7,INPUT);   
    }

    if (EmuMode==1 | EmuMode>4) { // Scale mouse/trackball/touchpad output
     scale=scale-rz;
     if (scale<5) scale=5;
     if (scale>25) scale=25;
     mx=x*(scale)/20+slx;
     my=y*(scale)/20+sly;
     
     if (scale<20) {
       lx=x-(mx*20/scale);
       ly=y-(my*20/scale);
     } else {
       lx=0;ly=0;
     }
     
    } else {
     mx=x;
     my=y;
    }

    time=millis()+40;

    if (EmuMode<4) {  // Mouse emulation

    sendMSX(-mx);
    time=millis()+3;
    sendMSX(-my);
    if (millis()<time) {
      x=lx;y=ly;
  //      x=0;y=0;
      if (EmuMode==2 | EmuMode==3) {
      sendMSX(((mstat>>2) & 1)| but34 | 16);
      sendMSX(-z);
      if (millis()<time) {z=0;}
      }

      
//      if (StatCnt<25) digitalWrite(InfoPin,LOW); else digitalWrite(InfoPin,HIGH);

      time=millis()+2;
    } //else if (StatCnt<48) digitalWrite(InfoPin,LOW); else digitalWrite(InfoPin,HIGH);

    while (digitalRead(JoyPin8)==LOW) {if (millis()>time) break;};
    JoyHigh();
    }

    if (EmuMode==3 | EmuMode==4){   // Joystick emulation

    jy=jy+ry;
    jx=jx-rx;
//    if (StatCnt<40) digitalWrite(InfoPin,LOW); else digitalWrite(InfoPin,HIGH);
    if (digitalRead(JoyPin8)==LOW) {
      solimit=olimit*(scale)/20;
      silimit=ilimit*(scale)/20;

      if (jy>solimit) jy=solimit;
      if (jy<-solimit) jy=-solimit;
      if (jx>solimit) jx=solimit;
      if (jx<-solimit) jx=-solimit;

      if (jy>silimit)  pinMode(JoyPin1,OUTPUT); else pinMode(JoyPin1,INPUT);
      if (jy<-silimit) pinMode(JoyPin2,OUTPUT); else pinMode(JoyPin2,INPUT);
      if (jx>silimit)  pinMode(JoyPin3,OUTPUT); else pinMode(JoyPin3,INPUT);
      if (jx<-silimit) pinMode(JoyPin4,OUTPUT); else pinMode(JoyPin4,INPUT);
    } else JoyHigh();
    }
    
    if (EmuMode==5) {   // Trackball emulation
    
    // To be done
    if (mx>7) {slx=mx-7;mx=7;} else 
    { 
      if (mx<-7) {slx=mx+7;mx=-7;} else {slx=0;}
    }
    if (my>7) {sly=my-7;my=7;} else 
    { 
      if (my<-7) {sly=my+7;my=-7;} else {sly=0;}
    }
    
    //if (scale>20) {slx=0;sly=0;}
    
    mx=((mx^8)&15);
    my=((my^8)&15);
    
    //mx=((DDRD & 195)|((~ (mx<<2)) & 60));
    //my=((DDRD & 195)|((~ (my<<2)) & 60));
    
    mx=((MSX_DDR & 0xf0) | ~(mx<<4));  // low nibble 
    my=((MSX_DDR & 0xf0) | ~(my<<4));  // low nibble  
    
    
    MSX_DDR = mx;x=lx;
    while (digitalRead(JoyPin8)==LOW) {if (millis()>time) break;};
    
    MSX_DDR = my;y=ly;
    while (digitalRead(JoyPin8)==HIGH) {if (millis()>time) break;};

    MSX_DDR = mx;mx=8;
    //mx=((DDRD & 195)|((~ (mx<<2)) & 60));
    mx=((MSX_DDR & 0xf0) | ~(mx<<4));  // low nibble     
    while (digitalRead(JoyPin8)==LOW) {if (millis()>time) break;};
    
    MSX_DDR = mx;
    while (digitalRead(JoyPin8)==HIGH) {if (millis()>time) break;};
    
    while (digitalRead(JoyPin8)==LOW) {if (millis()>time) break;};

    while (digitalRead(JoyPin8)==HIGH) {if (millis()>time) break;};

       
    delay(3);
    JoyHigh();
    }
    if (EmuMode==6) {   // Touchpad emulation
    
    jx=jx+mx;
    jy=jy+my;
    x=lx;y=ly;
    
    if (jx>255) jx=255;
    if (jx<0) jx=0;
    if (jy>255) jy=255;
    if (jy<0) jy=0;

    
    if (SI==0) {SO=jx;} else {SO=jy;}
    SI=0;  
    
    pinMode(JoyPin2,INPUT);  // Ei kiirettä (No hurry) 
    while (digitalRead(JoyPin8)==HIGH) {if (millis()>time) break;}; // Wait for select
    for (int i=0; i < 8; i++){
      while (digitalRead(JoyPin6)==HIGH) {if (millis()>time) break;};
      if(SO&128) pinMode(JoyPin3,INPUT); else pinMode(JoyPin3,OUTPUT);SO=SO<<1;
      while (digitalRead(JoyPin6)==LOW) {if (millis()>time) break;};
      SI=SI<<1;if (digitalRead(JoyPin7)==HIGH) {SI++;};
    }
     pinMode(JoyPin2,OUTPUT); // Kiire (hurry)
     while (digitalRead(JoyPin8)==LOW) {if (millis()>time) break;};
    
    }
  } // for (;;)
}

 


