/*
  _____                _     ____ ___ ____ 
 |_   _|__  _   _  ___| |__ |  _ \_ _/ ___|
   | |/ _ \| | | |/ __| '_ \| |_) | | |    
   | | (_) | |_| | (__| | | |  __/| | |___ 
   |_|\___/ \__,_|\___|_| |_|_|  |___\____|

 TouchPad for MSX using 4 wire touch panel  
 Daniel Jose Viana, 2014 - http://hotbit.blogspot.com
*/


/*  ___ _               _   
   | _ (_)_ _  ___ _  _| |_ 
   |  _/ | ' \/ _ \ || |  _|
   |_| |_|_||_\___/\_,_|\__|

                PIC16F688
                +-------\__/-------+
                |                  |
         VCC [1 |Vdd            Vss|14] GND 
                |                  |
             [2 |RA5            RA0|13] Y- / PGD  
                |                  |
          X+ [3 |RA4            RA1|12] X- / PGC
                |                  |
             [4 |RA3/MCLR       RA2|11] Y+  
                |                  |
        SOUT [5 |RC5            RC0|10] /CS     
                |                  |
         EOC [6 |RC4            RC1| 9] SCK 
                |                  |
      /SENSE [7 |RC3            RC2| 8] SI 
                |                  |
                +------------------+
     
*/

// Compiled on CCS Version 4.057

#include <16F688.h>
#use delay(clock=8000000) // 8MHZ Internal Clock
#fuses INTRC_IO,NOMCLR,NOWDT


//////////////////////////////////////////////////////////////////////////////////////////////
//  ___       __ _      _ _   _             
// |   \ ___ / _(_)_ _ (_) |_(_)___ _ _  ___
// | |) / -_)  _| | ' \| |  _| / _ \ ' \(_-<
// |___/\___|_| |_|_||_|_|\__|_\___/_||_/__/
//                                          

// SFRs
#byte PORTA   = 0x05
#byte TRISA   = 0x85
#byte WPUA    = 0x95

#bit Pin_Yplus   = PORTA.2

#byte PORTC   = 0x07
#byte TRISC   = 0x87

#bit CS_     = PORTC.0
#bit SI_     = PORTC.1
#bit SCK_    = PORTC.2
#bit nSENSE_ = TRISC.3
#bit EOC_    = TRISC.4
#bit SOUT_   = TRISC.5

#byte OPTION  = 0x81
#byte CMCON0  = 0x19
#byte ANSEL   = 0x91
#byte ADCON0  = 0x1F
#byte ADCON1  = 0x9F
#byte ADRESH  = 0x1E
#byte ADRESL  = 0x9E

#bit GODONE  = ADCON0.1
#bit RAPU    = OPTION.7

//////////////////////////////////////////////////////////////////////////////////////////////
//   ___ _     _          _  __   __        _      _    _        
//  / __| |___| |__  __ _| | \ \ / /_ _ _ _(_)__ _| |__| |___ ___
// | (_ | / _ \ '_ \/ _` | |  \ V / _` | '_| / _` | '_ \ / -_|_-<
//  \___|_\___/_.__/\__,_|_|   \_/\__,_|_| |_\__,_|_.__/_\___/__/
//

//////////////////////////////////////////////////////////////////////////////////////////////
//  ___             _   _            ___         _       _                     
// | __|  _ _ _  __| |_(_)___ _ _   | _ \_ _ ___| |_ ___| |_ _  _ _ __  ___ ___
// | _| || | ' \/ _|  _| / _ \ ' \  |  _/ '_/ _ \  _/ _ \  _| || | '_ \/ -_|_-<
// |_| \_,_|_||_\__|\__|_\___/_||_| |_| |_| \___/\__\___/\__|\_, | .__/\___/__/
//                                                           |__/|_|           

unsigned char Transfer (unsigned char Data);
int16 Read_Axis(int1 axis);
int1 Sense_Touch(void);
void go_idle(void);


//////////////////////////////////////////////////////////////////////////////////////////////
//  __  __      _        ___             _   _          
// |  \/  |__ _(_)_ _   | __|  _ _ _  __| |_(_)___ _ _  
// | |\/| / _` | | ' \  | _| || | ' \/ _|  _| / _ \ ' \ 
// |_|  |_\__,_|_|_||_| |_| \_,_|_||_\__|\__|_\___/_||_|
// 


void main (void) {

unsigned char CX,CY;
unsigned char DataIn,DataOut;
int1 Touched;
int1 LastSI;
int1 LastCS;  // Previous state of CS line


    // startup
	TRISA  = 0b11111111; // all pins as inputs initially
	PORTA  = 0b00011100; 
	WPUA   = 0b00000100;

	ANSEL  = 0b00001100; // Only channels 2 and 1 selected.
	ADCON0 = 0b00001101; // Left Justified, VDD as reference, CH3 selected, ADC enabled.
	ADCON1 = 0b00110000; // Internal clock

	CMCON0 = 0b00000111; // Comparators disabled
	
    TRISC=0b11111111;
    PORTC=0b00000000;    // all output latches in 0 for simulate open collector

    EOC_    = 1;  //float
    nSENSE_ = 1; // float
    SOUT_   = 1; // float
 
    LastCS=0;
  
    
    // Main Loop. Emulate uPD7001;
    for (;;) { 
	    
	    // wait for a rising edge on CS line
        
        while (CS_==0);     // aguarda transição /CS de 0->1
	    
	    EOC_=0; // signal as busy
	    
	    
	    // Read Touch Screen
	    CX=(unsigned char)Read_Axis(0);
		CY=(unsigned char)Read_Axis(1);
		Touched=Sense_Touch();
		go_idle();
		
		// Update /SENSE signal
		if (Touched) // if (Sense) 
		   nSENSE_=0;
		else
		   nSENSE_=1;
	   
	   // Prepare next word to be transferred
	   if (LastSI==0)
	      DataOut=CX;
	   else 
	      DataOut=CY;
	   
	   // Pre-load Shift Register Value   
	   if (DataOut & 0x80)
	      SOUT_=1;
	   else
	      SOUT_=0; 
	   
	   
		EOC_ = 1; // float EOC to tell MSX that the conversion is done 

	    do {
		    
	    } while (CS_); // wait for /CS to fall again
	    
	    
	    // transfer 8 bits of data
	    DataIn=Transfer(DataOut);
	    
	    // Get the channel information from last received bit
	   if (DataIn & 0x01)
	      LastSI=1;
	   else
	      LastSI=0; 
	    
    } // for

} // main


//////////////////////////////////////////////////////////////////////////////////////////////
//  ___             _   _            ___            _                   _        _   _          
// | __|  _ _ _  __| |_(_)___ _ _   |_ _|_ __  _ __| |___ _ __  ___ _ _| |_ __ _| |_(_)___ _ _  
// | _| || | ' \/ _|  _| / _ \ ' \   | || '  \| '_ \ / -_) '  \/ -_) ' \  _/ _` |  _| / _ \ ' \ 
// |_| \_,_|_||_\__|\__|_\___/_||_| |___|_|_|_| .__/_\___|_|_|_\___|_||_\__\__,_|\__|_\___/_||_|
//                                            |_|                                              
//                                  
int16 Read_Axis(int1 axis) {

   int16 Vplus, Vminus, Vread,Temp16;
   int32 Temp32;
	
   if (axis) {  // Read X Axis
   //	              X YXY
   //	              + +--
		TRISA  = 0b11111010; 
		PORTA  = 0b00011100;

		// read Yplus
		ANSEL  = 0b00000100; // AN2
	    ADCON0 = 0b10001001; // Left Justified, VDD as reference, CH2 selected, ADC enabled.
	    delay_us(20);        // wait for sample/hold time
		GODONE = 1;          // start the conversion
		while (GODONE);      // wait for clearing the bit 
		Vplus=ADRESH;
		Vplus<<=8;
		Vplus+=ADRESL;
				
		// read Yminus
		ANSEL  = 0b00000001; // AN0
	    ADCON0 = 0b10000001; // Left Justified, VDD as reference, CH0 selected, ADC enabled.
	    delay_us(20);        // wait for sample/hold time
		GODONE = 1;          // start the conversion
		while (GODONE);      // wait for clearing the bit 
		Vminus=ADRESH;
		Vminus<<=8;
		Vminus+=ADRESL;

		// read Xplus.
		ANSEL  = 0b00001000; // AN3
	    ADCON0 = 0b10001101; // Left Justified, VDD as reference, CH3 selected, ADC enabled.
	    delay_us(20);        // wait for sample/hold time
		GODONE = 1;          // start the conversion
		while (GODONE);      // wait for clearing the bit 
		Vread=ADRESH;
		Vread<<=8;
		Vread+=ADRESL;

   }   else  { // Read Y Axis
   //		          X YXY
   //		          + +--
		TRISA  = 0b11101101; 
		PORTA  = 0b00011100;

		// read Xplus.
		ANSEL  = 0b00001000; // AN3
	    ADCON0 = 0b10001101; // Left Justified, VDD as reference, CH3 selected, ADC enabled.
	    delay_us(20);        // wait for sample/hold time
		GODONE = 1;          // start the conversion
		while (GODONE);      // wait for clearing the bit 
		Vplus=ADRESH;
		Vplus<<=8;
		Vplus+=ADRESL;
		
		// read Xminus
		ANSEL  = 0b00000010; // AN1
	    ADCON0 = 0b10000101; // Left Justified, VDD as reference, CH1 selected, ADC enabled.
	    delay_us(20);        // wait for sample/hold time
		GODONE = 1;          // start the conversion
		while (GODONE);      // wait for clearing the bit 
		Vminus=ADRESH;
		Vminus<<=8; 
		Vminus+=ADRESL;

		// read Yplus
		ANSEL  = 0b00000100; // AN2
	    ADCON0 = 0b10001001; // Left Justified, VDD as reference, CH2 selected, ADC enabled.
	    delay_us(20);        // wait for sample/hold time
		GODONE = 1;          // start the conversion
		while (GODONE);      // wait for clearing the bit 
		Vread=ADRESH;
		Vread<<=8;
		Vread+=ADRESL;

   }

   

 //  Temp32=(Vread-Vminus);
   if (Vread < Vminus) Vread=Vminus;
   Temp16=(Vread-Vminus);
   Temp32=Temp16<<8;
   Temp32-=Temp16;
   if (Vread>VPlus) Vread=Vplus;
   Temp16=(Vplus-Vminus);
   Temp16=Temp32/Temp16;

   return Temp16;   
}



// /////////////////////////////////////////////////////////////////////////
int1 Sense_Touch(void) {
	    
	    RAPU=0; // enable pullup resistor 

//		              X YXY
//		              + +--
		TRISA  = 0b11111101; 
		PORTA  = 0b00011100;
	    ANSEL  = 0b00000000; // No channel selected
	    delay_us(20);        // may have to increase to compensate charge
	                         // time of screen capacitance
	    return (!Pin_Yplus); 
}

// /////////////////////////////////////////////////////////////////////////
void go_idle(void) {
	
	    RAPU=1; // Disable pullup resistors 
//		              X YXY
//		              + +--
		TRISA  = 0b11111111; 
		PORTA  = 0b00011100;
	    ANSEL  = 0b00000000; // 
	    ADCON0 = 0b00001101; // Left Justified, VDD as reference, CH3 selected, ADC enabled.
}


// /////////////////////////////////////////////////////////////////////////
unsigned char Transfer (unsigned char Data) {
	unsigned char j=8;
	unsigned char Din=0;
	
	do {
		// wait for clock down
		while (SCK_); //  { if (CS_) break; }
		
	    // Load Shift Register Value   
	    if (Data & 0x80)
	      SOUT_=1;
	    else
	      SOUT_=0; 
	
	    // wait for clock up
		while (!SCK_); //  { if (CS_) break; }
		
		
		// Sample incoming bit
		Din<<=1;
		if (SI_) Din |= 0x01;
		
		
		// Shift data register
		Data<<=1;	

        // decrease bit counter
	    j--;
	} while ( (j>0) ); // && (CS_==0) ); //   
    
    return Din;

}