/*****************************************************************************
 *   ___ __  __ _____  __  ___         _    _ _     
 *  / __|  \/  / __\ \/ / | _ \__ _ __| |__| | |___ 
 *  \__ \ |\/| \__ \>  <  |  _/ _` / _` / _` | / -_)
 *  |___/_|  |_|___/_/\_\ |_| \__,_\__,_\__,_|_\___|
 *                                                
 *  Daniel Jose Viana, august/september 2019 - danjovic@hotmail.com
 * 
 *  This project implements a paddle control that can be used to play games 
 *  on MSX computers and in Sega Master System video game consoles.
 * 
 *  This code is released under GPL V2.0 
 * 
 ***************************************************************************** 
 * Pinout
 * 
 * DE-9  SMS     MSX     ARDUINO   AVR
 *  1    D0/D4   DATA       8      PB0
 *  2    D1/D5   BUTTON     9      PB1
 *  3    D2/D6   -         10      PB2
 *  4    D3/D7   -         11      PB3
 *  5    +5V     +5V        
 *  6    BUTTON  CLOCK      3      PD3/INT1
 *  7    -       -          -      -  
 *  8    GND     START      2      PD2/INT0
 *  9    NIBBLE  GND       12      PB4
 *  
 * Potentiometer           A5      PC0
 * Fire Button              4      PD4
 *  
*/

///////////////////////////////////////////////////////////////////////////////
//  libraries
//
#include <avr/sleep.h>
#include <avr/power.h>
#include <avr/interrupt.h>

///////////////////////////////////////////////////////////////////////////////
//  Definitions
//
//#define DEBUG 1

#define debugPin 13


#define OUT_PORT PORTB
#define OUT_DDR  DDRB


#define _MSX 0
#define _SMS 1

#define _d0d4data       8  // PB0
#define _d1d5button     9  // PB1
#define _d2d6          10  // PB2
#define _d3d7          11  // PB3
#define _nibbleGND     12  // PB4
 
#define _buttonClock    3  // PD3/INT1
#define _gndStart       2  // PD2/INT0

#define _Potentiometer A0  // PC0 
#define _fireButton     4  // PD4


///////////////////////////////////////////////////////////////////////////////
// Variables
//
uint8_t  hostSystem;
uint8_t  phase0,phase1;

static volatile uint16_t shiftRegister;






///////////////////////////////////////////////////////////////////////////////
//  ___      _             
// / __| ___| |_ _  _ _ __ 
// \__ \/ -_)  _| || | '_ \
// |___/\___|\__|\_,_| .__/
//                   |_|
void setup() {
  // Initialize pins
  pinMode(_d0d4data  ,INPUT_PULLUP);  
  pinMode(_d1d5button,INPUT_PULLUP);
  pinMode(_d2d6      ,INPUT_PULLUP);
  pinMode(_d3d7      ,INPUT_PULLUP);
  pinMode(_nibbleGND ,INPUT_PULLUP);
  
  pinMode(_buttonClock ,INPUT_PULLUP);
  pinMode(_fireButton  ,INPUT_PULLUP);

  // Initialize ADC
  init_adc();
  
  // Detect host system
  if (digitalRead(_nibbleGND ))  {
     hostSystem = _SMS;
     initializeSMS();
  } else { 
     hostSystem = _MSX;
     initializeMSX();
  }

#ifdef DEBUG
  // Initialize Serial
  pinMode (debugPin,OUTPUT);
  digitalWrite (debugPin,LOW);
  Serial.begin(9600);
  if (hostSystem == _MSX)
     Serial.println("MSX");
  else
     Serial.println("SMS");
#endif


}



///////////////////////////////////////////////////////////////////////////////
//  _                  
// | |   ___  ___ _ __ 
// | |__/ _ \/ _ \ '_ \
// |____\___/\___/ .__/
//               |_|
//
void loop() {
  // run controller loop
  if (hostSystem == _MSX)
     doMsxArkanoid();
  else
    doSmsHpd200();
}


///////////////////////////////////////////////////////////////////////////////
//     ___                            ___             _   _             
//    / __|___ _ __  _ __  ___ _ _   | __|  _ _ _  __| |_(_)___ _ _  ___
//   | (__/ _ \ '  \| '  \/ _ \ ' \  | _| || | ' \/ _|  _| / _ \ ' \(_-<
//    \___\___/_|_|_|_|_|_\___/_||_| |_| \_,_|_||_\__|\__|_\___/_||_/__/
//   

                                                                   
///////////////////////////////////////////////////////////////////////////////
// Define logic levels at joystick port
inline void populateOuput(uint8_t portBits) { 
  OUT_PORT = portBits;
  OUT_DDR  = ~portBits;
  }


///////////////////////////////////////////////////////////////////////////////
// put CPU to sleep 
void go_sleep(void) {
  set_sleep_mode(SLEEP_MODE_IDLE);
  sleep_enable();         // Note: As Timer 0 is used by Arduino
  power_timer0_disable(); // housekeeping it should be turned off 
  sleep_mode();           // otherwise it will wake up CPU and hassle
  sleep_disable();        // the interrupt mechanism used by this code  
}


///////////////////////////////////////////////////////////////////////////////
// put ADC in free running mode
void init_adc(void) {
  ADCSRA = 0;             // clear ADCSRA register
  ADCSRB = 0;             // clear ADCSRB register
  ADMUX |= (0 & 0x07);    // set A0 analog input pin
  ADMUX |= (1 << REFS0);  // set reference voltage
  ADMUX |= (1 << ADLAR);  // left align ADC value to 8 bits from ADCH register

  // sampling rate is [ADC clock] / [prescaler] / [conversion clock cycles]
  // for Arduino Uno ADC clock is 16 MHz and a conversion takes 13 clock cycles
  ADCSRA |= (1<<ADPS2)|(0<<ADPS1)|(0<<ADPS0) ;  // 16 prescaler for 76.9 KHz

  ADCSRA |= (1 << ADATE); // enable auto trigger
//  ADCSRA |= (1 << ADIE);  // enable interrupts when measurement complete
  ADCSRA |= (1 << ADEN);  // enable ADC
  ADCSRA |= (1 << ADSC);  // start ADC measurements
}



///////////////////////////////////////////////////////////////////////////////
//    ___ __  __ ___                 _    _ _     
//   / __|  \/  / __|  _ __  __ _ __| |__| | |___ 
//   \__ \ |\/| \__ \ | '_ \/ _` / _` / _` | / -_)
//   |___/_|  |_|___/ | .__/\__,_\__,_\__,_|_\___|
//                    |_|                         


///////////////////////////////////////////////////////////////////////////////
// Perform hardware initialization for SMS 
void initializeSMS(void) {
	
	// Program Timer2 to generate one interrupt at each 62.5us
	cli(); // stop interrupts
	TCCR2A = 0; // set entire TCCR2A register to 0
	TCCR2B = 0; // same for TCCR2B
	TCNT2  = 0; // initialize counter value to 0
	// set compare match register for 16000 Hz increments
    OCR2A = 124; // = 16000000 / (8 * 16000) - 1  
    // turn on CTC mode
    TCCR2A |= (1 << WGM21);
    // Set CS22, CS21 and CS20 bits for 8 prescaler
    TCCR2B |= (0 << CS22) | (1 << CS21) | (0 << CS20);

	// Enable Timer2 compare interrupt
    TIMSK2 |= (1 << OCIE2A);
    
    // Enable interrupts
    sei();
	}

///////////////////////////////////////////////////////////////////////////////
// Run SMS paddle emulation
void doSmsHpd200(void) {
    uint8_t tempADC;
    
	// phase 0, less significant bits
	populateOuput(phase0);


   if (digitalRead(_fireButton)) {
    pinMode(_buttonClock,INPUT_PULLUP);
    } else { 
        digitalWrite(_buttonClock,LOW);
        pinMode(_buttonClock,OUTPUT);
      }
      
       
	go_sleep();

	// phase 1, most significant bits
	populateOuput(phase1);
	if (ADCSRA & (1<<ADIF)) { // New ADC sample ready?
		tempADC = ADCH;
		ADCSRA |= (1 << ADIF); // clear flag
		phase0 = (tempADC & 0x0f); // bits 0..3->D0..D3, bit 4=0
		phase1 = ( (tempADC>>4) | (1<<4)); // bits 0..3->D4..D7, bit 4=1
#ifdef DEBUG    
   digitalWrite(debugPin,HIGH);  
   digitalWrite(debugPin,LOW);     
#endif   
		}

	go_sleep();	
}


///////////////////////////////////////////////////////////////////////////////
// Timer 2 overflow interrupt, Used by SMS
ISR(TIMER2_COMPA_vect){ 
   // Do nothing, just wake CPU
}

//////////////////////////// End of SMS specific code /////////////////////////



///////////////////////////////////////////////////////////////////////////////
//    __  __ _____  __                _    _ _     
//   |  \/  / __\ \/ /  _ __  __ _ __| |__| | |___ 
//   | |\/| \__ \>  <  | '_ \/ _` / _` / _` | / -_)
//   |_|  |_|___/_/\_\ | .__/\__,_\__,_\__,_|_\___|
//                     |_|                         

///////////////////////////////////////////////////////////////////
// Perform hardware initialization for MSX
void initializeMSX(void) {
	  // program  External Interrupt(s) initialization

	  cli();

    // Enable external interrupts
	  EIMSK = (1<<INT0)|(1<<INT1);
	
    // trigger on rising edges for interrupt 0 (start pulse)
    // trigger on falling edge for interrupt 1 (clock)
	 EICRA = (1<<ISC11)|(0<<ISC10)|(1<<ISC01)|(1<<ISC00) ; 

    // clear any pending interrupts
    EIFR =  (1<<INTF0)|(1<<INTF1);

    sei();
  
  
}


///////////////////////////////////////////////////////////////////
// Run MSX paddle emulation 
void      doMsxArkanoid(void) {	
	go_sleep();	// do nothing, everything happens at interrupts
}


///////////////////////////////////////////////////////////////////////////////
// External Interrupt driven by pulse pin (8)
ISR(INT0_vect) { // Used by MSX 

   // Read potentiometer
   while (!(ADCSRA & (1<<ADIF)) );  // New ADC sample ready ?
    shiftRegister = ADC;
    ADCSRA |= (1 << ADIF); // clear flag


   //let MSB ready at output pin (1)  
   if (shiftRegister & (1<<15)) {
    pinMode(_d0d4data,INPUT_PULLUP);
    } else { 
        digitalWrite(_d0d4data,LOW);
        pinMode(_d0d4data,OUTPUT);
      }
   // and let next bit ready
   shiftRegister<<=1;    
      
   // sample fire button and update output pin (2)
   if (digitalRead(_fireButton)) {
    pinMode(_d1d5button,INPUT_PULLUP);
    } else { 
        digitalWrite(_d1d5button,LOW);
        pinMode(_d1d5button,OUTPUT);
      }

}


///////////////////////////////////////////////////////////////////////////////
// External Interrupt driven by Clock pin (6)
ISR(INT1_vect) {

   if (shiftRegister & (1<<15) ){

      OUT_DDR  &= ~(1<<0); // data on bit 0
      OUT_PORT |= (1<<0);    
    } else {
      OUT_PORT  &= ~(1<<0);
      OUT_DDR |= (1<<0);      
      }
 
   // shift regiter was pre-shifted 
   digitalWrite(debugPin,HIGH);  
   digitalWrite(debugPin,LOW); 
     
    // pre-shift next bit   
    shiftRegister<<=1; 

    
}

//////////////////////////// End of MSX specific code /////////////////////////
