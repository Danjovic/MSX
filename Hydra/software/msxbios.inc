;   msxbios.inc
;   extracted from the MSX Red BOOK
;
;NAME        ADDR    JP to Function
CHKRAM : EQU 0000H ; 02D7H Power-up, check RAM
SYNCHR : EQU 0008H ; 2683H Check BASIC program character
RDSLT  : EQU 000CH ; 01B6H Read RAM in any slot
CHRGTR : EQU 0010H ; 2686H Get next BASIC program character
WRSLT  : EQU 0014H ; 01D1H Write to RAM in any slot
OUTDO  : EQU 0018H ; 1B45H Output to current device
CALSLT : EQU 001CH ; 0217H Call routine in any slot
DCOMPR : EQU 0020H ; 146AH Compare register pairs HL and DE
ENASLT : EQU 0024H ; 025EH Enable any slot permanently
GETYPR : EQU 0028H ; 2689H Get BASIC operand type
CALLF  : EQU 0030H ; 0205H Call routine in any slot
KEYINT : EQU 0038H ; 0C3CH Interrupt handler, keyboard scan
INITIO : EQU 003BH ; 049DH Initialize I/O devices
INIFNK : EQU 003EH ; 139DH Initialize function key strings
DISSCR : EQU 0041H ; 0577H Disable screen
ENASCR : EQU 0044H ; 0570H Enable screen
WRTVDP : EQU 0047H ; 057FH Write to any VDP register
RDVRM  : EQU 004AH ; 07D7H Read byte from VRAM
WRTVRM : EQU 004DH ; 07CDH Write byte to VRAM
SETRD  : EQU 0050H ; 07ECH Set up VDP for read
SETWRT : EQU 0053H ; 07DFH Set up VDP for write
FILVRM : EQU 0056H ; 0815H Fill block of VRAM with data byte
LDIRMV : EQU 0059H ; 070FH Copy block to memory from VRAM
LDIRVM : EQU 005CH ; 0744H Copy block to VRAM, from memory
CHGMOD : EQU 005FH ; 084FH Change VDP mode
CHGCLR : EQU 0062H ; 07F7H Change VDP colours
NMI    : EQU 0066H ; 1398H Non Maskable Interrupt handler
CLRSPR : EQU 0069H ; 06A8H Clear all sprites
INITXT : EQU 006CH ; 050EH Initialize VDP to 40x24 Text Mode
INIT32 : EQU 006FH ; 0538H Initialize VDP to 32x24 Text Mode
INIGRP : EQU 0072H ; 05D2H Initialize VDP to Graphics Mode
INIMLT : EQU 0075H ; 061FH Initialize VDP to Multicolour Mode
SETTXT : EQU 0078H ; 0594H Set VDP to 40x24 Text Mode
SETT32 : EQU 007BH ; 05B4H Set VDP to 32x24 Text Mode
SETGRP : EQU 007EH ; 0602H Set VDP to Graphics Mode
SETMLT : EQU 0081H ; 0659H Set VDP to Multicolour Mode
CALPAT : EQU 0084H ; 06E4H Calculate address of sprite pattern
CALATR : EQU 0087H ; 06F9H Calculate address of sprite attribute
GSPSIZ : EQU 008AH ; 0704H Get sprite size
GRPPRT : EQU 008DH ; 1510H Print character on graphic screen
GICINI : EQU 0090H ; 04BDH Initialize PSG (GI Chip)
WRTPSG : EQU 0093H ; 1102H Write to any PSG register
RDPSG  : EQU 0096H ; 110EH Read from any PSG register
STRTMS : EQU 0099H ; 11C4H Start music dequeueing
CHSNS  : EQU 009CH ; 0D6AH Sense keyboard buffer for character
CHGET  : EQU 009FH ; 10CBH Get character from keyboard buffer (wait)
CHPUT  : EQU 00A2H ; 08BCH Screen character output
LPTOUT : EQU 00A5H ; 085DH Line printer character output
LPTSTT : EQU 00A8H ; 0884H Line printer status test
CNVCHR : EQU 00ABH ; 089DH Convert character with graphic header
PINLIN : EQU 00AEH ; 23BFH Get line from console (editor)
INLIN  : EQU 00B1H ; 23D5H Get line from console (editor)
QINLIN : EQU 00B4H ; 23CCH Display "?", get line from console (editor)
BREAKX : EQU 00B7H ; 046FH Check CTRL-STOP key directly
ISCNTC : EQU 00BAH ; 03FBH Check CRTL-STOP key
CKCNTC : EQU 00BDH ; 10F9H Check CTRL-STOP key
BEEP   : EQU 00C0H ; 1113H Go beep
CLS    : EQU 00C3H ; 0848H Clear screen
POSIT  : EQU 00C6H ; 088EH Set cursor position
FNKSB  : EQU 00C9H ; 0B26H Check if function key display on
ERAFNK : EQU 00CCH ; 0B15H Erase function key display
DSPFNK : EQU 00CFH ; 0B2BH Display function keys
TOTEXT : EQU 00D2H ; 083BH Return VDP to text mode
GTSTCK : EQU 00D5H ; 11EEH Get joystick status
GTTRIG : EQU 00D8H ; 1253H Get trigger status
GTPAD  : EQU 00DBH ; 12ACH Get touch pad status
GTPDL  : EQU 00DEH ; 1273H Get paddle status
TAPION : EQU 00E1H ; 1A63H Tape input ON
TAPIN  : EQU 00E4H ; 1ABCH Tape input
TAPIOF : EQU 00E7H ; 19E9H Tape input OFF
TAPOON : EQU 00EAH ; 19F1H Tape output ON
TAPOUT : EQU 00EDH ; 1A19H Tape output
TAPOOF : EQU 00F0H ; 19DDH Tape output OFF
STMOTR : EQU 00F3H ; 1384H Turn motor ON/OFF
LFTQ   : EQU 00F6H ; 14EBH Space left in music queue
PUTQ   : EQU 00F9H ; 1492H Put byte in music queue
RIGHTC : EQU 00FCH ; 16C5H Move current pixel physical address right
LEFTC  : EQU 00FFH ; 16EEH Move current pixel physical address left
UPC    : EQU 0102H ; 175DH Move current pixel physical address up
TUPC   : EQU 0105H ; 173CH Test then UPC if legal
DOWNC  : EQU 0108H ; 172AH Move current pixel physical address down
TDOWNC : EQU 010BH ; 170AH Test then DOWNC if legal
SCALXY : EQU 010EH ; 1599H Scale graphics coordinates
MAPXYC : EQU 0111H ; 15DFH Map graphic coordinates to physical address
FETCHC : EQU 0114H ; 1639H Fetch current pixel physical address
STOREC : EQU 0117H ; 1640H Store current pixel physical address
SETATR : EQU 011AH ; 1676H Set attribute byte
READC  : EQU 011DH ; 1647H Read attribute of current pixel
SETC   : EQU 0120H ; 167EH Set attribute of current pixel
NSETCX : EQU 0123H ; 1809H Set attribute of number of pixels
GTASPC : EQU 0126H ; 18C7H Get aspect ratio
PNTINI : EQU 0129H ; 18CFH Paint initialize
SCANR  : EQU 012CH ; 18E4H Scan pixels to right
SCANL  : EQU 012FH ; 197AH Scan pixels to left
CHGCAP : EQU 0132H ; 0F3DH Change Caps Lock LED
CHGSND : EQU 0135H ; 0F7AH Change Key Click sound output
RSLREG : EQU 0138H ; 144CH Read Primary Slot Register
WSLREG : EQU 013BH ; 144FH Write to Primary Slot Register
RDVDP  : EQU 013EH ; 1449H Read VDP Status Register
SNSMAT : EQU 0141H ; 1452H Read row of keyboard matrix
PHYDIO : EQU 0144H ; 148AH Disk, no action
FORMAT : EQU 0147H ; 148EH Disk, no action
ISFLIO : EQU 014AH ; 145FH Check for file I/O
OUTDLP : EQU 014DH ; 1B63H Formatted output to line printer
GETVCP : EQU 0150H ; 1470H Get music voice pointer
GETVC2 : EQU 0153H ; 1474H Get music voice pointer
KILBUF : EQU 0156H ; 0468H Clear keyboard buffer
CALBAS : EQU 0159H ; 01FFH Call to BASIC from any slot

