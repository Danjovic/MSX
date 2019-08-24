/*
	MEGA MSX - Dual Megadrive/Sega Genesis adapter for MSX

	Supports compatible mode and expanded mode

	Compatible mode button association. 
	
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

// required headers
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <avr/pgmspace.h>


// definitions


#define MSX_PULSE_PIN 7   // All MSX connected pins shall be on the same port
#define MSX_DDR  DDRD
#define MSX_PIN  PIND
#define MSX_PORT PORTD


#define Pulse_Pin() (MSX_PIN & (1<<MSX_PULSE_PIN))

// variables

          // Controller data
uint8_t   ControllerA, // UDLRAB
          ControllerB, // 
		  // Raw Data
		  RawA_H,      // U D L R B  C
		  RawA_L,      // A X Y Z St Mo
		  RawB_H,      // U D L R B  C
		  RawB_L;      // A X Y Z St Mo
		  
		  
		  


/*

After the fourth rising edge occurred in between two sample times (16.3ms)
the device presents raw data from the controllers at the outputs.
Controller data is wholly sampled and stored on Raw variables then converted
to four directions plus two triggers format and put in ControllerX variables


*/
//

//  PCINT23 - PD7



ISR(PCINT2_vect) {  

	uint8_t Phase = (Pulse_Pin())
//	if (Phase) SeqCount++;             // Count on rising edges  
	if (SeqCount < 4) {                // Normal Mode
		if (Phase) MSX_DDR = ControllerB; // Update present joystick
			else MSX_DDR = ControllerA;   	
	} else {                           // Raw Mode
 		if (Phase) {                   // Raw B data
			if (SeqCont & 0x01) MSX_DDR = RawB_H; 
				else (MSX_DDR = RawB_L;
		} else {                       // Raw A data
			if (SeqCont & 0x01) MSX_DDR = RawA_H; 
				else (MSX_DDR = RawA_L;
		}
	}
	
    if (Phase) SeqCount++;             // Count on rising edges 
	if (SeqCount==255) SeqCount = 5;   // roll over  
	TCNT0=0; // Reset Timer 0
	OCF0A=1;  // Reset overflow flag
}



void main (void) {

	// Program interrupts
	PCICR = (1<<PCIE2);  // PCINT23..16
	PCMSK2 = (1<<MSX_PULSE_PIN);

	PCIFR = (1<<PCIE2);  // Clear any pending interrupt	
	TIFR0 = (1<<TOV0);   //       

	// Program Timer 0 - Internal clock, 8MHz
	TCCR0B = (1<<CS02) | (1<<CS00) // Prescaler 1024, 
	TCCR0A = (1<<WGM01);  // CTC Mode, TOP = 128
	OCR0A = 128; // TOP = 128


	for (;;) {
		while (!OCF0A);                     // wait for 16ms tick
		OCF0A=1;                            // clear interrupt flag 
		Sample_Controllers();              // ditto
		cli();                             // disable interrupts
		if (Pulse_Pin()) MSX_DDR = ControllerB; // Update present joystick
			else MSX_DDR = ControllerA;       //
		SeqCount=0;                        // Reset Sequential Counter
		sei();                             // Restore interrupts
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
Low   UP DW LO LO A  ST
High  UP DW LF RG B  C
Low   UP DW LO LO A  ST
High  UP DW LF RG B  C   # If there is two up-edge in 1.1 milli seconds,
Low   LO LO LO LO A  ST  # D0 - D3 go Low as Sel goes Low.
High  Z  Y  X  MD HI HI  # Make Sel High and read D0 - D3.
Low   HI HI HI HI A  ST  # Check that D0 - D3 go High as Sel goes Low.
High  UP DW LF RG B  C   # Once this sequence take place
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
