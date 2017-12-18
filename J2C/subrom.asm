;CPU Z80
;
; Carregador de BOOT via J2C
;
; danjovic@hotmail.com
; http://hotbit.blogspot.com
;
; Licenca de uso: GNU GPL
;
; Versao 0.1 26/04/2007
;
; Rotinas da BIOS
RSLREG   EQU 0138H
CHPUT    EQU 0A2H


; HOOKS e Variaveis de sistema
EXPTBL   EQU 0FCC1H
PSGSAV   EQU 0FC97H  ; Final HI-MEM. Não usado no MSX
SAVEPPIA EQU 0FC98H  ; Final HI-MEM. Não usado no MSX
HIPL     EQU 0FE03H  ; Hook comando IPL
;
;
; Constantes
;
SUBAD0   EQU 10100000B ; Sub endereco 0
PG3ENTRY EQU 0C000H
TIMEOUT  EQU 2000
T1MS3MHZ EQU 109
T1MS7MHZ EQU 220
ENOCHIP  EQU 01
EOK      EQU 0

;
;  Bits do Registro 15 do PSG
;
ASDA  EQU 0
ASCL  EQU 1
BSDA  EQU 2
BSCL  EQU 3
APWR  EQU 4
BPWR  EQU 5
ABSEL EQU 6
MSDA  EQU 10H ; [SDA In = TRGA]
;
; Registros do PSG
;
PSGAD EQU 0A0H
PSGWR EQU 0A1H
PSGRD EQU 0A2H
;
; Registros da PPI
;
PPIA EQU 0A8H




;
ORG 08000H
DB 'A','B'  ; ID
DW INIT  ; Sta7rtup
DW 0     ; CALL statement
DW 0     ; DEVICE expansion
DW 0     ; BASIC program
DB 0,0,0,0,0,0 ; reserved area

MSGBOOT: DB 13,10," J2C Bootloader by Danjovic",13,10,10,9,0
MSGLOAD: DB "Loading...",0
MSGFAIL: DB "Fail",0
MSGOK:   DB "Ok",0

;
;  Inicio do programa
;
INIT:

;
; Mensagem de creditos
;
LD HL, MSGBOOT
CALL IMPRIME

IPLINIT:
LD HL,MSGLOAD
CALL IMPRIME

;
; Copia as rotinas para a página 3
;
LD DE,PG3ENTRY     ; Inicio da pagina 3
LD HL,ROTPAG3  ; Início das rotinas na pagina 3
LD BC,FIMROTPG3-ROTPAG3 ; Tamanho do bloco
LDIR

CALL PG3ENTRY ; Chama rotina na pagina 3
PUSH AF
PUSH HL

; programa hook IPL

LD HL,IPLINIT
LD [HIPL+2],HL
LD A,[SAVEPPIA]
LD [HIPL+1],A
LD A,0F7H   ; RST 30H
LD [HIPL],A

;
;
POP HL
CALL IMPRIME  ; Imprime mensagem de Status
POP AF
RET Z
;
; Exibe a mensagem de Status por alguns segundos
; Caso tenha havido falha
;
LD B,4
INI1:
LD HL,0
INI2:
DEC HL
LD A,H
OR L
JR NZ,INI2
DJNZ INI1
RET


;
; Rotina de Impressão
;
IMPRIME:
LD A,[HL]
OR A
RET Z       ; JP Z,09FH
CALL CHPUT
INC HL
JR IMPRIME








; /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
;
; Rotinas que sao relocadas para a pagina 3
;
;ORG PG3ENTRY

OFFSET EQU PG3ENTRY-ROTPAG3

ROTPAG3:

;DI ; @@ remover
;JR TRANSFERE; @@ remover

CALL J2CINIT+OFFSET
LD A,SUBAD0
AND 0FEH ; Bit R/!W=0
LD C,A
LD HL,0000H
CALL J2CP16ADR+OFFSET
JR C,ERRLOGON
;
LD A,SUBAD0
OR 01    ; Bit R/!W=1
LD C,A
CALL J2CLOGON+OFFSET
JR NC,TRANSFERE

ERRLOGON:
XOR A
INC A ; Clear Z Flag
JR ERRI2C



;
;  Transfere da I2C para a RAM
;


; Primeiro a Página 1
;
TRANSFERE:
IN A,[PPIA]
LD [SAVEPPIA],A
LD HL,04000H
LD C,4       ; C= 2^[2*#num pagina]
CALL FINDRAM+OFFSET  ; Encontra A RAM na página 1
JR NZ,FINAER  ; NZ = Nao encontrou

LD IY,04000H  ; Inicio pagina 1
LD HL,03FFFH  ; 16Kbytes-1
;LD C,055H ; @@REMOVER
CALL RECEBE+OFFSET   ; Recebe bloco via I2C

LD HL,08000H
LD C,16      ; C= 2^[2*#num pagina]
CALL FINDRAM+OFFSET  ; Encontra A RAM na página 2
JR NZ,FINAER  ; NZ = Nao encontrou

LD IY,08000H  ; Inicio pagina 2
LD HL,03FFFH  ; 16Kbytes-1
;LD C,0DDH ; @@REMOVER
CALL RECEBE+OFFSET   ; Recebe bloco via I2C



FINAER:
LD A,[SAVEPPIA]  ; Restaura configuracao PPI
OUT [PPIA],A
ERRI2C:
CALL J2CSTOP+OFFSET     ; Restaura configuracao PSG
LD A,[PSGSAV]
OUT [PSGWR],A
LD HL,MSGOK
RET Z
LD HL,MSGFAIL
RET



;
; Recebe bloco
; IY Endereço início
; HL Tamanho bloco-1
; Saida: Z=1
RECEBE:

CALL J2CGBYTE+OFFSET
LD [IY],C
INC IY
AND A ;CY=0 Gera ACK
CALL J2CPAK+OFFSET
DEC HL
LD A,H
OR L
JR NZ,RECEBE
;

;RET ; @@ remover

CALL J2CGBYTE+OFFSET ; Ultimo byte
LD [IY],C     ; nao gera ACK
SCF
JP J2CPAK+OFFSET ; Nao gera Stop ainda

;
; Inicia Hardware I2C
;
J2CINIT:
DI
LD A,15
OUT [PSGAD],A
IN A,[PSGRD]
LD [PSGSAV],A
;JR C,BINIT
;
AINIT:
RES ABSEL,A ; JOY A
SET APWR,A  ; Energiza HUB
OUT [PSGWR],A
CALL WAIT1MS+OFFSET ; Aguarda 1ms
SET ASDA,A ; SDA=1
OUT [PSGWR],A
RES ASCL,A  ; SCL=0
OUT [PSGWR],A
LD B,A
;
CALL J2CSTOP+OFFSET
CALL J2CSTOP+OFFSET
CALL J2CSTOP+OFFSET
RET
;

;
J2CSTOP:
LD A,B
;BIT ABSEL,A ; Qual porta?
;JR NZ,BSTOP
;
ASTOP:
RES ASDA,A ; SDA=0
OUT [PSGWR],A
SET ASCL,A ; SCL=1
OUT [PSGWR],A
SET ASDA,A ; SDA=1
OUT [PSGWR],A
LD B,A ; Atualiza B
RET
;

;
J2CSTART:
LD A,B
;BIT ABSEL,A
;JR NZ,BSTART
;
;ASTART:
SET ASCL,A ; SCL=1
OUT [PSGWR],A
SET ASDA,A ; SDA=1
OUT [PSGWR],A
RES ASDA,A ; SDA=0
OUT [PSGWR],A
RES ASCL,A ; SCL=0
OUT [PSGWR],A
SET ASDA,A ; SDA=1
OUT [PSGWR],A
LD B,A
RET
;

;
J2CPB:
LD A,B
;BIT ABSEL,A
;JR NZ,BPBYTE
;
APBYTE:
LD B,8
;
APBY1:
RLC C
RES ASDA,A
JR NC,APBY2 ; SDA=CY
SET ASDA,A
APBY2:
OUT [PSGWR],A
SET ASCL,A ; SCL=1
OUT [PSGWR],A
RES ASCL,A ; SCL=0
OUT [PSGWR],A
DJNZ APBY1
;
SET ASDA,A ; SDA=1
OUT [PSGWR],A
LD B,A
RET
;

;
J2CGBYTE:
LD A,B
;BIT ABSEL,A
;JR NZ,BGBYTE
;
AGBYTE:
SET ASDA,A ; SDA=1
OUT [PSGWR],A
LD BC,0800H ; B=8, C=0
;
AGBY1:
SET ASCL,A ; SCL=1
OUT [PSGWR],A
LD E,A     ; Salva A
LD A,14
OUT [PSGAD],A ; Selec REG 14
IN A,[PSGRD]
AND MSDA   ; Mascara bit TRIGGER
NEG ; CY=[A==0]
RL C
;
LD A,15
OUT [PSGAD],A
LD A,E ; Recupera est reg 15
RES ASCL,A ; SCL=0
OUT [PSGWR],A
DJNZ AGBY1
;
LD B,A
RET
;

;
J2CPAK: ; PUT ACK
LD A,B
;BIT ABSEL,A
;JR NZ,BPAK
;
APAK:
RES ASDA,A
OUT [PSGWR],A
JR NC,APAK1 ; SDA=CY
SET ASDA,A
;
APAK1:
OUT [PSGWR],A
SET ASCL,A ; SCL=1
OUT [PSGWR],A
RES ASCL,A ; SCL=0
OUT [PSGWR],A
SET ASDA,A ; SDA=1
OUT [PSGWR],A
LD B,A
RET

;
J2CGAK: ; GET ACK
LD A,B
;BIT ABSEL,A
;JR NZ,BGAK
;
AGAK:
SET ASDA,A ; SDA=1
OUT [PSGWR],A
SET ASCL,A ; SCL=1
OUT [PSGWR],A
PUSH HL
LD HL,TIMEOUT
LD B,A  ; Salva est reg 15
;
LD A,14
OUT [PSGAD],A; Sel REG 14
AGAK1:
IN A,[PSGRD]
AND MSDA ; checa e tbem clear CY
JR Z,AGAK2 ; Sai ao receber ACK
;
DEC HL
LD A,H
OR L
JR NZ,AGAK1
;
SCF ; Indica TIMEOUT
;
AGAK2:
LD A,15
OUT [PSGAD],A ; Sel Reg 15
LD A,B
RES ASCL,A
OUT [PSGWR],A
LD B,A
POP HL
RET


;
;
J2CLOGON:
CALL J2CSTART+OFFSET
CALL J2CPB+OFFSET
CALL J2CGAK+OFFSET
RET
;
J2CP16ADR:
CALL J2CLOGON+OFFSET
RET C
PADR2:
LD C,H
CALL J2CPB+OFFSET
CALL J2CGAK+OFFSET
RET C
LD C,L
CALL J2CPB+OFFSET
CALL J2CGAK+OFFSET
RET
;

WAIT1MS:
PUSH HL
PUSH AF
LD HL,T1MS3MHZ
WAIT1: DEC HL
LD A,H
OR L
JR NZ,WAIT1
POP AF
POP HL
RET
;
; Trecho Adaptado de:
; SLOTS e EXPANSOES
; AUTOR: ANDRE FREITAS
; CPU MSX 001
;

;
; Procura RAM nos SLOTS 1 a 3
;
FINDRAM:
LD B,3
LD A,C
ADD A,A
OR C
CPL
LD D,A    ; Mascara
IN A,(PPIA)
AND D
FRAM1:
ADD A,C           ; Inicia no slot 1
LD [SAVEPPIA+1],A
OUT [PPIA],A
LD E,[HL]
LD A,E
CPL
LD [HL],A
LD A,E
ADD A,[HL]
LD [HL],E ; Restaura
CP 0FFH ; INC A
RET Z
IN A,[PPIA]
DJNZ FRAM1
INC B ; Clear Z flag
RET


FIMROTPG3:






