# FA-32BR

Recreation of the FA-32 cassete recorder interface for the Casio MX-10, MX-101 and PV-7. 

The whole project was designed to be easy to reproduce. The original circuit was reverse engineered and a custom, 
single sided PCB was designed to fit into a [Hammond 1593J](http://www.hammondmfg.com/pdf/1593J.pdf) plastic case. 

![PCB Image](/FA-32/board_db9.png "Single Sided Board")

The board provides options for some of the components:
- Relay:

  Original FBR211 series or a generic DPDT subminiature type with DIP spacing that can be found under several brands and part numbers
  
  ![Optional Relay](/FA-32/DPDT_sub_relay.jpg "Generic Subminiature Relay")
  
- Transistor

  Original 2SC945 [BCE] or a BC338 [EBC]
  
  
- EAR/MIC Input Jacks

  Two Mono Jacks PJ-301 or a Stereo Jack type PJ-325
  
  ![Otion for Jacks](/FA-32/plugsMonoStereo.jpg "Jacks 3.5mm and 2.5mm")

The connection from the MSX to the board is done using a DIN-5 to DB-9 cable with the following wiring:

![MSX Wiring](/FA-32/FA-32BR_Cable_Wiring.png "Wiring from MSX to Interface")

The connection to the Cassete depends upon the option used for the MIC/EAR jack:

- Two Mono Jacks PJ-301

![Straight Cable](/FA-32/cable-mono.png "Straight Cable")
    
- One Stereo Jack type PJ-325

![Stereo Cable](/FA-32/cable-stereo.png "Stereo Cable")
