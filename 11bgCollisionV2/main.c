#include <gb/gb.h>
#include "level01Map.c"
#include "level01Tile.c"
#include "playerSprite.c"

//global variables
UBYTE previousKeys;
UBYTE keys;
INT8 gravity;
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

//joypad key functions
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


//playerSprite01 setup
//playerSprite struct
struct gameCharacter
{
	UBYTE spriteId[4];//change this according to sprite size (16x16, 24x24..)
	UINT8 x;
	UINT8 y;
	UINT8 width;
	UINT8 height;
};
//moving a 16x16 metaSprite in unison function
void moveGameCharacter(struct gameCharacter *character, UINT8 x, UINT8 y)
{
	move_sprite(character->spriteId[0],x, y);
	move_sprite(character->spriteId[1],x + 8, y);
	move_sprite(character->spriteId[2],x, y + 8);
	move_sprite(character->spriteId[3],x + 8, y + 8);
}
//playerSprite to gameCharacter struct
struct gameCharacter playerSprite01;
//setup the playerSprite01 sprite struct
void setupPlayerSprite()
{
	set_sprite_data(0, 5, playerSprite);
	
	playerSprite01.x = 8;
	playerSprite01.y = 16;
	playerSprite01.width = 16;
	playerSprite01.height = 16;

	set_sprite_tile(1,1);
	playerSprite01.spriteId[0]=1;
	set_sprite_tile(2,2);
	playerSprite01.spriteId[1]=2;
	set_sprite_tile(3,3);
	playerSprite01.spriteId[2]=3;
	set_sprite_tile(4,4);
	playerSprite01.spriteId[3]=4;

	moveGameCharacter(&playerSprite01,playerSprite01.x,playerSprite01.y);
}

UBYTE canPlayerMove(UINT8 newPlayerX, UINT8 newPlayerY)
{
	UINT16 indexTlX, indexTlY, tileIndexTl;
	UBYTE result;

	indexTlX = (newPlayerX - 8) / 8;
	indexTlY = (newPlayerY - 16) / 8;
	tileIndexTl = 20 * indexTlY + indexTlX;

	result = level01Map[tileIndexTl] == blankMap[0];

	return result;

		
}

void main()
{
	setupPlayerSprite();

	set_bkg_data(0, 9, level01Tile);
	set_bkg_tiles(0, 0, 20, 18, level01Map);

	SHOW_BKG;
	SHOW_SPRITES;
	DISPLAY_ON;

	gravity = 2;

	while(1)
	{
		updateKeys();

		if(canPlayerMove(playerSprite01.x, playerSprite01.y + 16))
		{
			playerSprite01.y += gravity;
//			moveGameCharacter(&playerSprite01, playerSprite01.x, playerSprite01.y);
		}
		if(keyPressed(J_LEFT))
		{
			if(canPlayerMove(playerSprite01.x - 1, playerSprite01.y))
			{
				playerSprite01.x -= 2;
				moveGameCharacter(&playerSprite01, playerSprite01.x, playerSprite01.y);
			}
		}

		if(keyPressed(J_RIGHT))
		{
			if(canPlayerMove(playerSprite01.x + 16, playerSprite01.y))
			{
				playerSprite01.x += 2;
				moveGameCharacter(&playerSprite01, playerSprite01.x, playerSprite01.y);
			}
		}
				
		performantDelay(1);
	}
}
