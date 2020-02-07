BIN=~/develop/gbdk-n-master/bin
OBJ=./obj



build:
	mkdir -p $(OBJ)
	$(BIN)/gbdk-n-compile.sh main.c -o $(OBJ)/main.rel
	$(BIN)/gbdk-n-compile.sh keys.c -o $(OBJ)/keys.rel
	$(BIN)/gbdk-n-link.sh $(OBJ)/main.rel $(OBJ)/keys.rel -o $(OBJ)/main.ihx
	$(BIN)/gbdk-n-make-rom.sh $(OBJ)/main.ihx gameRom.gb

clean:
	rm -rf $(OBJ)

run:
#	wine bgb gameRom.gb
	visualboyadvance-m gameRom.gb
