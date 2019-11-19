#include <gb/gb.h>
#include "bgMap.c"
#include "bgTiles.c"

void main(){
    set_bkg_data(0, 8, bgTiles);
    set_bkg_tiles(0, 0, 40, 18, bgMap);

    SHOW_BKG;
    DISPLAY_ON;

    while(1){
	scroll_bkg(1, 0);
	delay(60);
    }


}
