//    _____  _____  ___   _____
//   | __\ \/ / _ \/ __| / /_  )
//   | _| >  <|  _/\__ \/ / / /
//   |___/_/\_\_|  |___/_/ /___|
//
//   Teclado PS/2 externo para Expert XP800

// Conexao dos pinos do AVR com a PPI
// AVR interface pin assignment to the PPI

// AVR  PPI

// PC0  PC0   /   sel A
// PC1  PC1   /   sel B
// PC2  PC2   /   sel C
// PC3  PC3   /   sel D

// PD0  PB5   /   X5
// PD1  PB0   /   X0
// PD2  PB6   /   X6
// PD3  PB2   /   X2
// PD4  PB7   /   X7
// PD5  PB4   /   X4
// PD6  PB1   /   X1
// PD7  PB3   /   X3

/*
SH  ROW[0..10] COL [0..7]

    7     6     5     4     3     2     1     0    BIT
 +-----------------------------------------------+
 |SHIFT|       ROW [0..10]     |    COL[0..7]    |
 +-----------------------------------------------+


    7     6     5     4     3     2     1     0    BIT
 +-----------------------------------------------+
 |  7  |  5  |  6  |  4  |  3  |  2  |  1  |  0  |   Row 0
 +-----+-----+-----+-----+-----+-----+-----+-----|
 |  ;  |  [  |  ]  |  \  |  =  |  -  |  9  |  8  |   Row 1
 +-----+-----+-----+-----+-----+-----+-----+-----|
 |  B  |  |  |  A  |  /  |  .  |  ,  |  `  |  '  |   Row 2
 +-----+-----+-----+-----+-----+-----+-----+-----|
 |  J  |  H  |  I  |  G  |  F  |  E  |  D  |  C  |   Row 3
 +-----+-----+-----+-----+-----+-----+-----+-----|
 |  R  |  P  |  Q  |  O  |  N  |  M  |  L  |  K  |   Row 4
 +-----+-----+-----+-----+-----+-----+-----+-----|
 |  Z  |  X  |  Y  |  W  |  V  |  U  |  T  |  S  |   Row 5
 +-----+-----+-----+-----+-----+-----+-----+-----|
 | F3  | F1  | F2  |CODE | CAP |GRAPH|CTRL |SHIFT|   Row 6
 +-----+-----+-----+-----+-----+-----+-----+-----|
 | CR  | BS  | SEL |STOP | TAB | ESC | F5  | F4  |   Row 7
 +-----+-----+-----+-----+-----+-----+-----+-----|
 |RIGHT| UP  |DOWN |LEFT | DEL | INS |HOME |SPACE|   Row 8
 +-----+-----+-----+-----+-----+-----+-----+-----|
 | KP4 | KP2 | KP2 | KP1 | KP0 |NUM/ |NUM+ |NUM* |   Row 9
 +-----+-----+-----+-----+-----+-----+-----+-----|
 |  .  |  -  |  ,  | KP9 | KP8 | KP7 | KP6 | KP5 |   Row 10
 +-----------------------------------------------+
    7     5     6     4     3     2     1     0       Column

*/

// Mapa das linhas de selecao da PPI
// PPI selection line mapping
//      line bit
#define selA  0
#define selB  1
#define selC  2
#define selD  3


#define row0  ( (0<<selD)|(0<<selC)|(0<<selB)|(0<<selA) ) <<3
#define row1  ( (0<<selD)|(0<<selC)|(0<<selB)|(1<<selA) ) <<3
#define row2  ( (0<<selD)|(0<<selC)|(1<<selB)|(0<<selA) ) <<3
#define row3  ( (0<<selD)|(0<<selC)|(1<<selB)|(1<<selA) ) <<3
#define row4  ( (0<<selD)|(1<<selC)|(0<<selB)|(0<<selA) ) <<3
#define row5  ( (0<<selD)|(1<<selC)|(0<<selB)|(1<<selA) ) <<3
#define row6  ( (0<<selD)|(1<<selC)|(1<<selB)|(0<<selA) ) <<3
#define row7  ( (0<<selD)|(1<<selC)|(1<<selB)|(1<<selA) ) <<3
#define row8  ( (1<<selD)|(0<<selC)|(0<<selB)|(0<<selA) ) <<3
#define row9  ( (1<<selD)|(0<<selC)|(0<<selB)|(1<<selA) ) <<3
#define rowA  ( (1<<selD)|(0<<selC)|(1<<selB)|(0<<selA) ) <<3
#define rowB  ( (1<<selD)|(0<<selC)|(1<<selB)|(1<<selA) ) <<3
#define rowC  ( (1<<selD)|(1<<selC)|(0<<selB)|(0<<selA) ) <<3
#define rowD  ( (1<<selD)|(1<<selC)|(0<<selB)|(1<<selA) ) <<3
#define rowE  ( (1<<selD)|(1<<selC)|(1<<selB)|(0<<selA) ) <<3
#define rowF  ( (1<<selD)|(1<<selC)|(1<<selB)|(1<<selA) ) <<3


// Posicao das bits das colunas (teclas)
// Column position bit mapping (keys)
//   column  bit
#define col0  5
#define col1  0
#define col2  6
#define col3  2
#define col4  7
#define col5  4
#define col6  1
#define col7  3


//  SHIFT Position in Matrx
#define LIN_SHIFT 6
#define COL_SHIFT col0


#define _NONE          0x7F
#define _SH            0x80

#define _0            ( row0 | col0 )
#define _1            ( row0 | col1 )
#define _2            ( row0 | col2 )
#define _3            ( row0 | col3 )
#define _4            ( row0 | col4 )
#define _5            ( row0 | col5 )
#define _6            ( row0 | col6 )
#define _7            ( row0 | col7 )

#define _8            ( row1 | col0 )
#define _9            ( row1 | col1 )
#define _MINUS        ( row1 | col2 )
#define _EQUAL        ( row1 | col3 )
#define _OPENBRACKET  ( row1 | col4 )
#define _ACUTE        ( row1 | col5 )
#define _OPENKEY      ( row1 | col6 )
#define _TILDE        ( row1 | col7 )

#define _ASTERISK     ( row2 | col0 )
#define _CCEDIL       ( row2 | col1 )
#define _COMMA        ( row2 | col2 )
#define _DOT          ( row2 | col3 )
#define _SEMICOLON    ( row2 | col4 )
#define _SLASH        ( row2 | col5 )
#define _A            ( row2 | col6 )
#define _B            ( row2 | col7 )

#define _C            ( row3 | col0 )
#define _D            ( row3 | col1 )
#define _E            ( row3 | col2 )
#define _F            ( row3 | col3 )
#define _G            ( row3 | col4 )
#define _H            ( row3 | col5 )
#define _I            ( row3 | col6 )
#define _J            ( row3 | col7 )

#define _K            ( row4 | col0 )
#define _L            ( row4 | col1 )
#define _M            ( row4 | col2 )
#define _N            ( row4 | col3 )
#define _O            ( row4 | col4 )
#define _P            ( row4 | col5 )
#define _Q            ( row4 | col6 )
#define _R            ( row4 | col7 )

#define _S            ( row5 | col0 )
#define _T            ( row5 | col1 )
#define _U            ( row5 | col2 )
#define _V            ( row5 | col3 )
#define _W            ( row5 | col4 )
#define _X            ( row5 | col5 )
#define _Y            ( row5 | col6 )
#define _Z            ( row5 | col7 )

#define _SHIFT        ( row6 | col0 )
#define _CONTROL      ( row6 | col1 )
#define _GRAPH        ( row6 | col2 )
#define _CAPS         ( row6 | col3 )
#define _CODE         ( row6 | col4 )
#define _F1           ( row6 | col5 )
#define _F2           ( row6 | col6 )
#define _F3           ( row6 | col7 )

#define _F4           ( row7 | col0 )
#define _F5           ( row7 | col1 )
#define _ESC          ( row7 | col2 )
#define _TAB          ( row7 | col3 )
#define _STOP         ( row7 | col4 )
#define _BACKSPACE    ( row7 | col5 )
#define _SELECT       ( row7 | col6 )
#define _ENTER        ( row7 | col7 )

#define _SPACE        ( row8 | col0 )
#define _HOME         ( row8 | col1 )
#define _INSERT       ( row8 | col2 )
#define _DELETE       ( row8 | col3 )
#define _LEFT         ( row8 | col4 )
#define _UP           ( row8 | col5 )
#define _DOWN         ( row8 | col6 )
#define _RIGHT        ( row8 | col7 )

#define _KPPLUS       ( row9 | col0 )    
#define _KPMINUS      ( row9 | col1 )    
#define _KPTIMES      ( row9 | col2 )    
#define _KPSLASH      ( row9 | col3 )    

#define _KP1          ( _NONE       )    
#define _KP2          ( _NONE       )    
#define _KP3          ( _NONE       )    
#define _KP4          ( _NONE       )    

#define _KP5          ( _NONE       )    
#define _KP6          ( _NONE       )    
#define _KP7          ( _NONE       )    
#define _KP8          ( _NONE       )   
#define _KP9          ( _NONE       )       
#define _KPCOMMA      ( _NONE       )    
#define _KPDOT        ( _NONE       )    

// Shifted
#define _F6           ( _SH + _F1 )        // F6
#define _F7           ( _SH + _F2 )        // F7
#define _F8           ( _SH + _F3 )        // F8
#define _F9           ( _SH + _F4 )        // F9
#define _F10          ( _SH + _F5 )        // F10

#define _EXCLAMATION  ( _SH + _1  )         // !
#define _QUOTE        ( _SH + _2  )         // "
#define _NUMBER       ( _SH + _3  )         // #
#define _DOLLAR       ( _SH + _4  )         // $
#define _PERCENT      ( _SH + _5  )         // %
#define _POWER        ( _SH + _6  )         // ^
#define _AMPERSAND    ( _SH + _7  )         // &
#define _APOSTROPHE   ( _SH + _8  )         // '
#define _OPENBRACE    ( _SH + _9  )         // (
#define _CLOSEBRACE   ( _SH + _0  )         // )

#define _AT           ( _SH + _ASTERISK   ) // @
#define _UNDERSCORE   ( _SH + _MINUS      ) // _
#define _PLUS         ( _SH + _EQUAL      ) // +
#define _CLOSEKEY     ( _SH + _OPENKEY    ) // }

#define _GRAVE        ( _SH + _ACUTE      ) // `
#define _CLOSEBRACKET ( _SH + _OPENBRACKET) // ]
#define _CIRCUMFLEX   ( _SH + _TILDE      ) // ^

#define _LESSTHAN     ( _SH + _COMMA      ) // <
#define _GREATERTHAN  ( _SH + _DOT        ) // >
#define _COLON        ( _SH + _SEMICOLON  ) // :
#define _QUESTION     ( _SH + _SLASH      ) // ?

#define _PIPE         (  _NONE )
