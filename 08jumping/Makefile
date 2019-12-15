LCC = /opt/gbdk/bin/lcc

build:
	$(LCC) -Wa-l -Wl-m -Wl-j -c -o main.o main.c
	$(LCC) -Wa-l -Wl-m -Wl-j -o gbRom.gb main.o

clean:
	rm main.o
	rm main.lst
	rm gbRom.map
	rm gbRom.sym

run:
	visualboyadvance-m gbRom.gb
