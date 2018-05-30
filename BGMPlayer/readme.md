# MSX BGM player

compile with [pasmo](http://pasmo.speccy.org/)

`pasmo --msx player.asm player.bin`

load with 

`bload "player.bin":defusr=&Hc000:a=usr(0)`

Convert RTTL tune string to assembly line statements using
the RTTL2PSG.py Python script.

