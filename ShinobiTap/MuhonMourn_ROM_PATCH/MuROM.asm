; MuhonMourn Cart

RDSLT  : equ 000ch
CHGMOD : equ 005fh
LDIRVM : equ 005ch
DISSCR : equ 0041h

PATCHLEN: equ 01f0h
PATCHBEGIN: equ 0e000h

FORCLR: equ 0f3e9h
BAKCLR: equ 0f3e9h 
BDRCLR: equ 0f3ebh
BOTTOM: equ 0fc48h

; variables
presentSlot: equ PATCHBEGIN + PATCHLEN ; last address of patch


org 04000h
db 'AB'       ; header ID
dw Initialize ; ditto
dw 0          ; CALL expansion
dw 0          ; device expansion
dw 0          ; No Basic program
ds 6,0        ; reserved
Initialize:
in a,(0a8h)
ld (presentSlot),a  ; save present slot configuration
; at the moment, page 0 -> BIOS
;                page 1 -> ROM
;                page 2 -> RAM
;                page 3 -> RAM

; Screen3:color 15,1,1
ld a,15        ; color 15,1,1
ld (FORCLR),a
ld a,1
ld (BAKCLR),a
ld (BDRCLR),a
ld a,3
call CHGMOD   

; prepare for transfer
ld bc,1536 ; Length
ld de,0    ; VRAM address

ld a,(BOTTOM+1)
cp 80h ;  machines with 32k or more always have 80h here
jr z, SPLASH_SCREEN
jr c, SPLASH_SCREEN

DO_NORAM_SCREEN
ld hl,NORAM
call LDIRVM

FREEZE: jr FREEZE

SPLASH_SCREEN:
ld a,(presentSlot)
ld hl,QUEEN3
bit 2,a   ; test for cart inserted on odd/even slot

DO_QUEEN:    ; even
jr z, DO_SPLASH

DO_INFOSOC:  ; odd
ld hl,INFOSOC

DO_SPLASH:
call LDIRVM

ld b,3
SPL_DLY:
call delay1s
djnz SPL_DLY

; copy the upper part of the game c000..d3ff, e000..e1f0
 ; copy the Ninja Tap code
 ld hl,06a00h
 ld de,0e000h
 ld bc,PATCHLEN ;
 ldir

 ld hl,06c00h
 ld de,0c000h
 ld bc,01400h
 ldir

; read from game slot and write on RAM
in a,(0a8h) ;  bits 2,3 are the slot where this rom is running
 
 rrca
 rrca
 and 03  ; isolate bits
 ld ( presentSlot ),a

 ld hl,8000h
 ld de,8000h
 ld bc,4000h
 
 slotldir:
 push bc
 push de
 ld a,(presentSlot)
 call RDSLT
 pop de
 pop bc

 ld (de),a
 inc de
 inc hl
 dec bc
 ld a,b
 or c
 jr nz, slotldir


 ; load switching slot routine in page 3
 ld hl,SWSLOT
 ld de,0e1f0h
 ld bc,ENDSWSLOT-SWSLOT
 ldir
 jp 0e1f0h


 SWSLOT:
 in a,(0a8h) ;  bits 2,3 are the slot where this rom is running
             ;  bits 0,1 are the slot where BIOS is running
 ld e,a        ; save slot configuration
 and 11110011b ; 0f3h  mask bits for page 1
 ld d,a        ; then save it
 ld a,e        ; get back the paging register
 rlca          ; shift bits from page 0 to page 2 position
 rlca
 and 0ch        ; isolate bits from page 0
 or d          ; add them to the slot register
 out (0a8h),a  ; select correct pages

 ; disable the screen 
 call DISSCR
 ; now jump to the game
 ld hl, 0915fh
 ex (sp),hl
 ;ei
 ret
 ; ei
 ; jp 0915fh
ENDSWSLOT:

delay1s:
ld hl,1000    ; 
dl0:          ; 
ld c,154      ; 8      | = 8 + (5+5+13) * (C-1) + (5+5+8) * C 
dl1:          ;        | = 8 + (5+5+13) * C - (13-8) 
nop           ; 5      | = (8-5) + (5+5+13) * C
dec c         ; 5      | = 3 + 23 * C  
jr nz,dl1     ; 13/8   | for C = 154, dl1= 3 + 23 * 154 = 3.545 cycles

dec hl        ; 7      | = ( 3545 + 7 + 5 + 5 + 5 + 13 ) * HL - (13-8)
ld a,h        ; 5      | = 3580 * HL - 5
nop           ; 5      | for HL = 1000, dl0 = 3580 * 1000 - 5 = 3.579.995 cycles 
or l          ; 5      | or 1 second on a standard MSX machine
jr nz,dl0     ; 13/8   | 
ret           ;        |


include splashNoram.inc
include splashInfoSoc.inc
include splashQueen3.inc


FREE_AREA:


org 069ffh ; org 0bfffh
nop


