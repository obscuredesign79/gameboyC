#include <gb/gb.h>
#include <gb/font.h>
#include "level01Tiles.c"
#include "level01Map.c"

//set global variables
UINT8 indexForLoop;
UINT8 timer = 0;

//loads background data
void loadBkg()
{
    set_bkg_data(38, 13, level01Tiles);
    set_bkg_tiles(0, 0, 40, 18, level01Map);
}

//initializes video
void vInit()
{
    SHOW_BKG;
	SHOW_WIN;
    DISPLAY_ON;
}

//tile data for characters 0-9. used in counter function
//duplicated hex data to slow down animation
unsigned char numberCount[40] =
{
	0x02,0x02,0x02,0x02,
	0x03,0x03,0x03,0x03,
	0x04,0x04,0x04,0x04,
	0x05,0x05,0x05,0x05,
	0x06,0x06,0x06,0x06,
	0x07,0x07,0x07,0x07,
	0x08,0x08,0x08,0x08,
	0x09,0x09,0x09,0x09,
	0x0A,0x0A,0x0A,0x0A,
	0x0B,0x0B,0x0B,0x0B
};

//window map layer
unsigned char window01Map[] =
{
  0x17,0x14,0x11,0x10,0x00,0x02,0x02
};

//vsync blanking to free up CPU process
void performantDelay(UINT8 numloops)
{
	for(indexForLoop = 0;indexForLoop < numloops;indexForLoop++)
	{
		wait_vbl_done();
	}
}

//basic counter function for window layer
void counter()
{

	window01Map[6] = numberCount[timer];
	set_win_tiles(0, 0, 7, 1, window01Map);
	if(timer > 38)
	{
		timer = 0;
	}
	timer++;
	move_win(7, 130);
}

//initializes the font data
void fontINIT()
{
	font_t minFont;
	font_init();
	minFont = font_load(font_min);
	font_set(minFont);
}

void main()
{
	vInit();	
	fontINIT();
	loadBkg();

    while(1)
	{

		counter();

		scroll_bkg(1, 0);
		performantDelay(1);
    }

}
