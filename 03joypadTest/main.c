#include <gb/gb.h>
#include "spritePac.c"
#include <stdio.h>

UINT8 keyPress;
UINT8 currentSpritePacMan;

void performantDelay(UINT8 numloops)
{

	UINT8 i;
	for(i=0;i<numloops;i++)
	{
		wait_vbl_done();
	}
}

void keyPressedRight()
{
	if(keyPress & J_A)
	{
		currentSpritePacMan = 1;
		set_sprite_tile(0, currentSpritePacMan);
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
		keyPress = joypad();
//		printf("%d", keyPress);
//obscuredesign79: Testing code for simultaneous key press
//initial control is jRight. while pressing jRight, you can press
//jUp or jDown or jA.

	currentSpritePacMan = 0;
	set_sprite_tile(0, currentSpritePacMan);

		if(keyPress == J_RIGHT)
		{
			x += 2;
			move_sprite(0, x, y);
		}

		else if(keyPress == J_A)
		{
			currentSpritePacMan = 1;
			set_sprite_tile(0, currentSpritePacMan);
		}

		performantDelay(1);
    }
}

