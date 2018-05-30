#
# Convert RTTL tune to PSG 3-byte play format
# Danjovic 2018 - danjovic@hotmail.com
#

# Uses Python Parser for Ring Tone Text Transfer Language (RTTTL)
# by Dave Hylands   https://github.com/dhylands/upy-rtttl
from rtttl import RTTTL



try:
    import winsound
except ImportError:
    import os
    def playsound(frequency,duration):
        pass
        #apt-get install beep
#        os.system('beep -f %s -l %s' % (frequency,duration))
else:
    def playsound(frequency,duration):
        winsound.Beep(frequency,duration)




while (1):
    song = raw_input("Paste RTL Tune: ")
    if (song == ""):
        exit()
    tune = RTTTL(song)


    print "; start song: "+song.split(':')[0]

    for tcnt, divider_low, divider_high in tune.notes():
        while (tcnt > 255):
            print "db "+str(255)+","+str(divider_low)+","+str(divider_high)+" ; extended"
            tcnt = tcnt-255
        print "db "+str(tcnt)+","+str(divider_low)+","+str(divider_high)+" ; ",
        if (divider_high==0 and divider_low==0):
            print " pause"
        else:
            print
        divider = (divider_high*256+ divider_low)
        if divider==0:
            freq = 32767
        else:
            freq=111861/ (divider_high*256+ divider_low)


        duration = tcnt * 1000 / 60
        playsound(freq,duration)


    print "db 0,0,0 ; repeat song"

