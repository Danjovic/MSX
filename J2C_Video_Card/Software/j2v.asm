;         _ _____   __          _            _             _    _         
;      _ | |_  ) \ / /  ___    (_)___ _  _  | |_ ___  __ _(_)__| |___ ___ 
;     | || |/ / \ V /  |___|   | / _ \ || | |  _/ _ \ \ V / / _` / -_) _ \
;      \__//___| \_/          _/ \___/\_, |  \__\___/  \_/|_\__,_\___\___/
;                            |__/     |__/                                
; j2v.asm
; Send string to AVR video device connected to joystick port 2
; danjovic 2026

 ; ### definitions

; PSG Registers
    PSGAD:   EQU 0A0H
    PSGWR:   EQU 0A1H
    PSGRD:   EQU 0A2H
    VALTYP:  EQU 0F663H
    I2CADDR: EQU 01H

;
;  PSG Register bits;
;
    ASDA:  EQU 0
    ASCL:  EQU 1
    BSDA:  EQU 2
    BSCL:  EQU 3
    SDAI:  EQU 4
    SCLI:  EQU 5
    ABSEL: EQU 6
    MSDA  EQU 10H ; [SDA In = TRGA]

;
; Constants
;

    T1MS3MHZ EQU 100
    T1MS7MHZ EQU 202




ORG 0d000h

START:
    ld A, (VALTYP)
    CP 3               ; is string?
    RET NZ             ; no, return withour error

    ; DE+0 = Tamanho da string
    ; DE+1 e DE+2 = Endereço real dos caracteres do texto
    ex de,hl

    LD a, (hl)        ; string size
    inc hl
    LD e,(hl)        ; e = address lsbits
    inc hl
    LD h,(hl)        ; h = address msbits
    ld l,e           ; l = address lsbits
    ld d,a           ; d = string size
    
    ; 
    CALL SENDJ2C     ; send string
    ;
    LD A,3           ; return String TYPE
    RET


; Send string to video terminal at I2C address 0x01 on joystick port B
; Inputs: D buffer size, HL buffer address
; Outputs: None
; Modify: AF, BC, DE, Hl

SENDJ2C:
    call I2C_Init   ; init ends with a start
;    call I2C_Start
    ld c, I2CADDR<<1   ;7 bit address left shited by 1
    push de
    call I2C_Write
    pop de
    jr nz, FAIL        ;not acked ?  error

sendOneCharacter:
    ld c,(hl)
    inc hl
    push de
    call I2C_Write
    pop de
    jr nz,FAIL
    dec d
    jr nz,sendOneCharacter

FINIS:
    and a   ; clear carry 
EXIT:
    call I2C_Stop
;    call I2C_Stop 
    ei
    ret

FAIL:
    scf       ; set carry
    jr EXIT



; I2C_Init - Initialize I2C_subsystem
; Inputs: None
; Outputs: Cy set: fail to initialize
;          A - reg 15 state with port 2 selected, TRGA and TRGB high 
; Modify: AF, BC, Disable Interrupts, PSG reg 15 selected
;
I2C_Init:
    di                 ;
    ld a,15            ; Register 15 PSG
    out (PSGAD),a      ;
    in a,(PSGRD)       ;
    or  01001100b      ; select port#2, TRGA (SDA) and TRGB(SCL) high
    out (PSGWR),a      ; 
    ld b,18
I2CIN1:                ; make scl 9 times high, then  low 
    xor 00001000b      ; flip SCL
    out (PSGWR),a      ; 
    EX (SP),HL         ; 20  loose some time
    EX (SP),HL         ; 20  
    djnz I2CIN1        ; 
           
    and 11111011b      ; make SDA low
    out (PSGWR),a      ; 
    EX (SP),HL         ; 20  loose some time
    EX (SP),HL         ; 20  
    or  00000100b      ; make SDA high
    and 11110111b      ; and SCL low
    out (PSGWR),a      ; 
    ld a,14
    out (PSGAD),a      ; select register 14
    
    ld b,0  
I2CIN2:                ; wait for stretching and arbitration
    in a,(PSGRD)
    and 00001100b      ; isolate SDA and SCL (and clear carry flag)
    cp  00001100b      ; test for 
    jr z,I2CIN3        ; if both high, initialized with success
    call _Wait_1ms_    ; otherwise wait
    djnz I2CIN2        ; up to 256 milliseconds 
    
    scf                ; timed out, set carry flag
I2CIN3:
    ld a,15            ; select register 15
    out (PSGAD),a   
    in a,(PSGRD)       ; read current state
    ret                



; I2C_Start - Generate I2C START condition
; Inputs: PSG Register 15 Selected, A = Register 15 state, TRGA(SDA) = H, TRGB(SCL) = H
; Outputs: TRGA(SDA) = H, TRGB(SCL) = L
; Modify: A
; Cycles: 100 (27.9us) 
I2C_Start:            ; 18
    res BSDA,a        ; 10 sda=0  Generate START condition
    out (PSGWR),a     ; 12 
    res BSCL,a        ; 10 scl=0  Bring clock down
    out (PSGWR),a     ; 12 
    set BSDA,a        ; 10 sda=1  Release SDA Line
    out (PSGWR),a     ; 12 
    ld b,a            ; 5 
ret                   ; 11



; I2C_Stop - Generate I2C STOP condition
; Inputs: PSG Register 15 Selected, A = Register 15 state
; Outputs: None
; Modify: A
; Cycles: 95 (26.5us)
I2C_Stop:             ; 18 (call)
    res BSCL,a        ; 10 make sure scl = low
    out (PSGWR),a     ; 12
    res BSDA,a        ; 10 sda=0  make sure sda = low
    out (PSGWR),a     ; 12
    set BSCL,a        ; 10 rise scl 
    out (PSGWR),a     ; 12
    set BSDA,a        ; 10 release sda
    out (PSGWR),a     ; 12
    ret               ; 11 



; I2C_putBit_CS - put one bit and check for clock stretch
; Inputs: PSG Register 15 Selected, 
;         A = Register 15 state with scl low 
;         Cy = bit to write
; Outputs: 
; Modify: 
I2C_putBit_CS:     ; 18 
    res BSDA,a     ; 10 clear SDA bit
    ld b,a         ;  5 save a value
    sbc a,a        ;  5 if cy=1, a=ff otherwise a=0
    and 00000100b  ;  8 isolate bit 4
    or b           ;  5 add it to b
    out (PSGWR),a  ; 12 write bit
    
    ld b,a         ;  5 save reg 15 with scl low   
    or  00001000b  ;  8 scl=1  rise clock
    out (PSGWR),a  ; 12 write bit
        
    ld a,14        ;  8
    out (PSGAD),a  ; 12 select register 15
        
I2CPBCS1:          ;    wait for clock stretch    
    in a,(PSGRD)   ; 12 read value
    and 00100000b  ;  8 check for scl 
                   ;    here is the place to check for timeout
                   ;    or break
    jr z, I2CPBCS1 ;  8 / 13 wait until clock rise
    
    
    ld a,15        ;  8
    out (PSGAD),a  ; 12
    ld a,b         ;  5  b was saved with scl bit low
    ;and 11110111b ;     8  
    out (PSGWR),a  ; 12  make scl=low again
    
    ret            ; 11  best case: 184 cycles 
    


; I2C_putBit - put one bit 
; Inputs: PSG Register 15 Selected, 
;         A = Register 15 state with scl low 
;         Cy = bit to write
; Outputs: 
; Modify: 
I2C_putBit:        ; 18 
    res BSDA,a     ; 10 clear SDA bit
    ld b,a         ;  5 save a value
    sbc a,a        ;  5 if cy=1, a=ff otherwise a=0
    and 00000100b  ;  8 isolate bit 4
    or b           ;  5 add it to b
    out (PSGWR),a  ; 12 write bit
    
    or  00001000b  ;  8 scl=1  
    out (PSGWR),a  ; 12 rise clock   
    
    and 11110111b  ;  8     
    out (PSGWR),a  ; 12  make scl=low 
    ret            ; 11  
                   ; total 114  cycles 


; bool I2C_Write ( byte data)

; I2C_Write - Write a byte on I2C bus, return ACK state on Z flag
; Inputs:  C = data byte to write,
;          A = Register 15 state,
;          TRGA(SDA) = H, TRGB(SCL) = L,
;          PSG Register 15 Selected,
; Outputs: Flag Z = Ack State
;          A = register 15 state
;          TRGA(SDA) = H, TRGB(SCL) = L
; Modify:  AF, BC, DE
; 
I2C_Write:              ; 18 (call)

    sla c               ; 10  bit 7
    call I2C_putBit_CS  ; 178 (best case)  
    sla c               ; 10  bit 6
    call I2C_putBit     ; 74 
    sla c               ; 10  bit 5
    call I2C_putBit     ; 74 
    sla c               ; 10  bit 4
    call I2C_putBit     ; 74 
    sla c               ; 10  bit 3
    call I2C_putBit     ; 74 
    sla c               ; 10  bit 2
    call I2C_putBit     ; 74 
    sla c               ; 10  bit 1
    call I2C_putBit     ; 74 
    sla c               ; 10  bit 0
    call I2C_putBit     ; 74 


    or  00000100b       ;  8  release SDA line
    out (PSGWR),a       ; 12  

    ld b,a         ;  5 save reg 15 with scl low   
    or  00001000b  ;  8 scl=1  rise clock
    out (PSGWR),a  ; 12 write bit
        
    ld a,14        ;  8
    out (PSGAD),a  ; 12 select register 15
        
I2WB1:             ;    wait for clock stretch    
    in a,(PSGRD)   ; 12 read value

    and 00100000b  ;  8 check for scl 
                   ;    here is the place to check for timeout
                   ;    or break
    jr z, I2WB1    ;  8 / 13 wait until clock rise
    
    in a,(PSGRD)   ; 12 read value
    ld c,a         ;  5
    ld (9000h),a
    
        
    ld a,15        ;  8
    out (PSGAD),a  ; 12  select register 15
    ld a,b         ;  5  restore state
    and 11110111b  ;  8  make scl low
    out (PSGWR),a  ; 12  
   
;    call flip8    ;    debug     
   
    bit SDAI,c     ; 10  return  Z flag   Z = acked, NZ = not Nacked
    ret            ; 11
                   ; total best case  cycles 
    
;flip8:
;   xor 00100000
;   out (PSGWR),a
;   xor 00100000
;   out (PSGWR),a
;ret                   

;
; delay 1us
; 

delay1ms:
_Wait_1ms_:         ; 18
    push hl         ; 12 
    push af         ; 12
    ld hl,T1MS3MHZ  ; 11
    wait1: dec hl   ;  7
    ld a,h          ;  5
    or l            ;  5
    nop             ;  5
    jr nz,wait1     ; 13/8
    pop af          ; 11
    pop hl          ; 11
    ret             ; 11

zzz:


_SIZE: equ zzz - START
