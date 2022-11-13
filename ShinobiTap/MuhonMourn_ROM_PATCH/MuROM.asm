; MuhonMourn Cart

RDSLT: equ 000ch
PATCHLEN: equ 01f0h
PATCHBEGIN equ 0e000h
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

 ; now jump to the game
 ld hl, 0915fh
 ex (sp),hl
 ;ei
 ret
 ; ei
 ; jp 0915fh
ENDSWSLOT:


FREE_AREA:


org 069ffh ; org 0bfffh
nop


