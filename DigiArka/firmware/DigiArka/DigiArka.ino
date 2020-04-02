/*******************************************************************************
        ____  _       _      _         _
       |  _ \(_) __ _(_)_   / \   _ __| | ____ _
       | | | | |/ _` | (_) / _ \ | '__| |/ / _` |
       | |_| | | (_| | |_ / ___ \| |  |   < (_| |
       |____/|_|\__, |_(_)_/   \_\_|  |_|\_\__,_|
                |___/

       Digispark Based Arkanoid Paddle clone for MSX
       Danjovic 2020 danjovic@gmail.com
       Basic Release 30/March/2020
*/


///////////////////////////////////////////////////////////////////////////////
//    _    _ _                 _
//   | |  (_) |__ _ _ __ _ _ _(_)___ ___
//   | |__| | '_ \ '_/ _` | '_| / -_|_-<
//   |____|_|_.__/_| \__,_|_| |_\___/__/
//
#include <avr/sleep.h>
#include <avr/power.h>
#include <avr/interrupt.h>



///////////////////////////////////////////////////////////////////////////////
//    ___       __ _      _ _   _
//   |   \ ___ / _(_)_ _ (_) |_(_)___ _ _  ___
//   | |) / -_)  _| | ' \| |  _| / _ \ ' \(_-<
//   |___/\___|_| |_|_||_|_|\__|_\___/_||_/__/
//
#define CLOCK 2 // TRG A on MSX (pin 6) 
#define SOC   1 // PULSE on MSX (pin 8)
#define DATA  0 // UP    on MSX (pin 1)

#define MSBIT 8  // Bit 8 is the 9th bit of the mapped ADC value
#define MINVAL 110
#define MAXVAL 390

///////////////////////////////////////////////////////////////////////////////
//   __   __        _      _    _
//   \ \ / /_ _ _ _(_)__ _| |__| |___ ___
//    \ V / _` | '_| / _` | '_ \ / -_|_-<
//     \_/\__,_|_| |_\__,_|_.__/_\___/__/
//
static volatile uint16_t shiftRegister;

///////////////////////////////////////////////////////////////////////////////
//  ___      _
// / __| ___| |_ _  _ _ __
// \__ \/ -_)  _| || | '_ \
// |___/\___|\__|\_,_| .__/
//
void setup() {
  // Initialize pins
  pinMode(CLOCK , INPUT_PULLUP); // Clock input
  pinMode(SOC   , INPUT_PULLUP); // Start Conversion
  pinMode(DATA  , INPUT_PULLUP); // Tristate data output


  // Initialize ADC
  init_adc();

  // Initialize Interrupts
  cli();
  // Enable interrupts
  GIMSK = (1<<INT0 )|  // External (int0)
          (1<<PCIE );  // Pin change 
          
  MCUCR = (0<<ISC00)|  // External INT on Falling edge ISC=[10])
          (1<<ISC01);  // on pin TRGA (clock)
      
  PCMSK = (0<<PCINT0)| // 
          (1<<PCINT1)| // Pin change INT on PULSE pin (start conversion)
          (0<<PCINT2)| // 
          (0<<PCINT3)| // 
          (0<<PCINT4)| // 
          (0<<PCINT5); // 

    // clear any pending interrupts
    GIFR =  (1<<INTF0)|
            (1<<PCIF );
    sei();  
}


///////////////////////////////////////////////////////////////////////////////
//  _
// | |   ___  ___ _ __
// | |__/ _ \/ _ \ '_ \
// |____\___/\___/ .__/
//               |_|
//
void loop() {
  // do nothing, everything happens at interrupts
  go_sleep();
}


///////////////////////////////////////////////////////////////////////////////
//    ___             _   _
//   | __|  _ _ _  __| |_(_)___ _ _  ___
//   | _| || | ' \/ _|  _| / _ \ ' \(_-<
//   |_| \_,_|_||_\__|\__|_\___/_||_/__/
//


//
// Put CPU to sleep
//
inline void go_sleep() {
  set_sleep_mode(SLEEP_MODE_IDLE);
  sleep_enable();         // Note: As Timer 0 is used by Arduino
  power_timer0_disable(); // housekeeping it should be turned off
  sleep_mode();           // otherwise it will wake up CPU and hassle
  sleep_disable();        // the interrupt mechanism used by this code
}


//
// Put ADC in free running mode
//
void init_adc() {

  ADMUX  = (0 << MUX0 ) | // Select AN0 ADMUX=[0000]
           (0 << MUX1 ) | //
           (0 << MUX2 ) | //
           (0 << MUX3 ) | //
           (0 << REFS2) | //
           (0 << ADLAR) | // Right Aligned value 
           (0 << REFS0) | //
           (0 << REFS1); // Select Vref=Vcc REFS=[000]

  ADCSRA = (0 << ADPS0) | // Prescaler 16 ADPS=[100]
           (0 << ADPS1) | //
           (1 << ADPS2) | //
           (0 << ADIE ) | // No ADC interrupts
           (0 << ADIF ) | //
           (1 << ADATE) | // Enable Auto Trigger
           (1 << ADSC ) | // Start conversion
           (1 << ADEN );  // Enable ADC

  ADCSRB = (0 << ADTS0) | // Free running mode ADTS=[000]
           (0 << ADTS1) | //
           (0 << ADTS2) | //
           (0 << IPR  ) | //
           (0 << ACME ) | //
           (0 << BIN  );  //
}





///////////////////////////////////////////////////////////////////////////////
//    ___     _                         _      
//   |_ _|_ _| |_ ___ _ _ _ _ _  _ _ __| |_ ___
//    | || ' \  _/ -_) '_| '_| || | '_ \  _(_-<
//   |___|_||_\__\___|_| |_|  \_,_| .__/\__/__/
//                                |_|          


//
// Pin change interrupt driven by SOC (Start of Conversion) pin (8) - PULSE
//
ISR(PCINT0_vect) { //
  uint16_t potValue;
  if (digitalRead(SOC  )) { //Rising edge?
  
    // Read potentiometer
    while (!(ADCSRA & (1 << ADIF)) ); // New ADC sample ready ?
    potValue=ADC;
    ADCSRA |= (1 << ADIF); // clear flag

    // Map value read
    shiftRegister = map(potValue,0,1023,MINVAL,MAXVAL); 

    //let MSB ready at output pin (1)
    if (shiftRegister & (1 << MSBIT)) {
      pinMode(DATA, INPUT_PULLUP);
    } else {
      digitalWrite(DATA, LOW);
      pinMode(DATA, OUTPUT);
    }
    // and let next bit ready
    shiftRegister <<= 1;
  }
}


//
// External Interrupt driven by Clock pin (6)
//
ISR(INT0_vect) {
  // output a new bit 
  if (shiftRegister & (1 << MSBIT)) {
    pinMode(DATA, INPUT_PULLUP);
  } else {
    digitalWrite(DATA, LOW);
    pinMode(DATA, OUTPUT);
  }
  // pre-shift next bit
  shiftRegister <<= 1;
        
  GIFR |= (1<<PCIF );   // <- De-glitch in a single instruction!      
}
