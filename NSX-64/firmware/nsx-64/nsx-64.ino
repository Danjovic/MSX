/*****************************************************************************
 *   _  _ _____  __    __ _ _  
 *  | \| / __\ \/ /__ / /| | | 
 *  | .` \__ \>  <___/ _ \_  _|
 *  |_|\_|___/_/\_\  \___/ |_| 
 * 
 *  Daniel Jose Viana, august 2019 - danjovic@hotmail.com
 * 
 * MSX adapter for Nintendo 64 controllers
 * This project lets you play MSX games using Nintendo 64 controllers. 
 * The several N64 controller buttons are mapped on a variety of combinations
 * for the MSX and the analog stick can act both as directional controls and
 * as standard Paddles.
 * 
 * This code is released under GPL V2.0 
 * 
 ***************************************************************************** 
 * Controls Mapping
 *   N64      MSX
 * D-UP       UP 
 * D-DOWN    DOWN
 * D-LEFT    LEFT
 * D-RIGHT   RIGHT
 *   A       TRG A
 *   B       TRG B
 *   Z       TRA A + Autofire
 *   L       UP + LEFT
 *   R       UP + RIGHT
 * START     LEFT + RIGHT
 * C-UP      TRGA + UP
 * C-DOWN    TRGA + DOWN   
 * C-LEFT    TRGA + LEFT
 * C-RIGHT   TRGA + RIGHT
 * X Axis    LEFT/RIGHT   PDL(5)[/6]
 * Y Axis    UP/DOWN      PDL(1)[/2]
 * 
*/

#define DEBUG
#define debugPin 4
#define debugPin2 5
#define debugPin3 6

///////////////////////////////////////////////////////////////////////////////
//  Definitions
//  
#define MSX_PORT PORTB
#define MSX_DDR  DDRB

#define MSX_UP    0  // PB0 AVR pin
#define MSX_DOWN  1  // PB1
#define MSX_LEFT  2  // PB2
#define MSX_RIGHT 3  // PB3
#define MSX_TRGA  4  // PB4
#define MSX_TRGB  5  // PB5

#define MSX_PULSE 2 // PD2/INT0 Arduino pin

#define N64_Pin 7   // PD7
#define autofiremod() ((TCNT1H & 0x03)==0) // turn on/off at 7.62Hz (16MHz/1024) / 2^(3+8)

///////////////////////////////////////////////////////////////////////////////
//  Libraries
//
#include <TimerOne.h>
#include <avr/sleep.h>
#include <avr/power.h>

#include "Nintendo.h"


///////////////////////////////////////////////////////////////////////////////
// Variables
//
CN64Controller N64Controller(N64_Pin);  // Define a N64 Controller

static volatile uint8_t msx_paddle_1_2   = 0; // Pin 1 - UP      
static volatile uint8_t msx_paddle_3_4   = 0; // Pin 1 - DOWN      
static volatile uint8_t msx_paddle_5_6   = 0; // Pin 1 - LEFT    
static volatile uint8_t msx_paddle_7_8   = 0; // Pin 1 - RIGHT    
static volatile uint8_t msx_paddle_9_10  = 0; // Pin 1 - TRIGGER A   
static volatile uint8_t msx_paddle_11_12 = 0; // Pin 1 - TRIGGER B  


///////////////////////////////////////////////////////////////////
// 
//  ___      _             
// / __| ___| |_ _  _ _ __ 
// \__ \/ -_)  _| || | '_ \
// |___/\___|\__|\_,_| .__/
//                   |_|
//
void setup() {
  N64Controller.begin();   // initialize n64 controller
  delayMicroseconds(100);  // wait some time between initialize and the first read 

  pinMode(MSX_PULSE,INPUT_PULLUP);
  populate_MSX(0xff); 
  attachInterrupt(digitalPinToInterrupt(MSX_PULSE), cycle_MSX_paddles, RISING);
  Timer1.initialize(10000);  // 10ms
//  Timer1.restart();
  Timer1.attachInterrupt(timeout,10000); 

  #ifdef DEBUG
  pinMode(debugPin,OUTPUT);
  digitalWrite(debugPin,LOW);
  pinMode(debugPin2,OUTPUT);
  digitalWrite(debugPin2,LOW);  
  pinMode(debugPin3,OUTPUT);
  digitalWrite(debugPin3,LOW);  

  #endif

  sei();

}

///////////////////////////////////////////////////////////////////
//
//  _                  
// | |   ___  ___ _ __ 
// | |__/ _ \/ _ \ '_ \
// |____\___/\___/ .__/
//               |_|
//
void loop() {
  do_N64(); // Sample  and Update Outputs
  digitalWrite(debugPin2,LOW); 
  set_sleep_mode(SLEEP_MODE_IDLE);
  sleep_enable();
  power_timer0_disable();
  sleep_mode(); 
  sleep_disable();  
  digitalWrite(debugPin2,HIGH);   
}


///////////////////////////////////////////////////////////////////
//
//  ___             _   _             
// | __|  _ _ _  __| |_(_)___ _ _  ___
// | _| || | ' \/ _|  _| / _ \ ' \(_-<
// |_| \_,_|_||_\__|\__|_\___/_||_/__/
// 

///////////////////////////////////////////////////////////////////
// Timer 1 Interrupt handler
//
void timeout()
{
 // Timer1.stop();
  Timer1.setPeriod(10000); // 10ms
 // Timer1.restart(); 
  #ifdef DEBUG
  digitalWrite(debugPin,HIGH);
  digitalWrite(debugPin,LOW);
  #endif
}



///////////////////////////////////////////////////////////////////
// External IRQ Interrupt handler
//
void cycle_MSX_paddles(void) {
  uint8_t i,j;
  uint8_t msx_buttons = ~MSX_DDR; // save button state
  #ifdef DEBUG
  digitalWrite(debugPin3,HIGH); 
  Timer1.stop();
  #endif
  populate_MSX(0xff); // start by rising all pins 
  for (i=0;i<255;i++){
    j=0;    
    if (i < msx_paddle_1_2  ) j |= (1<<MSX_UP);  
    if (i < msx_paddle_3_4  ) j |= (1<<MSX_DOWN); 
    if (i < msx_paddle_5_6  ) j |= (1<<MSX_LEFT);         
    if (i < msx_paddle_7_8  ) j |= (1<<MSX_RIGHT); 
    if (i < msx_paddle_9_10 ) j |= (1<<MSX_TRGA); 
    if (i < msx_paddle_11_12) j |= (1<<MSX_TRGB);
    populate_MSX(j);
    if (j==0) break;  // exit right after all outputs went low
    delayMicroseconds(10);

    asm volatile ( "nop\n"
                   "nop\n" 
                   "nop\n" );

    }  // hand tuned to 12us

    delayMicroseconds(50); // allow some time for Z80 to detect the end of timing 


    populate_MSX(msx_buttons); // restore button state 
    #ifdef DEBUG
    digitalWrite(debugPin3,LOW); 
    #endif    
    Timer1.stop();
    Timer1.setPeriod(100000); // 100ms 
    Timer1.restart();  
//    TIFR1 = 0xff;  // clear any pending timer IRQ
//    TIFR0 = 0xff;  // clear any pending timer IRQ  
//    TIFR2 = 0xff;  // clear any pending timer IRQ  

  }


///////////////////////////////////////////////////////////////////
// Sample N64 controller and update outputs and Paddle variables
//
void do_N64() {
  uint8_t msx_buttons;

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

}


///////////////////////////////////////////////////////////////////
// Define logic levels at MSX joystick port
//
inline void populate_MSX(uint8_t buttons) { 
  MSX_PORT = buttons;
  MSX_DDR  = ~buttons;
  }
