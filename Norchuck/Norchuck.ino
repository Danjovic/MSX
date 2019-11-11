
/*******************************************************************************
 *      _  _            _           _   
 *     | \| |___ _ _ __| |_ _  _ __| |__
 *     | .` / _ \ '_/ _| ' \ || / _| / /
 *     |_|\_\___/_| \__|_||_\_,_\__|_\_\
 *                                      
 *     Danjovic 2019 - danjovic@hotmail.com                                  
 *     Released under GPL - November 2019
 *
 ******************************************************************************* 
 *  North Sea Helicopter was a flight simulation game for MSX1 published in 1985 
 *  by Aackosoft.  One of the peculiarities of this game is that you need two 2 
 *  joysticks to control the flight (one of them could be the cursor keys, 
 *  though).
 *  
 *  The purpose of this project is to provide an adapter that lets you play the
 *  game using only one hand a Wii Nunchuck as a controller.
 *  
 ******************************************************************************/



/*******************************************************************************
 *      _ _ _                 _        
 *     | (_) |__ _ _ __ _ _ _(_)___ ___
 *     | | | '_ \ '_/ _` | '_| / -_|_-<
 *     |_|_|_.__/_| \__,_|_| |_\___/__/
 *                                     
 */
#include <Wire.h>
//#define NUNCHUK_DEBUG

// Nunchuck library by Robert Eisele (robert@xarg.org)
// https://create.arduino.cc/projecthub/infusion/using-a-wii-nunchuk-with-arduino-597254
#include "Nunchuk.h"


/*  Pin Assignment
​(AVR) UNO - Function    MSX            Remark
-------------------------------------------------------
(PD4) D4  - UP-1        Port 1/Pin 1   Thumbstick
(PD5) D5  - DOWN-1      Port 1/Pin 2
(PD6) D6  - LEFT-1      Port 1/Pin 3
(PD7) D7  - RIGHT-1     Port 1/Pin 4

(PC0) A0  - TRGA-1      Port 1/Pin 6    Button Z
(PC1) A1  - TRGB-1      Port 1/Pin 7    Button C

(PB0) D8  - UP-2        Port 2/Pin 1   Accelerometers
(PB1) D9  - DOWN-2      Port 2/Pin 2
(PB2) D10 - LEFT-2      Port 2/Pin 3
(PB3) D11 - RIGHT-2     Port 2/Pin 4   


​(AVR) UNO - Function    Nunchuck        Remark
​-------------------------------------------------------
(PC2) A2  - nGND        GND             Optional
(PC3) A#  - nVCC        VCC             Optional
(PC4) A4  - SDA         SDA
(PC5) A5  - SCL         SCL
*/​


/*******************************************************************************
 *         _      __ _      _ _   _             
 *      __| |___ / _(_)_ _ (_) |_(_)___ _ _  ___
 *     / _` / -_)  _| | ' \| |  _| / _ \ ' \(_-<
 *     \__,_\___|_| |_|_||_|_|\__|_\___/_||_/__/
 *                                              
 */

#define DDR_CONT1 DDRD
#define DDR_CONT2 DDRB
#define DDR_TRIG  DDRC

#define PORT_CONT1 PORTD
#define PORT_CONT2 PORTB
#define PORT_TRIG  PORTC

#define UP_1 4  // bit 4
#define DW_1 5  // bit 5
#define LF_1 6  // bit 6
#define RG_1 7  // bit 7

#define UP_2 0  // bit 0
#define DW_2 1  // bit 1
#define LF_2 2  // bit 2
#define RG_2 3  // bit 3

#define TA_1 0  // bit 0 
#define TB_1 1  // bit 1

#define THSP  16 // positite threshold
#define THSN -16 // negative threshold

#define THDGP  (30*3.14/180) // positite threshold
#define THDGN -(30*3.14/180) // negative threshold


//#define DEBUG


/*******************************************************************************
 *              _             
 *      ___ ___| |_ _  _ _ __ 
 *     (_-</ -_)  _| || | '_ \
 *     /__/\___|\__|\_,_| .__/
 *                      |_|   
 */
void setup() {
    Serial.begin(9600);

    // All MSX interface pins as inputs
    DDR_CONT1 &=( (1<<UP_1)|(1<<DW_1)|(1<<LF_1)|(1<<RG_1) );
    DDR_CONT2 &=( (1<<UP_2)|(1<<DW_2)|(1<<LF_2)|(1<<RG_2) );
    DDR_TRIG  &=( (1<<TA_1)|(1<<TB_1) );
  
    PORT_CONT1 &=~( (1<<UP_1)|(1<<DW_1)|(1<<LF_1)|(1<<RG_1) );
    PORT_CONT2 &=~( (1<<UP_2)|(1<<DW_2)|(1<<LF_2)|(1<<RG_2) );
    PORT_TRIG  &=~( (1<<TA_1)|(1<<TB_1) );


    // disable all outputs 
      DDRD &=0x0f;  // pins PD7..PD4 as inputs
      DDRC &=0xfc;  // pins PC1..PC0 as inputs
      DDRB &=0xf0;  // pins PB3..PB0 as inputs

    // Initialize I2C - nuchuk uses Fast-I2C (400kHz)
    Wire.begin();
    Wire.setClock(400000);

	  // Initialize Nunchuck
    
    nunchuk_init_power(); // A1 and A2 is power supply
    nunchuk_init();
}


/*******************************************************************************
 *      _               
 *     | |___  ___ _ __ 
 *     | / _ \/ _ \ '_ \
 *     |_\___/\___/ .__/
 *                |_|   
 */
void loop() {

    int8_t _speed,_nose,_pitch,_roll,_ta,_tb;

    if (nunchuk_read()) { // Work with nunchuk_data




      // deal with controller 1 - Y Axis
      if (nunchuk_joystickY()>THSP) { // UP
        DDR_CONT1 |= (1<<UP_1); // activate UP
        DDR_CONT1 &=~(1<<DW_1); // deactivate DOWN   
        _speed = 1;     
        } else if (nunchuk_joystickY()<THSN) { // DOWN
           DDR_CONT1 &=~(1<<UP_1);  // deactivate UP
           DDR_CONT1 |= (1<<DW_1);  // activate DOWN
           _speed = -1;
          } else { // CENTER
           DDR_CONT1 &=~(1<<UP_1);  // deactivate UP
           DDR_CONT1 &=~(1<<DW_1); // deactivate DOWN 
           _speed = 0;       
          }

      // deal with controller 1 - X Axis
      if (nunchuk_joystickX()>THSP) { // RIGHT
        DDR_CONT1 |= (1<<RG_1); // activate RIGHT
        DDR_CONT1 &=~(1<<LF_1); // deactivate LEFT
        _nose = 1;
        } else if (nunchuk_joystickX()<THSN) { // LEFT
           DDR_CONT1 &=~(1<<RG_1);  // deactivate RIGHT
           DDR_CONT1 |= (1<<LF_1);  // activate LEFT
           _nose = -1;
          } else { // CENTER
           DDR_CONT1 &=~(1<<RG_1);  // deactivate RIGHT
           DDR_CONT1 &=~(1<<LF_1); // deactivate LEFT  
           _nose = 0;   
          }

      // deal with controller 2 - Pitch
;
      if (nunchuk_pitch()>THDGP) { // UP
        DDR_CONT2 |= (1<<UP_2); // activate UP
        DDR_CONT2 &=~(1<<DW_2); // deactivate DOWN  
        _pitch = 1;      
        } else if (nunchuk_joystickX()<THDGN) { // DOWN
           DDR_CONT2 &=~(1<<UP_2);  // deactivate UP
           DDR_CONT2 |= (1<<DW_2);  // activate DOWN
           _pitch = -1;
          } else { // CENTER
           DDR_CONT2 &=~(1<<UP_2);  // deactivate UP
           DDR_CONT2 &=~(1<<DW_2); // deactivate DOWN   
           _pitch = 0;     
          }
      Serial.print(nunchuk_pitch());
      Serial.print(THDGP);
      Serial.print(THDGN);
      Serial.println (_pitch);
      // deal with controller 2 - Roll  
      if (nunchuk_roll()>THDGP) { // RIGHT
        DDR_CONT2 |= (1<<RG_2); // activate RIGHT
        DDR_CONT2 &=~(1<<LF_2); // deactivate LEFT
        _roll = 1;
        } else if (nunchuk_joystickX()<THDGN) { // LEFT
           DDR_CONT2 &=~(1<<RG_2);  // deactivate RIGHT
           DDR_CONT2 |= (1<<LF_2);  // activate LEFT
           _roll = -1;
          } else { // CENTER
           DDR_CONT2 &=~(1<<RG_2);  // deactivate RIGHT
           DDR_CONT2 &=~(1<<LF_2); // deactivate LEFT
           _roll = 0;     
          }

       // deal with triggers
        if (nunchuk_buttonZ()) { //
           DDR_TRIG |= (1<<TA_1); // activate trigger A
           _ta = 1;
          } else {
           DDR_TRIG &=~(1<<TA_1); // deactivate trigger A
           _ta = 0;
          }
        
        if (nunchuk_buttonC()) { //
           DDR_TRIG |= (1<<TB_1); // activate trigger B
           _tb = 1;
          } else {
           DDR_TRIG &=~(1<<TB_1); // deactivate trigger B
           _tb = 0;
          }

#ifdef DEBUG
/*
      Serial.print("***");
      Serial.print("Speed:");
      if (_speed>0) Serial.print ("Accelerate"); else if (_speed<0) Serial.print ("SlowDown"); else Serial.print ("Keep");
      Serial.print(" / Yaw:");
      if (_nose>0) Serial.print ("Right"); else if (_nose<0) Serial.print ("Left"); else Serial.print ("Straight");
      Serial.print(" / Pitch:");
      if (_pitch>0) Serial.print ("Dive"); else if (_pitch<0) Serial.print ("Climb"); else Serial.print ("Neutral");
      Serial.print(" / Roll:");
      if (_roll>0) Serial.print ("Right"); else if (_roll<0) Serial.print ("Left"); else Serial.print ("Straight");
      Serial.print("  / Triggers: TA:");
      if (_ta>0) Serial.print ("On"); else Serial.print ("--");   
      Serial.print(" TB:");         
      if (_tb>0) Serial.print ("On"); else Serial.print ("--"); 
      Serial.println();
*/
      
      delay(100);

      
#endif

        
        //nunchuk_print();
    } else { // disable all outputs 
#ifdef DEBUG
      Serial.print("fail");
      delay(100);
#endif      
      DDRD &=0x0f;  // pins PD7..PD4 as inputs
      DDRC &=0xfc;  // pins PC1..PC0 as inputs
      DDRB &=0xf0;  // pins PB3..PB0 as inputs
      
      }
    delay(10);
} 
/*** FINIS ********************************************************************/
