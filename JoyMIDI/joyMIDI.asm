; ------------------------------------------------------------------------------
;  JoyMIDI:
;
;  Resident routine for sendind MIDI commands
;  using Joystick port on MSX computers
;
; danjovic@hotmail.com
; http://hotbit.blogspot.com
;
; Version 0.0 03/10/2018 - Basic release, based con Joy232 1.2
;
;
; Released under GNU GPL 2.0
;
; Compiled using PASMO assembler 0.5.3:
; http://pasmo.speccy.org
;
; 
; 
;
; ------------------------------------------------------------------------------
; Definitions
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
; CPU Z80

; Add header to make code loadable with 'bload' command
;db 0x0FE
;dw START, FINIS, INSTALL

;
; Address of execution. Can be changed to more convenient place
ORG 0E000H
START:


; ------------------------------------------------------------------------------

;
; Install bitbang routine on printer HOOK
; Borrowed from the book "+50 dicas para o MSX"
;
HLPT:  EQU 0FFB6H ; Printer hook entry
RS2IQ: EQU 0FAF5H ; RS232 queue, 64 bytes

;
INSTALL:
LD HL, HOOK_PRNTJ232             ; beginning of hook code
LD DE, RS2IQ                     ; destiny, unused rs232 queue
LD BC, HOOK_END-HOOK_PRNTJ232  ; block size
LDIR                             ; transfer hook code to its new location


LD HL,RS2IQ     ; Write the execution entry point for printer hook
LD [HLPT+1],HL
LD A,0C3H       ; then write the CALL instruction (0xC3)
LD [HLPT],A
RET

; ------------------------------------------------------------------------------
; Hook Code
;
; This routine is called from HLPT hook. At this point register A holds
; the character to be sent to printer port.
;

HOOK_PRNTJ232:
DI             ; disable interrupts as they can ruin the timing
PUSH AF        ; save registers used in the routine
PUSH BC
PUSH HL

LD L,A         ; Save register A which holds the byte to be printed

; Select PSG Register 15
LD A,15
OUT [PSGAD],A


; ------------------------------------------------------------------------------
; Bitbang code
;
; Send the character in register A through
; pin 6 from Joystick port B using 8N1 signaling
;
; Timing in MSX computers is tricky because the standard requires one wait state
; to be inserted at each machine cycle. Then it is necessary to check how many
; M1 cycles happens on each instruction and add them to to sum to know exactly
; how many clock cycles will be spent.
;
; At NTSC frequency 3.579545MHz it takes 114.54 clock cycles to send each bit
;
; CYCLES BAUDRATE   ERROR (%)
;  113	 31677,39  -1,3676460177
;  114	 31399,52  -0,4784561404
;  115	 31126,48   0,3952695652
;  116	 30858,15   1,2539310345




; Prepare stream of bits
LD H,255; Add stop bits
AND A   ; clear carry flag
RL L    ; Add start bit and send 7th bit to carry
RL H    ; Send 7th bit to H register
        ; HL register is now
        ; ------------ H -----------    ----------- L ---------
        ; 16 15 14 13 12 11 10  9  8    7  6  5  4  3  2  1  0
        ;  1  1  1  1  1  1  1 stp b7   b6 b5 b4 b3 b2 b1 b0 start


; Now loop through 10 bits [1 extra to compensate time at the end of the loop]
LD B,10+1  ; poke here with 12 to send two stop bits instead of only one


   ; prepare mask ; Cycles  Accumul
   IN A,[PSGRD]   ;  14             save the present state of the bits from PSG register 15
   LD C,A

   
   
SEND_BITS:
   RES 0,A        ;  10     75      clear bit 0
    ; 16 bit rotate
   RR H           ;  10     85      H.0->Cy (bit 0 from H goes to carry)
   RR L           ;  10     95      Cy->L.7, L.0->Cy
    ; set TXD line state
   ADC A,0        ;   8    103      A.0 now equals Cy
   OUT [PSGWR],A  ;  12    115/0      write bit to output. Here starts the cycle counting

   ; do some stuff to spend time ( 51 cycles)
   LD C,(IX+0)    ;  21     21
   RR C           ;  10     31
   RL C           ;  10     41 
   RR C           ;  10     51


DJNZ SEND_BITS    ;  14(/9) 65    send next bit

POP HL         ; restore used registers
POP BC
POP AF
AND A          ; Signal to BIOS that the byte was successfully printed

EI             ; Enable interrupts
INC SP         ; Discard stack to skip the original code that
INC SP         ; writes on printer port

RET
HOOK_END:







FINIS:
