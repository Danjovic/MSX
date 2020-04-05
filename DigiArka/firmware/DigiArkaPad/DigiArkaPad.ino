/*******************************************************************************
       ____  _       _      _         _          __  ____           _
      |  _ \(_) __ _(_)_   / \   _ __| | ____ _  \ \|  _ \ __ _  __| |
      | | | | |/ _` | (_) / _ \ | '__| |/ / _` |__\ \ |_) / _` |/ _` |
      | |_| | | (_| | |_ / ___ \| |  |   < (_| |__/ /  __/ (_| | (_| |
      |____/|_|\__, |_(_)_/   \_\_|  |_|\_\__,_| /_/|_|   \__,_|\__,_|
               |___/

       Digispark Based Arkanoid clone/Standard Paddle for MSX
       Danjovic 2020 danjovic@gmail.com
       Expanded version for Arduino Uno, Nano and Digispark - 04/April/2020
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
#include <avr/eeprom.h>

///////////////////////////////////////////////////////////////////////////////
//    ___       __ _      _ _   _
//   |   \ ___ / _(_)_ _ (_) |_(_)___ _ _  ___
//   | |) / -_)  _| | ' \| |  _| / _ \ ' \(_-<
//   |___/\___|_| |_|_||_|_|\__|_\___/_||_/__/
//

#if defined (ARDUINO_AVR_DIGISPARK)
#define BUTTON 4 // Button input
#define DOWN   3 // DOWN  on MSX (pin 2)
#define CLOCK  2 // TRG A on MSX (pin 6) INT0 on AVR
#define TRIGA  2
#define SOC    1 // PULSE on MSX (pin 8) PCINT1 on AVR
#define DATA   0 // UP    on MSX (pin 1)

#define SOChigh() PINB&(1<<1) // Fast digital reading


#elif defined (ARDUINO_AVR_UNO) || defined(ARDUINO_AVR_NANO)
#define BUTTON 4 // Button input
#define DOWN   3 // DOWN  on MSX (pin 2)
#define CLOCK  2 // TRG A on MSX (pin 6) INT0 on AVR
#define TRIGA  2
#define SOC    9 // PULSE on MSX (pin 8) PCINT1 on AVR
#define DATA   8 // UP    on MSX (pin 1)

#define SOChigh() PINB&(1<<1) // Fast digital reading 
#endif


#define MSBIT 8  // Bit 8 is the 9th bit of the mapped ADC value
#define MINVAL 110
#define MAXVAL 390

#define thresholdStandard 768
#define thresholdVaus     255
enum mode_t { Standard, Automatic, Vaus } ;


///////////////////////////////////////////////////////////////////////////////
//   __   __        _      _    _
//   \ \ / /_ _ _ _(_)__ _| |__| |___ ___
//    \ V / _` | '_| / _` | '_ \ / -_|_-<
//     \_/\__,_|_| |_\__,_|_.__/_\___/__/
//
static volatile uint16_t shiftRegister;
mode_t operatingMode;
uint8_t eeAddress EEMEM = 0;


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
  pinMode(DOWN  , INPUT_PULLUP); // Tristate output DOWN directional
  pinMode(BUTTON, INPUT_PULLUP);        // External button input

  // Initialize ADC
  init_adc();

  // turn off Arduino housekeeping to not mess with timing
  power_timer0_disable();

  // Detect operating mode
  operatingMode = selectOperatingMode();

  cli();

  // Enable interrupts
#if defined (ARDUINO_AVR_DIGISPARK)
  if (operatingMode == Vaus)
    GIMSK = (1 << INT0 ) | // Interrupt on CLOCK signal
            (1 << PCIE ); // Interrupt on PULSE signal
  else
    GIMSK = (1 << PCIE ); // Only on PULSE signal Standard paddle

  MCUCR = (0 << ISC00) | // External INT on Falling edge ISC=[10])
          (1 << ISC01); // on pin TRGA (clock). Don't care for Standard

  PCMSK = (0 << PCINT0) | //
          (1 << PCINT1) | // Pin change INT on PULSE pin
          (0 << PCINT2) | //
          (0 << PCINT3) | //
          (0 << PCINT4) | //
          (0 << PCINT5); //

  // clear any pending interrupts
  GIFR =  (1 << INTF0) |
          (1 << PCIF );

#elif defined (ARDUINO_AVR_UNO) || defined(ARDUINO_AVR_NANO)
  if (operatingMode == Vaus) {
    EIMSK = (1 << INT0 ); // Interrupt on CLOCK signal
    PCICR = (1 << PCIE0 ); // Interrupt on PULSE signal
  }
  else
    PCICR = (1 << PCIE0 ); // Only on PULSE signal Standard paddle


  EICRA = (0 << ISC00) | // External INT on Falling edge ISC=[10])
          (1 << ISC01); // on pin TRGA (clock). Don't care for Standard


  PCMSK0 = (0 << PCINT0) | //
           (1 << PCINT1) | // Pin change INT on PULSE pin
           (0 << PCINT2) | //
           (0 << PCINT3) | //
           (0 << PCINT4) | //
           (0 << PCINT5); //

  // clear any pending interrupts
  EIFR =  (1 << INTF0);
  PCIFR = (1 << PCIF0 );

#endif

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
  // update buttons
  if (operatingMode == Vaus)
    updateVausButton();
  else
    updateStandardButton();

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
inline void init_adc() {
#if defined (ARDUINO_AVR_DIGISPARK)
  ADMUX  = (0 << MUX0 ) | // Select AN0 ADMUX=[0000]
           (0 << MUX1 ) | //
           (0 << MUX2 ) | //
           (0 << MUX3 ) | //
           (0 << REFS2) | //
           (0 << ADLAR) | // Right Aligned value
           (0 << REFS0) | //
           (0 << REFS1); // Select Vref=Vcc REFS=[000]

#elif defined (ARDUINO_AVR_UNO) || defined(ARDUINO_AVR_NANO)
  ADMUX  = (0 << MUX0 ) | // Select AN0 ADMUX=[0000]
           (0 << MUX1 ) | //
           (0 << MUX2 ) | //
           (0 << MUX3 ) | //
           (0 << ADLAR) | // Right Aligned value
           (1 << REFS0) | //
           (0 << REFS1); // Select Vref=AVcc with capacitor at AREF  REFS=[01]


#endif

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
           (0 << ADTS2);  //
}


//
// Select operating mode
//
inline mode_t selectOperatingMode() {
  uint8_t mode;
  uint16_t potValue;

  // Change mod if button pressed on startup
  if (digitalRead(BUTTON) == 0) {

    // read potentiometer position
    while (!(ADCSRA & (1 << ADIF)) ); // New ADC sample ready ?
    potValue = ADC;                   //
    ADCSRA |= (1 << ADIF);            // release for next reading

    if (potValue > thresholdStandard) {
      mode = Standard;
    } else if (potValue < thresholdVaus) {
      mode = Vaus;
    } else mode = Automatic;

    // store new configuration
    eeprom_write_byte(&eeAddress, mode);
  }

  // Read stored operating mode
  mode = eeprom_read_byte(&eeAddress);

  // detect operating mode if mode is Automatic (or unknown)
  if ((mode != Standard) && (mode != Vaus)) {

    uint8_t thisPulse, thisTrigA;
    uint8_t lastPulse = digitalRead(SOC);
    uint8_t lastTrigA = digitalRead(CLOCK);
    uint8_t clockCount = 0;
    uint8_t pulseCount = 0;

    // Check how many times pin 6 changed state until pin 8 has pulsed 5 times
    //
    do {
      // sample signals
      thisPulse = digitalRead(SOC);
      thisTrigA = digitalRead(CLOCK);

      // count clock pulses
      if ( thisPulse != lastPulse) {
        pulseCount++;
        lastPulse = thisPulse;
      }

      // count Pulse state changes
      if ( thisTrigA != lastTrigA) {
        clockCount++;
        lastTrigA = thisTrigA;
      }

      updateVausButton();  // Arkanoid game needs to detect button press
      // before start issuing pulses

    } while (pulseCount < 10); // complete cycles

    if (clockCount > 0) mode = Vaus; //
    else mode = Standard;
  }

  // always return either Vaus or Standard
  return (mode_t)mode;
}



//
// Sample fire button and update output pin (6)
//
inline void updateStandardButton() {
  if (digitalRead(BUTTON)) {
    pinMode(TRIGA, INPUT_PULLUP);
  } else {
    digitalWrite(TRIGA, LOW);
    pinMode(TRIGA, OUTPUT);
  }
}

//
// Sample fire button and update output pin (2)
//
void updateVausButton() {
  if (digitalRead(BUTTON)) {
    pinMode(DOWN, INPUT_PULLUP);
  } else {
    digitalWrite(DOWN, LOW);
    pinMode(DOWN, OUTPUT);
  }
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
  uint8_t countDown;


  if (SOChigh()  ) { //Rising edge?

    if (operatingMode == Standard) { // Standard Mode
      //      pinMode(DATA,INPUT_PULLUP); // Turn output HIGH
      //      digitalWrite(13,HIGH);


      // Read potentiometer
      while (!(ADCSRA & (1 << ADIF)) ); // New ADC sample ready ?
      countDown = uint8_t(ADC >> 2);   // make 8 bit value
      ADCSRA |= (1 << ADIF); // release ADC for next conversion


      // Loop through ADC value, hand tuned to 12us
      while (countDown) {
        delayMicroseconds(13);
        //      asm volatile ( "nop\n" );
        countDown--;
      }

      // then turn off signal
      digitalWrite(DATA, LOW);
      pinMode(DATA, OUTPUT);

      // then make a brief pause for Z80 to detect the end of cycle
      delayMicroseconds(50);

      // Turn output HIGH again
      pinMode(DATA, INPUT_PULLUP);

    } else {  // Vaus Mode

      // Read potentiometer
      while (!(ADCSRA & (1 << ADIF)) ); // New ADC sample ready ?
      potValue = ADC;
      ADCSRA |= (1 << ADIF); // release ADC for next conversion

      // Map value read
      shiftRegister = map(potValue, 0, 1023, MINVAL, MAXVAL);

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
  }  // endif rising edge
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

#if defined (ARDUINO_AVR_DIGISPARK)
  GIFR |= (1 << PCIF ); // <- De-glitch in a single instruction!

#elif defined (ARDUINO_AVR_UNO) || defined(ARDUINO_AVR_NANO)
  PCIFR |= (1 << PCIF0 );
#endif

}
