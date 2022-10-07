;
;
org 09000h
;

CHECKPLYRS:
; Return the number of players connected
; [E] None                     
; [R] C Tap connected info ( 0  0  0  0  a1 a0 b1 b0)
;     B number of players connected and interface type
;  7   6   5   4   3   2   1   0
;  │   │   │   │   └───┴───┴───┴── Number of joystick ports available (2, 5 or 8)
;  │   │   └───┴────────────────── Tap type pluged in port 1 
;  └───┴────────────────────────── Tap type pluged in port 2 

	call CHECKTAPS
	ld b,0
	ld hl,TBPLRS
	add hl,bc
	ld b,(hl)
	ret
	
TBPLRS: ; unknown count as 1
	db 0A8h,068h,0E5h,025h,098h,058h,0D5h,015h,0B5h,075h,0F2h,032h,085h,045h,0C2h,002h
;   db  8,8,5,5,8,8,5,5,5,5,2,2,5,5,2,2

;  Input: C          output B   #players  Table    
;  P.Ty.#  P.Ty.#   P.Ty  P.Ty  B.#+A.#   bin
;  A.ST.4  B.ST.4   B.10  A.10    4+4     1010 <<4  + 8  = 0A8h
;  A.ST.4  B.NJ.4   B.01  A.10    4+4     0110 <<4  + 8  = 068h
;  A.ST.4  B.UK.1   B.11  A.10    1+4     1110 <<4  + 5  = 0E5h
;  A.ST.4  B.JO.1   B.00  A.10    1+4     0010 <<4  + 5  = 025h
;  A.NJ.4  B.ST.4   B.10  A.01    4+4     1001 <<4  + 8  = 098h
;  A.NJ.4  B.NJ.4   B.01  A.01    4+4     0101 <<4  + 8  = 058h
;  A.NJ.4  B.UK.1   B.11  A.01    1+4     1101 <<4  + 5  = 0D5h
;  A.NJ.4  B.JO.1   B.00  A.01    1+4     0001 <<4  + 5  = 015h
;  A.UK.1  B.ST.4   B.10  A.11    4+1     1011 <<4  + 5  = 0B5h
;  A.UK.1  B.NJ.4   B.01  A.11    4+1     0111 <<4  + 5  = 075h
;  A.UK.1  B.UK.1   B.11  A.11    1+1     1111 <<4  + 2  = 0F2h
;  A.UK.1  B.JO.1   B.00  A.11    1+1     0011 <<4  + 2  = 032h
;  A.JO.1  B.ST.4   B.10  A.00    4+1     1000 <<4  + 5  = 085h
;  A.JO.1  B.NJ.4   B.01  A.00    4+1     0100 <<4  + 5  = 045h
;  A.JO.1  B.UK.1   B.11  A.00    1+1     1100 <<4  + 2  = 0C2h
;  A.JO.1  B.JO.1   B.00  A.00    1+1     0000 <<4  + 2  = 002h
;  
;  



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

; --write--  ---Pin 7 (read)-----
; PIN6  PIN8 No-Tap Ninja  Shinobi Unknown
;  LOW  LOW   HIGH   HIGH   HIGH    HIGH  
;  LOW  HIGH  HIGH   LOW    LOW     HIGH    -> to bit a1/b1   First Read
;  HIGH LOW   HIGH   HIGH   LOW     LOW    -> to bit a0/b0   Second Read
;  HIGH HIGH  HIGH   LOW    LOW     LOW   (can be disregarded)
; 
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
	ld de,0ba7ah  ; repeat with Joysel port B, pins 8=1, 7=1, 6=0 (read b1)
	call FBCHECK  ; return Cy = State of pin 7
    rl  c         ; c = 0 0 0 0 0 a1 a0 b1
	ld de,08f4fh  ; repeat with Joysel port B, pins 8=0, 7=1, 6=1 (read b0)
	call FBCHECK  ; feedback check at pin 7
    rl  c         ; c = 0 0 0 0 a1 a0 b1 b0
    ret           ; and B = B+1

;	
; Set bits on Joystick ports and return state of pin 7
; [E]  DE => Reg 15 bit mask, D = bit clear mask, E = bit set mask 
; [R] Cy = State of pin 7
;
FBCHECK:
    call PORSEL
	LD	A,14        ; select register 14 
	OUT	(0A0H),A
	IN	A,(0A2H)    ; read state of joystick port a = x x B A R L D U
	rla             ; a =  x B A R L D U, cy = x
	rla             ; a =  B A R L D U x, cy = x
	rla             ; a =  A R L D U x x, cy = B
	ret	
	

;======================================
; Sub Routine
PORSEL:	LD	A,15
	OUT	(0A0H),A
	IN	A,(0A2H)
	AND	D          ; bit clear mask 
	OR	E          ; bit set mask
	OUT	(0A1H),A   ; return A = state of Reg15 
	RET



