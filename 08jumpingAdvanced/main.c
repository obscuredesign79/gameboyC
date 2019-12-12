#include <gb/gb.h>
#include "ballSprite.c"

//global variables
BYTE jumping;
INT8 gravity = -2;
UINT8 currentSpeedY;
UINT8 floorYPosition = 136;
INT8 possibleYSurface;
UINT8 index;
UINT8 timer = 0;

//performance delay to free up CPU
void performantDelay(UINT8 numloops)
{
	for(index=0;index < numloops;index++)
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
	if(timer == 4)
	{
		set_sprite_tile(1, 5);
		set_sprite_tile(2, 6);
		set_sprite_tile(3, 7);
		set_sprite_tile(4, 8);
	}
	else if(timer == 8)
	{
		set_sprite_tile(1, 1);
		set_sprite_tile(2, 2);
		set_sprite_tile(3, 3);
		set_sprite_tile(4, 4);

		timer = 0;
	}
	timer++;
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
void gameBallAnimSquashed(INT8 numloops)//static ball squashed
{
	for(index=0;index < numloops;index++)
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
	
	ballSprite01.x=80;
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

INT8 wouldHitSurf(INT8 projectedYPosition)
{
	if(projectedYPosition >= floorYPosition){
		return floorYPosition;
	}
	return -1;
}

//jump algorythm
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


	if(possibleYSurface < -1)
	{
		jumping = 0;
		moveGameCharacter(&ballSprite01, ballSprite01.x, possibleYSurface);
	}
	else
	{
		moveGameCharacter(&ballSprite01, ballSprite01.x, ballSprite01.y);
	}
}
void main()
{
	//loads ballSprite
	setupBallSprite01();

	//initialize jumping variable
	jumping = 0;


	DISPLAY_ON;
	SHOW_SPRITES;

	while(1)
	{
		if((joypad() & J_A) || jumping == 1)
		{
			jump();	
			gameBallStaticStretched();
			if(jumping == 0)
			{
				gameBallAnimSquashed(500);
				wait_vbl_done();
			}
		}
		if(joypad() & J_LEFT)
		{
			ballSprite01.x -= 3;
			moveGameCharacter(&ballSprite01, ballSprite01.x, ballSprite01.y);
			gameBallAnimRollLoop();
			if(joypad() & J_A)
			{
				gameBallStaticStretched();
				if(jumping == 0)
				{
					gameBallAnimSquashed(500);
				}
			}
		}
		if(joypad() & J_RIGHT)
		{
			ballSprite01.x += 3;
			moveGameCharacter(&ballSprite01, ballSprite01.x, ballSprite01.y);
			gameBallAnimRollLoop();
			if(joypad() & J_A)
			{
				gameBallStaticStretched();
				if(jumping == 0)
				{
					gameBallAnimSquashed(500);
				}
			}
		}

		performantDelay(2);
	}

}
