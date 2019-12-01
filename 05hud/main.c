#include <gb/gb.h>
#include <gb/font.h>
#include "level01Tiles.c"
#include "level01Map.c"

UINT8 indexForLoop;
unsigned char counterDigit1[] =
{
	0x00
};
UINT8 counterDigit2;

unsigned char numberCount[10] =
{
	0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x0A,0x0B
};

unsigned char window01Map[7] =
{
  0x17,0x14,0x11,0x10,0x00,0x02,0x02
};

unsigned char counterDigit()
{
	for(indexForLoop = 0; indexForLoop < 10; indexForLoop++)
	{
		counterDigit1[0] = numberCount[indexForLoop];
	}
}
void performantDelay(UINT8 numloops){

	for(indexForLoop = 0;indexForLoop < numloops;indexForLoop++){
		wait_vbl_done();
	}
}

void fontINIT()
{
	font_t minFont;
	font_init();
	minFont = font_load(font_min);
	font_set(minFont);
}

void main()
{
	
    SHOW_BKG;
	SHOW_WIN;
    DISPLAY_ON;

	fontINIT();

    set_bkg_data(38, 13, level01Tiles);
    set_bkg_tiles(0, 0, 40, 18, level01Map);

	set_win_tiles(0, 0, 7, 1, window01Map);
	move_win(7, 130);


    while(1)
	{
		counterDigit();
		window01Map[6] = counterDigit1[0];
		scroll_bkg(1, 0);
		performantDelay(1);
    }

}
