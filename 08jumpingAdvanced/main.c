#include <stdio.h>
#include <gb/gb.h>
#include "ballSprite.c"//16x16 sprite with animation

//global variables
BYTE keyPressed_A;
BYTE keyPressed_RIGHT;
BYTE jumping;
INT8 gravity = -2;
UINT8 currentSpeedY;
UINT8 floorYPosition = 136;
UINT8 possibleYSurface;
UINT8 timer = 0;
UINT8 jPad;
BYTE result;

//performance delay to free up CPU
void performantDelay(UINT8 numloops)
{
	UINT8 i;
	for(i=0;i < numloops;i++)
	{
		wait_vbl_done();
	}
}

//gameCharacter struct
struct gameCharacter
{
	UBYTE spriteId[4];//change this according to sprite size (16x16, 24x24..)
	UINT8 x;
	UINT8 y;
	UINT8 width;
	UINT8 height;
};

//inializes gameCharacter to ballSprite01
struct gameCharacter ballSprite01;

//cycle through tiles for animation
void gameBallAnimRollLoop()//looping ball moving animation.(highlight jitters)
{
	set_sprite_tile(1, 5);
	set_sprite_tile(2, 6);
	set_sprite_tile(3, 7);
	set_sprite_tile(4, 8);
}

void gameBallStaticStretched()//static ball stretch
{
	set_sprite_tile(1, 9);
	set_sprite_tile(2, 10);
	set_sprite_tile(3, 11);
	set_sprite_tile(4, 12);
}

void gameBallStaticRest()//static ball rest
{
	set_sprite_tile(1, 1);
	set_sprite_tile(2, 2);
	set_sprite_tile(3, 3);
	set_sprite_tile(4, 4);
}
void gameBallAnimSquashed(UINT8 numloops)//static ball squashed
{
	UINT8 i;
	for(i=0;i < numloops;i++)
	{
		set_sprite_tile(1, 0);
		set_sprite_tile(2, 0);
		set_sprite_tile(3, 13);
		set_sprite_tile(4, 14);
	}

	gameBallStaticRest();
}

//moving a 16x16 metaSprite in unison
void moveGameCharacter(struct gameCharacter *character, UINT8 x, UINT8 y)
{
	move_sprite(character->spriteId[0],x, y);
	move_sprite(character->spriteId[1],x + 8, y);
	move_sprite(character->spriteId[2],x, y + 8);
	move_sprite(character->spriteId[3],x + 8, y + 8);
}

//setup the ballSprite01 sprite struct
void setupBallSprite01()
{
	set_sprite_data(0, 15, ballSprite);
	
	ballSprite01.x=16;
	ballSprite01.y = floorYPosition;
	ballSprite01.width=16;
	ballSprite01.height=16;

	set_sprite_tile(1,1);
	ballSprite01.spriteId[0]=1;
	set_sprite_tile(2,2);
	ballSprite01.spriteId[1]=2;
	set_sprite_tile(3,3);
	ballSprite01.spriteId[2]=3;
	set_sprite_tile(4,4);
	ballSprite01.spriteId[3]=4;

	moveGameCharacter(&ballSprite01,ballSprite01.x,ballSprite01.y);
}

INT8 wouldHitSurf(UINT8 projectedYPosition)
{
	if(projectedYPosition >= floorYPosition){
		return floorYPosition;
	}
	return -1;
}

//jump algorithm
void jump()
{
	if(jumping == 0)
	{
		jumping = 1;
		currentSpeedY = 10;
	}
	currentSpeedY = currentSpeedY + gravity;

	ballSprite01.y -= currentSpeedY;

	possibleYSurface = wouldHitSurf(ballSprite01.y);


	if(possibleYSurface == floorYPosition)
	{
		jumping = 0;
		moveGameCharacter(&ballSprite01,ballSprite01.x, possibleYSurface);

	}
	else
	{
		moveGameCharacter(&ballSprite01,ballSprite01.x,ballSprite01.y);
	}
}

INT8 keyTicked(UINT8 jPad)
{
	
	if(jPad == J_A)
	{
				
		result = 1;

	}
	else if(jPad != J_A)
	{
		if(jPad == J_A)
		{
			result = 0;
		}
	}

	return result;

}

//jump sound
void jumpSound()
{
	NR10_REG = 0x16;
	NR11_REG = 0x40;
	NR12_REG = 0x73;
	NR13_REG = 0x00;
	NR14_REG = 0xC3;
}
void main()
{
	//loads ballSprite
	setupBallSprite01();

	//initialize jumping variable
	jumping = 0;

	//initialize sound
	NR52_REG = 0x80;
	NR50_REG = 0x77;
	NR51_REG = 0xFF;

	keyPressed_A = 1;
	jPad = joypad();


	DISPLAY_ON;
	SHOW_SPRITES;

	while(1)
	{

		if((joypad() & J_A || jumping == 1) && keyPressed_A == 1)
		{
				
			jump();	
			jumpSound();
			gameBallStaticStretched();//sprite for stretched ball
			if(jumping == 0)
			{
				gameBallAnimSquashed(500);//hold squashed sprite for a period of time using for loops
				keyPressed_A = 0;
			}
		}

		else if(joypad() != J_A)
		{
			keyPressed_A = 1;
		}

				
		if((joypad() & J_RIGHT) && keyPressed_RIGHT == 1)
		{

			ballSprite01.x += 3;
			moveGameCharacter(&ballSprite01, ballSprite01.x, ballSprite01.y);
			gameBallAnimRollLoop();
			if(jumping == 0)
			{
				keyPressed_A = 1;
			}
			if(joypad() == 16)
			{
				keyPressed_A = 1;
			}


		}
		else if(joypad() != J_RIGHT)
		{
			keyPressed_RIGHT = 1;
		}

		performantDelay(2);
	}

}
