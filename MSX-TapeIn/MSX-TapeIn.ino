/***
        __  __ _____  __  _                                 _   _
       |  \/  / __\ \/ / | |_ __ _ _ __  ___   _ _ ___ _  _| |_(_)_ _  ___ ___
       | |\/| \__ \>  <  |  _/ _` | '_ \/ -_) | '_/ _ \ || |  _| | ' \/ -_|_-<
       |_|  |_|___/_/\_\  \__\__,_| .__/\___| |_| \___/\_,_|\__|_|_||_\___/__/
                                  |_|
*/


#define debug1_hi() PORTB |=  (1<<4)
#define debug1_lo() PORTB &= ~(1<<4)
#define debug1_tg() PORTB ^=  (1<<4)


#define debug2_hi() PORTB |=  (1<<3)
#define debug2_lo() PORTB &= ~(1<<3)
#define debug2_tg() PORTB ^=  (1<<3)

#define debug3_hi() PORTB |=  (1<<2)
#define debug3_lo() PORTB &= ~(1<<2)
#define debug3_tg() PORTB ^=  (1<<2)

#define debug4_hi() PORTB |=  (1<<1)
#define debug4_lo() PORTB &= ~(1<<1)
#define debug4_tg() PORTB ^=  (1<<1)

#define _MAX_PULSE_LENGTH 250 // in 8us steps -> 2000ms -> down to 500 baud
#define _PULSE_TOLERANCE    4 // in 8us steps -> 32us
#define _SPURY_TIME         5 // in 8us steps -> 40us
#define t2Overflow() ( TIFR2 & (1<<0) )
#define t2Reset()     TIFR2 |= (1<<0)



typedef enum  { _INTERRUPT = 0,    // 0
                _HEADER_SYNC,    // 1
                _HEADER_AVERAGE, // 2
                _DATA_STARTBIT,  // 3
                _DATA_DATABITS   // 4
              } t_rxMachineState;






//                 _      _    _
//   __ ____ _ _ _(_)__ _| |__| |___ ___
//   \ V / _` | '_| / _` | '_ \ / -_|_-<
//    \_/\__,_|_| |_\__,_|_.__/_\___/__/
//

//volatile uint8_t _HIGHCYCLE;    // mininum lenght for a half bit time
//volatile uint8_t _LOWCYCLE;     // maximum lenght for a single bit

volatile uint8_t _LOWLIMIT;    // mininum lenght for a full bit cycle
volatile uint8_t _MAXBITLEN;   // maximum lenght for a full bit cycle

volatile uint16_t _MEDIA;  // maximum length for a single bit  // debug
volatile uint8_t rxx;

uint8_t temp;

volatile t_rxMachineState rxState = _INTERRUPT;


const byte ledPin = 13;
const byte interruptPin = 3;
volatile byte state = LOW;

void setup() {
  DDRB  |=    (1 << 4) | (1 << 3) | (1 << 2) | (1 << 1);
  PORTB = ~( (1 << 4) | (1 << 3) | (1 << 2) | (1 << 1) );
  debug1_hi();
  debug1_lo();



  Serial.begin(115200);
  pinMode(ledPin, OUTPUT);
  pinMode(interruptPin, INPUT_PULLUP);
  initializeTapeRead() ;
  attachInterrupt(digitalPinToInterrupt(interruptPin), TapeIn, CHANGE);
}

void loop() {

  delay(20);

  digitalWrite(ledPin, HIGH);
  delay(1);
  digitalWrite(ledPin, LOW);

  Serial.write('>');

  rxState = _HEADER_SYNC;

  while ( rxState == _HEADER_SYNC ); // wait for synchronize header
  cli(); temp = rxState; sei();  Serial.write ('0' + temp);
  while ( rxState == _HEADER_AVERAGE ); // wait for average levels
  cli(); temp = rxState; sei();  Serial.write ('0' + temp);
  Serial.print ("sum:"); Serial.print (_MEDIA );
  Serial.print (" lwlm"); Serial.print (_LOWLIMIT);
  Serial.print (" max"); Serial.println (_MAXBITLEN);

  
  do {
    do {
      cli(); temp = rxState; sei();
    } while ( temp == _DATA_STARTBIT );
    Serial.print (temp);
    Serial.write ('-');
    do {
      cli(); temp = rxState; sei();
    } while ( temp == _DATA_DATABITS );
    Serial.print (temp);
    Serial.write ('[');
    Serial.print (rxx, HEX);
    Serial.write (']');

  } while ( temp != _INTERRUPT );
  Serial.println("Break");

}




void initializeTapeRead() {
  // program Timer 2 -> prescaler 128, normal count, no interrupts
  TCCR2A = 0;
  TCCR2B = (1 << CS22) | (0 << CS21) | (1 << CS20) ; // 101 -> prescaler 128, increment every 8us
  TIMSK2 = 0;
  TIFR2 |= (1 << 0) ; // clear any pending interrupts
  rxState = _INTERRUPT;
  //   attachInterrupt(digitalPinToInterrupt(interruptPin), blink, CHANGE);

}

// dummy
void push (uint8_t rxdata) {
  rxx = rxdata;
}


void TapeIn () {
  static uint8_t  lastTime = 0;
  static uint8_t  thisTime = 0;
  static uint16_t pulseCount = 0;
  static int16_t  pulseLength = 0;
  static int16_t  lastPulseLength = 0;
  static uint16_t sum16 = 0;
  static uint8_t  phase = 0;
  static uint8_t  bitCount;
  static uint8_t  rxData;
  //static  uint8_t _HIGHCYCLE;    // mininum lenght for a half bit time
  //static  uint8_t _LOWCYCLE;     // maximum lenght for a single bit

  // state machine for reading data from tape

  thisTime = TCNT2; // counts since last pulse
  TCNT2 = 0;      // Keep Going




  switch (rxState) {
    // When 1,111 cycles have been found with less than 35 µs variation
    // in their lengths a header has been located.
    case _HEADER_SYNC:
      if (t2Overflow() ) {
        t2Reset();

        pulseCount = 0; // after overflow mark first time run

      } else { // sum every pair of pulse lenghts
        if ( pulseCount == 0 ) { // First time run
          pulseCount = 2222;
          lastPulseLength = 0;
        } else {
          pulseCount--;
          if ( pulseCount & (1 << 0) ) { // first half
            lastTime = thisTime;
          } else { // second half
            pulseLength = thisTime + lastTime; // compute pulse lenght.

            if (pulseLength > _MAX_PULSE_LENGTH ) { // Pulse exceed maximum time (baud rate too low)
              pulseCount = 0; // reset pulse count
              lastPulseLength = 0;
            }  else { // pulse lenght valid compare with last
              int16_t difference = pulseLength - lastPulseLength;
              lastPulseLength = pulseLength;                 // update value for next comparison
              if (difference < 0 ) difference = -difference; // absolute value

              // now check for stability
              if (difference > _PULSE_TOLERANCE ) { // one more pulse within tolerance(35us)
                pulseCount = 2222; // keep looking (but keep last length)
              } else {
                if ( pulseCount == 0 ) {   // if no more pulses left a stable waveform was found
                  rxState = _HEADER_AVERAGE;
                  pulseCount = 0 ; // reset value for next state
                }
              }
            }
          }
        }
      }
      break;

    case _HEADER_AVERAGE:
      if (t2Overflow() ) {
        t2Reset();
        pulseCount = 512; // 512 half countings = 256 cycles
        sum16 = 0; // reset counter

      } else {

        if ( pulseCount == 0 ) { // first run
          pulseCount = 512; // 512 half countings = 256 cycles
          sum16 = 0; // reset counter
        }

        sum16 = sum16 + thisTime;  // 

        if ( --pulseCount == 0 ) {  // after 256 full hi cycles (equivalent to 128 low cycles)
          _MEDIA = sum16 >> 7; // average time for a full cycle -> 4 half cycles
          _LOWLIMIT = _MEDIA - (_MEDIA >> 2) ;     // 
          _MAXBITLEN =  _MEDIA + (_MEDIA >> 2) ;   // +/- 25 % around average time

          sum16 = 0; // get ready for the next state
          lastTime = 0;
          rxState = _DATA_STARTBIT;
        }
      }
      break; //110010111


    case _DATA_STARTBIT:
      debug1_tg();
      if (t2Overflow() ) {
        t2Reset();
        rxState = _INTERRUPT;
      } else {
        sum16 = lastTime + thisTime;  // sum16 = full cycle, or time between two edges
        lastTime = thisTime;           // update

        if (sum16 < _LOWLIMIT) { // full cycle smaller than a high cycle
          pulseCount = 0;  // try the next pulse
          debug4_tg(); debug4_tg();
        } else { // part of a low cycle detected
          if  (sum16 > _MAXBITLEN ) {  // cycle too long?
            rxState = _INTERRUPT;   // yes, interrupt
          } else {
            pulseCount++;
            if (pulseCount == 2) {  // make sure it passed the full start byt
              debug2_tg();  debug2_tg();
              rxState = _DATA_DATABITS;
              pulseCount = 0;  // prepare for the next state
              lastTime = 0;
              bitCount = 0;
              sum16 = 0;
            }
          }
        }
      }
      debug1_tg();
      break;

    case _DATA_DATABITS:
      if (t2Overflow() ) {
        t2Reset();
        rxState = _INTERRUPT;
      } else {
        pulseCount++;
        sum16 = sum16 + thisTime;

        if (sum16 > _MAXBITLEN ) { // exceeded a bit time by a margin?
          rxState = _INTERRUPT;   // yes, interrupt

        } else { // not exceeded full bit time
          if (pulseCount == 2) { // check for low or high
            if (sum16 > _LOWLIMIT ) {  // is it a low bit?
              debug3_tg();
              rxData >>= 1; // yes, shift in a zero
              bitCount++;  // and advance bit counter
              pulseCount = 0; // reset pulse counter for next bit
              sum16 = 0;      // clear bit time for next bit
            }
          } else if (pulseCount == 4) {
            debug3_tg();
            rxData >>= 1;   // yes, shift in a zero
            rxData |= (1 << 7);
            bitCount++;  // and advance bit counter
            pulseCount = 0; // reset pulse counter for next bit
            sum16 = 0;      // clear bit time for next bit
          }

          // now check if we have a full byte
          if (bitCount == 8 ) {
            push(rxData);	// push data byte to the circular buffer
            rxState = _DATA_STARTBIT;
            lastTime = 0;
          }
        }
      }

      break;

    case _INTERRUPT:
    default:

      pulseCount = 0;
      TCNT2 = 0;

      break;

  }
}
