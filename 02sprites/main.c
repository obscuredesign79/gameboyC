//	Gameboy sprite study using 2 sprites

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

	/*	Note: 
		set_sprite_data() loads the sprite to the vram.
		The first variable is the tile number in the vram.
		If more than one sprite is loaded, enter the second
		sprite to the next available tile in the vram taking
		into account the tile number used on the first sprite
		with all the extra tiles for animation.
		
		set_sprite_tile() sets the sprite id on the first flag
		to be used in move_sprite() to differentiate the different
		sprites from one another. The second flag is the tile
		number in the vram.

		move_sprite() displays the sprite on the gameboy screen.
		the first flag is the sprite id indicated in the set_sprite_tile().
		The second and third flag is the x and y location on the gameboy
		screen. Note that the location (8, 16) is the top left most
		corner of the screen.
	*/

    set_sprite_data(0, 2, blinker);
    set_sprite_tile(0, 0);
    move_sprite(0, 8, 16);

	set_sprite_data(2, 2, pacMan);
	set_sprite_tile(1, 2);
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
		set_sprite_tile(1, currentSpritePacMan);

		performantDelay(5);
	}

    
}

