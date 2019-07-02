;*******************************************************************************
;
; MSX Systen Variables: This is an excerpt of MSX RED BOOK
;
;*******************************************************************************
;                             6. MEMORY MAP
;
;
;    A maximum of 32 KB of RAM is available to the BASIC
;Interpreter to hold the program text, the BASIC Variables, the
;Z80 stack, the I/O buffers and the internal workspace. A memory
;map of these areas in the power-up state is shown below:
;
;
;                      +-----------------------+
;                      ¦     Workspace Area    ¦
;    HIMEM=F380H-------¦                       ¦
;                      +-----------------------¦
;                      ¦     I/O Buffer 1      ¦
;                      +-----------------------¦
;                      ¦         FCB 1         ¦
;                      +-----------------------¦
;                      ¦     I/O Buffer 0      ¦
;    NULBUF=F177H------¦                       ¦
;                      +-----------------------¦
;                      ¦         FCB 0         ¦
;                      +-----------------------¦
;                      ¦     F277H (FCB 1)     ¦
;                      +-----------------------¦
;    FILTAB=F16AH------¦     F16EH (FCB 0)     ¦
;                      +-----------------------¦
;                      ¦          00H          ¦
;                      +-----------------------¦
;    MEMSIZ=F168H------¦                       ¦
;    FRETOP=F168H---+  ¦  String Storage Area  ¦
;                      ¦                       ¦
;    STKTOP=F0A0H------¦                       ¦
;                      +-----------------------¦
;                      ¦       Z80 Stack       ¦
;                      ¦                       ¦
;                      +-----------------------+
;
;    STREND=8003H------
;                      +-----------------------+
;                      ¦  Array Storage Area   ¦
;    ARYTAB=8003H------¦                       ¦
;                      +-----------------------¦
;                      ¦ Variable Storage Area ¦
;    VARTAB=8003H------¦                       ¦
;                      +-----------------------¦
;                      ¦   Program Text Area   ¦
;    TXTTAB=8001H------¦                       ¦
;                      +-----------------------¦
;                      ¦          00H          ¦
;                      +-----------------------+
;
;Figure 50: Memory Map 8000H to FFFFH
;
;
;    The Program Text Area is composed of tokenized program lines
;stored in line number order and terminated by a zero end link,
;when in the "NEW" state only the end link is present. The zero
;byte at 8000H is a dummy end of line character needed to
;synchronize the Runloop at the start of a program.
;
;    The Variable and Array Storage Areas are composed of string
;or numeric Variables and Arrays stored in the order in which
;they are found in the program text. Execution speed improves
;marginally if Variables are declared before Arrays in a program
;as this reduces the amount of memory to be moved upwards.
;
;    The Z80 stack is positioned immediately below the String
;Storage Area, the structure of the stack top is shown below:
;
;          STKTOP-------¦     ¦
;                       +-----¦
;                       ¦ 00H ¦
;     Mainloop SP-------¦ 00H ¦
;                       +-----¦
;                       ¦ 46H ¦
;    Statement SP-------¦ 01H ¦
;                       +-----+
;
;Figure 51: Z80 Stack Top
;
;
;    Whenever the position of the stack is altered, as a result of a
;"CLEAR" or "MAXFILES" statement, two zero bytes are first
;pushed to function as a terminator during "FOR" or "GOSUB"
;parameter block searches. Assuming no parameter blocks are
;present the Z80 SP will therefore be at STKTOP-2 within the
;Interpreter Mainloop and at STKTOP-4 when control transfers
;from the Runloop to a statement handler.
;
;    The String Storage Area is composed of the string bodies
;assigned to Variables or Arrays. During expression evaluation a
;number of intermediate string results may also be temporarily
;present under the permanent string heap. The zero byte
;following the String Storage Area is a temporary delimiter for
;the "VAL" function.
;
;    The region between the String Storage Area and HIMEM is used
;for I/O buffer storage. I/O buffer 0, the "SAVE" and "LOAD"
;buffer, is always present but the number of user buffers is
;determined by the "MAXFILES" statement. Each I/O buffer
;consists of a 9 byte FCB, whose address is contained in the
;table under FCB 0, followed by a 256 byte data buffer. The FCB
;contains the status of the I/O buffer as below:
;
;
;       0     1     2     3     4     5     6     7     8
;    +-----------------------------------------------------+
;    ¦ Mod ¦ 00H ¦ 00H ¦ 00H ¦ DEV ¦ 00H ¦ POS ¦ 00H ¦ PPS ¦
;    +-----------------------------------------------------+
;Figure 52 : File Control Block
;
;
;    The MOD byte holds the buffer mode, the DEV byte the device
;code, the POS byte the current position in the buffer (0 to
;255) and the PPS byte the "PRINT" position. The remainder of
;the FCB is unused on a standard MSX machine.
;
;    The section of the Workspace Area from F380H to FD99H holds
;the BIOS/Interpreter variables. These are listed on the
;following pages in standard assembly language form:
;
RDPRIM: equ 0F380H
;    F380H RDPRIM: OUT (0A8H),A ; Set new Primary Slot
;    F382H         LD E,(HL)    ; Read memory
;    F383H         JR WRPRM1    ; Restore old Primary Slot
;
;    This routine is used by the RDSLT standard routine to switch
;Primary Slots and read a byte from memory. The new Primary Slot
;Register setting is supplied in register A, the old setting in
;register D and the byte read returned in register E.
;

WRPRIM: equ 0F385H
;    F385H WRPRIM: OUT (0A8H),A ; Set new Primary Slot
;    F387H         LD (HL),E    ; Write to memory
;    F388H WRPRM1: LD A,D       ; Get old setting
;    F389H         OUT (0A8H),A ; Restore old Primary Slot
;    F38BH         RET
;
;    This routine is used by the WRSLT standard routine to switch
;Primary Slots and write a byte to memory. The new Primary Slot
;Register setting is supplied in register A, the old setting in
;register D and the byte to write in register E.
;

CLPRIM: equ 0F38CH
;    F38CH CLPRIM: OUT (0A8H),A ; Set new Primary Slot
;    F38EH         EX AF,AF'    ; Swap to AF for call
;    F38FH         CALL CLPRM1  ; Do it
;    F392H         EX AF,AF'    ; Swap to AF
;    F393H         POP AF       ; Get old setting
;    F394H         OUT (0A8H),A ; Restore old Primary Slot
;    F396H         EX AF,AF'    ; Swap to AF
;    F397H         RET
;    F398H CLPRM1: JP (IX)
;
;    This routine is used by the CALSLT standard routine to switch
;Primary Slots and call an address. The new Primary Slot
;Register setting is supplied in register A, the old setting on
;the Z80 stack and the address to call in register pair IX.
;

USRTAB: equ 0F39AH
;    F39AH USRTAB: DEFW 475AH   ; USR 0
;    F39CH         DEFW 475AH   ; USR 1
;    F39EH         DEFW 475AH   ; USR 2
;    F3A0H         DEFW 475AH   ; USR 3
;    F3A2H         DEFW 475AH   ; USR 4
;    F3A4H         DEFW 475AH   ; USR 5
;    F3A6H         DEFW 475AH   ; USR 6
;    F3A8H         DEFW 475AH   ; USR 7
;    F3AAH         DEFW 475AH   ; USR 8
;    F3ACH         DEFW 475AH   ; USR 9
;
;    These ten variables contain the "USR" function addresses. Their
;values are set to the Interpreter "Illegal function call" error
;generator at power-up and thereafter only altered by the
;"DEFUSR" statement.
;

LINL40: equ 0F3AEH ; DEFB 37
;
;    This variable contains the 40x24 Text Mode screen width. Its
;value is set at power-up and thereafter only altered by the
;"WIDTH" statement.
;

LINL32: equ 0F3AFH ; DEFB 29
;
;    This variable contains the 32x24 Text Mode screen width. Its
;value is set at power-up and thereafter only altered by the
;"WIDTH" statement.
;

LINLEN: equ 0F3B0H
;    F3B0H LINLEN: DEFB 37
;
;    This variable contains the current text mode screen width. Its
;value is set from LINL40 or LINL32 whenever the VDP is
;initialized to a text mode via the INITXT or INIT32 standard
;routines.
;

CRTCNT: equ 0F3B1H ; DEFB 24
;
;    This variable contains the number of rows on the screen. Its
;value is set at power-up and thereafter unaltered.
;

CLMLST: equ 0F3B2H ; DEFB 14
;
;    This variable contains the minimum number of columns that must
;still be available on a line for a data item to be "PRINT"ed,
;if less space is available a CR,LF is issued first. Its value
;is set at power-up and thereafter only altered by the "WIDTH"
;and "SCREEN" statements.
;

TXTNAM: equ 0F3B3H ; DEFW 0000H   ; Name Table Base
TXTCOL: equ 0F3B5H ; DEFW 0000H   ; Colour Table Base
TXTCGP: equ 0F3B7H ; DEFW 0800H   ; Character Pattern Base
TXTATR: equ 0F3B9H ; DEFW 0000H   ; Sprite Attribute Base
TXTPAT: equ 0F3BBH ; DEFW 0000H   ; Sprite Pattern Base
;
;    These five variables contain the 40x24 Text Mode VDP base
;addresses. Their values are set at power-up and thereafter only
;altered by the "BASE" statement.
;

T32NAM: equ 0F3BDH ; DEFW 1800H   ; Name Table Base
T32COL: equ 0F3BFH ; DEFW 2000H   ; Colour Table Base
T32CGP: equ 0F3C1H ; DEFW 0000H   ; Character Pattern Base
T32ATR: equ 0F3C3H ; DEFW 1B00H   ; Sprite Attribute Base
T32PAT: equ 0F3C5H ; DEFW 3800H   ; Sprite Pattern Base
;
;    These five variables contain the 32x24 Text Mode VDP base
;addresses. Their values are set at power-up and thereafter only
;altered by the "BASE" statement.

GRPNAM: equ 0F3C7H ; DEFW 1800H   ; Name Table Base
GRPCOL: equ 0F3C9H ; DEFW 2000H   ; Colour Table Base
GRPCGP: equ 0F3CBH ; DEFW 0000H   ; Character Pattern Base
GRPATR: equ 0F3CDH ; DEFW 1B00H   ; Sprite Attribute Base
GRPPAT: equ 0F3CFH ; DEFW 3800H   ; Sprite Pattern Base
;
;    These five variables contain the Graphics Mode VDP base
;addresses. Their values are set at power-up and thereafter only
;altered by the "BASE" statement.

MLTNAM: equ 0F3D1H ; DEFW 0800H   ; Name Table Base
MLTCOL: equ 0F3D3H ; DEFW 0000H   ; Colour Table Base
MLTCGP: equ 0F3D5H ; DEFW 0000H   ; Character Pattern Base
MLTATR: equ 0F3D7H ; DEFW 1B00H   ; Sprite Attribute Base
MLTPAT: equ 0F3D9H ; DEFW 3800H   ; Sprite Pattern Base
;
;    These five variables contain the Multicolour Mode VDP base
;addresses. Their values are set at power-up and thereafter only
;altered by the "BASE" statement.

CLIKSW: equ 0F3DBH ; DEFB 01H
;
;    This variable controls the interrupt handler key click:
;00H=Off, NZ=On. Its value is set at power-up and thereafter
;only altered by the "SCREEN" statement.

CSRY: equ 0F3DCH ; DEFB 01H
;
;    This variable contains the row coordinate (from 1 to CTRCNT) of
;the text mode cursor.

CSRX: equ 0F3DDH ; DEFB 01H
;
;    This variable contains the column coordinate (from 1 to LINLEN)
;of the text mode cursor. Note that the BIOS cursor coordinates
;for the home position are 1,1 whatever the screen width.

CNSDFG: equ 0F3DEH ; DEFB FFH
;
;    This variable contains the current state of the function key
;display: 00H=Off, NZ=On.

RG0SAV: equ 0F3DFH ; DEFB 00H
RG1SAV: equ 0F3E0H ; DEFB F0H
RG2SAV: equ 0F3E1H ; DEFB 00H
RG3SAV: equ 0F3E2H ; DEFB 00H
RG4SAV: equ 0F3E3H ; DEFB 01H
RG5SAV: equ 0F3E4H ; DEFB 00H
RG6SAV: equ 0F3E5H ; DEFB 00H
RG7SAV: equ 0F3E6H ; DEFB F4H
;
;    These eight variables mimic the state of the eight write-only
;VDP Mode Registers. The values shown are for 40x24 Text Mode.

STATFL: equ 0F3E7H ; DEFB CAH
;
;    This variable is continuously updated by the interrupt handler
;with the contents of the VDP Status Register.
;
TRGFLG: equ 0F3E8H ; DEFB F1H
;
;    This variable is continuously updated by the interrupt handler
;with the state of the four joystick trigger inputs and the
;space key.

FORCLR: equ 0F3E9H ; DEFB 0FH     ; White
;
;    This variable contains the current foreground colour. Its value
;is set at power-up and thereafter only altered by the "COLOR"
;statement. The foreground colour is used by the CLRSPR standard
;routine to set the sprite colour and by the CHGCLR standard
;routine to set the 1 pixel colour in the text modes. It also
;functions as the graphics ink colour as it is copied to ATRBYT
;by the GRPPRT standard routine and used throughout the
;Interpreter as the default value for any optional colour
;operand.

BAKCLR: equ 0F3EAH ; DEFB 04H     ; Dark blue
;
;    This variable contains the current background colour. Its value
;is set at power-up and thereafter only altered by the "COLOR"
;statement. The background colour is used by the CLS standard
;routine to clear the screen in the graphics modes and by the
;CHGCLR standard routine to set the 0 pixel colour in the text
;modes.

BDRCLR: equ 0F3EBH ; DEFB 04H     ; Dark blue
;
;    This variable contains the current border colour. Its value is
;set at power-up and thereafter only altered by the "COLOR"
;statement. The border colour is used by the CHGCLR standard
;routine in 32x24 Text Mode, Graphics Mode and Multicolour Mode
;to set the border colour.

MAXUPD: equ 0F3CEH
;    F3ECH MAXUPD: DEFB C3H
;    F3EDH         DEFW 0000H
;
;    These two bytes are filled in by the "LINE" statement handler
;to form a Z80 JP to the RIGHTC, LEFTC, UPC or DOWNC standard
;routines.

MINUPD: equ 0F3EFH
;    F3EFH MINUPD: DEFB C3H
;    F3F0H         DEFW 0000H
;
;    These two bytes are filled in by the "LINE" statement handler
;to form a Z80 JP to the RIGHTC, LEFTC, UPC or DOWNC standard
;routines.

ATRBYT: equ 0F3F2H ; DEFB 0FH
;
;    This variable contains the graphics ink colour used by the SETC
;and NSETCX standard routines.

QUEUES: equ 0F3F3H ; DEFW F959H
;
;    This variable contains the address of the control blocks for
;the three music queues. Its value is set at power-up and
;thereafter unaltered.

FRCNEW: equ 0F3F5H ; DEFB FFH
;
;    This variable contains a flag to distinguish the two statements
;in the "CLOAD/CLOAD?" statement handler: 00H=CLOAD, FFH=CLOAD?.

SCNCNT: equ 0F3F6H ; DEFB 01H
;
;    This variable is used as a counter by the interrupt handler to
;control the rate at which keyboard scans are performed.

REPCNT: equ 0F3F7H ; DEFB 01H
;
;    This variable is used as a counter by the interrupt handler to
;control the key repeat rate.

PUTPNT: equ 0F3F8H ; DEFW FBF0H
;
;    This variable contains the address of the put position in
;KEYBUF.

GETPNT: equ 0F3FAH ; DEFW FBF0H
;
;    This variable contains the address of the get position in
;KEYBUF.
;

CS1200: equ 0F3FCH
;    F3FCH CS1200: DEFB 53H     ; LO cycle 1st half
;    F3FDH         DEFB 5CH     ; LO cycle 2nd half
;    F3FEH         DEFB 26H     ; HI cycle 1st half
;    F3FFH         DEFB 2DH     ; HI cycle 2nd half
;    F400H         DEFB 0FH     ; Header cycle count
;
;    These five variables contain the 1200 baud cassette parameters.
;Their values are set at power-up and thereafter unaltered.

CS2400: equ 0F401H
;    F401H CS2400: DEFB 25H     ; LO cycle 1st half
;    F402H         DEFB 2DH     ; LO cycle 2nd half
;    F403H         DEFB 0EH     ; HI cycle 1st half
;    F404H         DEFB 16H     ; HI cycle 2nd half
;    F405H         DEFB 1FH     ; Header cycle count
;
;    These five variables contain the 2400 baud cassette parameters.
;Their values are set at power-up and thereafter unaltered.

CAS_LOW:    equ 0F406H
CAS_HIGH:   equ 0F408H
CAS_HEADER: equ 0F40AH
;    F406H LOW:    DEFB 53H     ; LO cycle 1st half
;    F407H         DEFB 5CH     ; LO cycle 2nd half
;    F408H HIGH:   DEFB 26H     ; HI cycle 1st half
;    F409H         DEFB 2DH     ; HI cycle 2nd half
;    F40AH HEADER: DEFB 0FH     ; Header cycle count
;
;    These five variables contain the current cassette parameters.
;Their values are set to 1200 baud at power-up and thereafter
;only altered by the "CSAVE" and "SCREEN" statements.

ASPCT1: equ 0F40BH ; DEFW 0100H
;
;    This variable contains the reciprocal of the default "CIRCLE"
;aspect ratio multiplied by 256. Its value is set at power-up
;and thereafter unaltered.

ASPCT2: equ 0F40DH ; DEFW 01C0H
;
;    This variable contains the default "CIRCLE" aspect ratio
;multiplied by 256. Its value is set at power-up and thereafter
;unaltered. The aspect ratio is present in two forms so that the
;"CIRCLE" statement handler can select the appropriate one
;immediately rather than needing to examine and possibly
;reciprocate it as is the case with an operand in the program
;text.

ENDPRG: equ 0F40FH
;    F40FH ENDPRG: DEFB ":"
;    F410H         DEFB 00H
;    F411H         DEFB 00H
;    FE12H         DEFB 00H
;    F413H         DEFB 00H
;
;    These five bytes form a dummy program line. Their values are
;set at power-up and thereafter unaltered. The line exists in
;case an error occurs in the Interpreter Mainloop before any
;tokenized text is available in KBUF. If an "ON ERROR GOTO" is
;active at this time then it provides some text for the "RESUME"
;statement to terminate on.

ERRFLG: equ 0F414H ; DEFB 00H
;
;    This variable is used by the Interpreter error handler to save
;the error number.

LPTPOS: equ 0F415H ; DEFB 00H
;
;    This variable is used by the "LPRINT" statement handler to hold
;the current position of the printer head.

PRTFLG: equ 0F416H ; DEFB 00H
;
;    This variable determines whether the OUTDO standard routine
;directs its output to the screen or to the printer: 00H=Screen,
;01H=Printer.

NTMSXP: equ 0F417H ; DEFB 00H
;
;    This variable determines whether the OUTDO standard routine
;will replace headered graphics characters directed to the
;printer with spaces: 00H=Graphics, NZ=Spaces. Its value is set
;at power-up and thereafter only altered by the "SCREEN"
;statement.
;
RAWPRT: equ 0F418H ; DEFB 00H
;
;    This variable determines whether the OUTDO standard routine
;will modify control and headered graphics characters directed
;to the printer: 00H=Modify, NZ=Raw. Its value is set at power-
;up and thereafter unaltered.
;
VLZADR: equ 0F419H ; DEFW 0000H
VLZDAT: equ 0F41BH ; DEFB 00H
;
;    These variables contain the address and value of any character
;temporarily removed by the "VAL" function.
;
CURLIN: equ 0F41CH ; DEFW FFFFH
;
;    This variable contains the current Interpreter line number. A
;value of FFFFH denotes direct mode.
;
KBFMIN: equ 0F41EH ; DEFB ":"
;
;    This byte provides a dummy prefix to the tokenized text
;contained in KBUF. Its function is similar to that of ENDPRG
;but is used for the situation where an error occurs within a
;direct statement.
;
KBUF:   equ 0F41FH ; DEFS 318
;
;    This buffer contains the tokenized form of the input line
;collected by the Interpreter Mainloop. When a direct statement
;is executed the contents of this buffer form the program text.
;
BUFMIN: equ 0F55DH ; DEFB ","
;
;    This byte provides a dummy prefix to the text contained in BUF.
;It is used to synchronize the "INPUT" statement handler as it
;starts to analyze the input text.
;
BUF:    equ 0F55EH ; DEFS 259
;
;    This buffer contains the text collected from the console by the
;INLIN standard routine.
;
TTYPOS: equ 0F661H ; DEFB 00H
;
;    This variable is used by the "PRINT" statement handler to hold
;the current screen position (Teletype!).

DIMFLG: equ 0F662H ; DEFB 00H
;
;    This variable is normally zero but is set by the "DIM"
;statement handler to control the operation of the variable
;search routine.
;
VALTYP: equ 0F663H ; DEFB 02H
;
;    This variable contains the type code of the operand currently
;contained in DAC: integer, 3=String, 4=Single Precision,
;8=Double Precision.
;
DORES:  equ 0F664H ; DEFB 00H
;
;    This variable is normally zero but is set to prevent the
;tokenization of unquoted keywords following a "DATA" token.
;
DONUM:  equ 0F665H ; DEFB 00H
;
;    This variable is normally zero but is set when a numeric
;constant follows one of the keywords GOTO, GOSUB, THEN, etc.,
;and must be tokenized to the special line number operand form.
;
CONTXT: equ 0F666H ; DEFW 0000H
;
;    This variable is used by the CHRGTR standard routine to save
;the address of the character following a numeric constant in
;the program text.
;
CONSAV: equ 0F668H ; DEFB 00H
;
;    This variable is used by the CHRGTR standard routine to save
;the token of a numeric constant found in the program text.
;
CONTYP: equ 0F669H ; DEFB 00H
;
;    This variable is used by the CHRGTR standard routine to save
;the type of a numeric constant found in the program text.
;
CONLO:  equ 0F66AH ; DEFS 8
;
;    This buffer is used by the CHRGTR standard routine to save the
;value of a numeric constant found in the program text.
;
MEMSIZ: equ 0F672H ; DEFW F168H
;
;    This variable contains the address of the top of the String
;Storage Area. Its value is set at power-up and thereafter only
;altered by the "CLEAR" and "MAXFILES" statements.
;
STKTOP: equ 0F674H ; DEFW F0A0H
;
;    This variable contains the address of the top of the Z80 stack.
;Its value is set at power-up to MEMSIZ-200 and thereafter only
;altered by the "CLEAR" and "MAXFILES" statements.


TXTTAB: equ 0F676H ; DEFW 8001H
;
;    This variable contains the address of the first byte of the
;Program Text Area. Its value is set at power-up and thereafter
;unaltered.
;
TEMPPT: equ 0F678H ; DEFW F67AH
;
;    This variable contains the address of the next free location in
;TEMPST.
;
TEMPST: equ 0F67AH ; DEFS 30
;
;    This buffer is used to store string descriptors. It functions
;as a stack with string producers pushing their results and
;string consumers popping them.
;
DSCTMP: equ 0F698H ; DEFS 3
;
;    This buffer is used by the string functions to hold a result
;descriptor while it is being constructed.
;
FRETOP: equ 0F69BH ; DEFW F168H
;
;    This variable contains the address of the next free location in
;the String Storage Area. When the area is empty FRETOP is equal
;to MEMSIZ.
;
TEMP3:  equ 0F69DH ;DEFW 0000H
;
;    This variable is used for temporary storage by various parts of
;the Interpreter.
;
TEMP8:  equ 0F69FH ; DEFW 0000H
;
;    This variable is used for temporary storage by various parts of
;the Interpreter.
;
ENDFOR: equ 0F6A1H ; DEFW 0000H
;
;    This variable is used by the "FOR" statement handler to hold
;the end of statement address during construction of a parameter
;block.
;
DATLIN: equ 0F6A3H ; DEFW 0000H
;
;    This variable contains the line number of the current "DATA"
;item in the program text.
;
SUBFLG: equ 0F6A5H ; DEFB 00H
;
;    This variable is normally zero but is set by the "ERASE",
;"FOR", "FN" and "DEF FN" handlers to control the processing of
;subscripts by the variable search routine.
;
FLGINP: equ 0F6A6H ; DEFB 00H
;
;    This variable contains a flag to distinguish the two statements
;in the "READ/INPUT" statement handler: 00H=INPUT, NZ=READ.
;
TEMP:   equ 0F6A7H ; DEFW 0000H
;
;    This variable is used for temporary storage by various parts of
;the Interpreter.
;
PTRFLG: equ 0F6A9H ; DEFB 00H
;
;    This variable is normally zero but is set if any line number
;operands in the Program Text Area have been converted to
;pointers.
;
AUTFLG: equ 0F6AAH ; DEFB 00H
;
;    This variable is normally zero but is set when "AUTO" mode is
;turned on.
;
AUTLIN: equ 0F6ABH ; DEFW 0000H
;
;    This variable contains the current "AUTO" line number.
;
AUTINC: equ 0F6ADH ; DEFW 0000H
;
;    This variable contains the current "AUTO" line number
;increment.
;
SAVTXT: equ 0F6AFH ; DEFW 0000H
;
;    This variable is updated by the Runloop at the start of every
;statement with the current location in the program text. It is
;used during error recovery to set ERRTXT for the "RESUME"
;statement handler and OLDTXT for the "CONT" statement handler.
;
SAVSTK: equ 0F6B1H ; DEFW F09EH
;
;    This variable is updated by the Runloop at the start of every
;statement with the current Z80 SP for error recovery purposes.
;
ERRLIN: equ 0F6B3H ; DEFW 0000H
;
;    This variable is used by the error handler to hold the line
;number of the program line generating an error.
;
DOT:    equ 0F6B5H ; DEFW 0000H
;
;    This variable is updated by the Mainloop and the error handler
;with the current line number for use with the "." parameter.
;
ERRTXT: equ 0F6B7H ; DEFW 0000H
;
;    This variable is updated from SAVTXT by the error handler for
;use by the "RESUME" statement handler.
;
ONELIN: equ 0F6B9H ; DEFW 0000H
;
;    This variable is set by the "ON ERROR GOTO" statement handler
;with the address of the program line to execute when an error
;occurs.
;
ONEFLG: equ 0F6BBH ; DEFB 00H
;
;    This variable is normally zero but is set by the error handler
;when control transfers to an "ON ERROR GOTO" statement. This is
;to prevent a loop developing if an error occurs inside the
;error recovery statements.
;
TEMP2:  equ 0F6BCH ; DEFW 0000H
;
;    This variable is used for temporary storage by various parts of
;the Interpreter.
;
OLDLIN: equ 0F6BEH ; DEFW 0000H
;
;    This variable contains the line number of the terminating
;program line. It is set by the "END" and "STOP" statement
;handlers for use with the "CONT" statement.
;
OLDTXT: equ 0F6C0H ; DEFW 0000H
;
;    This variable contains the address of the terminating program
;statement.
;
VARTAB: equ 0F6C2H ; DEFW 8003H
;
;    This variable contains the address of the first byte of the
;Variable Storage Area.
;
ARYTAB: equ 0F6C4H ; DEFW 8003H
;
;    This variable contains the address of the first byte of the
;Array Storage Area.
;
STREND: equ 0F6C6H ; DEFW 8003H
;
;    This variable contains the address of the byte following the
;Array Storage Area.
;
DATPTR: equ 0F6C8H ; DEFW 8000H
;
;    This variable contains the address of the current "DATA" item
;in the program text.

DEFTBL: equ 0F6CAH
;    F6CAH DEFTBL: DEFB 08H     ; A
;    F6CBH         DEFB 08H     ; B
;    F6CCH         DEFB 08H     ; C
;    F6CDH         DEFB 08H     ; D
;    F6CEH         DEFB 08H     ; E
;    F6CFH         DEFB 08H     ; F
;    F6D0H         DEFB 08H     ; G
;    F6D1H         DEFB 08H     ; H
;    F6D2H         DEFB 08H     ; I
;    F6D3H         DEFB 08H     ; J
;    F6D4H         DEFB 08H     ; K
;    F6D5H         DEFB 08H     ; L
;    F6D6H         DEFB 08H     ; M
;    F6D7H         DEFB 08H     ; N
;    F6D8H         DEFB 08H     ; O
;    F6D9H         DEFB 08H     ; P
;    F6DAH         DEFB 08H     ; Q
;    F6DBH         DEFB 08H     ; R
;    F6DCH         DEFB 08H     ; S
;    F6DDH         DEFB 08H     ; T
;    F6DEH         DEFB 08H     ; U
;    F6DFH         DEFB 08H     ; V
;    F6E0H         DEFB 08H     ; W
;    F6E1H         DEFB 08H     ; X
;    F6E2H         DEFB 08H     ; Y
;    F6E3H         DEFB 08H     ; Z
;
;    These twenty-six variables contain the default type for each
;group of BASIC Variables. Their values are set to double
;precision at power-up, "NEW" and "CLEAR" and thereafter altered
;only by the "DEF" group of statements.
;
PRMSTK: equ 0F6E4H ; DEFW 0000H
;
;    This variable contains the base address of the previous "FN"
;parameter block on the Z80 stack. It is used during string
;garbage collection to travel from block to block on the stack.
;
PRMLEN: equ 0F6E6H ; DEFW 0000H
;
;    This variable contains the length of the current "FN" parameter
;block in PARM1.
;
PARM1 : equ 0F6E8H ; DEFS 100
;
;    This buffer contains the local Variables belonging to the "FN"
;function currently being evaluated.
;
PRMPRV: equ 0F74CH ; DEFW F6E4H
;
;    This variable contains the address of the previous "FN"
;parameter block. It is actually a constant used to ensure that
;string garbage collection commences with the current parameter
;block before proceeding to those on the stack.
;
PRMLN2: equ 0F74EH ; DEFW 0000H
;
;    This variable contains the length of the "FN" parameter block
;being constructed in PARM2
;
PARM2:  equ 0F750H ; DEFS 100
;
;    This buffer is used to construct the local Variables owned by
;the current "FN" function.
;
PRMFLG: equ 0F7B4H ; DEFB 00H
;
;    This variable is used during a Variable search to indicate
;whether local or global Variables are being examined.
;
ARYTA2: equ 0F7B5H ; DEFW 0000H
;
;    This variable is used during a Variable search to hold the
;termination address of the storage area being examined.
;
NOFUNS: equ 0F7B7H ; DEFB 00H
;
;    This variable is normally zero but is set by the "FN" function
;handler to indicate to the variable search routine that local
;Variables are present.
;
TEMP9:  equ 0F7B8H ; DEFW 0000H
;
;    This variable is used for temporary storage by various parts of
;the Interpreter.
;
FUNACT: equ 0F7BAH ; DEFW 0000H
;
;    This variable contains the number of currently active "FN
;functions.
;
SWPTMP: equ 0F7BCH ; DEFS 8
;
;    This buffer is used to hold the first operand in a "SWAP"
;statement.
;
TRCFLG: equ 0F7C4H ; DEFB 00H
;
;    This variable is normally zero but is set by the "TRON"
;statement handler to turn on the trace facility.
;
FBUFFR: equ 0F7C5H ; DEFS 43
;
;    This buffer is used to hold the text produced during numeric
;output conversion.
;
DECTMP: equ 0F7F0H ; DEFW 0000H
;
;    This variable is used for temporary storage by the double
;precision division routine.
;
DECTM2: equ 0F7F2H ; DEFW 0000H
;
;    This variable is used for temporary storage by the double
;precision division routine.
;
DECCNT: equ 0F7F4H ; DEFB 00H
;
;    This variable is used by the double precision division routine
;to hold the number of non-zero bytes in the mantissa of the
;second operand.
;
DAC:    equ 0F7F6H ; DEFS 16
;
;    This buffer functions as the Interpreter's primary accumulator
;during expression evaluation.
;
HOLD8:  equ 0F806H ; DEFS 65
;
;    This buffer is used by the double precision multiplication
;routine to hold the multiples of the first operand.
;
ARG:    equ 0F847H ; DEFS 16
;
;    This buffer functions as the Interpreter's secondary
;accumulator during expression evaluation.
;
RNDX:   equ 0F857H ; DEFS 8
;
;    This buffer contains the current double precision random
;number.
;
MAXFIL: equ 0F85FH ; DEFB 01H
;
;    This variable contains the number of currently allocated user
;I/O buffers. Its value is set to 1 at power-up and thereafter
;only altered by the "MAXFILES" statement.
;
FILTAB: equ 0F860H ; DEFW F16AH
;
;    This variable contains the address of the pointer table for the
;I/O buffer FCBs.
;
NULBUF: equ 0F862H ; DEFW F177H
;
;    This variable contains the address of the first byte of the
;data buffer belonging to I/O buffer 0.
;
PTRFIL: equ 0F864H ; DEFW 0000H
;
;    This variable contains the address of the currently active I/O
;buffer FCB.
;
FILNAM: equ 0F866H ; DEFS 11
;
;    This buffer holds a user-specified filename. It is eleven
;characters long to allow for disc file specs such as
;"FILENAME.BAS".
;
FILNM2: equ 0F871H ; DEFS 11
;
;    This buffer holds a filename read from an I/O device for
;comparison with the contents of FILNAM.
;
NLONLY: equ 0F87CH ; DEFB 00H
;
;    This variable is normally zero but is set during a program
;"LOAD". Bit 0 is used to prevent I/O buffer 0 being closed
;during loading and bit 7 to prevent the user I/O buffers being
;closed if auto-run is required.
;
SAVEND: equ 0F87DH ; DEFW 0000H
;
;    This variable is used by the "BSAVE" statement handler to hold
;the end address of the memory block to be saved.
;
FNKSTR: equ 0F87FH ; DEFS 160
;
;    This buffer contains the ten sixteen-character function key
;strings. Their values are set at power-up and thereafter only
;altered by the "KEY" statement.
;
CGPNT:  equ 0F91FH
;    F91FH CGPNT:  DEFB 00H     ; Slot ID
;    F920H         DEFW 1BBFH   ; Address
;
;    These variables contain the location of the character set
;copied to the VDP by the INITXT and INIT32 standard routines.
;Their values are set to the MSX ROM character set at power-up
;and thereafter unaltered.
;
NAMBAS: equ 0F922H ; DEFW 0000H
;
;    This variable contains the current text mode VDP Name Table
;base address. Its value is set from TXTNAM or T32NAM whenever
;the VDP is initialized to a text mode via the INITXT or INIT32
;standard routines.
;
CGPBAS: equ 0F924H ; DEFW 0800H
;
;    This variable contains the current text mode VDP Character
;Pattern Table base address. Its value is set from TXTCGP or
;T32CGP whenever the VDP is initialized to a text mode via the
;INITXT or INIT32 standard routines.
;
PATBAS: equ 0F926H ; DEFW 3800H
;
;    This variable contains the current VDP Sprite Pattern Table
;base address. Its value is set from T32PAT, GRPPAT or MLTPAT
;whenever the VDP is initialized via the INIT32, INIGRP or
;INIMLT standard routines.
;
ATRBAS: equ 0F928H ; DEFW 1B00H
;
;    This variable contains the current VDP Sprite Attribute Table
;base address. Its value is set from T32ATR, GRPATR or MLTATR
;whenever the VDP is initialized via the INIT32, INIGRP or
;INIMLT standard routines.
;
CLOC:   equ 0F92AH ; DEFW 0000H   ; Pixel location
CMASK:  equ 0F92CH ; DEFB 80H     ; Pixel Mask
;
;    These variables contain the current pixel physical address used
;by the RIGHTC, LEFTC, UPC, TUPC, DOWNC, TDOWNC, FETCHC, STOREC,
;READC, SETC, NSETCX, SCANR and SCANL standard routines. CLOC
;holds the address of the byte containing the current pixel and
;CMASK defines the pixel within that byte.
;
MINDEL: equ 0F92DH ; DEFW 0000H
;
;    This variable is used by the "LINE" statement handler to hold
;the minimum difference between the end points of the line.
;
MAXDEL: equ 0F92FH ; DEFW 0000H
;
;    This variable is used by the "LINE" statement handler to hold
;the maximum difference between the end points of the line.
;
ASPECT: equ 0F931H ; DEFW 0000H
;
;    This variable is used by the "CIRCLE" statement handler to hold
;the current aspect ratio. This is stored as a single byte
;binary fraction so an aspect ratio of 0.75 would become 00C0H.
;The MSB is only required if the aspect ratio is exactly 1.00,
;that is 0100H.
;
CENCNT: equ 0F933H ; DEFW 0000H
;
;    This variable is used by the "CIRCLE" statement handler to hold
;the point count of the end angle.
;
CLINEF: equ 0F935H ; DEFB 00H
;
;    This variable is used by the "CIRCLE" statement handler to hold
;the two line flags. Bit 0 is set if a line is required from the
;start angle to the centre and bit 7 set if one is required from
;the end angle.
;
CNPNTS: equ 0F936H ; DEFW 0000H
;
;    This variable is used by the "CIRCLE" statement handler to hold
;the number of points within a forty-five degree segment.
;
CPLOTF: equ 0F938H ; DEFB 00H
;
;    This variable is normally zero but is set by the "CIRCLE"
;statement handler if the end angle is smaller than the start
;angle. It is used to determine whether the pixels should be set
;"inside" the angles or "outside" them.
;
CPCNT:  equ 0F939H ; DEFW 0000H
;
;    This variable is used by the 'CIRCLE" statement handler to hold
;the point count within the current forty-five degree segment,
;this is in fact the Y coordinate.
;
CPCNT8: equ 0F93BH ; DEFW 0000H
;
;    This variable is used by the "CIRCLE" statement handler to hold
;the total point count of the present position.
;
CRCSUM: equ 0F93DH ; DEFW 0000H
;
;    This variable is used by the "CIRCLE" statement handler as the
;point computation counter.
;
CSTCNT: equ 0F93FH ; DEFW 0000H
;
;    This variable is used by the "CIRCLE" statement handler to hold
;the point count of the start angle.
;
CSCLXY: equ 0F941H ; DEFB 00H
;
;    This variable is used by the "CIRCLE" statement handler as a
;flag to determine in which direction the elliptic squash is to
;be applied: 00H=Y, 01H=X.
;
CSAVEA: equ 0F942H ; DEFW 0000H
;
;    This variable is used for temporary storage by the SCANR
;standard routine.
;
CSAVEM: equ 0F944H ; DEFB 00h
;
;    This variable is used for temporary storage by the SCANR
;standard routine.
;
CXOFF:  equ 0F945H ; DEFW 0000H
;
;    This variable is used for temporary storage by the "CIRCLE"
;statement handler.
;
CYOFF:  equ 0F947H ; DEFW 0000H
;
;    This variable is used for temporary storage by the "CIRCLE"
;statement handler.
;
LOHMSK: equ 0F949H ; DEFB 00H
;
;    This variable is used by the "PAINT" statement handler to hold
;the leftmost position of a LH excursion.
;
LOHDIR: equ 0F94AH ; DEFB 00H
;
;    This variable is used by the "PAINT" statement handler to hold
;the new paint direction required by a LH excursion.
;
LOHADR: equ 0F94BH ; DEFW 0000H
;
;    This variable is used by the "PAINT" statement handler to hold
;the leftmost position of a LH excursion.
;
LOHCNT: equ 0F94DH ; DEFW 0000H
;
;    This variable is used by the "PAINT" statement handler to hold
;the size of a LH excursion.
;
SKPCNT: equ 0F94FH ; DEFW 0000H
;
;    This variable is used by the "PAINT" statement handler to hold
;the skip count returned by the SCANR standard routine.
;
MOVCNT: equ 0F951H ; DEFW 0000H
;
;    This variable is used by the "PAINT" statement handler to hold
;the movement count returned by the SCANR standard routine.
;
PDIREC: equ 0F953H ; DEFB 00H
;
;    This variable is used by the "PAINT" statement handler to hold
;the current paint direction: 40H=Down, C0H=Up, 00H=Terminate.
;
LFPROG: equ 0F954H ; DEFB 00H
;
;    This variable is normally zero but is set by the "PAINT"
;statement handler if there has been any leftwards progress.
;
RTPROG: equ 0F955H ; DEFB 00H
;
;    This variable is normally zero but is set by the "PAINT"
;statement handler if there has been any rightwards progress.
;
MCLTAB: equ 0F956H ; DEFW 0000H
;
;    This variable contains the address of the command table to be
;used by the macro language parser. The "DRAW" table is at 5D83H
;and the "PLAY" table at 752EH.
;
MCLFLG: equ 0F958H ; DEFB 00H
;
;    This variable is zero if the macro language parser is being
;used by the "DRAW", statement handler and non-zero if it is
;being used by "PLAY".
;
QUETAB: equ 0F959H
;    F959H QUETAB: DEFB 00H     ; AQ Put position
;    F95AH         DEFB 00H     ; AQ Get position
;    F95BH         DEFB 00H     ; AQ Putback flag
;    F95CH         DEFB 7FH     ; AQ Size
;    F95DH         DEFW F975H   ; AQ Address
;
;    F95FH         DEFB 00H     ; BQ Put position
;    F960H         DEFB 00H     ; BQ Get position
;    F961H         DEFB 00H     ; BQ Putback flag
;    F962H         DEFB 7FH     ; BQ Size
;    F963H         DEFW F9F5H   ; BQ Address
;
;    F965H         DEFB 00H     ; CQ Put position
;    F966H         DEFB 00H     ; CQ Get position
;    F967H         DEFB 00H     ; CQ Putback flag
;    F968H         DEFB 7FH     ; CQ Size
;    F969H         DEFW FA75H   ; CQ Address
;
;    F96BH         DEFB 00H     ; RQ Put position
;    F96CH         DEFB 00H     ; RQ Get position
;    F96DH         DEFB 00H     ; RQ Putback flag
;    F96EH         DEFB 00H     ; RQ Size
;    F96FH         DEFW 0000H   ; RQ Address
;
;    These twenty-four variables form the control blocks for the
;three music queues (VOICAQ, VOICBQ and VOICCQ) and the RS232
;queue. The three music control blocks are initialized by the
;GICINI standard routine and thereafter maintained by the
;interrupt handler and the PUTQ standard routine. The RS232
;control block is unused in the current MSX ROM.
;
QUEBAK: equ 0F971H
;    F971H QUEBAK: DEFB 00H     ; AQ Putback character
;    F972H         DEFB 00H     ; BQ Putback character
;    F973H         DEFB 00H     ; CQ Putback character
;    F974H         DEFB 00H     ; RQ Putback character
;
;    These four variables are used to hold any unwanted character
;returned to the associated queue. Although the putback facility
;is implemented in the MSX ROM it is currently unused.
;
VOICAQ: equ 0F975H ; DEFS 128     ; Voice A queue
VOICBQ: equ 0F9F5H ; DEFS 128     ; Voice B queue
VOICCQ: equ 0FA75H ; DEFS 128     ; Voice C queue
RS2IQ:  equ 0FAF5H ; DEFS 64      ; RS232 queue
;
;    These four buffers contain the three music queues and the RS232
;queue, the latter is unused.
;
PRSCNT: equ 0FB35H ; DEFB 00H
;
;    This variable is used by the "PLAY" statement handler to count
;the number of completed operand strings. Bit 7 is also set
;after each of the three operands has been parsed to prevent
;repeated activation of the STRTMS standard routine.
;
SAVSP:  equ 0FB36H ; EFW 0000H
;
;    This variable is used by the "PLAY" statement handler to save
;the Z80 SP before control transfers to the macro language
;parser. Its value is compared with the SP on return to
;determine whether any data has been left on the stack because
;of a queue-full termination by the parser.
;
VOICEN: equ 0FB38H ; DEFB 00H
;
;    This variable contains the current voice number being processed
;by the "PLAY" statement handler. The values 0, 1 and 2
;correspond to PSG channels A, B and C.
;
SAVVOL: equ 0FB39H ; DEFW 0000H
;
;    This variable is used by the "PLAY" statement "R" command
;handler to save the current volume setting while a zero-
;amplitude rest is generated.
;
MCLLEN: equ 0FB3BH ; DEFB 00H
;
;    This variable is used by the macro language parser to hold the
;length of the string operand being parsed.
;
MCLPTR: equ 0FB3CH ; DEFW 0000H
;
;    This variable is used by the macro language parser to hold the
;address of the string operand being parsed.
;
QUEUEN: equ 0FB3EH ; DEFB 00H
;
;    This variable is used by the interrupt handler to hold the
;number of the music queue currently being processed. The values
;0, 1 and 2 correspond to PSG channels A, B and C.
;
MUSICF: equ 0FB3FH ; DEFB 00H
;
;    This variable contains three bit flags set by the STRTMS
;standard routine to initiate processing of a music queue by the
;interrupt handler. Bits 0, 1 and 2 correspond to VOICAQ, VOICBQ
;and VOICCQ.
;
PLYCNT: equ 0FB40H ; DEFB 00H
;
;    This variable is used by the STRTMS standard routine to hold
;the number of "PLAY" statement sequences currently held in the
;music queues. It is examined when all three end of queue marks
;have been found for one sequence to determine whether
;dequeueing should be restarted.
;
VCBA: equ 0FB41H 
;    FB41H VCBA:   DEFW 0000H   ; Duration counter
;    FB43H         DEFB 00H     ; String length
;    FB44H         DEFW 0000H   ; String address
;    FB46H         DEFW 0000H   ; Stack data address
;    FB48H         DEFB 00H     ; Music packet length
;    FB49H         DEFS 7       ; Music packet
;    FB50H         DEFB 04H     ; Octave
;    FB51H         DEFB 04H     ; Length
;    FB52H         DEFB 78H     ; Tempo
;    FB53H         DEFB 88H     ; Volume
;    FB54H         DEFW 00FFH   ; Envelope period
;    FB56H         DEFS 16      ; Space for stack data
;
;    This thirty-seven byte buffer is used by the "PLAY" statement
;handler to hold the current parameters for voice A.
;
VCBB:   equ 0FB66H ; DEFS 37
;
;    This buffer is used by the "PLAY" statement handler to hold the
;current parameters for voice B, its structure is the same as
;VCBA.
;
VCBC:   equ 0FB8BH ; DEFS 37
;
;    This buffer is used by the "PLAY" statement handler to hold the
;current parameters for voice C, its structure is the same as
;VCBA.
;
ENSTOP: equ 0FBB0H ; DEFB 00H
;
;    This variable determines whether the interrupt handler will
;execute a warm start to the Interpreter upon detecting the keys
;CODE, GRAPH, CTRL and SHIFT depressed together: 00H=Disable,
;NZ=Enable.
;
BASROM: equ 0FBB1H ; DEFB 00H
;
;    This variable determines whether the ISCNTC and INLIN standard
;routines will respond to the CTRL-STOP key: 00H=Enable,
;NZ=Disable. It is used to prevent termination of a BASIC ROM
;located during the power-up ROM search.
;
LINTTB: equ 0FBB2H ; DEFS 24
;
;    Each of these twenty-four variables is normally non-zero but is
;zeroed if the contents of the corresponding screen row have
;overflowed onto the next row. They are maintained by the BIOS
;but only actually used by the INLIN standard routine (the
;screen editor) to discriminate between logical and physical
;lines.
;
FSTPOS: equ 0FBCAH ; DEFW 0000H
;
;    This variable is used to hold the cursor coordinates upon entry
;to the INLIN standard routine. Its function is to restrict the
;extent of backtracking performed when the text is collected
;from the screen at termination.
;
CURSAV: equ 0FBCCH ; DEFB 00H
;
;    This variable is used to hold the screen character replaced by
;the text cursor.
;
FNKSWI: equ 0FBCDH ; DEFB 00H
;
;    This variable is used by the CHSNS standard routine to
;determine whether the shifted or unshifted function keys are
;currently displayed: 00H=Shifted, 01H=Unshifted.
;
FNKFLG: equ 0FBCEH ; DEFS 10
;
;    Each of these ten variables is normally zero but is set to 01H
;if the associated function key has been turned on by a "KEY(n)
;ON" statement. They are used by the interrupt handler to
;determine whether, in program mode only, it should return a
;character string or update the associated entry in TRPTBL.
;
ONGSBF: equ 0FBD8H ; DEFB 00H
;
;    This variable is normally zero but is incremented by the
;interrupt handler whenever a device has achieved the conditions
;necessary to generate a program interrupt. It is used by the
;Runloop to determine whether any program interrupts are pending
;without having to search TRPTBL.
;
CLIKFL: equ 0FBD9H ; DEFB 00H
;
;    This variable is used internally by the interrupt handler to
;prevent spurious key clicks when returning multiple characters
;from a single key depression such as a function key.
;
OLDKEY: equ 0FBDAH ; DEFS 11
;
;    This buffer is used by the interrupt handler to hold the
;previous state of the keyboard matrix, each byte contains one
;row of keys starting with row 0.
;
NEWKEY: equ 0FBE5H ; DEFS 11
;
;    This buffer is used by the interrupt handler to hold the
;current state of the keyboard matrix. Key transitions are
;detected by comparison with the contents of OLDKEY after which
;OLDKEY is updated with the current state.
;
KEYBUF: equ 0FBF0H ; DEFS 40
;
;    This buffer contains the decoded keyboard characters produced
;by the interrupt handler. Note that the buffer is organized as
;a circular queue driven by GETPNT and PUTPNT and consequently
;has no fixed starting point.
;
LINWRK: equ 0FC18H ; DEFS 40
;
;    This buffer is used by the BIOS to hold a complete line of
;screen characters.
;
PATWRK: equ 0FC40H ; DEFS 8
;
;    This buffer is used by the BIOS to hold an 8x8 pixel pattern.
;
BOTTOM: equ 0FC48H ; DEFW 8000H
;
;    This variable contains the address of the lowest RAM location
;used by the Interpreter. Its value is set at power-up and
;thereafter unaltered.
;
HIMEM:  equ 0FC4AH ; DEFW F380H
;
;    This variable contains the address of the byte following the
;highest RAM location used by the Interpreter. Its value is set
;at power-up and thereafter only altered by the "CLEAR"
;statement.
;
TRPTBL: equ 0FC4CH
;    FC4CH TRPTBL: DEFS 3       ; KEY 1
;    FC4FH         DEFS 3       ; KEY 2
;    FC52H         DEFS 3       ; KEY 3
;    FC55H         DEFS 3       ; KEY 4
;    FC58H         DEFS 3       ; KEY 5
;    FC5BH         DEFS 3       ; KEY 6
;    FC5EH         DEFS 3       ; KEY 7
;    FC61H         DEFS 3       ; KEY 8
;    FC64H         DEFS 3       ; KEY 9
;    FC67H         DEFS 3       ; KEY 10
;    FC6AH         DEFS 3       ; STOP
;    FC6DH         DEFS 3       ; SPRITE
;    FC70H         DEFS 3       ; STRIG 0
;    FC73H         DEFS 3       ; STRIG 1
;    FC76H         DEFS 3       ; STRIG 2
;    FC79H         DEFS 3       ; STRIG 3
;    FC7CH         DEFS 3       ; STRIG 4
;    FC7FH         DEFS 3       ; INTERVAL
;    FC82H         DEFS 3       ; Unused
;    FC85H         DEFS 3       ; Unused
;    FC88H         DEFS 3       ; Unused
;    FC8BH         DEFS 3       ; Unused
;    FC8EH         DEFS 3       ; Unused
;    FC91H         DEFS 3       ; Unused
;    FC94H         DEFS 3       ; Unused
;    FC97H         DEFS 3       ; Unused
;
;    These twenty-six three byte variables hold the current state of
;the interrupt generating devices. The first byte of each entry
;contains the device status (bit 0=On, bit 1=Stop, bit 2=Event
;active) and is updated by the interrupt handler, the Runloop
;interrupt processor and the "DEVICE 0=ON/OFF/STOP" and "RETURN"
;statement handlers. The remaining two bytes of each entry are
;set by the "ON DEVICE GOSUB" statement handler and contain the
;address of the program line to execute upon a program
;interrupt.
;
RTYCNT: equ 0FC9AH ; DEFB 00H
;
;    This variable is unused by the current MSX ROM.
;
INTFLG: equ 0FC9BH ; DEFB 00H
;
;    This variable is normally zero but is set to 03H or 04H if the
;CTRL-STOP or STOP keys are detected by the interrupt handler.
;
PADY:   equ 0FC9CH ; DEFB 00H
;
;    This variable contains the Y coordinate of the last point
;detected by a touchpad.
;
PADX:   equ 0FC9DH ; DEFB 00H
;
;    This variable contains the X coordinate of the last point
;detected by a touchpad.
;
JIFFY:  equ 0FC9EH ; DEFW 0000H
;
;    This variable is continually incremented by the interrupt
;handler. Its value may be set or read by the "TIME" statement
;or function.
;
INTVAL: equ 0FCA0H ; DEFW 0000H
;
;    This variable holds the interval duration set by the "ON
;INTERVAL" statement handler.
;
INTCNT: equ 0FCA2H ; DEFW 0000H
;
;    This variable is continually decremented by the interrupt
;handler. When zero is reached its value is reset from INTVAL
;and, if applicable, a program interrupt generated. Note that
;this variable always counts irrespective of whether an
;"INTERVAL ON" statement is active.
;
LOWLIM: equ 0FCA4H ; DEFB 31H
;
;    This variable is used to hold the minimum allowable start bit
;duration as determined by the TAPION standard routine.
;
WINWID: equ 0FCA5H ; DEFB 22H
;
;    This variable is used to hold the LO/HI cycle discrimination
;duration as determined by the TAPION standard routine.
;
GRPHED: equ 0FCA6H ; DEFB 00H
;
;    This variable is normally zero but is set to 01H by the CNVCHR
;standard routine upon detection of a graphic header code.
;
ESCCNT: equ 0FCA7H ; DEFB 00H
;
;    This variable is used by the CHPUT standard routine ESC
;sequence processor to count escape parameters.
;
INSFLG: equ 0FCA8H ; DEFB 00H
;
;    This variable is normally zero but is set to FFH by the INLIN
;standard routine when insert mode is on.
;
CSRSW:  equ 0FCA9H ; DEFB 00H
;
;    If this variable is zero the cursor is only displayed while the
;CHGET standard routine is waiting for a keyboard character. If
;it is non-zero the cursor is permanently displayed via the
;CHPUT standard routine.
;
CSTYLE: equ 0FCAAH ; DEFB 00H
;
;    This variable determines the cursor style: 00H=Block,
;NZ=Underline.
;
CAPST:  equ 0FCABH ; DEFB 00H
;
;    This variable is used by   the interrupt handler to hold the
;current caps lock status: 00H=Off, NZ=On.
;
KANAST: equ 0FCACH ; DEFB 00H
;
;    This variable is used to hold the keyboard Kana lock status on
;Japanese machines and the DEAD key status on European machines.
;
KANAMD: equ 0FCADH ; DEFB 00H
;
;    This variable holds a keyboard mode on Japanese machines only.
;
FLBMEM: equ 0FCAEH ; DEFB 00H
;
;    This variable is set by the file I/O error generators but is
;otherwise unused.
;
SCRMOD: equ 0FCAFH ; DEFB 00H
;
;    This variable contains the current screen mode: 0=40x24 Text
;Mode, 1=32x24 Text Mode, 2=Graphics Mode, 3=Multicolour Mode.
;
OLDSCR: equ 0FCB0H ; DEFB 00H
;
;    This variable holds the screen mode of the last text mode set.
;
CASPRV: equ 0FCB1H ; DEFB 00H
;
;    This variable is used to hold any character returned to an I/O
;buffer by the cassette putback function.
;
BDRATR: equ 0FCB2H ; DEFB 00H
;
;    This variable contains the boundary colour for the "PAINT"
;statement handler. Its value is set by the PNTINI standard
;routine and used by the SCANR and SCANL standard routines.
;
GXPOS:  equ 0FCB3H ; DEFW 0000H
;
;    This variable is used for temporary storage of a graphics X
;coordinate.
;
GYPOS:  equ 0FCB5H ; DEFW 0000H
;
;    This variable is used for temporary storage of a graphics Y
;coordinate.
;
GRPACX: equ 0FCB7H ; DEFW 0000H
;
;    This variable contains the current graphics X coordinate for
;the GRPPRT standard routine.
;
GRPACY: equ 0FCB9H ; DEFW 0000H
;
;    This variable contains the current graphics Y coordinate for
;the GRPPRT standard routine.
;
DRWFLG: equ 0FCBBH ; DEFB 00H
;
;    Bits 6 and 7 of this variable are set by the "DRAW" statement
;"N" and "B" command handlers to turn the associated mode on.
;
DRWSCL: equ 0FCBCH ; DEFB 00H
;
;    This variable is used by the "DRAW" statement "S" command
;handler to hold the current scale factor.
;
DRWANG: equ 0FCBDH ; DEFB 00H
;
;    This variable is used by the "DRAW" statement "A" command
;handler to hold the current angle.
;
RUNBNF: equ 0FCBEH ; DEFB 00H
;
;    This variable is normally zero but is set by the "BLOAD"
;statement handler when an auto-run "R" parameter is specified.
;
SAVENT: equ 0FCBFH ; DEFW 0000H
;
;    This variable contains the "BSAVE" and "BLOAD" entry address.
;
EXPTBL: equ 0FCC1H
;    FCC1H EXPTBL: DEFB 00H     ; Primary Slot 0
;    FCC2H         DEFB 00H     ; Primary Slot 1
;    FCC3H         DEFB 00H     ; Primary Slot 2
;    FCC4H         DEFB 00H     ; Primary Slot 3
;
;    Each of these four variables is normally zero but is set to 80H
;during the power-up RAM search if the associated Primary Slot
;is found to be expanded.
;
SLTTBL: equ 0FCC5H
;    FCC5H SLTTBL: DEFB 00H     ; Primary Slot 0
;    FCC6H         DEFB 00H     ; Primary Slot 1
;    FCC7H         DEFB 00H     ; Primary Slot 2
;    FCC8H         DEFB 00H     ; Primary Slot 3
;
;    These four variables duplicate the contents of the four
;possible Secondary Slot Registers. The contents of each
;variable should only be regarded as valid if EXPTBL shows the
;associated Primary Slot to be expanded.
;
SLTATR: equ 0FCC9H
;    FCC9H SLTATR: DEFS 4       ; PS0, SS0
;    FCCDH         DEFS 4       ; PS0, SS1
;    FCD1H         DEFS 4       ; PS0, SS2
;    FCD5H         DEFS 4       ; PS0, SS3
;
;    FCD9H         DEFS 4       ; PS1, SS0
;    FCDDH         DEFS 4       ; PS1, SS1
;    FCE1H         DEFS 4       ; PS1, SS2
;    FCE5H         DEFS 4       ; PS1, SS3
;
;    FCE9H         DEFS 4       ; PS2, SS0
;    FCEDH         DEFS 4       ; PS2, SS1
;    FCF1H         DEFS 4       ; PS2, SS2
;    FCF5H         DEFS 4       ; PS2, SS3
;
;    FCF9H         DEFS 4       ; PS3, SS0
;    FCFDH         DEFS 4       ; PS3, SS1
;    FD01H         DEFS 4       ; PS3, SS2
;    FD05H         DEFS 4       ; PS3, SS3
;
;    These sixty-four variables contain the attributes of any
;extension ROMs found during the power-up ROM search. The
;characteristics of each 16 KB ROM are encoded into a single byte
;so four bytes are required for each possible slot. The encoding
;is:
;
;
;        Bit 7 set=BASIC program
;        Bit 6 set=Device handler
;        Bit 5 set=Statement handler
;
;
;    Note that the entries for page 0 (0000H to 3FFFH) and page 3
;(C000H to FFFFH) will always be zero as only page 1 (4000H to
;7FFFH) and page 2 (8000H to BFFFH) are actually examined. The
;MSX convention is that machine code extension ROMs are placed
;in page 1 and BASIC program ROMs in page 2.
;
SLTWRK: equ 0FD09H ; DEFS 128
;
;    This buffer provides two bytes of local workspace for each of
;the sixty-four possible extension ROMs.
;
PROCNM: equ 0FD89H ; DEFS 16
;
;    This buffer is used to hold a device or statement name for
;examination by an extension ROM.
;
DEVICE: equ 0FD99H ; DEFB 00H
;
;    This variable is used to pass a device code, from 0 to 3, to an
;extension ROM.
;
;
;    The section of the Workspace Area from FD9AH to FFC9H
;contains one hundred and twelve hooks, each of which is filled
;with five Z80 RET opcodes at power-up. These are called from
;strategic locations within the BIOS/Interpreter so that the ROM
;can be extended, particularly so that it can be upgraded to
;Disk BASIC. Each hook has sufficient room to hold a far call to
;any slot:
;
;        RST 30H
;        DEFB Slot ID
;        DEFW Address
;        RET
;
;    The hooks are listed on the following pages together with the
;address they are called from and a brief note as to their
;function.
;
HKEYI:  equ 0FD9AH ; DEFS 5       ; 0C4AH Interrupt handler
HTIMI:  equ 0FD9FH ; DEFS 5       ; 0C53H Interrupt handler
HCHPU:  equ 0FDA4H ; DEFS 5       ; 08C0H CHPUT standard routine
HDSPC:  equ 0FDA9H ; DEFS 5       ; 09E6H Display cursor
HERAC:  equ 0FDAEH ; DEFS 5       ; 0A33H Erase cursor
HDSPF:  equ 0FDB3H ; DEFS 5       ; 0B2BH DSPFNK standard routine
HERAF:  equ 0FDB8H ; DEFS 5       ; 0B15H ERAFNK standard routine
HTOTE:  equ 0FDBDH ; DEFS 5       ; 0842H TOTEXT standard routine
HCHGE:  equ 0FDC2H ; DEFS 5       ; 10CEH CHGET standard routine
HINIP:  equ 0FDC7H ; DEFS 5       ; 071EH Copy character set to VDP
HKEYC:  equ 0FDCCH ; DEFS 5       ; 1025H Keyboard decoder
HKYEA:  equ 0FDD1H ; DEFS 5       ; 0F10H Keyboard decoder
HNMI:   equ 0FDD6H ; DEFS 5       ; 1398H NMI standard routine
HPINL:  equ 0FDDBH ; DEFS 5       ; 23BFH PINLIN standard routine
HQINL:  equ 0FDE0H ; DEFS 5       ; 23CCH QINLIN standard routine
HINLI:  equ 0FDE5H ; DEFS 5       ; 23D5H INLIN standard routine
HONGO:  equ 0FDEAH ; DEFS 5       ; 7810H "ON DEVICE GOSUB"
HDSKO:  equ 0FDEFH ; DEFS 5       ; 7C16H "DSKO$"
HSETS:  equ 0FDF4H ; DEFS 5       ; 7C1BH "SET"
HNAME:  equ 0FDF9H ; DEFS 5       ; 7C20H "NAME"
HKILL:  equ 0FDFEH ; DEFS 5       ; 7C25H "KILL"
HIPL:   equ 0FE03H ; DEFS 5       ; 7C2AH "IPL"
HCOPY:  equ 0FE08H ; DEFS 5       ; 7C2FH "COPY"
HCMD:   equ 0FE0DH ; DEFS 5       ; 7C34H "CMD"
HDSKF:  equ 0FE12H ; DEFS 5       ; 7C39H "DSKF"
HDSKI:  equ 0FE17H ; DEFS 5       ; 7C3EH "DSKI$"
HATTR:  equ 0FE1CH ; DEFS 5       ; 7C43H "ATTR$"
HLSET:  equ 0FE21H ; DEFS 5       ; 7C48H "LSET"
HRSET:  equ 0FE26H ; DEFS 5       ; 7C4DH "RSET"
HFIEL:  equ 0FE2BH ; DEFS 5       ; 7C52H "FIELD"
HMKI_:  equ 0FE30H ; DEFS 5       ; 7C57H "MKI$"
HMKS_:  equ 0FE35H ; DEFS 5       ; 7C5CH "MKS$"
HMKD_:  equ 0FE3AH ; DEFS 5       ; 7C61H "MKD$"
HCVI:   equ 0FE3FH ; DEFS 5       ; 7C66H "CVI"
HCVS:   equ 0FE44H ; DEFS 5       ; 7C6BH "CVS"
HCVD:   equ 0FE49H ; DEFS 5       ; 7C70H "CVD"
HGETP:  equ 0FE4EH ; DEFS 5       ; 6A93H Locate FCB
HSETF:  equ 0FE53H ; DEFS 5       ; 6AB3H Locate FCB
HNOFO:  equ 0FE58H ; DEFS 5       ; 6AF6H "OPEN"
HNULO:  equ 0FE5DH ; DEFS 5       ; 6B0FH "OPEN"
HNTFL:  equ 0FE62H ; DEFS 5       ; 6B3BH Close I/O buffer 0
HMERG:  equ 0FE67H ; DEFS 5       ; 6B63H "MERGE/LOAD"
HSAVE:  equ 0FE6CH ; DEFS 5       ; 6BA6H "SAVE"
HBINS:  equ 0FE71H ; DEFS 5       ; 6BCEH "SAVE"
HBINL:  equ 0FE76H ; DEFS 5       ; 6BD4H "MERGE/LOAD"
HFILE:  equ 0FE7BH ; DEFS 5       ; 6C2FH "FILES"
HDGET:  equ 0FE80H ; DEFS 5       ; 6C3BH "GET/PUT"
HFILO:  equ 0FE85H ; DEFS 5       ; 6C51H Sequential output
HINDS:  equ 0FE8AH ; DEFS 5       ; 6C79H Sequential input
HRSLF:  equ 0FE8FH ; DEFS 5       ; 6CD8H "INPUT$"
HSAVD:  equ 0FE94H ; DEFS 5       ; 6D03H "LOC", 6D14H "LOF",
;                                 ; 6D25H "EOF", 6D39H "FPOS"
HLOC:   equ 0FE99H ; DEFS 5       ; 6D0FH "LOC"
HLOF:   equ 0FE9EH ; DEFS 5       ; 6D20H "LOF"
HEOF:   equ 0FEA3H ; DEFS 5       ; 6D33H "EOF"
HFPOS:  equ 0FEA8H ; DEFS 5       ; 6D43H "FPOS"
HBAKU:  equ 0FEADH ; DEFS 5       ; 6E36H "LINE INPUT#"
HPARD:  equ 0FEB2H ; DEFS 5       ; 6F15H Parse device name
HNODE:  equ 0FEB7H ; DEFS 5       ; 6F33H Parse device name
HPOSD:  equ 0FEBCH ; DEFS 5       ; 6F37H Parse device name
HDEVN:  equ 0FEC1H ; DEFS 5       ; This hook is not used.
HGEND:  equ 0FEC6H ; DEFS 5       ; 6F8FH I/O function dispatcher
HRUNC:  equ 0FECBH ; DEFS 5       ; 629AH Run-clear
HCLEA:  equ 0FED0H ; DEFS 5       ; 62A1H Run-clear
HLOPD:  equ 0FED5H ; DEFS 5       ; 62AFH Run-clear
HSTKE:  equ 0FEDAH ; DEFS 5       ; 62F0H Reset stack
HISFL:  equ 0FEDFH ; DEFS 5       ; 145FH ISFLIO standard routine
HOUTD:  equ 0FEE4H ; DEFS 5       ; 1B46H OUTDO standard routine
HCRDO:  equ 0FEE9H ; DEFS 5       ; 7328H CR,LF to OUTDO
HDSKC:  equ 0FEEEH ; DEFS 5       ; 7374H Mainloop line input
HDOGR:  equ 0FEF3H ; DEFS 5       ; 593CH Line draw
HPRGE:  equ 0FEF8H ; DEFS 5       ; 4039H Program end
HERRP:  equ 0FEFDH ; DEFS 5       ; 40DCH Error handler
HERRF:  equ 0FF02H ; DEFS 5       ; 40FDH Error handler
HREAD:  equ 0FF07H ; DEFS 5       ; 4128H Mainloop "OK"
HMAIN:  equ 0FF0CH ; DEFS 5       ; 4134H Mainloop
HDIRD:  equ 0FF11H ; DEFS 5       ; 41A8H Mainloop direct statement
HFINI:  equ 0FF16H ; DEFS 5       ; 4237H Mainloop finished
HFINE:  equ 0FF1BH ; DEFS 5       ; 4247H Mainloop finished
HCRUN:  equ 0FF20H ; DEFS 5       ; 42B9H Tokenize
HCRUS:  equ 0FF25H ; DEFS 5       ; 4353H Tokenize
HISRE:  equ 0FF2AH ; DEFS 5       ; 437CH Tokenize
HNTFN:  equ 0FF2FH ; DEFS 5       ; 43A4H Tokenize
HNOTR:  equ 0FF34H ; DEFS 5       ; 44EBH Tokenize
HSNGF:  equ 0FF39H ; DEFS 5       ; 45D1H "FOR"
HNEWS:  equ 0FF3EH ; DEFS 5       ; 4601H Runloop new statement
HGONE:  equ 0FF43H ; DEFS 5       ; 4646H Runloop execute
HCHRG:  equ 0FF48H ; DEFS 5       ; 4666H CHRGTR standard routine
HRETU:  equ 0FF4DH ; DEFS 5       ; 4821H "RETURN"
HPRTF:  equ 0FF52H ; DEFS 5       ; 4A5EH "PRINT"
HCOMP:  equ 0FF57H ; DEFS 5       ; 4A54H "PRINT"
HFINP:  equ 0FF5CH ; DEFS 5       ; 4AFFH "PRINT"
HTRMN:  equ 0FF61H ; DEFS 5       ; 4B4DH "READ/INPUT" error
HFRME:  equ 0FF66H ; DEFS 5       ; 4C6DH Expression Evaluator
HNTPL:  equ 0FF6BH ; DEFS 5       ; 4CA6H Expression Evaluator
HEVAL:  equ 0FF70H ; DEFS 5       ; 4DD9H Factor Evaluator
HOKNO:  equ 0FF75H ; DEFS 5       ; 4F2CH Factor Evaluator
HFING:  equ 0FF7AH ; DEFS 5       ; 4F3EH Factor Evaluator
HISMI:  equ 0FF7FH ; DEFS 5       ; 51C3H Runloop execute
HWIDT:  equ 0FF84H ; DEFS 5       ; 51CCH "WIDTH"
HLIST:  equ 0FF89H ; DEFS 5       ; 522EH "LIST"
HBUFL:  equ 0FF8EH ; DEFS 5       ; 532DH Detokenize
HFRQI:  equ 0FF93H ; DEFS 5       ; 543FH Convert to integer
HSCNE:  equ 0FF98H ; DEFS 5       ; 5514H Line number to pointer
HFRET:  equ 0FF9DH ; DEFS 5       ; 67EEH Free descriptor
HPTRG:  equ 0FFA2H ; DEFS 5       ; 5EA9H Variable search
HPHYD:  equ 0FFA7H ; DEFS 5       ; 148AH PHYDIO standard routine
HFORM:  equ 0FFACH ; DEFS 5       ; 148EH FORMAT standard routine
HERRO:  equ 0FFB1H ; DEFS 5       ; 406FH Error handler
HLPTO:  equ 0FFB6H ; DEFS 5       ; 085DH LPTOUT standard routine
HLPTS:  equ 0FFBBH ; DEFS 5       ; 0884H LPTSTT standard routine
HSCRE:  equ 0FFC0H ; DEFS 5       ; 79CCH "SCREEN"
HPLAY:  equ 0FFC5H ; DEFS 5       ; 73E5H "PLAY" statement
;
;
;    The Workspace Area from FFCAH to FFFFH is unused. (on MSX 1 )
;
;