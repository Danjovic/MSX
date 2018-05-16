
;
; MSX Paddles Revisited
; Danjovic 2018 - danjovic@hotmail.com
; Released under GPL 2.0
;

; For ATTiny85 running at internal 16MHz clock

.nolist
.include "tn85def.inc"
.list

;
; Pin-DE9 MSX-Stick  MSX-Paddle Arkanoid-Pad   Tiny85 pin/signal
;   1      UP          PDL0 (UP) DOut           5  / PB0
;   2      DOWN        N.C.      Button (DOWN)  6  / PB1
;   6      TRIG-A      TRG-A     Clock          2  / PB4
;   8      PULSE       PULSE     Start          7  / PB2/INT0
;
;                                               1  / PB5/ADC0 Potentiometer
;                                               3  / PB3      Button
;
;
;
; BOARD    ---MSX---                                    ---MSX---
;          Pin  Name             +---__---|             Name  Pin
; POT                 ADC0/PB5 1 |        | 8 Vcc       +5V    5
;           6  TRG-A       PB4 2 |ATTiny85| 7 PB2/INT0  PULSE  8
; BUTTON                   PB3 3 |        | 6 PB1       DOWN   2
;           9  GND         GND 4 |        | 5 PB0       UP     1
;                                +--------+
;

.equ ButtonPin = 3


.equ PinUP     = 0  ; MSX Paddle
.equ PinTRGA   = 4


.equ PinDout   = 0  ; Arkanoid Paddle
.equ PinDOWN   = 1
.equ PinClock  = 4
.equ PinStart  = 2

.equ T_12us = 48 ; 48 * 4 instr= 12us 
.equ T_24us = 96




; Register usage
; r16 = SREG backup during IRQ
; r17 = temp used in IRQ
; r18 = temp
; r19 = TWaitHigh ; used in MSX Paddle loop
; r20 = Operating Mode





.cseg
.org 0
	rjmp START         ; External Pin, Power-on Reset,Brown-out Reset, Watchdog Reset
	rjmp EXT_INT       ; External Interrupt Request 0
	rjmp PC_INT        ; Pin Change Interrupt Request 0
	rjmp TIMER1_COMPA  ; Timer/Counter1 Compare Match A
	rjmp TIMER1_OVF    ; Timer/Counter1 Overflow
	rjmp TIMER0_OVF    ; Timer/Counter0 Overflow
	rjmp EE_RDY        ; EEPROM Ready
	rjmp ANA_COMP      ; Analog Comparator
	rjmp ADCC          ; ADC Conversion Complete
	rjmp TIMER1_COMPB  ; Timer/Counter1 Compare Match B
	rjmp TIMER0_COMPA  ; Timer/Counter0 Compare Match A
	rjmp TIMER0_COMPB  ; Timer/Counter0 Compare Match B
	rjmp WDT           ; Watchdog Time-out
	rjmp USI_START     ; USI START
	rjmp USI_OVF       ; USI Overflow

; unused interrupts
;EXT_INT:
;PC_INT:
TIMER1_COMPA:
TIMER1_OVF:
TIMER0_OVF:
EE_RDY:
ANA_COMP:
;ADCC:
TIMER1_COMPB:
TIMER0_COMPA:
TIMER0_COMPB:
WDT:
USI_START:
USI_OVF:
  reti


EXT_INT: ; Used in MSX Paddle mode
  in r16,SREG  ; save context 

;## DOUT = HIGH ##
  sbi PORTB,PinUP  ; Release the pin UP 
  cbi DDRB,PinUP   ; 


;## wait TWaitHigh ##
  ldi r17,T_24us ; 1
  nop       ; 1   
  dec r17   ; 1   2
  brne pc-2 ; 2   4   r17*4 cycles
  
   
; r19 holds the potentiometer value 0..255 
; the output should stay high by this value times 12us (192 cycles@16MHZ).
Loop_MSX_Pad_Timing:   

  ldi r17,T_12us-1 ; 47
  nop       ; 1   
  dec r17   ; 1   2
  brne pc-2 ; 2   4   r17*4 = 47*4 = 188 cycles 

  nop       ; 1  189    
  dec r19   ; 1  190
  brne Loop_MSX_Pad_Timing ; 2/1  192 
 
 ;## DOUT = LOW ##
  cbi PORTB,PinUP  ; Hold down the pin UP 
  sbi DDRB,PinUP   ;   
  	
  out SREG,r16   ; restore context 
  reti




; ### IRQ Pin Change ###
; Start a new ADC Conversion at falling edges
; Used in Arkanoid Paddle mode
PC_INT:    
  in r16,SREG
  sbis PINB,PinStart ; Falling Edge ?  
  sbi ADCSRA,ADSC    ; Yes, start a new conversion
                     ; No, return
  out SREG,r16
  reti


; ### IRQ ADC End of Conversion ###
; Load a new value on the output shift register value composed by R24:R25
; Used in Arkanoid Paddle mode
ADCC:          
  in r16,SREG

  ; According with calculations performed on Arkanoid schematic
  ; the output counting should be between 106 and 602, hence a 496 counts
  ; For this program the counting range is being considered from 
  ; 100 to 612, hence 512 counts added to an offset of 100.
  ; 
  ; The ADC Value shall then be divided by two to get 0-511 counts interval
  ; which will be added by 100.
  ; 
  ; Since the ADC value is left justified the offset shall also be shifted
  ; to be justified with the lsbit of the ADC befere it is added to the ADC Value
  ;
  ; In practical terms we should have:
  ; r24:r25 = (ADC /2 ) + (100<<6)

  in r24,ADCH  ; r24:r25 = ADC
  in r25,ADCL


  lsr r24      ;  Divide by two
  ror r25


.equ PadOffset = 100<<6 ; 6400   
  
                                ; Add (100<<6)
  subi	r25, low(-PadOffset)	; Add low byte ( x -(-y)) = x + y
  sbci	r24, high(-PadOffset)	; Add high byte with carry


  ; copy r24 MSB to Dout
  sbrc r24,7
  rjmp pc+4  ; (set Dout)

  sbi DDRB,PinDout   ;  ResetDout:
  cbi PORTB,PinDout
  rjmp pc+3 ; (continue)

  cbi DDRB,PinDout   ;  SetDout
  sbi PORTB,PinDout



ArkReturn:
  out SREG,r16
  reti




; ****************
START:

; Initialize
  cli
  clr r18
  out DDRB,r18
  sbi PORTB,ButtonPin  ; Activate pullup on button pin



; Read Last Operating Mode
  sbic EECR,EEPE  ; Wait for completion of previous write, if any
  rjmp pc-1
  out  EEARH, r18   ; Set up address 0 in address register
  out  EEARL, r18
  sbi  EECR,EERE    ; Start eeprom read by writing EERE
  in  r20,EEDR      ; r20: Operating Mode

; Then Check button state
  sbic PINB,ButtonPin      ; Pressed?
  rjmp StartSelectedMode    ; No, keep last Operating Mode

; Yes, Change the Operating Mode
  ; Toggle operating mode
  ldi r17,1
  eor r20,r17

  ; write back to EEPROM
  sbic EECR,EEPE     ; Wait for completion of previous write
  rjmp pc-1
  ldi r17, (0<<EEPM1)|(0<<EEPM0) ; Set Programming mode
  out EECR, r17
  out  EEARH, r18   ; Set up address 0 in address register
  out  EEARL, r18
  out  EEDR, r20    ; Write Operating mode to data register
  sbi  EECR,EEMPE  ; Write logical one to EEMPE
  ; Start eeprom write by setting EEPE
  sbi  EECR,EEPE


StartSelectedMode:  ; bit 0 from R16
  sbrc r20,0  ; check bit 0
  rjmp ARKANOID_Paddle  ; ==0: Msx Paddle
                        ; ==1: Arkanoid Paddle

MSX_Paddle:
; Pinout:
; Pin-DE9 MSX-Stick  MSX-Paddle Tiny85        Direction
;   1      UP          PDL0     PB0            Out /in
;   2      DOWN        N.C.     PB3            in
;   6      TRIG-A      TRG-A    PB4            Out /in
;   8      PULSE       PULSE    PB2/INT0       in
;                               PB5/ADC0 Pot.  in
;                               PB3      Btn.  in
;
; Init IO
  clr r18
  out DDRB,r18
  ser r18
  out PORTB,r18  ;  activate pullups
  
; Init ADC
  ldi r18, (0<<REFS1)|(0<<REFS0)|(1<<ADLAR)|(0<<REFS2)|(0<<MUX3 )|(0<<MUX2 )|(0<<MUX1 )|(0<<MUX0 )
  out ADMUX ,r18
  ldi r18, (1<<ADEN )|(1<<ADSC )|(1<<ADATE)|(1<<ADIF )|(0<<ADIE )|(1<<ADPS2)|(1<<ADPS1)|(1<<ADPS0)
  out ADCSRA,r18
  ldi r18, (0<<BIN  )|(0<<ACME )|(0<<IPR  )|                      (0<<ADTS2)|(0<<ADTS1)|(0<<ADTS0)
  out ADCSRB,r18
  ldi r18,                       (1<<ADC0D)|(0<<ADC2D)|(0<<ADC3D)|(0<<ADC1D)|(0<<AIN1D)|(0<<AIN0D)
  out DIDR0 ,r18


; Init IRQ
  ldi r18,(1<<ISC01)|(1<<ISC00)
  out MCUCR,r18
  ldi r18,(1<<INT0)|(0<<PCIE)
  out GIMSK,r18
  ldi r18,(1<<INTF0)|(1<<PCIF)
  out GIFR,r18
  ldi r18,(0<<PCINT5)|(0<<PCINT4)|(0<<PCINT3)|(0<<PCINT2)|(0<<PCINT1)|(0<<PCINT0)
  out PCMSK,r18

  sei


PadLoop1:
  sbic ADCSRA,ADIF      ; Has conversion ended?
  rjmp PadUpdateButton  ; No, test Trigger Button

  sbi ADCSRA,ADIF       ; Yes reset ADC flag
  in r19,ADCH           ; Yes, update TWaitHigh (r19)



PadUpdateButton:        ; Check button state
  sbis PINB,ButtonPin   ; Released? 
  rjmp HoldTRGA         ; No, Hold TRGA button down 
                        
ReleaseTRGA:            ; Yes, Release TRIGGER A line
  cbi DDRB, PinTRGA 
  sbi PORTB,PinTRGA 
  rjmp PadLoop1

HoldTRGA:               ; Hold down TRIGGER A line
  sbi DDRB, PinTRGA
  cbi PORTB,PinTRGA 
  rjmp PadLoop1




ARKANOID_Paddle:   ; 1:Arkanoid Paddle
; Pinout:
; Pin-DE9 MSX-Stick  Arkanoid-Pad   Tiny85
;   1      UP         DOut           PB0
;   2      DOWN       Button         PB3
;   6      TRIG-A     Clock          PB4
;   8      PULSE      Start          PB2/PCINT2
;                                    PB5/ADC0 Potentiometer
;                                    PB3      Button

; Init IO
  clr r18
  out DDRB,r18
  ser r18
  out PORTB,r18  ;  activate pullups
  
; Init ADC
  ldi r18, (0<<REFS1)|(0<<REFS0)|(1<<ADLAR)|(0<<REFS2)|(0<<MUX3 )|(0<<MUX2 )|(0<<MUX1 )|(0<<MUX0 )
  out ADMUX ,r18
  ldi r18, (1<<ADEN )|(0<<ADSC )|(0<<ADATE)|(1<<ADIF )|(1<<ADIE )|(1<<ADPS2)|(1<<ADPS1)|(1<<ADPS0)
  out ADCSRA,r18
  ldi r18, (0<<BIN  )|(0<<ACME )|(0<<IPR  )|                      (1<<ADTS2)|(1<<ADTS1)|(0<<ADTS0)
  out ADCSRB,r18
  ldi r18,                       (1<<ADC0D)|(0<<ADC2D)|(0<<ADC3D)|(0<<ADC1D)|(0<<AIN1D)|(0<<AIN0D)
  out DIDR0 ,r18


; Init IRQ
  ldi r18,(1<<ISC01)|(1<<ISC00)
  out MCUCR,r18
  ldi r18,(0<<INT0)|(1<<PCIE)
  out GIMSK,r18
  ldi r18,(1<<INTF0)|(1<<PCIF)
  out GIFR,r18
  ldi r18,(0<<PCINT5)|(0<<PCINT4)|(0<<PCINT3)|(1<<PCINT2)|(0<<PCINT1)|(0<<PCINT0)
  out PCMSK,r18

  sei



ArkPadLoop1:


; ## UPDATE BUTTON STATE ##
ArkUpdateButton:        ; Check button state
  sbis PINB,ButtonPin   ; Released? 
  rjmp HoldDOWN         ; No, Hold DOWN line down 
                        
ReleaseDOWN:            ; Yes, Release DOWN line
  cbi DDRB, PinDOWN 
  sbi PORTB,PinDOWN
  rjmp ArkCheckClock

HoldDOWN:               ; Hold down DOWN line
  sbi DDRB, PinDOWN
  cbi PORTB,PinDOWN  


ArkCheckClock:          ; keep updating button while clock signal is high
  sbic PINB,PinClock 
  rjmp ArkPadLoop1

  lsl r25  ; shift left last pot result
  rol r24 

  ; copy r24 MSB to Dout
  sbrc r24,7
  rjmp pc+4  ; (set Dout)

  sbi DDRB,PinDout   ;  ResetDout:
  cbi PORTB,PinDout
  rjmp pc+3 ; continue

  cbi DDRB,PinDout   ;  SetDout
  sbi PORTB,PinDout


  sbis PINB,PinClock   ; wait Clock rise again
  rjmp pc-1

  rjmp ArkPadLoop1






















