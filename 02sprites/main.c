#include <gb/gb.h>
#include <stdio.h>
#include "spritePac.c"
#include "spriteBlink.c"

void performantDelay(UINT8 numloops)
{

	UINT8 i;
	for(i=0;i<numloops;i++)
	{
		wait_vbl_done();
	}
}
void main()
{
	UINT8 currentSpriteBlinker = 0;
	UINT8 currentSpritePacMan = 2;

    set_sprite_data(0, 2, blinker);//(starts of tile, how manytiles, name of variable sprite(not the fileName.c))
    set_sprite_tile(0, 0);//(tile number to load, sprite index if more than one tile can change)
    move_sprite(0, 8, 16);//(sprite ID, x, y)

	set_sprite_data(2, 2, pacMan);
	set_sprite_tile(2, 1);
	move_sprite(1, 16, 16);


    SHOW_SPRITES;

	while(1)
	{
		if(currentSpriteBlinker == 0)
		{
			currentSpriteBlinker = 1;
			currentSpritePacMan = 3;
		}
		else
		{
			currentSpriteBlinker = 0;
			currentSpritePacMan = 2;
		}
		set_sprite_tile(0, currentSpriteBlinker);
		set_sprite_tile(2, currentSpritePacMan);

		performantDelay(5);
	}

    
}

