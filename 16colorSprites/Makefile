BIN=~/develop/gbdk-n-master/bin
OBJ=./obj



build:
	mkdir -p $(OBJ)
	$(BIN)/gbdk-n-compile.sh main.c -o $(OBJ)/main.rel
	$(BIN)/gbdk-n-compile.sh sprites.c -o $(OBJ)/sprites.rel
	$(BIN)/gbdk-n-link.sh -Wl-yp0x143=0x80 $(OBJ)/sprites.rel $(OBJ)/main.rel -o $(OBJ)/main.ihx
	$(BIN)/gbdk-n-make-rom.sh $(OBJ)/main.ihx gameRom.gb

clean:
	rm -rf $(OBJ)
	rm -f gameRom.gb

run:
#	wine bgb gameRom.gb
	visualboyadvance-m gameRom.gb
