LCC = /opt/gbdk/bin/lcc

build:
	$(LCC) -Wa-l -Wl-m -Wl-j -c -o main.o main.c
	$(LCC) -Wa-l -Wl-m -Wl-j -c -o keys.o keys.c
	$(LCC) -Wa-l -Wl-m -Wl-j -o gbRom.gb main.o keys.o
	rm main.o
	rm main.lst
	rm gbRom.map
	rm gbRom.sym

run:
	wine bgb gbRom.gb
