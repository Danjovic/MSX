; Ninja Tap Patch code for Muhonmourn 3
; Danjovic 2022

Y0:    equ 86b9h ; kbd matrix line 00  7  6  5  4  3  2  1  0
Y1:    equ 86bah ; kbd matrix line 01  ;  ]  [  \  =  -  9  8
Y2:    equ 86bbh ; kbd matrix line 02  B  A  £  /  .  ,  `  ' 
Y3:    equ 86bch ; kbd matrix line 03  J  I  H  G  F  E  D  C 
Y4:    equ 86bdh ; kbd matrix line 04  R  Q  P  O  N  M  L  K
Y5:    equ 86beh ; kbd matrix line 05  Z  Y  X  W  V  U  T  S
Y6:    equ 86bfh ; kbd matrix line 06  F3 F2 F1 CD CP GR CT SH  
Y7:    equ 86c0h ; kbd matrix line 07  CR SL BS ST TB ES F5 F4
Y8:    equ 86c1h ; kbd matrix line 08  RG DW UP LF DL IN HP SP
Y9:    equ 86c2h ; kbd matrix line 09  4  3  2  1  0
Y10:   equ 86c3h ; kbd matrix line 0a  .  ,  -  9  8  7  6  5
;
JOY1:  equ 86c4h ; Joystick 01  -      RG DW UP LF 0  0  TB TA
JOY2:  equ 86c5h ; Joystick 02  -      RG DW UP LF 0  0  TB TA


;org 8669h
;  jp NINJAPATCH

org 0e000h


;
;  check for a ninja tap or shinobi tap connected to port 1
;

NINJAPATCH:
; check for presence of Tap
   call CHECKTAPS
   bit 3,c   ; bit 3 should be 0 for either shinobi or ninja tap
   jr nz,DOSAMESTUFF  ; if no tap present use standard game controls
   
; scan taps
   ld de,0fa7ah
   ld hl,ntapData
   call GETNIN ; read TAPS on port 1


;  Process controller 1  A B Sl St Up Dw Lf Rg -> cursor U D L R + Space
   ld a,(tap1Data)
   call CONVERT
   ld (Y8),a

;  Process controller 3  A B Sl St Up Dw Lf Rg -> Joy1
   ld a,(tap3Data)
   call CONVERT
   ld (JOY1),a

;  Process controller 4  A B Sl St Up Dw Lf Rg -> Joy2
   ld a,(tap4Data)
   call CONVERT
   ld (JOY2),a

;  Process controller 2  A B Sl St Up Dw Lf Rg -> WASD
   ld a,(tap2Data)
   ld e,a       ; e = tap2Data
   xor a        ; a = 0 to initialize line as no key pressed
   ld hl,Y2 ;
TST_LEFT:
   ld (hl),a   ; clear previous button press state
   bit 1,e   ; test for  left -> key 'A'
   jr nz, TST_RIGHT
   set 6,(hl) ; activate bit corresponding to 'A' key
TST_RIGHT
   inc hl  ; point to Y3 now
   ld (hl),a   ; clear previous button press state
   bit 0,e   ; test for  right -> key 'D'
   jr nz, TST_UP
   set 2,(hl) ; activate bit corresponding to 'D' key
TST_UP
   inc hl  ; point to Y4 now
   inc hl  ; point to Y5 now
   ld (hl),a   ; clear previous button press state (both W and S)
   bit 3,e   ; test for  up -> key 'W'
   jr nz, TST_DOWN
   set 4,(hl) ; activate bit corresponding to 'W' key
TST_DOWN
   bit 2,e   ; test for down -> key 'S'
   jr nz, RETURN
   set 0,(hl) ; activate bit corresponding to 'S' key
RETURN:
   ei
   ret


DOSAMESTUFF:
    ld a,00h
    ld hl,86b9h
    jp 866ch

; Functions

CONVERT: 
; Convert Tap bit order and active level to format expected by the game
; [E] A = Tap data   A  B  Sl St UP DW LF RG
; [R] A = Game data  RG DW UP LF 0  0  TB TA

   ld e,a           ; save Tap data
   and 0fh          ; isolate directionals
   ld c,a           ;
   ld b,0           ; perform table conversion
   ld hl,TABCONV    ;
   add hl,bc        ;
   ld a,(hl)        ; a = RG DW UP LF 0  0  0  0
TST_A:
   bit 7,e          ; is trigger A pressed (active low)
   jr nz,TST_B      ; no, check trigger b
   set 0,a          ; yes, add it to the return value (active high)
TST_B:
   bit 7,e          ; is trigger B pressed (active low)
   ret nz           ; no, return from function
   set 1,a          ; yes, add it to the return value (active high)
   ret              ; and return from function
;

  TABCONV:
   ;    RDUL0000       0000UDLR
   db   11110000b    ; 00000000  
   db   01110000b    ; 00000001  
   db   11100000b    ; 00000010  
   db   01100000b    ; 00000011  
   db   10110000b    ; 00000100  
   db   00110000b    ; 00000101  northwest
   db   10100000b    ; 00000110  northeast
   db   00100000b    ; 00000111  north
   db   11010000b    ; 00001000  
   db   01010000b    ; 00001001  southwest
   db   11000000b    ; 00001010  southeast
   db   01000000b    ; 00001011  south
   db   10010000b    ; 00001100  
   db   00010000b    ; 00001101  west
   db   10000000b    ; 00001110  east
   db   00000000b    ; 00001111  center




CHECKTAPS:
; Return Ninja/Shinobi Tap info
; [E] None
; [R] C Tap connected info
;      7  6  5  4  3  2  1  0               
;      0  0  0  0  a1 a0 b1 b0
;
;  a[1..0], b[1..0] : Status of ports A and B
;  1 1 No Tap detected      ( no feedback on either pin 6 or 8)
;  0 1 Ninja Tap detected   ( feedback Pin 7 = ~Pin 8 )
;  0 0 Shinobi Tap detected ( feedback Pin 7 = ~Pin 6 . ~Pin 8)
;  1 0 Unknown/unexpected   ( feedback Pin 7 = ~Pin 6 )

CKANYTAP:
   di            ;
   ld c,0        ;
   ; port A
   ld de,0ba3ah  ; start with Joysel port A, pins 8=1, 7=1, 6=0 (read a1)
   call FBCHECK  ; return Cy = State of pin 7
   rl  c         ; c = 0 0 0 0 0 0 0 a1
   ld de,08f0fh  ; repeat with Joysel port A, pins 8=0, 7=1, 6=1 (read a0)
   call FBCHECK  ; feedback check at pin 7
   rl  c         ; c = 0 0 0 0 0 0 a1 a0
   ; port b
;   ld de,0ba7ah  ; repeat with Joysel port B, pins 8=1, 7=1, 6=0 (read b1)
;   call FBCHECK  ; return Cy = State of pin 7
   rl  c         ; c = 0 0 0 0 0 a1 a0 b1
;   ld de,08f4fh  ; repeat with Joysel port B, pins 8=0, 7=1, 6=1 (read b0)
;   call FBCHECK  ; feedback check at pin 7
   rl  c         ; c = 0 0 0 0 a1 a0 b1 b0
   ret           ; and B = B+1

;	
; Set bits on Joystick ports and return state of pin 7
; [E]  DE => Reg 15 bit mask, D = bit clear mask, E = bit set mask 
; [R] Cy = State of pin 7
;
FBCHECK:
   call PORSEL

   ld a,14        ; select register 14
   out (0A0H),a
   in a,(0A2H)    ; read state of joystick port a = x x B A R L D U
   rla             ; a =  x B A R L D U, cy = x
   rla             ; a =  B A R L D U x, cy = x
   rla             ; a =  A R L D U x x, cy = B
   ret


   
 ;======================================
; Scan Taps
GETNIN:
   push   af
   push   hl
; select port and 8pin=h,6pin=l
   ld a,15
   out (0a0h),a
   in a,(0a2h)
   and d
   or e
   out (0a1h),a

; pulse LATCH
   or   05h  ; 6pin=h (4021 data read)
   out   (0a1h),a
   and   0fah   ; 6pin=l (4021 transfer mode)
   out   (0a1h),a

; read tap loop
   ld   b,8
GETNI0:
; send me data
   ld   a,15
   out   (0a0h),a
   in   a,(0a2h)
   or   030h
   out   (0a1h),a   ;8=h
   and   0cfh
   out   (0a1h),a   ;8=l

   ld   a,14
   out   (0a0h),a
   in   a,(0a2h)   ;read
   rra
   rl    h      ;joy1
   rra
   rl    e      ;joy2
   rra
   rl    d      ;joy3
   rra
   rl    c      ;joy4
   djnz   GETNI0

; save tap data
   ld   a,h
   pop   hl
   ld   (hl),a      ;joy1
   inc   hl
   ld   (hl),e      ;joy2
   inc   hl
   ld   (hl),d      ;joy3
   inc   hl
   ld   (hl),c      ;joy4
   inc   hl
; restore port (6,7,8=h)
   ld   de,0ff3fh
   call   PORSEL
   pop   af
   ret


PORSEL:
   ld a,15
   out (0A0H),a
   in a,(0A2H)
   and d          ; bit clear mask
   or e          ; bit set mask
   out (0A1H),a   ; return A = state of Reg15
   ret


 ntapData:
tap1Data: db 0
tap2Data: db 0
tap3Data: db 0
tap4Data: db 0
