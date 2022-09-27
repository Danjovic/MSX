;
;
org 09000h
;

CHECKPLYRS:
; Return the number of players connected
; [E] None                     
; [R] C Tap connected info 
;     B number of players connected
	call CHECKTAPS
	ld b,0
	ld hl,TBPLRS
	add hl,bc
	ld b,(hl)
	ret
	
TBPLRS: ; unknown count as 1
   db  8,8,5,5,8,8,5,5,5,5,2,2,5,5,2,2

;   a1 a0 b1 b0   Tap a, Tapb   Count
;   0  0  0  0     4      4       8
;   0  0  0  1     4      4       8
;   0  0  1  0     4      1       5
;   0  0  1  1     4      1       5
;   0  1  0  0     4      4       8
;   0  1  0  1     4      4       8
;   0  1  1  0     4      1       5
;   0  1  1  1     4      1       5
;   1  0  0  0     1      4       5
;   1  0  0  1     1      4       5
;   1  0  1  0     1      1       2
;   1  0  1  1     1      1       2
;   1  1  0  0     1      4       5
;   1  1  0  1     1      4       5
;   1  1  1  0     1      1       2
;   1  1  1  1     1      1       2


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
	ld de,0bf3ah  ; start with Joysel port A, pins 8=1, 7=1, 6=0 (read a1)
	call FBCHECK  ; return Cy = State of pin 7
    rl  c         ; c = 0 0 0 0 0 0 0 a1
	ld de,08f0fh  ; repeat with Joysel port A, pins 8=0, 7=1, 6=1 (read a0)
	call FBCHECK  ; feedback check at pin 7
    rl  c         ; c = 0 0 0 0 0 0 a1 a0
    ; port b
	ld de,0bf7ah  ; repeat with Joysel port B, pins 8=1, 7=1, 6=0 (read b1)
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



