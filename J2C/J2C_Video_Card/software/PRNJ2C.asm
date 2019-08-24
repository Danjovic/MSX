; ------------------------------------------------------------------------------
;  PRNJ2C:
;
;  Resident routine for send characters to Joystick Port on MSX computers
;  using I2C protocol
;
; danjovic@hotmail.com
; http://hotbit.blogspot.com
;
; Version 1.0 19/09/2018
;
; Released under GNU GPL 2.0
;
; tniASM website:
; http://www.tni.nl/products/tniasm.html
;
; 
; 
;
; ------------------------------------------------------------------------------
; Definitions
;
; Possible BaudRates
; It might be necessary to trim these values
; for machines from other countries due to
; differences in Z80 clock which is usually
; tied to chroma subcarrier
;
;
T1200:   EQU 170  ;  1200 bauds
T2400:   EQU  83  ;  2400 bauds
T4800:   EQU  39  ;  4800 bauds
T9600:   EQU  17  ;  9600 bauds
T14400:  EQU  10  ; 14400 bauds
T19200:  EQU   6  ; 19200 bauds



;
;  Bit assignment in PSG register 15
;       7     6     5     4     3     2     1     0
;    +-----------------------------------------------+
;    ¦Kana ¦ Joy ¦Pulse¦Pulse¦PortB¦PortB¦PortA¦PortA¦
;    ¦ LED ¦ Sel ¦  B  ¦  A  ¦ pin7¦ pin6¦ pin7¦ pin6¦
;    +-----------------------------------------------+


; PSG IO addresses
PSGAD: EQU 0A0H
PSGWR: EQU 0A1H
PSGRD: EQU 0A2H

; ------------------------------------------------------------------------------
; 
;
; Tell the compiler which architecture is in use
CPU Z80

; Add header to make code loadable with 'bload' command
db 0x0FE
dw START, FINIS, INSTALL

;
; Address of execution. Can be changed to more convenient place
ORG 0E000H
START:


; ------------------------------------------------------------------------------
; Hook Code
;
; This routine is called from HLPT hook. At this point register A holds
; the character to be sent to printer port.
;

HOOK_PRNTJ2C:
DI             ; disable interrupts as they can ruin the timing
PUSH AF        ; save registers used in the routine
PUSH BC
PUSH HL

LD L,A         ; Save register A which holds the byte to be printed



POP HL         ; restore used registers
POP BC
POP AF
AND A          ; Signal to BIOS that the byte was successfully printed

EI             ; Enable interrupts
INC SP         ; Discard stack to skip the original code that
INC SP         ; writes on printer port

RET
HOOK_END:




; ------------------------------------------------------------------------------

;
; Install bitbang routine on printer HOOK
; Borrowed from the book "+50 dicas para o MSX"
;
HLPT:  EQU 0FFB6H ; Printer hook entry
RS2IQ: EQU 0FAF5H ; RS232 queue, 64 bytes

;
INSTALL:
LD HL, HOOK_PRNTJ2C             ; beginning of hook code
LD DE, RS2IQ                     ; destiny, unused rs232 queue
LD BC, HOOK_END-HOOK_PRNTJ2C  ; block size
LDIR                             ; transfer hook code to its new location


LD HL,RS2IQ     ; Write the execution entry point for printer hook
LD [HLPT+1],HL
LD A,0C3H       ; then write the CALL instruction (0xC3)
LD [HLPT],A
RET

FINIS: