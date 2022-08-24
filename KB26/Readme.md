# Atari keyboard controller Adapter # 
Atari keybads are a 3x4 matrix that can be read by MSX by pulling down consecutively the pins 6, 7, 8 to select the rows while the colums are read on the pins 1, 2, 3, 4. 

Pins 6 and 7 are native Open Collector In/Outs, while pin 8 is turned into an open collector by a 1n4148 diode and a 4k7 pullup resitor. 

## Schematics ##
[schematics](/doc/A2600KB_to_MSX.png)
