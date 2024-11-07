;
;  
;      _ ___ ___   ___               
;   _ | |_  ) __| / __| __ __ _ _ _  
;  | || |/ / (__  \__ \/ _/ _` | ' \ 
;   \__//___\___| |___/\__\__,_|_||_|
;
;    Danjovic - November 2024                               
;  
; This program scans the Joystick ports 
; looking for I2C devices tied to the 
; bidirectional pins
;
; Pinout: 
; Pin 6 - SDA
; Pin 7 - SCL
;
; Pin 8 - J2C HUB Power (optional)
;

;
; BIOS Functions
;
CHPUT    EQU 0A2H

;
; PSG Registers 
;
PSGAD EQU 0A0H
PSGWR EQU 0A1H
PSGRD EQU 0A2H
;
;  PSG Register bits;
;
ASDA  EQU 0
ASCL  EQU 1
BSDA  EQU 2
BSCL  EQU 3
APWR  EQU 4
BPWR  EQU 5
ABSEL EQU 6
MSDA  EQU 10H ; [SDA In = TRGA]


;
; Constants
;
TIMEOUT  EQU 2000
T1MS3MHZ EQU 109
T1MS7MHZ EQU 220
ENOCHIP  EQU 01
EOK      EQU 0


 
;      _            _   
;   __| |_ __ _ _ _| |_ 
;  (_-<  _/ _` | '_|  _|
;  /__/\__\__,_|_|  \__|
; 
org 0a000h



SCANJ2C:
    ld hl, MSGHELLO
    call PRINTMSG
    and a           ; clear carry flag -> port A
    call SCANPORT   ; Scan port and show results
    ld hl, MSGPORTB
    call PRINTMSG
    scf             ; set carry flag -> port B

; Scan port and show results
SCANPORT:
    ; initialize port 
    call J2CINIT 
    ; Scan 127 addresses
    ld c,2        ; first i2c address  <<1
    ld e,127      ; last i2c address 
    ld d,0        ; flag 
    ld hl,BUFFER
    ;
SCANP0:
    CALL J2CSTART
    CALL J2CPB
    CALL J2CGAK
    call J2CSTOP
    ld (hl),0       ; preload value 
    jr c, NOTACKED  ; device answered ?
    ld (hl),1       ; yes, mark device
    ld d,1          ; and set success flag
NOTACKED:           ; no, continue
    inc hl
    inc c           ; next address 
    inc c
    dec e
    jr nz, SCANP0
; 
; print the results
PRINTANS:
    bit 0,d         ; did any address answered ?
    ld hl,MSGNOANS
    jp z, PRINTMSG  ; No, print no answer message
    ;
    ld hl,BUFFER  
    ld b,127        ; addresses
    ld c,1          ; first address
PRINTADDR: 
    ld a,(hl)       ; check if address answered 
    and a           ; answered ? 
    jr z,NEXTADDR  ; no, check next address 
    call PRINTHEX8  ; yes print address that answered
    ld a,32
    call CHPUT      ; print a space 
    NEXTADDR:
    inc hl          ; next address
    inc c           ;
    djnz PRINTADDR
    ret

;
; Messages
;
MSGHELLO: DB 13,10,"J2C Scanner",13,10,"Port A: ",0
MSGPORTB: DB 13,10,"Port B: ",0
MSGNOANS: DB "No Answer",13,10,0



; 
; General Functions
; 

; print Hex value from register A
PRINTHEX8:
    LD  A,C
    RRA
    RRA
    RRA
    RRA
    CALL  CONV
    LD  A,C
CONV:
    AND  $0F
    ADD  A,$90
    DAA
    ADC  A,$40
    DAA
    CALL CHPUT    ; Show the value.
    RET

; Print a message
PRINTMSG:
    LD A,[HL]
    OR A
    RET Z       ;
    CALL CHPUT
    INC HL
    JR PRINTMSG

; Delay 1ms
WAIT1MS:
    PUSH HL
    PUSH AF
    LD HL,T1MS3MHZ
    WAIT1: DEC HL
    LD A,H
    OR L
    JR NZ,WAIT1
    POP AF
    POP HL
    RET

;
;  J2C Functions
;

; Inicialize I2C on Joystick port
; Cy flag: 0->Port A  1->Port B
J2CINIT:
    DI
    LD A,15
    OUT (PSGAD),A
    IN A,(PSGRD)
;    LD (PSGSAV),A
    JR C,BINIT
;
AINIT:
    RES ABSEL,A ; JOY A
    SET APWR,A  ; Power On J2C HUB (if exists)
    OUT (PSGWR),A
    CALL WAIT1MS ; Aguarda 1ms
    SET ASDA,A ; SDA=1
    OUT (PSGWR),A
    RES ASCL,A  ; SCL=0
    OUT (PSGWR),A
	jr ABINIEXIT
   ; LD B,A
    ;
   ;CALL J2CSTOP
   ; CALL J2CSTOP
   ; CALL J2CSTOP
   ; RET
;
BINIT:
    SET ABSEL,A ; JOY B
    SET BPWR,A  ; Power On J2C HUB (if exists)
    OUT (PSGWR),A
    CALL WAIT1MS ; Aguarda 1ms
    SET BSDA,A ; SDA=1
    OUT (PSGWR),A
    RES BSCL,A  ; SCL=0
    OUT (PSGWR),A
	;
ABINIEXIT:	
    LD B,A
    ld (ABSELECT),a  ; save a/b select
    CALL J2CSTOP
    CALL J2CSTOP
    CALL J2CSTOP
    RET
;
J2CSTOP:
    LD A,B
    BIT ABSEL,A ; Qual porta?
    JR NZ,BSTOP
;
ASTOP:
    RES ASDA,A ; SDA=0
    OUT (PSGWR),A
    SET ASCL,A ; SCL=1
    OUT (PSGWR),A
    SET ASDA,A ; SDA=1
    OUT (PSGWR),A
    LD B,A ; Atualiza B
    RET
;
BSTOP:
    RES BSDA,A ; SDA=0
    OUT (PSGWR),A
    SET BSCL,A ; SCL=1
    OUT (PSGWR),A
    SET BSDA,A ; SDA=1
    OUT (PSGWR),A
    LD B,A ; Atualiza B
    RET
;
J2CSTART:
    LD A,B
    BIT ABSEL,A
    JR NZ,BSTART
    ;
ASTART:
    SET ASCL,A ; SCL=1
    OUT (PSGWR),A
    SET ASDA,A ; SDA=1
    OUT (PSGWR),A
    RES ASDA,A ; SDA=0
    OUT (PSGWR),A
    RES ASCL,A ; SCL=0
    OUT (PSGWR),A
    SET ASDA,A ; SDA=1
    OUT (PSGWR),A
    LD B,A
    RET
;
BSTART:
    SET BSCL,A ; SCL=1
    OUT (PSGWR),A
    SET BSDA,A ; SDA=1
    OUT (PSGWR),A
    RES BSDA,A ; SDA=0
    OUT (PSGWR),A
    RES BSCL,A ; SCL=0
    OUT (PSGWR),A
    SET BSDA,A ; SDA=1
    OUT (PSGWR),A
    LD B,A
    RET
;
J2CPB:
    LD A,B
    LD B,8	
    BIT ABSEL,A
    JR NZ,BPBYTE
    ;
APBYTE:
    rlc C
    RES ASDA,A
    JR NC,APBY2 ; SDA=CY
    SET ASDA,A
    APBY2:
    OUT (PSGWR),A
    SET ASCL,A ; SCL=1
    OUT (PSGWR),A
    RES ASCL,A ; SCL=0
    OUT (PSGWR),A
    DJNZ APBYTE
    ;
    SET ASDA,A ; SDA=1
    OUT (PSGWR),A
    LD B,A
    RET
;
BPBYTE:
    rlc C
    RES BSDA,A
    JR NC,BPBY2 ; SDA=CY
    SET BSDA,A
    BPBY2:
    OUT (PSGWR),A
    SET BSCL,A ; SCL=1
    OUT (PSGWR),A
    RES BSCL,A ; SCL=0
    OUT (PSGWR),A
    DJNZ BPBYTE
    ;
    SET BSDA,A ; SDA=1
    OUT (PSGWR),A
    LD B,A
    RET
    ;
;
J2CGAK: ; GET ACK
    LD A,B
    BIT ABSEL,A
    JR NZ,BGAK
;
AGAK:
    SET ASDA,A ; SDA=1
    OUT (PSGWR),A
    SET ASCL,A ; SCL=1
    OUT (PSGWR),A
    PUSH HL
    LD HL,TIMEOUT
    LD B,A  ; Salva est reg 15
    ;
    LD A,14
    OUT (PSGAD),A; Sel REG 14
AGAK1:
    IN A,(PSGRD)
    AND MSDA ; checa e tbem clear CY
    JR Z,AGAK2 ; Sai ao receber ACK
    ;
    DEC HL
    LD A,H
    OR L
    JR NZ,AGAK1
    ;
    SCF ; Indica TIMEOUT
;
AGAK2:
    LD A,15
    OUT (PSGAD),A ; Sel Reg 15
    LD A,B
    RES ASCL,A
    OUT (PSGWR),A
    LD B,A
    POP HL
    RET
;
BGAK:
    SET BSDA,A ; SDA=1
    OUT (PSGWR),A
    SET BSCL,A ; SCL=1
    OUT (PSGWR),A
    PUSH HL
    LD HL,TIMEOUT
    LD B,A  ; Salva est reg 15
    ;
    LD A,14
    OUT (PSGAD),A; Sel REG 14
BGAK1:
    IN A,(PSGRD)
    AND MSDA ; checa e tbem clear CY
    JR Z,BGAK2 ; Sai ao receber ACK
    ;
    DEC HL
    LD A,H
    OR L
    JR NZ,BGAK1
    ;
    SCF ; Indica TIMEOUT
;
BGAK2:
    LD A,15
    OUT (PSGAD),A ; Sel Reg 15
    LD A,B
    RES BSCL,A
    OUT (PSGWR),A
    LD B,A
    POP HL
    RET
    ;
;

ZEND:
ABSELECT: ds 1
BUFFER:   DS 128

;










