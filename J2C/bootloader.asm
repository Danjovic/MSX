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
RSLREG:   EQU 0138H  ;
SNSMAT:   EQU 0141H  ; Le matriz teclado


; HOOKS e Variaveis de sistema
EXPTBL:   EQU 0FCC1H ;
HIPL:     EQU 0FE03H ; Hook comando IPL

;
; Constantes
;

TEMPOMAX: EQU 3FFFH  ; Aproximadamente 1 segundo
ACERTOS:  EQU 1FFFH  ; 0,5 segundos
SUBAD0:   EQU 10100000B ; Sub endereco 0
SUBAD1:   EQU 10100010B ; Sub endereco 0
SUBAD2:   EQU 10100100B ; Sub endereco 0
SUBAD3:   EQU 10100110B ; Sub endereco 0
TIMEOUT:  EQU 2000
T1MS3MHZ: EQU 109
T1MS7MHZ: EQU 220

;
;  Bits do Registro 15 do PSG
;
ASDA:  EQU 0
ASCL:  EQU 1
BSDA:  EQU 2
BSCL:  EQU 3
APWR:  EQU 4
BPWR:  EQU 5
ABSEL: EQU 6
MSDA:  EQU 10H ; (SDA In = TRGA)
;
; Registros do PSG
;
PSGAD: EQU 0A0H
PSGWR: EQU 0A1H
PSGRD: EQU 0A2H
;

ENOCHIP: EQU 01
EOK:     EQU 0
CHPUT:   EQU 0A2H






ORG 08000H
DB 'AB'  ; ID
DW INIT  ; Startup
DW 0     ; CALL statement
DW 0     ; DEVICE expansion
DW 0     ; BASIC program
DB 0,0,0,0,0,0 ; reserved area


INIT:
;
; Programa Hook do comando IPL
;
CALL WHEREAMI
LD A,0C9H   ; RET
LD (HIPL+4),A
LD HL,HLOADRAM
LD (HIPL+2),HL
LD (HIPL+1),A
LD A,0F7H   ; RST 30H
LD (HIPL),A

;
; Varre o teclado
;
LD HL,TEMPOMAX
XOR A
LD B,A
VARRE1:
LD DE,ACERTOS
VARRE2:
CALL SNSMAT   ; Le teclas 0..7
CPL           ; Inverte
AND A         ; Tecla pressionada?
JR Z, VARRE3  ; Se Nao, dec. cont. tempo
CP B          ; Se Sim. Mudou de estado?
JR NZ,VARRE3  ; Mudou, entao desconsidere
;
DEC DE        ; Nao mudou, entao testa se
LD A,D        ; tecla permaneceu pressionada.
OR E          ; Diminui contador de acertos
JR Z,TECLAPRESS ; Se chegar a zero, uma tecla
XOR A         ; pressionada foi detectada
JR VARRE2     ; Se nao, continua testando
;
VARRE3:
LD B,A        ; Novo estado das teclas 0..7
DEC HL        ; Decrementa contador de tempo
LD A,H        ; Se ainda tem tempo, continua
OR L          ; Testando, senao, inicia uma
JR NZ,VARRE1  ; varredura nos dispositivos
JR SCANJ2C    ;


;
; Procura na(s) porta(s) selecionadas durante
; O BOOT, pelo pressionamento das teclas 0..7
; Se nenhum dispositivo respondeu nas portas
; selecionadas, tenta as restantes
;
TECLAPRESS:
LD D,A        ; D armazena estado Teclas
              ; Bit ligado->tecla pressionada
              ; Dispositivo a ser verificado
CALL SCANJ2C
JR NC,FOUND

LD A,D        ; A=D=Teclas Pressionadas
CPL           ; A=Teclas nao pressionadas
LD D,A        ; Verificar os dispositivos restantes
CALL SCANJ2C
JR C,NOTFOUND


;
; Encontrou um dispositivo. Agora carrega
;
;
FOUND:


;
; Nao encontrou dispositivo. termina sem acao
;
NOTFOUND:
RET





SCANJ2C:
LD B,8
LD A,SUBAD0
SCANJ1:
LD C,A        ; C=Sub endereco
RRC D         ; Tecla 0 Pressionada?
JR NC,SCANJ2
LD A,B        ; CY = B.3  (0: porta A, 1: B)
CP 5          ; Se B>4, Cy=0
PUSH BC
CALL J2CINIT  ; Inicializa J2C
CALL J2CLOGON ; Dispositivo respondeu?
POP BC
RET C         ; Se sim, retorna
              ; B.3 contem a porta
              ; C contem o sub-endereco
;
CALL PSGRESTORE
SCANJ2:
LD A,C
ADD A,2       ; Proximo Sub Endereco
RES 3,A       ;
DJNZ SCANJ1
SCF
RET


;
; Retorna a config do slot de onde
; o programa esta sendo executado
; Fonte: MSX TECHNICAL DATA BOOK
; (Traduzido do 8080 para o Z80)
;
WHEREAMI:
CALL RSLREG
RRCA
RRCA
;
; Remover os 2 RR CAs abaixo caso o
; programa de bootloader va operar
; na pagina 1 (4000H~7FFFH)
RRCA
RRCA
AND 00000011B
LD C,A
LD B,0
LD HL,EXPTBL
ADD HL,BC
OR (HL)
RET P
LD C,A
INC HL
INC HL
INC HL
INC HL
LD A,(HL)
; Remover os 2 RRCAs abaixo caso o
; programa de bootloader va operar
; na pagina 1 (4000H~7FFFH)
RRCA
RRCA
AND 00001100B
OR C
RET
;
; Carrega atraves do comando IPL
;
HLOADRAM:

PSGRESTORE:

; #############################
;                                                                      
J2CINIT:                                                               
DI                                                                     
LD A,15                                                                
OUT (PSGAD),A                                                          
IN A,(PSGRD)                                                           
LD (PSGSAV),A                                                          
JR C,BINIT                                                             
;                                                                      
AINIT:                                                                 
RES ABSEL,A ; JOY A                                                    
SET APWR,A  ; Energiza HUB                                             
OUT (PSGWR),A                                                          
CALL WAIT1MS ; Aguarda 1ms                                             
SET ASDA,A ; SDA=1                                                     
OUT (PSGWR),A                                                          
RES ASCL,A  ; SCL=0                                                    
OUT (PSGWR),A                                                          
LD B,A                                                                 
;                                                                      
CALL J2CSTOP                                                           
CALL J2CSTOP                                                           
CALL J2CSTOP                                                           
RET                                                                    
;                                                                      
BINIT:                                                                 
SET ABSEL,A ; JOY B                                                    
SET BPWR,A  ; Energiza HUB                                             
OUT (PSGWR),A                                                          
CALL WAIT1MS ; Aguarda 1ms                                             
SET BSDA,A ; SDA=1                                                     
OUT (PSGWR),A                                                          
RES BSCL,A  ; SCL=0                                                    
OUT (PSGWR),A                                                          
LD B,A                                                                 
;                                                                      
CALL J2CSTOP                                                           
CALL J2CSTOP                                                           
CALL J2CSTOP                                                           
RET                                                                    
;                                                                      
J2CSTOP:                                                               
LD A,B                                                                 
BIT ABSEL,A ; Qual porta?                                              
JR NZ,BSTOP                                                            
;                                                                      
ASTOP:                                                                 
RES ASDA,A ; SDA=0                                                     
OUT (PSGWR),A                                                          
SET ASCL,A ; SCL=1
OUT (PSGWR),A
SET ASDA,A ; SDA=1
OUT (PSGWR),A
LD B,A ; Atualiza B
RET
;
BSTOP:
RES BSDA,A ; SDA=0
OUT (PSGWR),A
SET BSCL,A ; SCL=1
OUT (PSGWR),A
SET BSDA,A ; SDA=1
OUT (PSGWR),A
LD B,A ; Atualiza B
RET
;
J2CSTART:                                                              
LD A,B                                                                 
BIT ABSEL,A                                                            
JR NZ,BSTART                                                           
;                                                                      
ASTART:                                                                
SET ASCL,A ; SCL=1                                                     
OUT (PSGWR),A                                                          
SET ASDA,A ; SDA=1                                                     
OUT (PSGWR),A                                                          
RES ASDA,A ; SDA=0                                                     
OUT (PSGWR),A                                                          
RES ASCL,A ; SCL=0                                                     
OUT (PSGWR),A                                                          
SET ASDA,A ; SDA=1                                                     
OUT (PSGWR),A                                                          
LD B,A                                                                 
RET                                                                    
;                                                                      
BSTART:                                                                
SET BSCL,A ; SCL=1
OUT (PSGWR),A                                                          
SET BSDA,A ; SDA=1                                                     
OUT (PSGWR),A                                                          
RES BSDA,A ; SDA=0                                                     
OUT (PSGWR),A                                                          
RES BSCL,A ; SCL=0                                                     
OUT (PSGWR),A                                                          
SET BSDA,A ; SDA=1                                                     
OUT (PSGWR),A                                                          
LD B,A                                                                 
RET                                                                    
;                                                                      
J2CPB:                                                                 
LD A,B                                                                 
BIT ABSEL,A                                                            
JR NZ,BPBYTE                                                           
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
OUT (PSGWR),A                                                          
SET ASCL,A ; SCL=1                                                     
OUT (PSGWR),A                                                          
RES ASCL,A ; SCL=0                                                     
OUT (PSGWR),A                                                          
DJNZ APBY1                                                             
;                                                                      
SET ASDA,A ; SDA=1                                                     
OUT (PSGWR),A                                                          
LD B,A                                                                 
RET                                                                    
;                                                                      
BPBYTE:                                                                
LD B,8                                                                 
;                                                                      
BPBY1:                                                                 
RLC C                                                                  
RES BSDA,A                                                             
JR NC,BPBY2 ; SDA=CY                                                   
SET BSDA,A                                                             
BPBY2:                                                                 
OUT (PSGWR),A                                                          
SET BSCL,A ; SCL=1                                                     
OUT (PSGWR),A                                                          
RES BSCL,A ; SCL=0                                                     
OUT (PSGWR),A                                                          
DJNZ BPBY1                                                             
;                                                                      
SET BSDA,A ; SDA=1                                                     
OUT (PSGWR),A                                                          
LD B,A                                                                 
RET                                                                    
;                                                                      
J2CGBYTE:                                                              
LD A,B                                                                 
BIT ABSEL,A
JR NZ,BGBYTE                                                           
;                                                                      
AGBYTE:                                                                
SET ASDA,A ; SDA=1                                                     
OUT (PSGWR),A                                                          
LD BC,0800H ; B=8, C=0                                                 
;
AGBY1:
SET ASCL,A ; SCL=1
OUT (PSGWR),A
LD E,A     ; Salva A
LD A,14
OUT (PSGAD),A ; Selec REG 14                                           
IN A,(PSGRD)                                                           
AND MSDA   ; Mascara bit TRIGGER                                       
NEG ; CY=(A==0)                                                        
RL C                                                                   
;                                                                      
LD A,15                                                                
OUT (PSGAD),A                                                          
LD A,E ; Recupera est reg 15                                           
RES ASCL,A ; SCL=0                                                     
OUT (PSGWR),A                                                          
DJNZ AGBY1                                                             
;                                                                      
LD B,A                                                                 
RET                                                                    
;                                                                      
BGBYTE:                                                                
SET BSDA,A ; SDA=1                                                     
OUT (PSGWR),A                                                          
LD BC,0800H ; B=8, C=0                                                 
;                                                                      
BGBY1:                                                                 
SET BSCL,A ; SCL=1                                                     
OUT (PSGWR),A                                                          
LD E,A     ; Salva A                                                   
LD A,14                                                                
OUT (PSGAD),A ; Selec REG 14                                           
IN A,(PSGRD)                                                           
AND MSDA   ; Mascara bit TRIGGER                                       
NEG ; CY=(A==0)                                                        
RL C                                                                   
;                                                                      
LD A,15                                                                
OUT (PSGAD),A                                                          
LD A,E ; Recupera est reg 15                                           
RES BSCL,A ; SCL=0                                                     
OUT (PSGWR),A                                                          
DJNZ BGBY1                                                             
;                                                                      
LD B,A                                                                 
RET                                                                    
;                                                                      
J2CPAK: ; PUT ACK                                                      
LD A,B                                                                 
BIT ABSEL,A                                                            
JR NZ,BPAK                                                             
;                                                                      
APAK:                                                                  
RES ASDA,A                                                             
OUT (PSGWR),A                                                          
JR NC,APAK1 ; SDA=CY                                                   
SET ASDA,A                                                             
;                                                                      
APAK1:                                                                 
OUT (PSGWR),A                                                          
SET ASCL,A ; SCL=1                                                     
OUT (PSGWR),A                                                          
RES ASCL,A ; SCL=0                                                     
OUT (PSGWR),A                                                          
SET ASDA,A ; SDA=1                                                     
OUT (PSGWR),A                                                          
LD B,A                                                                 
RET                                                                    
;                                                                      
BPAK:                                                                  
RES BSDA,A                                                             
OUT (PSGWR),A                                                          
JR NC,BPAK1 ; SDA=CY                                                   
SET BSDA,A                                                             
;                                                                      
BPAK1:                                                                 
OUT (PSGWR),A                                                          
SET BSCL,A ; SCL=1                                                     
OUT (PSGWR),A                                                          
RES BSCL,A ; SCL=0                                                     
OUT (PSGWR),A                                                          
SET BSDA,A ; SDA=1                                                     
OUT (PSGWR),A                                                          
LD B,A                                                                 
RET                                                                    
;                                                                      
J2CGAK: ; GET ACK                                                      
LD A,B                                                                 
BIT ABSEL,A                                                            
JR NZ,BGAK                                                             
;                                                                      
AGAK:                                                                  
SET ASDA,A ; SDA=1                                                     
OUT (PSGWR),A                                                          
SET ASCL,A ; SCL=1                                                     
OUT (PSGWR),A                                                          
PUSH HL                                                                
LD HL,TIMEOUT                                                          
LD B,A  ; Salva est reg 15                                             
;                                                                      
LD A,14                                                                
OUT (PSGAD),A; Sel REG 14                                              
AGAK1:                                                                 
IN A,(PSGRD)                                                           
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
OUT (PSGAD),A ; Sel Reg 15                                             
LD A,B                                                                 
RES ASCL,A                                                             
OUT (PSGWR),A                                                          
LD B,A                                                                 
POP HL                                                                 
RET                                                                    
;                                                                      
BGAK:                                                                  
SET BSDA,A ; SDA=1                                                     
OUT (PSGWR),A                                                          
SET BSCL,A ; SCL=1                                                     
OUT (PSGWR),A                                                          
PUSH HL                                                                
LD HL,TIMEOUT                                                          
LD B,A  ; Salva est reg 15                                             
;                                                                      
LD A,14                                                                
OUT (PSGAD),A; Sel REG 14                                              
BGAK1:                                                                 
IN A,(PSGRD)                                                           
AND MSDA ; checa e tbem clear CY                                       
JR Z,BGAK2 ; Sai ao receber ACK                                        
;                                                                      
DEC HL                                                                 
LD A,H                                                                 
OR L                                                                   
JR NZ,BGAK1                                                            
;                                                                      
SCF ; Indica TIMEOUT                                                   
;                                                                      
BGAK2:                                                                 
LD A,15                                                                
OUT (PSGAD),A ; Sel Reg 15                                             
LD A,B                                                                 
RES BSCL,A                                                             
OUT (PSGWR),A                                                          
LD B,A                                                                 
POP HL                                                                 
RET                                                                    
;                                                                      
;                                                                      
J2CLOGON:                                                              
CALL J2CSTART                                                          
CALL J2CPB                                                             
CALL J2CGAK                                                            
RET                                                                    
;                                                                      
J2CP16ADR:                                                             
CALL J2CLOGON                                                          
RET C                                                                  
PADR2:                                                                 
LD C,H                                                                 
CALL J2CPB                                                             
CALL J2CGAK                                                            
RET C                                                                  
LD C,L                                                                 
CALL J2CPB                                                             
CALL J2CGAK                                                            
RET                                                                    
;                                                                      
J2CP8ADR:                                                              
CALL J2CLOGON                                                          
RET C                                                                  
P8ADR2:                                                                
LD C,L                                                                 
CALL J2CPB                                                             
CALL J2CGAK                                                            
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
ZEND:                                                                  
;                                                                      
ORG 0B000H                                                             
PSGSAV: DB 1                                                           
VERBOSE: DB 1                                                          
RTCBUF:  DS 7                                                          
;                                                                      

