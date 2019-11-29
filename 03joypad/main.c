#include <gb/gb.h>
#include "spritePac.c"

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
	UINT8 x = 88;
	UINT8 y = 78;

	UINT8 currentSpritePacMan = 0;

    set_sprite_data(0, 2, pacMan);
    move_sprite(0, x, y);
    SHOW_SPRITES;
    
    while(1)
	{
/*
//Original code from gameboy c programming tutorials	
		switch(joypad())
		{
			case J_LEFT:
			scroll_sprite(0, -4, 0);
			break;
		
			case J_RIGHT:
			scroll_sprite(0, 4, 0);
			break;
		
			case J_UP:
			scroll_sprite(0, 0, -4);
			break;
		
			case J_DOWN:
			scroll_sprite(0, 0, 4);
			break;
		}
*/

//obscuredesign79: Testing code for simultaneous key press
//initial control is jRight. while pressing jRight, you can press
//jUp or jDown or jA.

	UINT8 currentSpritePacMan = 0;
	set_sprite_tile(0, currentSpritePacMan);

		if(joypad() & J_RIGHT)
		{
			x += 2;
			move_sprite(0, x, y);
			if(joypad() & J_DOWN)
			{
				y += 2;
				move_sprite(0, x, y);
				if(joypad() & J_A)
				{
					currentSpritePacMan = 1;
					set_sprite_tile(0, currentSpritePacMan);
				}
			}
			else if(joypad() & J_UP)
			{
				y -= 2;
				move_sprite(0, x, y);
				if(joypad() & J_A)
				{
					currentSpritePacMan = 1;
					set_sprite_tile(0, currentSpritePacMan);
				}
			}
		}

		if(joypad() & J_A)
		{
			currentSpritePacMan = 1;
			set_sprite_tile(0, currentSpritePacMan);
		}

		performantDelay(1);
    }
}

