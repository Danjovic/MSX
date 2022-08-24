;  _  _____    ___  __ 
; | |/ / _ )__|_  )/ / 
; | ' <| _ \___/ // _ \
; |_|\_\___/  /___\___/
;                      
; Atari Keyboard Controller adapter
; for MSX Joystick Port
; 
; Danjovic - August 2022
;


; PSG IO addresses
PSGAD: EQU 0A0H
PSGWR: EQU 0A1H
PSGRD: EQU 0A2H

; Scan Atari keyboard connected at joystick port using wire adapter
;
;   MSX SIDE       ATARI SIDE    
; (DE-9 Female)    (DE9-Male)
;   1  o--------------o 1        3   2   1
;   2  o--------------o 2        6   5   4
;   3  o--------------o 3        9   8   7
;   4  o--------------o 4        #   0   *
;                                |   |   |
;   5  o--+-----------o 7        |   |   |
;         |   4k7                |   |   |
;         +--\/\/\-+             |   |   |
;           1N4148 |             |   |   |
;   8  o------|<|--+--o 6 -row-0-+   |   |
;   6  o--------------o 9 -row-1-----+   |
;   7  o--------------o 5 -row-2---------+
;   9  N.C.

ORG 09000h
ld a,(PORTKB)  
 

;
; ScanKB2600 - Scan Atari controller keyboard 
;
; Inputs: 
;        register A: 0=Connector 1, >0=Connector 2.
ScanKB2600:
   ; set zero flag according to port option
   and a 
   ; Save PSG Context
   ld a,15
   out (PSGAD),a
   in a,(PSGRD)
   ld (SAVPSG),a
   ld hl, KBROWS

   ; Select Joystick port accordingly
   jr NZ, ScanCon2
   
ScanCon1:
   and 10111111b  ; clear bit 6  (joy port 0)
   or  00010011b  ; set bits 4, 1, and 0  (all rows unset)
   ld b,a
   ld c,a
   res 4,a ; row 0 (pin8) low, rows 1 and 2 (6 and 7) high
   res 0,b ; row 1 (pin6) low, rows 0 and 2 (7 and 8) high
   res 1,c ; row 2 (pin7) low, rows 0 and 1 (6 and 8) high
   jr ScanRow0

ScanCon2:
   or  01101100b  ; set bits 6, 5, 3, and 2       
   ld b,a         ; ( joy port 1, all rows unset)
   ld c,a
   res 5,a ; row 0 (pin8) low, rows 1 and 2 (6 and 7) high
   res 2,b ; row 1 (pin6) low, rows 0 and 2 (7 and 8) high
   res 3,c ; row 2 (pin7) low, rows 0 and 1 (6 and 8) high

ScanRow0:  
   ld e,a
   call SaveRow

ScanRow1:  
   ld e,b
   call SaveRow

ScanRow2:  
   ld e,c
   call SaveRow

RestorePSG:
   ld e,(hl) ; hl now points to SAVPSG
   
SaveRow:
   di             ; disable interrupts
   ld a,15
   out (PSGAD),a
   ld a, e
   out (PSGWR),a  ; update register 15
   ld a,14
   out (PSGAD),a  ; select register 14
   in a,(PSGRD)   ; read keys hhhh*741
   or 11110000b   ; mask unused bits
   ld (HL),a      ; save keyboard state
   inc hl
   ei
   ret



; Variables

KBROWS: EQU 09800h
SAVPSG: EQU 09803h

PORTKB  : EQU 09804h ; 0 -> connector 0, 255 -> connector 1


; Variables 
; keyboard rows hhhh#963, hhhh0852, hhhh*741
; KBROWS: DS 3  

; PSG register 15 save state, destroyed at the end
;SAVPSG: DS 1  




; PSG Registers Bit assignment
;
;  Register 14
;    7     6     5     4     3     2     1     0
; +-----------------------------------------------+
; ¦ Cas ¦ Kbd ¦ Joy ¦ Joy ¦ Joy ¦ Joy ¦ Joy ¦ Joy ¦
; ¦Input¦Mode ¦Trg B¦Trg A¦Right¦Left ¦Down ¦ Up  ¦
; +-----------------------------------------------+
;
;
;  Register 15
;    7     6     5     4     3     2     1     0
; +-----------------------------------------------+
; ¦Kana ¦ Joy ¦Pulse¦Pulse¦PortB¦PortB¦PortA¦PortA¦
; ¦ LED ¦ Sel ¦  B  ¦  A  ¦ pin7¦ pin6¦ pin7¦ pin6¦
; +-----------------------------------------------+
; Joy Sel: 0=Connector 1, 1=Connector 2.

