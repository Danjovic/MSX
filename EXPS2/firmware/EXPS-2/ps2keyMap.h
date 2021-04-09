//    _____  _____  ___   _____ 
//   | __\ \/ / _ \/ __| / /_  )
//   | _| >  <|  _/\__ \/ / / / 
//   |___/_/\_\_|  |___/_/ /___|
//                              
//   Teclado PS/2 externo para Expert XP800

// Mapeamento dos Scancodes PS/2 para a matriz do teclado do MSX
// PS/2 Scan codes to MSX keyboard matrix mapping

#define _PS2_RIGHT_ALT   0x11
#define _PS2_RIGHT_CTRL  0x14
#define _PS2_LEFT_GUI    0x1F
#define _PS2_RIGHT_GUI   0x27
#define _PS2_KPSLASH     0x4A
#define _PS2_KPENTER     0x5A
#define _PS2_END         0x69
#define _PS2_LEFT_ARROW  0x6B
#define _PS2_HOME        0x6C
#define _PS2_INSERT      0x70
#define _PS2_DELETE      0x71
#define _PS2_DOWN_ARROW  0x72
#define _PS2_RIGHT_ARROW 0x74
#define _PS2_UP_ARROW    0x75
#define _PS2_PGDN        0x7A
#define _PS2_PGUP        0x7D


// Keys ordered by PS/2 Scancode
const uint8_t PS2Keymap_Normal[] PROGMEM = { 
_NONE       ,     // 0x00   
_F9         ,     // 0x01  F9
_NONE       ,     // 0x02  
_F5         ,     // 0x03  F5
_F3         ,     // 0x04  F3
_F1         ,     // 0x05  F1
_F2         ,     // 0x06  F2
_STOP       ,     // 0x07  F12           
_NONE       ,     // 0x08                
_F10        ,     // 0x09  F10           
_F8         ,     // 0x0A  F8            
_F6         ,     // 0x0B  F6            
_F4         ,     // 0x0C  F4            
_TAB        ,     // 0x0D  TAB           
_APOSTROPHE ,     // 0x0E  APOSTROPHE    '
_NONE       ,     // 0x0F                
_NONE       ,     // 0x10                
_GRAPH      ,     // 0x11  L ALT         
_SHIFT      ,     // 0x12  L SHFT        
_NONE       ,     // 0x13                
_CONTROL    ,     // 0x14  L CTRL            
_Q          ,     // 0x15  Q             
_1          ,     // 0x16  1             
_NONE       ,     // 0x17                
_NONE       ,     // 0x18                
_NONE       ,     // 0x19                
_Z          ,     // 0x1A  Z             
_S          ,     // 0x1B  S             
_A          ,     // 0x1C  A             
_W          ,     // 0x1D  W             
_2          ,     // 0x1E  2             
_NONE       ,     // 0x1F                
_NONE       ,     // 0x20                
_C          ,     // 0x21  C             
_X          ,     // 0x22  X             
_D          ,     // 0x23  D             
_E          ,     // 0x24  E             
_4          ,     // 0x25  4             
_3          ,     // 0x26  3             
_NONE       ,     // 0x27                
_NONE       ,     // 0x28                
_SPACE      ,     // 0x29  SPACE         
_V          ,     // 0x2A  V             
_F          ,     // 0x2B  F             
_T          ,     // 0x2C  T             
_R          ,     // 0x2D  R             
_5          ,     // 0x2E  5             
_NONE       ,     // 0x2F                
_NONE       ,     // 0x30                
_N          ,     // 0x31  N             
_B          ,     // 0x32  B             
_H          ,     // 0x33  H             
_G          ,     // 0x34  G             
_Y          ,     // 0x35  Y             
_6          ,     // 0x36  6             
_NONE       ,     // 0x37                
_NONE       ,     // 0x38                
_NONE       ,     // 0x39                
_M          ,     // 0x3A  M             
_J          ,     // 0x3B  J             
_U          ,     // 0x3C  U             
_7          ,     // 0x3D  7             
_8          ,     // 0x3E  8             
_NONE       ,     // 0x3F                
_NONE       ,     // 0x40                
_COMMA      ,     // 0x41  COMMA         ,
_K          ,     // 0x42  K             
_I          ,     // 0x43  I             
_O          ,     // 0x44  O             
_0          ,     // 0x45  0             
_9          ,     // 0x46  9             
_NONE       ,     // 0x47                
_NONE       ,     // 0x48                
_DOT        ,     // 0x49  DOT           .
_SEMICOLON  ,     // 0x4A  SEMICOLON     ;
_L          ,     // 0x4B  L             
_CCEDIL     ,     // 0x4C  CCCEDIL       Ç
_P          ,     // 0x4D  P             
_MINUS      ,     // 0x4E  MINUS         -
_NONE       ,     // 0x4F  
_NONE       ,     // 0x50  
_SLASH      ,     // 0x51  SLASH         /
_TILDE      ,     // 0x52  TILDE         ~
_NONE       ,     // 0x53  
_ACUTE      ,     // 0x54  ACUTE         `
_EQUAL      ,     // 0x55  EQUAL         =
_NONE       ,     // 0x56  
_NONE       ,     // 0x57  
_CAPS       ,     // 0x58  CAPS
_SHIFT      ,     // 0x59  R SHFT
_ENTER      ,     // 0x5A  ENTER
_OPENBRACKET,     // 0x5B  OPENBRACKET   [
_NONE       ,     // 0x5C  
_CLOSEBRACKET,    // 0x5D  CLOSEBRACKET  ]
_NONE       ,     // 0x5E  
_NONE       ,     // 0x5F  
_NONE       ,     // 0x60  
_NONE       ,     // 0x61  BACKSLASH     
_NONE       ,     // 0x62  
_F7         ,     // 0x63  F7 (relocated from 0x83 to keep table under 128 chars
_NONE       ,     // 0x64  
_NONE       ,     // 0x65        
_BACKSPACE  ,     // 0x66  BKSP
_NONE       ,     // 0x67  
_NONE       ,     // 0x68  
_1          ,     // 0x69  KP1
_NONE       ,     // 0x6A  
_4          ,     // 0x6B  KP4
_7          ,     // 0x6C  KP7
_DOT        ,     // 0x6D  KPDOT         .
_NONE       ,     // 0x6E  
_NONE       ,     // 0x6F  
_0          ,     // 0x70  KP0
_COMMA      ,     // 0x71  KPCOMMA       ,
_2          ,     // 0x72  KP2
_5          ,     // 0x73  KP5
_6          ,     // 0x74  KP6
_8          ,     // 0x75  KP8
_ESC        ,     // 0x76  ESC
_NONE       ,    // 0x77  NUM
_SELECT     ,     // 0x78  F11
_PLUS       ,     // 0x79  KPPLUS        +
_3          ,     // 0x7A  KP3
_MINUS      ,     // 0x7B  KPMINUS       -
_ASTERISK   ,     // 0x7C  KPTIMES       *
_9          ,     // 0x7D  KP9
_NONE       ,     // 0x7E  SCROLL
_NONE       ,     // 0x7F  
 };
/*
_NONE       ,     // 0x80  
_NONE       ,     // 0x81  
_NONE       ,     // 0x82  
_F7             // 0x83  F7
 };
*/

const uint8_t PS2Keymap_Shifted[] PROGMEM = { 
_NONE       ,      // 0x00   
_F9         ,      // 0x01  
_NONE       ,      // 0x02  
_F5         ,      // 0x03  
_F3         ,      // 0x04  
_F1         ,      // 0x05  
_F2         ,      // 0x06  
_SELECT     ,      // 0x07  
_NONE       ,      // 0x08  
_F10        ,      // 0x09  
_F8         ,      // 0x0A  
_F6         ,      // 0x0B  
_F4         ,      // 0x0C  
_TAB        ,      // 0x0D  
_QUOTE      ,      // 0x0E   QUOTE      "
_NONE       ,      // 0x0F              
_NONE       ,      // 0x10              
_GRAPH      ,      // 0x11              
_SHIFT      ,      // 0x12              
_NONE       ,      // 0x13              
_CONTROL    ,      // 0x14              
_Q          ,      // 0x15              
_EXCLAMATION,      // 0x16  EXCLAMATION !
_NONE       ,      // 0x17              
_NONE       ,      // 0x18              
_NONE       ,      // 0x19              
_Z          ,      // 0x1A              
_S          ,      // 0x1B              
_A          ,      // 0x1C              
_W          ,      // 0x1D              
_AT         ,      // 0x1E  AT          @
_NONE       ,      // 0x1F              
_NONE       ,      // 0x20              
_C          ,      // 0x21              
_X          ,      // 0x22              
_D          ,      // 0x23              
_E          ,      // 0x24              
_DOLLAR     ,      // 0x25  DOLLAR      $
_NUMBER     ,      // 0x26  NUMBER      #
_NONE       ,      // 0x27              
_NONE       ,      // 0x28              
_SPACE      ,      // 0x29              
_V          ,      // 0x2A              
_F          ,      // 0x2B              
_T          ,      // 0x2C              
_R          ,      // 0x2D              
_PERCENT    ,      // 0x2E  PERCENT     %
_NONE       ,      // 0x2F              
_NONE       ,      // 0x30              
_N          ,      // 0x31              
_B          ,      // 0x32              
_H          ,      // 0x33              
_G          ,      // 0x34              
_Y          ,      // 0x35              
_NONE       ,      // 0x36  UBER        ¨
_NONE       ,      // 0x37              
_NONE       ,      // 0x38              
_NONE       ,      // 0x39              
_M          ,      // 0x3A              
_J          ,      // 0x3B              
_U          ,      // 0x3C              
_AMPERSAND  ,      // 0x3D  AMPERSAND   &
_ASTERISK   ,      // 0x3E  ASTERISK    *
_NONE       ,      // 0x3F              
_NONE       ,      // 0x40              
_LESSTHAN   ,      // 0x41  LESSTHAN    <
_K          ,      // 0x42              
_I          ,      // 0x43              
_O          ,      // 0x44              
_CLOSEBRACE ,      // 0x45  CLOSEBRACE  )
_OPENBRACE  ,      // 0x46  OPENBRACE   (
_NONE       ,      // 0x47              
_NONE       ,      // 0x48              
_GREATERTHAN,      // 0x49  GREATERTHAN >
_COLON      ,      // 0x4A  COLON       :
_L          ,      // 0x4B              
_CCEDIL    ,      // 0x4C              
_P          ,      // 0x4D              
_UNDERSCORE ,      // 0x4E  UNDERSCORE  _
_NONE       ,      // 0x4F              
_NONE       ,      // 0x50              
_QUESTION   ,      // 0x51  QUESTION    ?
_CIRCUMFLEX ,      // 0x52  CIRCUMFLEX  ^
_NONE       ,      // 0x53              
_GRAVE      ,      // 0x54  GRAVE       `
_PLUS       ,      // 0x55  PLUS        +
_NONE       ,      // 0x56              
_NONE       ,      // 0x57              
_CAPS       ,      // 0x58              
_SHIFT      ,      // 0x59              
_ENTER      ,      // 0x5A              
_OPENKEY    ,      // 0x5B  OPENKEY     {
_NONE       ,      // 0x5C              
_CLOSEKEY   ,      // 0x5D  CLOSEKEY    }
_NONE       ,      // 0x5E              
_NONE       ,      // 0x5F              
_NONE       ,      // 0x60              
_PIPE       ,      // 0x61  PIPE        |
_NONE       ,      // 0x62              
_F7         ,      // 0x63  F7 (relocated from 0x83 to keep table under 128 chars            
_NONE       ,      // 0x64  
_NONE       ,      // 0x65  
_BACKSPACE  ,      // 0x66  
_NONE       ,      // 0x67  
_NONE       ,      // 0x68  
_1          ,      // 0x69  
_NONE       ,      // 0x6A  
_4          ,      // 0x6B  
_7          ,      // 0x6C  
_DOT        ,      // 0x6D  
_NONE       ,      // 0x6E  
_NONE       ,      // 0x6F  
_0          ,      // 0x70  
_COMMA      ,      // 0x71  
_2          ,      // 0x72  
_5          ,      // 0x73  
_6          ,      // 0x74  
_8          ,      // 0x75  
_ESC        ,      // 0x76  
_NONE       ,      // 0x77  
_SELECT     ,      // 0x78  
_PLUS       ,      // 0x79  
_3          ,      // 0x7A  
_MINUS      ,      // 0x7B  
_ASTERISK   ,      // 0x7C  
_9          ,      // 0x7D  
_NONE       ,      // 0x7E  
_NONE       ,      // 0x7F  
 };
/*
_NONE       ,      // 0x80  
_NONE       ,      // 0x81  
_NONE       ,      // 0x82  
_F7                // 0x83  
 };
*/
