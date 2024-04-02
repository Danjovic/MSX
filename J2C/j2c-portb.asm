;
; J2C - I2C drivers for joystick port - Optimized for port#2
; Versao 0.11 29/02/2024
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
; constants
  T1MS3MHZ: EQU 109
  T1MS7MHZ: EQU 220


; PSG Registers
	PSGAD: EQU 0A0H
	PSGWR: EQU 0A1H
	PSGRD: EQU 0A2H
	
; I2C bits
BSDA: EQU 2   ; pin 6 SDA   for write
BSCL: EQU 3	  ; pin 7 SCL   for write

MSDA: EQU %00010000 ;  0x10 -> 1<<4 -> for read reg 14  x x B A R L D U


org 0a000h
    ; perform random read of 32 bytes at address 0000 of the 24AA256
    ;
    call  I2C_Init

    ; select random read address
    call  I2C_Start
    ld c,%10100000    ; bit0=0 - write bytes
    call  I2C_Write
    jr nz, errNoAck
    ld c,0  ; address high byte
    call  I2C_Write
    jr nz, errNoAck
    ld c,0  ; address low byte
    call  I2C_Write
    jr nz, errNoAck

    ; send Control Byte
    call  I2C_Start
    ld c,%10100001      ; bit0=1 - read bytes
    call  I2C_Write
    jr nz, errNoAck
    
    ld hl,buffer
    ld b,127     ; 1 byte less. Host do not ack last byte read
repeat:
    push bc
    and a ; clear carry to give ack after read
    call  I2C_Read
    ld (hl),c
    inc hl
    pop bc
    djnz repeat
    ; do not give ack on the last byte read
    scf ; not ack

    call I2C_Read
    call I2C_Stop
    ld (hl),c

    ld a,'!' ; success
    jp 00a2h


errNoAck:
         call I2C_Stop
         ld a,'?'
         jp 00a2h   ; print error and return

 buffer: ds 128






; I2C_Init - Initialize I2C_subsystem
; Inputs: None
; Outputs: None
; Modify: AF, Disable Interrupts
I2C_Init:                           
	di                              ; 
	ld a,15                         ; Register 15 PSG
	out (PSGAD),a                   ; 

	in a,(PSGRD)                    ;
	or  %01001100                  ; select port#2, Idle TRGA and TRGB
	and %11110111                  ; SDA=1, SCK=0
;	set 5,a                         ; activate I2C/Joystick select logic
;	ld (psgSave),a 
	out (PSGWR),a
	call _Wait_1ms_
	call I2C_Stop
	call I2C_Stop
	call I2C_Stop
ret

; I2C_Stop - Generate I2C STOP condition
; Inputs: PSG Register 15 Selected, A = Register 15 state
; Outputs: None
; Modify: AF, Disable Interrupts
I2C_Stop:
    res BSCL,a        ; make sure SCL = 0
 	out (PSGWR),a
	res BSDA,a        ; sda=0
	out (PSGWR),a
	set BSCL,a        ; make sure that scl=1
	out (PSGWR),a
	set BSDA,a        ; sda=1
	out (PSGWR),a
	ret	

; I2C_Start - Generate I2C START condition
; Inputs: PSG Register 15 Selected, A = Register 15 state, TRGA(SDA) = H, TRGB(SCL) = H
; Outputs: TRGA(SDA) = H, TRGB(SCL) = L 
; Modify: AF, Disable Interrupts
I2C_Start:
	set BSCL,a        ; scl=1  make sure scl=1
	out (PSGWR),a
	set BSDA,a        ; sda=1  make sure sda=1
	out (PSGWR),a
	res BSDA,a        ; sda=0  Generate START condition
	out (PSGWR),a
	res BSCL,a        ; scl=0  Bring clock down
	out (PSGWR),a
	set BSDA,a        ; sda=1  Release SDA Line
	out (PSGWR),a
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
	or %00000100     ; 8   sda = 1
	sla c            ; 10 	
	jr c, PBWR2      ; 13/8 	
	and %11111011    ; 8   sda =0       8+10+13=31 / 8+10+8+8=34 31/34
PBWR2:           ;   
	out (PSGWR),a    ; 12 
	or %00001000     ; 8     scl=1
	out (PSGWR),a    ; 12
	and %11110111    ; 8     scl=0
	out (PSGWR),a    ; 12
	djnz PBWR1       ; 14/9    [727]        up to here  8+8*(31/34+12+8+12+12+14)-5 : min 715   max 739  avrg 727

getack:
	; get ack state
	or %00000100    ; 8 sda=1 release line to get ack
	out (PSGWR),a   ; 12
	or %00001000    ; 8 scl=1 rise clock
	out (PSGWR),a   ; 12
	                ;
	and %11110111   ; 8 now  a = register 15 state with sda=1 scl=0, will be used ahead
	ld c,a          ; 5 save register 15 state with scl=0
                     ; b is 0 from last loop it will be reused for countdown the next loop
	ld a,14          ; 8
	out (PSGAD),a    ; 12 sel reg 14

waitack:		
	in a,(PSGRD)      ; 12 read Ack bit
	and %00010000     ; 8 check ack bit
	jr z,haveAckState ; 13/8 acked? then continue
    djnz waitack      ; 14/9 timed out? No, try again
	                  ; yes, device did not acked
haveAckState:	      ; here Flag Z carries Ack state Z=acked, NZ=not acked (timed out)
	
	ld a,15          ; 8    select register 15
	out (PSGAD),a    ; 12	
	ld a,c           ; 5 restore reg 15 state. here sda=1 scl=0, flag Z still with ack state
	out (PSGWR),a    ; 12           8+12+5+8+12 = [45]
ret                  ; 11    (+18 call)          [29]                        
;


; byte I2C_read  (bool putAck)

; I2C_Read - Write a byte on I2C bus
; Inputs:  Flag Cy = Cy=0 give ack Cy=1 do not give ack 
;          A = Register 15 state, 
;          TRGA(SDA) = H, TRGB(SCL) = L,
;          PSG Register 15 Selected, 
; Outputs: C = byte received
;          A = register 15 state
;          TRGA(SDA) = H, TRGB(SCL) = L 
; Modify:  AF, BC, E

I2C_Read:
;	ld bc,0800       ; 11   B=8, C=0
	ld b,8           ; 5
	rl c             ; 10 save Give/Not Give ACK on C.0
GBRD1:	
    ; clock high
	or %00001000    ; 8  scl = 1
	out (PSGWR),a   ; 12
	ld e,a          ; 5 save a

	; read bit
	ld a,14         ; 8
	out (PSGAD),a   ; 12  Select PSG register 14
	IN A,(PSGRD)    ; 12
	AND MSDA        ; 8   Mascara bit TRIGGER
	NEG             ; 10  CY=(A==0)
	RL C            ; 10  after the last iteraction Give/NotGive ack thaw was stored
	                ;     in C.0 will be back to Carry Flag
 	; clock low
	ld a,15         ; 8
	OUT (PSGAD),A   ; 12  select Register 15
 	ld a,e          ; restore a
 	res BSCL,a      ; 10  scl = 0
	out (PSGWR),a   ; 12

	djnz GBRD1      ; 14/9
                    ; here b=0 and Cy hold the GiveAck/Not give ack state.
     ret c          ; end routine if not necessary to give ACK
	
giveAck:
	and %11111011   ; 8     sda = 0
	out (PSGWR),a   ; 12
	or  %00001000   ; 8     scl=1
	out (PSGWR),a   ; 12 
	and %11110111   ; 8     scl=0
	out (PSGWR),a   ; 12 
	or  %00000100   ; 8   sda = 1  release line
	out (PSGWR),a   ; 12
ret                 ; 

_Wait_1ms_:
	push hl
	push af
	ld hl,T1MS3MHZ
	wait1: dec hl
	ld a,h
	or l
	jr nz,wait1
	pop af
	pop hl
	ret




