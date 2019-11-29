#include <gb/gb.h>
#include "level01Tiles.c"
#include "level01Map.c"
#include <gb/font.h>
#include "window01Map.c"

void performantDelay(UINT8 numloops){

	UINT8 i;
	for(i=0;i<numloops;i++){
		wait_vbl_done();
	}
}

void main()
{
	
	font_t minFont;

	font_init();
	minFont = font_load(font_min);
	font_set(minFont);

    set_bkg_data(38, 13, level01Tiles);
    set_bkg_tiles(0, 0, 40, 18, level01Map);

	set_win_tiles(0, 0, 10, 1, window01Map);

    SHOW_BKG;
	SHOW_WIN;
    DISPLAY_ON;

    while(1)
	{
		scroll_bkg(1, 0);
		move_win(0, 136);
		performantDelay(1);
    }

}
