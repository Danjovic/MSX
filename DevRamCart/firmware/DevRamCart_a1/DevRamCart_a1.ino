/***
 *    $$$$$$$\                      $$$$$$$\                          
 *    $$  __$$\                     $$  __$$\                         
 *    $$ |  $$ | $$$$$$\ $$\    $$\ $$ |  $$ | $$$$$$\  $$$$$$\$$$$\  
 *    $$ |  $$ |$$  __$$\\$$\  $$  |$$$$$$$  | \____$$\ $$  _$$  _$$\ 
 *    $$ |  $$ |$$$$$$$$ |\$$\$$  / $$  __$$<  $$$$$$$ |$$ / $$ / $$ |
 *    $$ |  $$ |$$   ____| \$$$  /  $$ |  $$ |$$  __$$ |$$ | $$ | $$ |
 *    $$$$$$$  |\$$$$$$$\   \$  /   $$ |  $$ |\$$$$$$$ |$$ | $$ | $$ |
 *    \_______/  \_______|   \_/    \__|  \__| \_______|\__| \__| \__|
 *                                                                    
 *                                                                    
 *                                                                    
 *     $$$$$$\                       $$\                              
 *    $$  __$$\                      $$ |                             
 *    $$ /  \__| $$$$$$\   $$$$$$\ $$$$$$\                            
 *    $$ |       \____$$\ $$  __$$\\_$$  _|                           
 *    $$ |       $$$$$$$ |$$ |  \__| $$ |                             
 *    $$ |  $$\ $$  __$$ |$$ |       $$ |$$\                          
 *    \$$$$$$  |\$$$$$$$ |$$ |       \$$$$  |                         
 *     \______/  \_______|\__|        \____/                          
 *                                                                    
 *    32k Eprom emulator for MSX. 
 *    Danjovic, 2025
 *    Released under GPL V3
 *    basic release - Februray 2025
 *                                                                    
 */

//    _ _ _                 _
//   | (_) |__ _ _ __ _ _ _(_)___ ___
//   | | | '_ \ '_/ _` | '_| / -_|_-<
//   |_|_|_.__/_| \__,_|_| |_\___/__/
//
#include <Adafruit_NeoPixel.h>
#include "FS.h"
#include "SPIFFS.h"

//       _      __ _      _ _   _
//    __| |___ / _(_)_ _ (_) |_(_)___ _ _  ___
//   / _` / -_)  _| | ' \| |  _| / _ \ ' \(_-<
//   \__,_\___|_| |_|_||_|_|\__|_\___/_||_/__/
//

// Neopixel
#define NEO_PIXELS 1
#define RGB_LED_BRIGHTNESS 30
#define MANUAL_RECEIVE_COLOR GREEN
#define AUTO_RECEIVE_COLOR CYAN
#define LOAD_SPIFSFILE_COLOR BLUE
#define STORE_SPIFSFILE_COLOR YELLOW

// button scan
#define PERIOD 10         // 10 ms button sample at ~100Hz
#define LPTHRESHOLD 50    // 500ms second
#define PULSETHRESHOLD 5  // 50ms

// GPIO pins / definitions
#define RESET 0    // Active high, resets the MSX
#define nEN 1      // LOW - Enable Z80 Address bus and disable shift registers
#define SCK 2      // Shift register serial clock
#define RCK 3      // Shift register transfer
#define SERIN 4    // Shift register data in first bit A15..A8,A7..A0,D7..D0  last bit
#define nWR 9      // Write pulse for SRAM
#define RGBLED 10  // Neopixel data
#define BUTTON 20  // Button input
#define LED 21     // Red LED

// SPIFS
#define FORMAT_SPIFFS_IF_FAILED true
#define SRAM_SIZE_KB 32
#define MAXSRAM (1024 * SRAM_SIZE_KB) - 1


//
//    _ __  __ _ __ _ _ ___ ___
//   | '  \/ _` / _| '_/ _ (_-<
//   |_|_|_\__,_\__|_| \___/__/
//
#define ledON() digitalWrite(LED, HIGH)
#define ledOFF() digitalWrite(LED, LOW)

//       _      _             _               _
//    __| |__ _| |_ __ _   __| |_ _ _ _  _ __| |_ _  _ _ _ ___ ___
//   / _` / _` |  _/ _` | (_-<  _| '_| || / _|  _| || | '_/ -_|_-<
//   \__,_\__,_|\__\__,_| /__/\__|_|  \_,_\__|\__|\_,_|_| \___/__/
//

typedef enum {
  START_CODE = 0,
  BYTE_COUNT,
  ADDRESS,
  RECORD_TYPE,
  DATA,
  CHECK_SUM
} t_hexFilefields;

typedef enum {
  errRUNNING = 0,
  errEND_OF_FILE,
  errCHECKSUM_ERROR,
  errUNDEFINED
} t_hexEngineExitCodes;

typedef enum {
  BLACK = 0,
  RED = 0xff0000,
  GREEN = 0x00ff00,
  BLUE = 0x0000ff,
  YELLOW = 0xffff00,
  MAGENTA = 0xff00ff,
  CYAN = 0x00ffff,
  WHITE = 0xffffff
} t_rgbColors;

typedef enum {
  btNONE = 0,
  btLONG,
  btPULSE
} t_buttonEvents;

typedef enum {
  AUTO_RECEIVE,
  MANUAL_RECEIVE,
  MANUAL_READY,
} t_masterModes;

//                 _       _
//    _ __ _ _ ___| |_ ___| |_ _  _ _ __  ___ ___
//   | '_ \ '_/ _ \  _/ _ \  _| || | '_ \/ -_|_-<
//   | .__/_| \___/\__\___/\__|\_, | .__/\___/__/
//   |_|                       |__/|_|


// Main state machine
void runAutoReceive(void);    // receive an ihex file and store it into sram when rech EOF
void runManualReceive(void);  // receive an ihex file until EOF is reached
void runManualReady(void);    // wait for a command after reception reach EOF

// Button scan
t_buttonEvents getButtonEvent(uint8_t pin);  // scan button

// Neopixel
void setRGBled(t_rgbColors color);                   // Set neopixel color and updtate it
void blinkRGBled(uint8_t times, t_rgbColors color);  // blink neopixel to indicate the state of an operation

//  intel hex receiveing state machine
t_hexEngineExitCodes iHexEngine(uint8_t rxByte);  // non blocking intel hex machine stream decoder
uint8_t char2nibble(uint8_t b);                   // convert '0'..'9','A'..'F' into hexadecimal nibble 0..15

// Transference functions
bool transferSRAMtoSPIffs(void);    // store the rambuffer into a SPIFFS file
bool transferSPIffsToBuffer(void);  // load a file from SPIFFS to rambuffer
void writeRAMbufferToSRAM(void);    // write rambuffer to SRAM. used multiple times along the program
void transferBufferToSRAM(void);// shift out contents of rambuffer to SRAM


//                   _            _
//    __ ___ _ _  __| |_ __ _ _ _| |_ ___
//   / _/ _ \ ' \(_-<  _/ _` | ' \  _(_-<
//   \__\___/_||_/__/\__\__,_|_||_\__/__/
//


//        _     _
//    ___| |__ (_)___ __| |_ ___
//   / _ \ '_ \| / -_) _|  _(_-<
//   \___/_.__// \___\__|\__/__/
//           |__/

Adafruit_NeoPixel ledRGB(NEO_PIXELS, RGBLED, NEO_GRB + NEO_KHZ800);

//                 _      _    _
//   __ ____ _ _ _(_)__ _| |__| |___ ___
//   \ V / _` | '_| / _` | '_ \ / -_|_-<
//    \_/\__,_|_| |_\__,_|_.__/_\___/__/
//

// intel hex stream decoder variables
uint8_t rambuffer[32 * 1024];
uint8_t incomingByte;
t_hexFilefields currentField;

// master mode state machine
t_masterModes masterMode;

// button handling timer
t_buttonEvents buttonEvent;
unsigned long timeNow;

//            _
//    ___ ___| |_ _  _ _ __
//   (_-</ -_)  _| || | '_ \
//   /__/\___|\__|\_,_| .__/
//                    |_|
void setup() {

  // Serial port
  Serial.begin(115200);
  while (!Serial) {}  // Wait for serial port to connect
  Serial.println("Dev Ram Cart");

  // GPIO pins
  pinMode(RESET, OUTPUT);
  pinMode(nEN, OUTPUT);
  pinMode(SCK, OUTPUT);
  pinMode(RCK, OUTPUT);
  pinMode(SERIN, OUTPUT);
  pinMode(nWR, OUTPUT);
  pinMode(RGBLED, OUTPUT);
  pinMode(BUTTON, INPUT_PULLUP);
  pinMode(LED, OUTPUT);

  digitalWrite(RESET, LOW);
  digitalWrite(nEN, HIGH);
  digitalWrite(SCK, LOW);
  digitalWrite(RCK, LOW);
  digitalWrite(SERIN, LOW);
  digitalWrite(nWR, HIGH);


  // initialize neopixel
  ledRGB.begin();
  ledRGB.setBrightness(RGB_LED_BRIGHTNESS);

  // initialize SPI filesystem
  Serial.print("SPIFFS Mount:");
  if ((SPIFFS.begin(FORMAT_SPIFFS_IF_FAILED) &&  // formatted ?
       SPIFFS.begin(true)))                      // mounted   ?
  {
    Serial.println("ok");
  } else {
    Serial.println("fail");  // if either fails message
    blinkRGBled(5, RED);
  }

  // init some variables  Receive file, manual load.
  currentField = START_CODE;
  masterMode = MANUAL_RECEIVE;
  buttonEvent = btNONE;
  setRGBled(MANUAL_RECEIVE_COLOR);
  digitalWrite(LED, LOW);

  // initialize time reference
  timeNow = millis();
}


//    _
//   | |___  ___ _ __
//   | / _ \/ _ \ '_ \
//   |_\___/\___/ .__/
//              |_|
void loop() {
  // scan button every 10ms
  if (millis() >= timeNow + PERIOD) {
    timeNow += PERIOD;
    buttonEvent = getButtonEvent(BUTTON);
  }

  // run state machine
  switch (masterMode) {
    case AUTO_RECEIVE:
      runAutoReceive();
      break;
    case MANUAL_RECEIVE:
      runManualReceive();
      break;
    case MANUAL_READY:
      runManualReady();
      break;
  }

}  // loop()


//    _            _                   _        _   _
//   (_)_ __  _ __| |___ _ __  ___ _ _| |_ __ _| |_(_)___ _ _
//   | | '  \| '_ \ / -_) '  \/ -_) ' \  _/ _` |  _| / _ \ ' \ 
//   |_|_|_|_| .__/_\___|_|_|_\___|_||_\__\__,_|\__|_\___/_||_|
//           |_|

//
//  Main state machine functions
//

// receive an ihex file and store it into sram when rech EOF
void runAutoReceive(void) {
  t_hexEngineExitCodes err = errUNDEFINED;

  // process serial data
  if (Serial.available() > 0) {
    incomingByte = Serial.read();
    err = iHexEngine(incomingByte);
  }

  // process state logic
  if (err == errEND_OF_FILE) {  // EOF
    writeRAMbufferToSRAM();
    currentField = START_CODE;
  } else {                         // !EOF
    if (buttonEvent == btPULSE) {  // change receive mode
      buttonEvent = btNONE;
      masterMode = MANUAL_RECEIVE;
      setRGBled(MANUAL_RECEIVE_COLOR);
    }
    if (buttonEvent == btLONG) {
      buttonEvent = btNONE;
      Serial.print("Read SPIFS to buffer:");
      if (!transferSPIffsToBuffer()) {  // write ram buffer to sram
        Serial.println("fail");
        blinkRGBled(2, RED);
        currentField = START_CODE;
      } else {
        Serial.println("ok");
        blinkRGBled(2, LOAD_SPIFSFILE_COLOR);
        writeRAMbufferToSRAM();
        currentField = START_CODE;
      }
      setRGBled(AUTO_RECEIVE_COLOR);
    }
  }
}

// receive an ihex file until EOF is reached
void runManualReceive(void) {
  t_hexEngineExitCodes err = errUNDEFINED;

  // process serial data
  if (Serial.available() > 0) {
    incomingByte = Serial.read();
    err = iHexEngine(incomingByte);
  }

  // process state logic
  if (err == errEND_OF_FILE) {  // EOF
    ledON();
    masterMode = MANUAL_READY;
    Serial.println("Buffer Ready");
  } else {  // !EOF
    if (buttonEvent == btPULSE) {
      buttonEvent = btNONE;
      masterMode = AUTO_RECEIVE;
      setRGBled(AUTO_RECEIVE_COLOR);
    }
    if (buttonEvent == btLONG) {
      buttonEvent = btNONE;

      Serial.print("Read SPIFS to buffer:");
      if (!transferSPIffsToBuffer()) {  // write ram buffer to sram
        Serial.println("fail");
        blinkRGBled(2, RED);
      } else {
        Serial.println("ok");
        blinkRGBled(2, LOAD_SPIFSFILE_COLOR);
        writeRAMbufferToSRAM();
      }
      currentField = START_CODE;
      setRGBled(MANUAL_RECEIVE_COLOR);
    }
  }
}


// wait for a command after reception reach EOF
void runManualReady(void) {
  t_hexEngineExitCodes err = errUNDEFINED;

  // process state logic
  if (buttonEvent == btPULSE) {
    buttonEvent = btNONE;
    writeRAMbufferToSRAM();  //
    ledOFF();
    currentField = START_CODE;
    masterMode = MANUAL_RECEIVE;
  }
  if (buttonEvent == btLONG) {
    buttonEvent = btNONE;
    ledOFF();
    Serial.print("Write buffer to SPIFS:");
    if (!transferSRAMtoSPIffs()) {  // write ram buffer to sram
      Serial.println("fail");
      blinkRGBled(2, RED);
    } else {
      Serial.println("ok");
      blinkRGBled(2, STORE_SPIFSFILE_COLOR);
      writeRAMbufferToSRAM();
      masterMode = MANUAL_RECEIVE;
    }
    currentField = START_CODE;
    setRGBled(MANUAL_RECEIVE_COLOR);
  }
}

//
// Button scan functions
//

// scan button
t_buttonEvents getButtonEvent(uint8_t pin) {
  static uint8_t pressCount = 0;
  bool buttonPress = (!digitalRead(pin));
  if (!buttonPress) {  // release
    if (pressCount > PULSETHRESHOLD && pressCount < LPTHRESHOLD) {
      pressCount = 0;
      return btPULSE;
    }
    pressCount = 0;
  } else {                               // press
    if (pressCount < 250) pressCount++;  // saturate
    if (pressCount == LPTHRESHOLD) return btLONG;
  }
  return btNONE;
}


//
// Neopixel handling
//

// Set neopixel color and updtate it
void setRGBled(t_rgbColors color) {
  ledRGB.setPixelColor(0, color);
  ledRGB.show();
}

// blink neopixel to indicate the state of an operation
void blinkRGBled(uint8_t times, t_rgbColors color) {
  if (times) {
    do {
      setRGBled(color);
      delay(500);
      setRGBled(BLACK);
      delay(300);
    } while (--times);
  }
}


//
//  intel hex receiveing state machine
//
t_hexEngineExitCodes iHexEngine(uint8_t rxByte) {
  static uint8_t phase = 0;
  static uint8_t byteCounter = 0;
  static uint16_t recordAddress;
  static uint8_t checkSum;
  static uint8_t rxBuffer[3];
  static uint8_t recordType;
  uint8_t tempData;

  // filter only valid characters
  if (rxByte != ':' &&                   //
      (rxByte < '0' || rxByte > '9') &&  //
      (rxByte < 'a' || rxByte > 'f') &&  //
      (rxByte < 'A' || rxByte > 'F'))    //
    return errRUNNING;

  // run state machine
  switch (currentField) {
    case START_CODE:
      Serial.print(".");
      if (rxByte == ':') {
        phase = 0;
        checkSum = 0;
        currentField = BYTE_COUNT;
      }
      break;

    case BYTE_COUNT:
      if (phase == 1) {  // last nibble
        phase = 0;
        byteCounter = char2nibble(rxByte) + (char2nibble(rxBuffer[0]) << 4);
        checkSum += byteCounter;
        currentField = ADDRESS;

      } else {  // first nibble
        rxBuffer[phase] = rxByte;
        phase++;
      }
      break;

    case ADDRESS:
      if (phase == 3) {  // last nibble
        phase = 0;
        recordAddress = (char2nibble(rxBuffer[0]) << 12) +  //
                        (char2nibble(rxBuffer[1]) << 8) +   //
                        (char2nibble(rxBuffer[2]) << 4) +   //
                        char2nibble(rxByte);                //

        checkSum += (recordAddress >> 8);    // add hight byte
        checkSum += (recordAddress & 0xff);  // add low byte

        currentField = RECORD_TYPE;
      } else {  // first, second and third nibble
        rxBuffer[phase] = rxByte;
        phase++;
      }
      break;

    case RECORD_TYPE:

      if (phase == 1) {  // last nibble
        phase = 0;
        recordType = char2nibble(rxByte) + (char2nibble(rxBuffer[0]) << 4);
        checkSum += recordType;
        currentField = (byteCounter > 0 ? DATA : CHECK_SUM);  // skip data if byte count = 0
      } else {                                                // first nibble
        rxBuffer[phase] = rxByte;
        phase++;
      }
      break;

    case DATA:
      if (phase == 1) {  // last nibble
        phase = 0;
        tempData = char2nibble(rxByte) + (char2nibble(rxBuffer[0]) << 4);
        checkSum += tempData;
        rambuffer[recordAddress & MAXSRAM] = tempData;  // mask address to 32k
        recordAddress++;
        byteCounter--;
        if (byteCounter == 0) {
          currentField = CHECK_SUM;
        }
      } else {  // first nibble
        rxBuffer[phase] = rxByte;
        phase++;
      }
      break;

    case CHECK_SUM:
      if (phase == 1) {  // last nibble
        phase = 0;
        currentField = START_CODE;  // reset machine always after checksum

        tempData = char2nibble(rxByte) + (char2nibble(rxBuffer[0]) << 4);

        if (((checkSum + tempData) & 0xff) == 0) {  // checksum match
          if (recordType != 0) {                    // not a data record
            Serial.println("!");
            return errEND_OF_FILE;
          }
        } else {  // checksum mismatch
          Serial.print("-CKS ERR-");
          return errCHECKSUM_ERROR;
        }

      } else {  // first nibble
        rxBuffer[phase] = rxByte;
        phase++;
      }
      break;
  }
  return errRUNNING;  // default return
}

// convert character 0..9,A..F/a..f into value 0-15
uint8_t char2nibble(uint8_t b) {
  if (b >= '0' && b <= '9') {
    return b - '0';
  } else if (b >= 'a' && b <= 'f') {
    return b - 'a' + 10;
  } else if (b >= 'A' && b <= 'F') {
    return b - 'A' + 10;
  } else return 0;
}

//
// Transference functions
//

// store the rambuffer into a SPIFFS file
bool transferSRAMtoSPIffs(void) {  // write file
  bool result = true;
  File ROMfile = SPIFFS.open("/ROM.BIN", FILE_WRITE);
  if (!ROMfile) {
    Serial.println("Failed to open file to write");
    result = false;
  } else {
    ROMfile.write(rambuffer, 32768);
  }
  ROMfile.close();
  return result;
}

// load a file from SPIFFS to rambuffer
bool transferSPIffsToBuffer(void) {  // read file
  bool result = true;
  File ROMfile = SPIFFS.open("/ROM.BIN", FILE_READ);
  if (!ROMfile) {
    Serial.println("Failed to open file to read");
    result = false;
  } else {
    ROMfile.read(rambuffer, 32768);  // read ?
  }
  ROMfile.close();
  return result;
}

// write rambuffer to SRAM. used multiple times along the program
void writeRAMbufferToSRAM(void) {
  Serial.print("Write bufer to SRAM:");
  ledON();
  transferBufferToSRAM();  // write ram buffer to sram
  ledOFF();
  Serial.println("ok");
}

// shift out contents of rambuffer to SRAM
void transferBufferToSRAM(void) {
  // disable buffers
  digitalWrite(nEN, HIGH);

  // transfer ramBuffer to SRAM
  for (uint16_t address = 0; address < 32768; address++) {
    // shift data out
    uint32_t bitsToWrite = (address << 8) | rambuffer[address];  // make a 32 bit value
    uint32_t mask = (1 << 23);
    for (uint8_t i = 0; i < 24; i++) {  // shift bits out starting by A15
      digitalWrite(SERIN, (bitsToWrite & mask ? HIGH : LOW));
      digitalWrite(SCK, HIGH);
      mask >>= 1;
      digitalWrite(SCK, LOW);
    }
    // transfer from latchs to outputs
    digitalWrite(RCK, HIGH);
    digitalWrite(RCK, LOW);

    // write to SRAM
    digitalWrite(nWR, LOW);
    digitalWrite(nWR, HIGH);
  }

  // pulse reset
  digitalWrite(RESET, HIGH);
  delay(1);
  digitalWrite(RESET, LOW);

  // enable buffers
  digitalWrite(nEN, LOW);
}
