/***
 *    $$\      $$\                                     $$\      $$\  $$$$$$$$$$$\   $$\       
 *    $$$\    $$$ |                                    $$$\    $$$ |$$  ______$$ |  $$ |      
 *    $$$$\  $$$$ | $$$$$$\   $$$$$$\   $$$$$$\        $$$$\  $$$$ |$$ /      \$$\ $$  |      
 *    $$\$$\$$ $$ |$$  __$$\ $$  __$$\  \____$$\       $$\$$\$$ $$ |\$$$$$$\   \$$$$  /       
 *    $$ \$$$  $$ |$$$$$$$$ |$$ /  $$ | $$$$$$$ |      $$ \$$$  $$ | \____$$\  $$  $$<        
 *    $$ |\$  /$$ |$$   ____|$$ |  $$ |$$  __$$ |      $$ |\$  /$$ |      $$ |$$  /\$$\       
 *    $$ | \_/ $$ |\$$$$$$$\ \$$$$$$$ |\$$$$$$$ |      $$ | \_/ $$$$$$$$$$$  |$$ /  $$ |      
 *    \__|     \__| \_______| \____$$ | \_______|      \__|     \___________/ \__|  \__|      
 *                           $$\   $$ |                                                       
 *                           \$$$$$$  |                                                       
 *                            \______/                                                        
 *
 *   Danjovic 2022
 *
 * This project uses an ATMegaxx8 to provide the connection of up to 2 Megadrive (Sega Genesis)
 * controllers to MSX Joystick port. The Circuit shall support Master System and Genesis 3 or 6
 * button controllers and provide two modes of operation, selectable at power up:
 * 
 * BASIC mode, that translates buttons into MSX joystick controls;
 * JOYMEGA mode, provides compatibility with Joymega adapter
 *
 */

/*
    Supports BASIC mode and Joymega mode 

    Basic mode button association. 
    
    Megadrive -> MSX
    UP        -> ditto
    DOWN      -> ditto
    LEFT      -> ditto
    RIGHT     -> ditto
    Button A  -> Trigger A
    Button B  -> Trigger B
    Button C  -> Trigger A + Trigger B
    Button X  -> Autofire Trigger A
    Button Y  -> Autofire Trigger B
    Button Z  -> Autofire Trigger A + Trigger B
    Start     -> LEFT + RIGHT
    Mode      ->   UP + DOWN

    Selection between Controller A and Controller B is performed 
    by changing Pin 8 from joystick port. It is necessary a settling 
    time of about TBD us from changint pin 8 to reading next value

    Both controllers are polled automatically at each 16.384ms and 
    3/6 button controllers are detected automatically during poll. 
    For obvious reason the functions X Y Z and Mode are not available
    for 3 button controllers.
    
    Expanded mode can be accessed after issuing 4 consecutive rising edges
    on pin 8 within 1 poll cycle.

    PIN
     8     1  2    3    4     6      7
     Low   UP DOWN LEFT RIGHT Map A  Btn B (controller A)
     High  UP DOWN LEFT RIGHT Btn A  Btn B (controller B) 1st pulse
     Low   UP DOWN LEFT RIGHT Btn A  Btn B (controller A)
     High  UP DOWN LEFT RIGHT Btn A  Btn B (controller B) 2nd pulse
     Low   UP DOWN LEFT RIGHT Btn A  Btn B (controller A)
     High  UP DOWN LEFT RIGHT Btn A  Btn B (controller B) 3rd pulse
     Low   UP DOWN LEFT RIGHT Btn A  Btn B (controller A)
     High  UP DOWN LEFT RIGHT Btn A  Btn B (controller B) 4th pulse
     Low   UP DOWN LEFT RIGHT Btn A  Btn B (controller A)
     High  UP DOWN LEFT RIGHT A      B     (controller B - Raw ) 5th pulse     
     Low   UP DOWN LEFT RIGHT A      B     (controller A - Raw )      
     High  C  X    Y    Z     Start  Mode  (controller B - Raw ) 6th pulse     
     Low   C  X    Y    Z     Start  Mode  (controller A - Raw ) 
    
     High  UP DOWN LEFT RIGHT A      B     (controller B - Raw ) 7th pulse     
     Low   UP DOWN LEFT RIGHT A      B     (controller A - Raw )      
     High  C  X    Y    Z     Start  Mode  (controller B - Raw ) 8th pulse     
     Low   C  X    Y    Z     Start  Mode  (controller A - Raw )      
     ...
     ...
     ...
     
     The expanded mode is exited by timeout, 16ms after the last poll
     
    
*/

//    _ _ _                 _        
//   | (_) |__ _ _ __ _ _ _(_)___ ___
//   | | | '_ \ '_/ _` | '_| / -_|_-<
//   |_|_|_.__/_| \__,_|_| |_\___/__/
// 
#include <avr/io.h>
#include <avr/interrupt.h>

#include <util/delay.h>
#include <avr/eeprom.h>
#include <avr/pgmspace.h>



//       _      __ _      _ _   _             
//    __| |___ / _(_)_ _ (_) |_(_)___ _ _  ___
//   / _` / -_)  _| | ' \| |  _| / _ \ ' \(_-<
//   \__,_\___|_| |_|_||_|_|\__|_\___/_||_/__/
// 
#define MSX_PULSE_BIT 7   // All MSX connected pins shall be on the same port
#define MSX_DDR    DDRD
#define MSX_PIN    PIND
#define MSX_PORT   PORTD

#define MEGA1_DDR  DDRB
#define MEGA1_PIN  PINB
#define MEGA1_PORT PORTB

#define MEGA2_DDR  DDRC
#define MEGA2_PIN  PINC
#define MEGA2_PORT PORTC

#define MEGA1_SEL_DDR  DDRB
#define MEGA1_SEL_PIN  PINB
#define MEGA1_SEL_BIT  7
#define MEGA1_SEL_PORT PORTB

#define MEGA2_SEL_DDR  DDRB
#define MEGA2_SEL_PIN  PINB
#define MEGA2_SEL_BIT  6
#define MEGA2_SEL_PORT PORTB

#define megaSelLow()   { MEGA1_SEL_PORT &= ~(1<<MEGA1_SEL_BIT);  MEGA2_SEL_PORT &= ~(1<<MEGA2_SEL_BIT); }
#define megaSelHigh()  { MEGA1_SEL_PORT |=  (1<<MEGA1_SEL_BIT);  MEGA2_SEL_PORT |=  (1<<MEGA2_SEL_BIT); }


#define msxPulseLevel() (MSX_PIN & (1<<MSX_PULSE_BIT))

#define OPER_MODE_ADDR 16

#define waitForTick() { while (TIFR2 & (1<<TOV2)){}; TIFR2 |= (1<<TOV2); } 
#define resetTimer2() { TCNT2=0; TIFR2 |= (1<<TOV2); }

//               _               _                     
//    __ _  _ __| |_ ___ _ __   | |_ _  _ _ __  ___ ___
//   / _| || (_-<  _/ _ \ '  \  |  _| || | '_ \/ -_|_-<
//   \__|\_,_/__/\__\___/_|_|_|  \__|\_, | .__/\___/__/
//                                   |__/|_|              
typedef enum {
    BASIC,
    JOYMEGA    
} t_operationModes;


enum controllerType {
  _6Button=0,
  _3Button,
  _unKnown =0xff
  };



//                 _      _    _        
//   __ ____ _ _ _(_)__ _| |__| |___ ___
//   \ V / _` | '_| / _` | '_ \ / -_|_-<
//    \_/\__,_|_| |_\__,_|_.__/_\___/__/
// 
volatile t_operationModes operationMode = BASIC;
volatile uint8_t msxOut,joyMegaPhase,basicJoy1,basicJoy2;
volatile uint8_t joyMegaReport[16];
 
uint8_t mega1Samples[7];
uint8_t mega2Samples[7];

uint16_t rawButtons;     
uint16_t autofireMask; 

//                 _       _                     
//    _ __ _ _ ___| |_ ___| |_ _  _ _ __  ___ ___
//   | '_ \ '_/ _ \  _/ _ \  _| || | '_ \/ -_|_-<
//   | .__/_| \___/\__\___/\__|\_, | .__/\___/__/
//   |_|                       |__/|_|           

void initHardware(void);
void sampleMegaControllers(void);
inline uint8_t sampleMega1(void);
inline uint8_t sampleMega2(void);
void scanControllers (void);
void c(void);
void processStartupMode(void);
uint16_t decodeScans( uint8_t* samples);
void processScans(void);
uint8_t mapBasicModeButtons (uint16_t tempMega);
void mapJoymegaButtons ( uint16_t mega1buttons, volatile uint8_t *reports );

//    _     _                         _      
//   (_)_ _| |_ ___ _ _ _ _ _  _ _ __| |_ ___
//   | | ' \  _/ -_) '_| '_| || | '_ \  _(_-<
//   |_|_||_\__\___|_| |_|  \_,_| .__/\__/__/
//                              |_|          

/// occur whenever MSX PULSE pin change state
ISR (PCINT2_vect) {
    MSX_DDR = msxOut;
    if (operationMode == BASIC) { // Basic mode
        if (msxPulseLevel()) { // rising edge
           _delay_us(32);
           MSX_DDR = (uint8_t)~(1<<MSX_PULSE_BIT); // output zeroes
           _delay_us(32);
           MSX_DDR = basicJoy1;
          // msxOut = basicJoy2;    
           
        } else { //falling edge
            // no action
        }    
    }    else { // Mode = JOYMEGA
        if (msxPulseLevel()) { // rising edge
            if (++joyMegaPhase >8) joyMegaPhase = 0;
            msxOut =  ~(1<<MSX_PULSE_BIT) & joyMegaReport[(joyMegaPhase<<1) + 1];
        } else {
            msxOut =  ~(1<<MSX_PULSE_BIT) & joyMegaReport[(joyMegaPhase<<1)    ];            
        }
        resetTimer2();    
    }    
}


/// Occur every ~4ms
ISR (TIMER2_OVF_vect) {
if (operationMode == BASIC) { // Basic mode
        if (msxPulseLevel()) {
            MSX_DDR = basicJoy2;            
        } else {
            MSX_DDR = basicJoy1;
        }
    }    else { // Mode = JOYMEGA
        joyMegaPhase = 0; 
        if (msxPulseLevel()) {
            MSX_DDR = ~(1<<MSX_PULSE_BIT) & joyMegaReport[0];
        } else {
            MSX_DDR = ~(1<<MSX_PULSE_BIT) & joyMegaReport[1];
        }
    }
}



//               _         __              _   _          
//    _ __  __ _(_)_ _    / _|_  _ _ _  __| |_(_)___ _ _  
//   | '  \/ _` | | ' \  |  _| || | ' \/ _|  _| / _ \ '  \. 
//   |_|_|_\__,_|_|_||_| |_|  \_,_|_||_\__|\__|_\___/_||_|
//
int main (void) {
    
    // Initialize Hardware: I/O ports, interrupts etc.
    initHardware( );
    
    // Initalize variables
    joyMegaPhase = 0;

    // Set operating mode
    processStartupMode();    

    // Run controller loop
    for (;;) {
        waitForTick();  // every ~4ms
        
         scanControllers();
        processScans();

    }
}    





//     __              _   _             
//    / _|_  _ _ _  __| |_(_)___ _ _  ___
//   |  _| || | ' \/ _|  _| / _ \ ' \(_-<
//   |_|  \_,_|_||_\__|\__|_\___/_||_/__/
// 


uint8_t mapBasicModeButtons (uint16_t tempMega) {
  //  Sega side after decoding, active in 1
  //  Bit     15 14 13 12 11 10  9  8  7  6  5  4  3  2  1  0 
  //           0  0  0  0 MD  X  Y  Z  ST A  C  B  RG LF DW UP
  
  // Bit assignment for MSX to output on AVR port
  //   7  6  5  4  3  2  1  0  
  //   -  TB TA - RG LF DW UP    
  uint8_t  tempMsx;
  
  tempMsx = (uint8_t)( tempMega & 0x000f);     // 0  0  0  0  RG LF DW UP
  tempMsx = (uint8_t)( (tempMega<<1) & 0x60); // 0  TB TA 0  RG LF DW UP

  //                                        0BA0RLDU    
  if ( tempMega & ( 1<<11 ) ) tempMsx |= 0b00000011; // mode  = UP + DOWN
  if ( tempMega & ( 1<<7  ) ) tempMsx |= 0b00001100; // start = LEFT+RIGHT
  if ( tempMega & ( 1<<9  ) ) tempMsx |= 0b00100000; // Y = TA, Y is already modulated by autofire
  if ( tempMega & ( 1<<8  ) ) tempMsx |= 0b01000000; // Z = TB, Z is already modulated by autofire

  if ( tempMega & ( (1<<6)|(1<<10) ) ) tempMsx |= 0b01100000; // A or X = TA+TB. X is already modulated by autofire
  
  return tempMsx;

}


///    
void processScans(void) {
 // uint8_t a=0;
 
  static uint8_t autoFireCount=0; 



  //  Sega side after decoding, active in 1
  //  Bit     15 14 13 12 11 10  9  8  7  6  5  4  3  2  1  0 
  //           0  0  0  0 MD  X  Y  Z  ST A  C  B  RG LF DW UP                              
  uint16_t mega1buttons,mega2buttons,autofireMask;  
  
  // decode scans
  mega1buttons = decodeScans( mega1Samples );
  mega2buttons = decodeScans( mega2Samples );
  
  // Process Autofire 4.095ms every count, 32 counts is ~8Hz with 50% cycle
  // ~0b0000.0111.0000.0000 = 0b1111.1000.1111.1111 = 0xf800 = ~(7<<8)
  if (autoFireCount > 15 )  autofireMask = ~(7<<8); else autofireMask = 0xffff; 
  if (++autoFireCount == 32) autoFireCount = 0;
  
 
  // process Basic Mode 
  // UP,DOWN,LEFT,RIGHT = Same
  // A - Trigger A+B  
  // B - Trigger A
  // C - Trigger B
  
  // X = Trigger A+B with Autofire   
  // Y = Trigger A with Autofire
  // Z = Trigger B with Autofire

  // START = LEFT + RIGHT
  // MODE  = UP + DOWN
  
  
  basicJoy1 = mapBasicModeButtons ( mega1buttons & autofireMask) ; 
  basicJoy2 = mapBasicModeButtons ( mega1buttons & autofireMask) ;


  //  Sega side after decoding, active in 1
  //  Bit     15 14 13 12 11 10  9  8  7  6  5  4  3  2  1  0 
  //           0  0  0  0 MD  X  Y  Z  ST A  C  B  RG LF DW UP    
  
  // process Joymegamode
  // with buttons active in 1  
  // Report  D7  D6  D5  D4  D3  D2  D1  D0
  // 0/8     0   C   B   0   RG  LF  DW  UP
  // 1/9     0   ST  A   0   1   1   DW  UP
  // 2/10    0   C   B   0   RG  LF  DW  UP
  // 3/11    0   ST  A   0   1   1   DW  UP
  // 4/12    0   C   B   0   RG  LF  DW  UP
  // 5/13    0   ST  A   0   1   1   1   1
  // 6/14    0   0   0   0   MD  X   Y   Z 
  // 7/15    0   ST  A   0   0   0   0   0   
  
  mapJoymegaButtons ( mega1buttons, &joyMegaReport[0] );
  mapJoymegaButtons ( mega2buttons, &joyMegaReport[8] );
} 

/// 
void mapJoymegaButtons ( uint16_t mega1buttons, volatile uint8_t *reports ) {
  //  Bit     15 14 13 12 11 10  9  8  7  6  5  4  3  2  1  0 
  //           0  0  0  0 MD  X  Y  Z  ST A  C  B  RG LF DW UP
  uint8_t rep0,rep1,rep6;
  
  rep0 =  (uint8_t) ( ( mega1buttons & 0x000f) | ( (mega1buttons<<1) & 0x0060) ); // 0   C   B   0   RG  LF  DW  UP
  rep1 =  (uint8_t) ( ( mega1buttons & 0x0003) | ( (mega1buttons>>1) & 0x0060) | 0b00001100 ); // 0   ST  A   0   1   1   DW  UP
  rep6 =  (uint8_t) ( (mega1buttons>>8) & 0x000f); // 0   0   0   0   MD  X   Y   Z   
  
  *reports = rep0; reports++;              // report[0/8]  // 0   C   B   0   RG  LF  DW  UP
  *reports = rep1; reports++;              // report[1/9]  // 0   ST  A   0   1   1   DW  UP 
  *reports = rep0; reports++;              // report[2/10] // 0   C   B   0   RG  LF  DW  UP 
  *reports = rep1; reports++;              // report[3/11] // 0   ST  A   0   1   1   DW  UP  
  *reports = rep0; reports++;              // report[4/12] // 0   C   B   0   RG  LF  DW  UP
  *reports = rep1 | 0b00001111; reports++; // report[5/13] // 0   ST  A   0   1   1   1   1  
  *reports = rep6; reports++;              // report[6/14] // 0   0   0   0   MD  X   Y   Z 
  *reports = rep1 & 0b01100000;            // report[7/15] // 0   ST  A   0   1   1   DW  UP 


}

 
  
  

   
void initHardware( void ){
    
    // I/O
    DDRB = (uint8_t)((1<<MEGA1_SEL_BIT)|(1<<MEGA2_SEL_BIT));  
    PORTB = (uint8_t)~((1<<MEGA1_SEL_BIT)|(1<<MEGA2_SEL_BIT));  
    //megaSelLow() ;    
    
// MEGA1_SEL_DDR |=  (1<<MEGA1_SEL_BIT);
// MEGA2_SEL_DDR |=  (1<<MEGA2_SEL_BIT);
// MEGA1_SEL_PORT = !(1<<MEGA1_SEL_BIT);
// MEGA2_SEL_PORT = !(1<<MEGA2_SEL_BIT);    
    
    DDRC = 0x00; 
    PORTC = 0x3f;
    
    DDRD = 0x00; // all pins inputs
    PORTD = 0x00; // ~(1<<MSX_PULSE_BIT); 

    
    
    // Program interrupts  PCINT23 - PD7
    // Pin change for Pulse signal coming from MSX
    PCICR = (1<<PCIE2);  // PCINT23..16
    PCMSK2 = (1<<MSX_PULSE_BIT);
    PCIFR = (1<<PCIE2);  // Clear any pending interrupt    


    // Program Timer 2
    TCCR2B = ((1<<CS22) | (1<<CS20)); // Prescaler 128,  overflow each 4,096ms
    TCNT2 = 0;
    TIFR2 |= (1<<TOV2);   //      
    TIMSK2 |= (1<<TOIE2);  // Enable Timer 2 Interrupts    
}


/// Sample Megadrive controller 1, buttons active in 0
inline uint8_t sampleMega1 (void) {
    uint8_t sample = MEGA1_PIN ;
    //                                      x  x  BC RG LF DW UP AB
    return ( sample     & 0b00100000) | //  0  0  BC 0  0  0  0  0 
           ((sample>>1) & 0b00001111) | //  0  0  BC 0  RG LF DW UP
           ((sample<<4) & 0b00010000);  //  0  0  BC AB RG LF DW UP
}

/// Sample Megadrive controller 2, buttons active in 0
inline uint8_t sampleMega2 (void) {   
    uint8_t sample = MEGA2_PIN ;  
    //                                      x  x  BC RG LF DW AB UP
    return ( sample    & 0b00100001) | //   0  0  BC 0  0  0  0  UP 
          ((sample>>1) & 0b00001110) | //   0  0  BC 0  RG LF DW UP
          ((sample<<3) & 0b00010000);  //   0  0  BC AB RG LF DW UP
}


//
// Scan a series of 8 Sega controller reports and return buttons read using 
// the same format
//
// 14 14 13 12 11 10  9  8  7  6  5  4  3  2  1  0    controller type
// 0  0  0  0  0   0  0  0  0  0  2  1  RG LF DW UP   SMS
// 0  0  0  0  0   0  0  0  ST A  C  B  RG LF DW UP   3 Button
// 0  0  0  0  MD  X  Y  Z  ST A  C  B  RG LF DW UP   6 Button
///
uint16_t decodeScans( uint8_t *samples) {
// Sample  bit  7   6   5   4   3   2  1   0
//   0          0   0   ST  A  LO  LO  DW  UP
//   1          0   0   C   B  RG  LF  DW  UP
//   2          0   0   ST  A  LO  LO  DW  UP
//   3          0   0   C   B  RG  LF  DW  UP
//   4          0   0   ST  A  LO  LO  LO  LO
//   5          0   0   HI  HI MD  X   Y   Z 
//   6          0   0   ST  A  HI  HI  HI  HI
  uint8_t type;  
  uint16_t combinedButtons;
    

  // check for 3 or 6 buttons
  if ( ((samples[4] & 0x0f) == 0) && ((samples[6] & 0x0f)==0x0f) ) {
  type = _6Button;  
  } else if  ( (samples[6] & 0x0c) == 0)  {
  type = _3Button;
  } else
    type = _unKnown; // unknown

 
  // now populate combinedButtons variable accordingly          // 15 14 13 12 11 10 9  8  7  6  5  4  3  2  1  0
  combinedButtons = (uint16_t)samples[1];                      // 0  0  0  0  0  0  0  0  0  0  C  B  RG LF DW UP
  combinedButtons |= ((uint16_t)(samples[0]<<2)) & 0xc0;      // 0  0  0  0  0  0  0  0  ST A  C  B  RG LF DW UP
  combinedButtons |= ((uint16_t)(samples[5]<<8)) & 0xf00;     // 0  0  0  0  MD X  Y  Z  ST A  C  B  RG LF DW UP

  // mask unused buttons
  switch (type) {
    case _6Button:
      combinedButtons |= 0xf000; // 1  1  1  1  MD X  Y  Z  ST A  C  B  RG LF DW UP
      break;

    case _3Button:
      combinedButtons |= 0xff00; // 1  1  1  1  1  1  1  1  ST A  C  B  RG LF DW UP
      break;
      
    default:
      combinedButtons |= 0xffc0; // 1  1  1  1  MD X  Y  Z  ST A  C  B  RG LF DW UP    
    } // case

  return ~combinedButtons;  // 0  0  0  0  MD X  Y  Z  ST A  C  B  RG LF DW UP active in 1
}

/// 
void scanControllers (void) {

  mega1Samples[0] = sampleMega1(); //  ST A  0  0  DW UP
  mega2Samples[0] = sampleMega2();
     
  
  megaSelHigh()  //  
  _delay_us(10); 
  mega1Samples[1] = sampleMega1(); //  C  B  RG LF DW UP
  mega2Samples[1] = sampleMega2();
  
  megaSelLow()   //  
  _delay_us(10);
  mega1Samples[2] = sampleMega1(); //  ST A  0  0  DW UP 
  mega2Samples[2] = sampleMega2();
  
  
  megaSelHigh()  //  
  _delay_us(10);
  mega1Samples[3] = sampleMega1(); //  C  B  RG LF DW UP 
  mega2Samples[3] = sampleMega2();

  megaSelLow()   // 
  _delay_us(10);
  mega1Samples[4] = sampleMega1(); //   ST A  0  0  0  0  -> 3 button: ST A  0  0  DW  UP 
  mega2Samples[4] = sampleMega2();

  megaSelHigh()  //  
  _delay_us(10);
  mega1Samples[5] = sampleMega1(); //  1  1  MD X  Y  Z  
  mega2Samples[5] = sampleMega2();

  megaSelLow()   //
  _delay_us(10);
  mega1Samples[6] = sampleMega1(); //  ST A  1  1  1  1 -> 3 button:  ST A  0  0  DW  UP 
  mega2Samples[6] = sampleMega2();
}  

    

void processStartupMode(void) {
    
    // restore last operation mode from eeprom
    operationMode = eeprom_read_byte (( uint8_t *) OPER_MODE_ADDR) ;
    
    //  if either controller is UP set mode to BASIC, 
    // otherwiseif either controller is DOWN set mode to JOYMEGA.
    // Controller 1 has priority over controller 2.    
    scanControllers ();    //  Samples[0] =  - -  ST A  0  0  DW UP
    if ( (mega1Samples[0] & 0x03) == 0xb00000010 ) { // UP
       operationMode = BASIC;     
    } else if ( (mega1Samples[0] & 0x03) == 0xb00000001 ) { // DOWN 
        operationMode = JOYMEGA; 
        
    } else if ( (mega2Samples[0] & 0x03) == 0xb00000010 ) { // UP
       operationMode = BASIC; 
    
    } else if ( (mega2Samples[0] & 0x03) == 0xb00000001 ) { // DOWN     
        operationMode = JOYMEGA;     
    }
    
    if (operationMode > JOYMEGA ) {  // if invalid mode (first run) set default mode.
       operationMode = BASIC; 
       eeprom_update_byte (( uint8_t *)OPER_MODE_ADDR, (uint8_t)operationMode );
    }
    
}  
  
/*
Interface Protocol of SEGA MegaDrive's 6-Button-Controller
Pin Assign (D-SUB9P)
# SignalName |   Explanation (Direction)
   ----------+---------------------------------
    1. D0    | Data         (Controller -> Mainframe)
    2. D1    | Data         (Controller -> Mainframe)
    3. D2    | Data         (Controller -> Mainframe)
    4. D3    | Data         (Controller -> Mainframe)
    5. +5V   | PowerSupply  (Supplied to Controller by Mainframe)
    6. D4    | Data         (Controller -> Mainframe)
    7. Sel   | SelectSignal (Mainframe -> Controller)
    8. GND   | Ground
    9. D5    | Data         (Controller -> Mainframe)

# All signals are TTL compatible.


In Case of 3-Button-Controller

 Sel  D0 D1 D2 D3 D4 D5
 Low  UP DW LO LO A  ST
 High UP DW LF RG B  C

   # LO --- Always Low
   # UP --- Up of Cross Key
   # DW --- Down of Cross Key
   # LF --- Left of Cross Key
   # RG --- Right of Cross Key
   # A ---- Trigger Button A
   # B ---- Trigger Button B
   # C ---- Trigger Button C
   # ST --- Start Button
   ## Low -> Pressed , High -> Not Pressed



Data Aquisition Sequence of 6-Button-Controller

      Sel   D0 D1 D2 D3 D4 D5
      ----  -----------------
0  -1  High  UP DW LF RG B  C  -> initial state due to inverter in joymega adapter
1   0  Low   UP DW LO LO A  ST
2   1  High  UP DW LF RG B  C   1st edge
3   2  Low   UP DW LO LO A  ST
4   3  High  UP DW LF RG B  C   # If there is two up-edge in 1.1 milli seconds,
5   4  Low   LO LO LO LO A  ST  # D0 - D3 go Low as Sel goes Low.
6   5  High  Z  Y  X  MD HI HI  # Make Sel High and read D0 - D3.
7   6  Low   HI HI HI HI A  ST  # Check that D0 - D3 go High as Sel goes Low.
8   7  High  UP DW LF RG B  C   # Once this sequence take place
       Low   UP DW LO LO A  ST  # sequence can't be started for 1.8 milli seconds
       .                        # after the first up-edge of Sel.
       .                        # Only Datas read in 1.6 milli seconds from the
       .                        # first up-edge of Sel are reliable.

   # LO --- Always Low
   # HI --- Always High
   # UP --- Up of Cross Key
   # DW --- Down of Cross Key
   # LF --- Left of Cross Key
   # RG --- Right of Cross Key
   # A ---- Trigger Button A
   # B ---- Trigger Button B
   # C ---- Trigger Button C
   # X ---- Trigger Button X
   # Y ---- Trigger Button Y
   # Z ---- Trigger Button Z
   # ST --- Start Button
   # MD --- Mode Button
   ## Low -> Pressed , High -> Not Pressed

Time parameters were measured by using my PC's timer.
It seems that the time is measured by discharging of
a capacitor in a 6-Button-Controller. It may mean
parameters differ one by one controller.
Please choose values you think proper for parameters.

Ein Terakawa

applause@@elfmimi.jp

*/
