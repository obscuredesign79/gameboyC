#include <gb/gb.h>
#include "level01Tiles.c"
#include "level01Map.c"

void performantDelay(UINT8 numloops){

	UINT8 i;
	for(i=0;i<numloops;i++){
		wait_vbl_done();
	}
}

void main()
{
    set_bkg_data(0, 13, level01Tiles);
    set_bkg_tiles(0, 0, 40, 18, level01Map);

    SHOW_BKG;
    DISPLAY_ON;

    while(1){
	scroll_bkg(1, 0);
	performantDelay(2);
    }


}
