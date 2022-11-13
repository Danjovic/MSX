echo Build Rom Header/Ram Loader
pasmo MuROM.asm L

echo Build patch
pasmo mulpatch_1.2.asm M_E000-E1F0

echo Join files
cat   L   M_E000-E1F0  Q_C000-D400   Q_8000-BFFF >   muROM.rom