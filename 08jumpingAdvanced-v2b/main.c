//#include <stdio.h>
#include <gb/gb.h>
#include "ballSprite.c"//16x16 sprite with animation
#include "levelTile.c"
#include "levelMap.c"

//global variables
BYTE keyPressed_A;
BYTE keyPressed_RIGHT;
BYTE keyPressed_LEFT;
BYTE jumping;
INT8 gravity = -2;
UINT8 floorYPosition = 128;
UINT8 possibleYSurface;
INT8 timerAnimation;
UINT8 currentSpeedY;

UBYTE previousKeys;
UBYTE keys;
const char blankMap[1] = {0x00};

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

void updateKeys()
{
	previousKeys = keys;
	keys = joypad();
}

INT8 keyPressed(INT8 K)
{
	return keys & (K);
}

INT8 keyTicked(INT8 K)
{
	return (keys & (K) && !(previousKeys & (K)));
}

INT8 keyReleased(INT8 K)
{
	return previousKeys & (K) && !(keys & (K));
}

void anyKey()
{
	keys;
}
struct gameCharacter ballSprite01;

void gameBallSprite01a()//ball sprite rest A
{
	set_sprite_tile(1, 1);
	set_sprite_tile(2, 2);
	set_sprite_tile(3, 3);
	set_sprite_tile(4, 4);
}
void gameBallSprite01b()//ball sprite rest B
{

	set_sprite_tile(1, 5);
	set_sprite_tile(2, 6);
	set_sprite_tile(3, 7);
	set_sprite_tile(4, 8);
}

void gameBallSprite02()//ball sprite stretched
{
	set_sprite_tile(1, 9);
	set_sprite_tile(2, 10);
	set_sprite_tile(3, 11);
	set_sprite_tile(4, 12);
}

void gameBallSprite03()//ball sprite squashed
{
	set_sprite_tile(1, 0);
	set_sprite_tile(2, 0);
	set_sprite_tile(3, 13);
	set_sprite_tile(4, 14);
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

UBYTE canPlayerMove(UINT8 newPlayerX, UINT8 newPlayerY)
{
	UINT16 indexTlX, indexTlY, tileIndexTl;
	UBYTE result;

	indexTlX = (newPlayerX - 8) / 8;
	indexTlY = (newPlayerY - 16) / 8;
	tileIndexTl = 20 * indexTlY + indexTlX;

	result = levelMap[tileIndexTl] == blankMap[0];

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

INT8 wouldHitSurf(UINT8 projectedYPosition)
{
	if(projectedYPosition >= floorYPosition){
		return floorYPosition;
	}
	return -1;
}

//jump algorithm
void jump(UINT8 setSpeedY)
{
	if(jumping == 0)
	{
		jumping = 1;
		currentSpeedY = setSpeedY;
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
		moveGameCharacter(&ballSprite01, ballSprite01.x, ballSprite01.y);
	}
}

//ball move algorithm 1 for right and 0 for left
void ballMoveX(UINT8 direction)
{
	if(direction == 1)
	{
		ballSprite01.x += 3;
	}
	else if(direction == 0)
	{
		ballSprite01.x -= 3;
	}
	moveGameCharacter(&ballSprite01, ballSprite01.x, ballSprite01.y);
	if(timerAnimation == 1)
	{
		gameBallSprite01a();
	}
	else if(timerAnimation == 2)
	{
		gameBallSprite01b();
		timerAnimation = 0;
	}
	timerAnimation++;
}

//ball after jump animation
void ballAfterJumpMoving(UINT8 direction)
{
	
	if(jumping == 0)
	{
		gameBallSprite03();
		performantDelay(2);
		if(direction == 0)
		{
		keyPressed_LEFT = 0;
		}
		else if(direction == 1)
		{
		keyPressed_RIGHT = 0;
		}
	}
	
}


void main()
{
	//loads ballSprite
	setupBallSprite01();

	//load background data
	set_bkg_data(0, 2, levelTile);
	set_bkg_tiles(0, 0, 20, 18, levelMap);

	//initialize jumping variable
	jumping = 0;

	//initialize sound
	NR52_REG = 0x80;
	NR50_REG = 0x77;
	NR51_REG = 0xFF;

	keyPressed_A = 1;
	keyPressed_LEFT = 1;
	keyPressed_RIGHT = 1;


	SHOW_BKG;
	SHOW_SPRITES;
	DISPLAY_ON;

	timerAnimation = 0;

	while(1)
	{
		updateKeys();
		gameBallSprite01a();

		if(canPlayerMove(ballSprite01.x, ballSprite01.y + 16))
		{
			ballSprite01.y += gravity;
			moveGameCharacter(&ballSprite01, ballSprite01.x, ballSprite01.y);
			
			if(keyTicked(J_A))
			{
				jumpSound();
			}
		}

		if((keyTicked(J_A) || jumping == 1) && keyPressed_A == 1)
		{
				
			gameBallSprite02();//sprite for stretched ball
			jump(15);	
			if(jumping == 0)
			{
				keyPressed_A = 0;
				gameBallSprite03();
				performantDelay(2);
			}
		}

		else if(!(keyReleased(J_A)))
		{
			keyPressed_A = 1;
		}

		if(keyPressed(J_LEFT))
		{
			if(canPlayerMove(ballSprite01.x - 1, ballSprite01.y))
			{

				ballMoveX(0);// 1 for moving to right 0 for moving left
				if(jumping == 1)
				{
					gameBallSprite02();
					ballAfterJumpMoving(0);
				}
			}
		}
		else if(!(keyReleased(J_LEFT)))
		{
			keyPressed_LEFT = 1;
		}
				
		if(keyPressed(J_RIGHT))
		{

			ballMoveX(1);// 1 for moving to right 0 for moving left
			if(jumping == 1)
			{
				gameBallSprite02();
				ballAfterJumpMoving(1);
			}
		}
		else if(!(keyReleased(J_RIGHT)))
		{
			keyPressed_RIGHT = 1;
		}

		performantDelay(2);
	}

}
