C:\gbdk\bin\lcc.exe -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -c -o main.o main.c
C:\gbdk\bin\lcc.exe -Wa-l -Wl-m -Wl-j -DUSE_SFR_FOR_REG -o gbRom.gb main.o

del main.o
del main.lst
del gbRom.map
del gbRom.sym
