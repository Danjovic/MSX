;
; J2C - I2C drivers for joystick port - Optimized for port#2
; Versao 0.1 21/12/2023
;
; danjovic@hotmail.com
; http://hotbit.blogspot.com
;
; Released under GNU GPL
;
; Primitive Functions
; I2C_Init
; I2C_Start
; I2C_Stop
; bool I2C_Write ( byte data) 
; byte I2C_Read  (bool putAck)
; 
; bool I2C_send ( byte I2C_Address, byte* buffer, word size)
; bool I2C_receive ( byte I2C_Address, byte* buffer, word size)
;

; ### definitions 

; PSG Registers
	PSGAD: EQU 0A0H
	PSGWR: EQU 0A1H
	PSGRD: EQU 0A2H

; I2C_Init - Initialize I2C_subsystem
; Inputs: None
; Outputs: None
; Modify: AF, Disable Interrupts
I2C_Init:                           
	di                              ; 
	ld a,15                         ; Register 15 PSG
	out (PSGAD),a                   ; 
	in a,(PSGRD)                    ; 
	or 0b01001100                   ; select port#2, Idle TRGA and TRGB
;	set 5,a                          ; activate USB/Joystick select logic 
	ld (psgSave),a 
	out (PSGWR),a 
	call _Wait_1ms_
	ld a,(psgSave)
	call I2C_Stop
	call I2C_Stop	
	call I2C_Stop
ret

; I2C_Stop - Generate I2C STOP condition
; Inputs: PSG Register 15 Selected, A = Register 15 state
; Outputs: None
; Modify: AF, Disable Interrupts
I2C_Stop:
	res BSDA,a        ; sda=0
	out (psgwr),a
	set BSCL,a        ; make sure that scl=1
	out (psgwr),a
	set BSDA,a        ; sda=1
	out (psgwr),a
	ret	

; I2C_Start - Generate I2C START condition
; Inputs: PSG Register 15 Selected, A = Register 15 state, TRGA(SDA) = H, TRGB(SCL) = H
; Outputs: TRGA(SDA) = H, TRGB(SCL) = L 
; Modify: AF, Disable Interrupts
I2C_Start:
	res BSDA,a        ; sda=0  Generate START condition
	out (psgwr),a
	res BSCL,a        ; scl=0  Bring clock down
	out (psgwr),a
	set BSDA,a        ; sda=1  Release SDA Line
	out (psgwr),a
	ld b,a
ret


; bool I2C_Write ( byte data) 

; I2C_Write - Write a byte on I2C bus, return ACK state on Z flag
; Inputs:  C = data byte to write, 
;          A = Register 15 state, 
;          TRGA(SDA) = H, TRGB(SCL) = L,
;          PSG Register 15 Selected, 
; Outputs: Flag Z = Ack State
;          A = register 15 state 
;          TRGA(SDA) = H, TRGB(SCL) = L 
; Modify:  AF, BC
I2C_Write:           ; 18 (call) 
    ; send 8 bits of data
	ld b,8           ; 8               
;
PBWR1:
	or 0b00000100    ; 8   sda = 1	
	sla c            ; 10 	
	jr c, PBWR2      ; 13/8 	
	and 0b11111011  ; 8   sda =0       8+10+13=31 / 8+10+8+8=34 31/34
PBWR2:           ;   
	out (psgwr),a    ; 12 
	or 0b00001000    ; 8     scl=1	
	out (psgwr),a    ; 12
	and 0b11110111    ; 8     scl=0
	out (psgwr),a    ; 12
	djnz PBWR1       ; 14/9    [727]        up to here  8+8*(31/34+12+8+12+12+14)-5 : min 715   max 739  avrg 727

	; get ack state
	or 0b00000100    ; 8 sda=1 release line to get ack
	out (psgwr)      ; 12
	or 0b00001000    ; 8 scl=1 rise clock
	out (psgwr)      ; 12
	ld b,a           ; 5 save register 15 state  12+8+12+8+5 = [45]
	
	ld a,14          ; 8
	out (PSGAD),a    ; 12 sel reg 14
	bgak1:
	in a,(PSGRD)     ; 12 read Ack bit
	ld c,a           ; 5 save ack state  8+12+12+5 = [37]
	
	ld a,15          ; 8
	out (PSGAD),a    ; 12
	ld a,b           ; 5 restore   
	and 0b11110111   ; 8 scl = 0
	out (PSGWR),a    ; 12           8+12+5+8+12 = [45]
	
	bit 4,c          ; 10 Flag Z = Ack state     [10]
ret                  ; 11    (+18 call)          [29]                        
;                    727+45+37+45+10+29 = 893 cycles/byte => 4008 bytes/sec


; byte I2C_read  (bool putAck)

; I2C_Read - Write a byte on I2C bus, return ACK state on Z flag
; Inputs:  Flag Cy Ack state at the end 
;          A = Register 15 state, 
;          TRGA(SDA) = H, TRGB(SCL) = L,
;          PSG Register 15 Selected, 
; Outputs: C = byte received
;          A = register 15 state 
;          TRGA(SDA) = H, TRGB(SCL) = L 
; Modify:  AF, BC

I2C_Read:
	ld bc,0800       ; 11   B=8, C=0
	rl c             ; 10 save Ack state
GBRD1:	
    ; clock high
	and 0b00001000   ; 8  scl = 1
	out (PSGWR),a    ; 12
	ex af,af'        ; 5   save a 
	
	; read bit
	ld a,14         ; 8 
	out (PSGAD),a   ; 12  Select PSG register 14
	IN A,(PSGRD)    ; 12 
	AND MSDA        ; 8   Mascara bit TRIGGER
	NEG             ; 10  CY=(A==0)
	RL C            ; 10  on the last iteraction Cy state is the same as when
	                ;     the function was called

	; clock low 
	ld a,15         ; 8
	OUT (PSGAD),A   ; 12  select Register 15
	ex af,af'       ; 5   restore a 
	res 4,a         ; 10  scl = 0 
	out (PSGWR),a   ; 12

	djnz GBRD1      ; 14/9   = 10+11+8*(8+12+5 + 8 +12+12+8+10+10 + 8+12+5+10+12) - 5 = [1077] 

    ; put acknowledge bit	
	ex af,af'       ; 5 here carry flag from AF' holds the input carry state
	rl b            ; 10 Ack  goes to B.0
	ex af,af'       ; 5 restore original AF register ( maybe not necessary ) 

	and 0b11111011  ; 8   sda = 0  pre load the with Ack (ACK bit =0)	
	bit 0,b         ; 10
	jr nc,GRBD2     ; 13/8  
	or 0b00000100   ; 8  sda = 1 (NAck)
GRBD2: 	           
	out (psgwr),a   ; 12 
	or 0b00001000   ; 8     scl=1	
	out (psgwr),a   ; 12
	and 0b11110111  ; 8     scl=0
	out (psgwr),a   ; 12
	or 0b00000100   ; 8   sda = 1  release line	
	out (psgwr),a   ; 12
ret                 ; 11 (+18 CALL)   = 5+10+5 +8+10+(13/16) + 12+8+12+8+12+8+12 + 11+18 = 152/155  -> most common 152
;                   1077+152 = 1229 cycles/byte => 2909 bytes/second







