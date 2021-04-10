/*
   Biblioteca para dispositivos com protocolo PS/2
   Baseada na biblioteca Arduino 'PS2' da autoria de Chris J. Kiick
   Daniel Jose Viana - Abril 2021 - danjovic@hotmail.com
*/



// Send one byte to the device
void writePS2(uint8_t data); 

// Receive one byte from the device
uint8_t readPS2(void);           


//#include "myPS2.c"
