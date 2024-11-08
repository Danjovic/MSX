#    _     _        ___  _              
#   | |__ (_) _ _  |_  )| |__  __ _  ___
#   | '_ \| || ' \  / / | '_ \/ _` |(_-<
#   |_.__/|_||_||_|/___||_.__/\__,_|/__/
#
#   Convert MSX binary file into DATA lines to be loaded in BASIC
#
#   Danjovic - November 2024 
#
import sys

# check command line arguments
if len(sys.argv) < 2: # 
    print('Usage bin2bas.py <input file> [output file] [v]')
    sys.exit()

inputFilename = sys.argv[1] 
shortInputFilename = inputFilename.split('/')[-1]

if len(sys.argv) <3:
    outputFilename = inputFilename.rsplit( ".", 1 )[ 0 ]+".bas"
else:
    outputFilename = sys.argv[2]

cr = '\x0a' 

# read input file
inputFile = open(inputFilename, "rb")
contents = inputFile.read()
inputFile.close()

# process input
if contents[0] != 0xfe: # 
    print('Not an MSX binary file')
    sys.exit()

#compute addresses
sa = '&h{:0>4X}'.format (contents[1]+256*contents[2])
ea = '&h{:0>4X}'.format (contents[3]+256*contents[4])

# workaround PASMO assembler 
entry = contents[5]+256*contents[6]
if entry < 0x8000:
    ra = sa
else:
    ra = '&h{:0>4X}'.format (entry)


#if len(contents[7:] > xxx) warning file too large

# generate output loader
outputContent =  "10'"+shortInputFilename+cr
outputContent += "20 restore 1000"+cr
outputContent += "30 for a="+sa+"to"+ea+" : read b$"+cr
outputContent += "40 poke a,val(\"&h\"+b$) : next"+cr
outputContent += "50 defusr="+ra+":print\"a=usr(0)\" "+cr
outputContent += "60'"+cr


# generate DATA lines
lineNumber = 1000
column = 0

for i in contents[7:]:
    if column==0:
        outputContent += '{:0} data '.format (lineNumber)
    outputContent += '{:0>2x}'.format (i & 0xff)
    column=column+1
    if column < 8:
        outputContent +=","
    else:
        outputContent += cr
        column = 0
        lineNumber+= 10
        
# remove trailng comma when last data line have less than 8 bytes
if outputContent[-1] == ",":
    outputContent = outputContent[:-1]
    outputContent += cr
    

# process output

# save the output file
outputFile = open (outputFilename,"w")
outputFile.write(outputContent)
outputFile.close()


# if a third argument is given, show the output
if len(sys.argv) >3:
    print ("Binary file: "+shortInputFilename)
    print ("Start: "+sa+"  End: "+ea +"  Entry: "+ra+cr)
    print (outputContent)




