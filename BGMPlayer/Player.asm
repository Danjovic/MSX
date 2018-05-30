;
; MSX BGM player
;
; v0.7 - 27 may 2018 by Danjovic  -  Danjovic @gmail.com
;
; Released under GPL V2.0
;

; BIOS CALLS
wrtpsg: equ  0093h


org 0C000h
  ld hl,SONG      ; Song pointer
  ld a,0          ; PSG Channel
  call InitSound
  ;..
  ;.. initialize remaining of your code here
  ;..

loop:
  ei
  halt
  call PlaySong
  ;..
  ;.. process your code here
  ;..
  jr loop

;
; Initialize Song pointer and channel
;
; Input:  HL=Song stream address, A=Sound channel (0,1,2)
; Output:
; Modify: E,EI
;
InitSound:
;  ld hl,SONG
  ld (sngstart),hl
  ld (sngnow),hl
;  xor a
  ld (tcnt),a
  ld (channel),a

  ; Tone A,B,C on
  ld a,10111000b
  ld e,7
  call wrtpsg

  ; ch a vol = 15
  ld a,8
  ld e,15
  call wrtpsg

  ; ch b vol = 15
  ld a,9
  ld e,15
  call wrtpsg

  ; ch c vol = 15
  ld a,10
  ld e,15
  call wrtpsg

  ret


;
; Play a BGM track. Can be used to play sound effects
; by writing directly to PSG registers
;
; Input:
; Output:
; Modify: A,HL,DE
;
PlaySong
  ld a,(tcnt)
  or a
  jr z,next_note

  dec a
  ld (tcnt),a
  ret

next_note:    ; d =  [0000  msb]  msb for PSG frequency divider   0..15
              ; e =  [   lsb   ]  for PSG frequency divider       0..255
  ld hl,(sngnow)
  ld a,(hl)       ; get Tempo
  inc hl
  ld e,(hl)       ; get data lsb
  inc hl
  ld d,(hl)       ; get data msb
  inc hl          ; point to next address
  ld (sngnow),hl  ; update pointer

  or a            ; data (NZ)/command(Z) ?
  jr z,command    ;

  ld (tcnt),a     ; store new tick counter value
  ld a,(channel)  ; PSG channel
  add a,a         ; 
  
  call wrtpsg     ; write lsb
  inc a
  ld e,d
  call wrtpsg     ; write msb
  ret

command:      ; d =  [ccccrrrr]  cccc command 0..15  rrrr argument 0..15
              ; e =  [dddddddd]  dddddddd data 0..255
  ld a,0xf0   ;
  and d       ; isolate command a = cccc0000
  jr z,replay ; 0000 = replay

  cp  010h    ; (1<<4)   ; 0001 = write psg value rrrr= register, dddddddd = data
  jr z,command_write     ;        then leave

  cp  020h    ; (2<<4)    ; 0010 = write psg value rrrr= register, dddddddd = data
  jr z,command_write_more ;        then interpret next command or note

  ;
  ; add new commands here
  ;cp 030h   ; (3<<4)
  ;jr z,command3
  ; ...
  ; ...
  ;cp 0f0h   ; (15<<4)
  ;jr z,command15


default_command:
replay:
  ld hl,(sngstart) ; restart pointer
  ld (sngnow),hl   ; to beginning of song
  xor a            ; and prepare to get new command
  ld (tcnt),a      ; on next interrupt
  ret

command_write:
  ld a,0x0f    ; d = ccccrrrr e=dddddddd
  and d        ; a = 0000rrrr
  call wrtpsg  ; write PSG register with value
  ret

command_write_more:
  ld a,0x0f    ; d = ccccrrrr e=dddddddd
  and d        ; a = 0000rrrr
  call wrtpsg  ; write PSG register with value
  jr next_note ; allow more than one write to PSG
               ; on the same frame time




SONG:
  ; start song: Super Mario - Main Theme
db 28,127,0 ;
db 21,160,0 ; 
db 7,213,0 ; 
db 7,190,0 ; 
db 7,160,0 ; 
db 7,0,0 ;   pause
db 28,160,0 ; 
db 7,190,0 ; 
db 7,213,0 ; 
db 7,0,0 ;   pause
db 7,160,0 ; 
db 7,0,0 ;   pause
db 7,160,0 ; 
db 7,0,0 ;   pause
db 14,106,0 ; 
db 21,127,0 ; 
db 28,142,0 ; 
db 7,213,0 ; 
db 28,127,0 ; 
db 21,160,0 ; 
db 7,213,0 ; 
db 7,190,0 ; 
db 7,160,0 ; 
db 7,0,0 ;   pause
db 28,160,0 ; 
db 7,190,0 ; 
db 7,213,0 ; 
db 7,0,0 ;   pause
db 7,160,0 ; 
db 7,0,0 ;   pause
db 7,119,0 ; 
db 7,127,0 ; 
db 7,142,0 ; 
db 57,160,0 ; 
db 7,0,0 ;   pause
db 21,127,0 ; 
db 21,160,0 ; 
db 14,213,0 ; 
db 21,127,0 ; 
db 28,160,0 ; 
db 7,134,0 ; 
db 7,160,0 ; 
db 7,213,0 ; 
db 7,0,0 ;   pause
db 21,134,0 ; 
db 57,142,0 ; 
db 21,127,0 ; 
db 21,160,0 ; 
db 14,213,0 ; 
db 21,127,0 ; 
db 28,160,0 ; 
db 7,134,0 ; 
db 7,160,0 ; 
db 14,213,0 ; 
db 57,106,0 ; 
db 0,0,0 ; repeat song



; Variables
;.org 0E000h
sngstart: dw 0  ; song start address  (reset value for sngnow)
sngnow:   dw 0  ; pointer to present song playing
tcnt:     db 0  ; tick counter
channel:  db 0  ; current PSG channel






