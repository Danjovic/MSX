#-------------------------------------------------------------------------------
# Name:        module1
# Purpose:
#
# Author:      Danjovic
#
# Created:     14/11/2022
# Copyright:   (c) Danjovic 2022
# Licence:     <your licence>
#-------------------------------------------------------------------------------
from PIL import Image
def translateColor (inputColor):
    #msxCores = [ 1, 3, 7, 9, 11, 14, 15]
    msxCores = [ 1, 3, 7, 15, 6, 14, 9]
    if inputColor <= len(msxCores):
        return msxCores [ inputColor ]
    else:
        return 1
def getCoords ( linearCount ):
    # bit order   Y5 Y4 Y3 X5 - X4 X3 X2 X1 .Y2 Y1 Y0 X0
    #             0  0  0  1    1  1   1  1   0  0  0  1
    #             1  1  1  0    0  0  0  0   1  1  1  0
    cx = ( (linearCount & 0x1f0)  >> 3) + (  linearCount & 0x01 )
    cy = ( (linearCount & 0xe00) >> 6) + ( (linearCount & 0x0e) >> 1)
    return cx,cy

def intToHexValue2digits (b,s):
    bv = str(hex(b))[2:]  # convert to hex and remove prefix 0x
    if len(bv)<2:         # novmalize to 2 digits
        bv = '0'+ bv
    if (s=='0') or (s=='h') :
        return '0'+bv+'h'     # add previx 0 and suffix - 0bbh
    elif s=='x':
        return '0x' + bv        # add previx 0x  - 0xbb
    else:
        return '$' + bv        # add previx $  - $bb

# arquivo de entrada
#filename = 'm3q.bmp'
#filename = 'infosoc.bmp'
filename = 'noram.bmp'
image =  Image.open(filename)
width, height = image.size

pixels = image.load()

# initialize file
outputBuffer ="; screen 3 file:" + filename


for i in range (0,1536*2,2):
    x,y = getCoords (i)
    pp = translateColor ( pixels [x,y] )  # pega cor do MSB
    x,y = getCoords (i+1)
    ss = translateColor ( pixels [x,y] )  # pega cor LSB
    bb = (pp<<4 | ss ) & 0xff
    #print ( "x,y = ", x , ",",y , " pp,ss->bb = " ,pp, "," ,ss , "->" , bb )

    if (i % 32 == 0 ):
        outputBuffer = outputBuffer + "\n db "
    else:
        outputBuffer = outputBuffer + ', '
    outputBuffer = outputBuffer + intToHexValue2digits (bb, '$')

print (outputBuffer)







#for y in range (0,height):
#    for x in range (0,width):
#        print ( pixels[x,y], end="" )
#    print ()


##for i in range (0,256+16):
##    x,y = getCoords (i)
##    if i % 16 == 0 :
##        print ()
##    print ("(",x,",",y,")" , end= "")
##
##
##for i in range (0,20):
##    print ("i=",i,"Cor = ",translateColor(i))


