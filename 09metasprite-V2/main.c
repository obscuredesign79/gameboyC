#include <stdio.h>
#include <gb/gb.h>
#include "keys.h"
#include "playerTile.c"
#include "level01Tile.c"
#include "level01Map.c"

const char blankMap[5] = {0x00,0x01,0x02,0x03,0x04};
//volatile variable (RAM)
UINT8 index;
UINT8 timerLocal;
UINT8 timerKeyR;
UINT8 timerKeyL;

void slowDown(UINT8 steps)
{
	UINT8 i;
//	UINT8 junk;

//	junk = 0;

	for(i = 0; i < steps; i++)
	{
//		junk++;
	}
}
void performantDelay(UINT8 numLoops)
{
	UINT8 i;
	for(i = 0; i < numLoops; i++)
	{
		slowDown(255);
	}
}


//player struct
struct gamePlayer
{
	UBYTE spriteId[4];//change this according to sprite size (16x16, 24x24..)
	UINT8 x;
	UINT8 y;
	UINT8 width;
	UINT8 height;
};
// assign struct gamePlayer to player
struct gamePlayer player;

//player animation fuction flag(frame number start, inbetween frame number, frame number ends, first frame, second frame)
void playerAnimation(UINT8 fStart, UINT8 fMid, UINT8 fEnd, UINT8 a0, UINT8 b0, UINT8 numLoops)
{
	if(timerLocal == fStart)
	{
		set_sprite_tile(0, a0);
		set_sprite_tile(1, a0 + 1);
		set_sprite_tile(2, a0 + 2);
		set_sprite_tile(3, a0 + 3);
		performantDelay(numLoops);
	}
	else if(timerLocal == fMid)
	{
		set_sprite_tile(0, b0);
		set_sprite_tile(1, b0 + 1);
		set_sprite_tile(2, b0 + 2);
		set_sprite_tile(3, b0 + 3);
		performantDelay(numLoops);
	}
	else if(timerLocal == fEnd)
	{
		timerLocal = 0;
		performantDelay(numLoops);
	}
	timerLocal++;
}
//moving a 16x16 metaSprite to right in unison
void movePlayerR(struct gamePlayer *character, UINT8 x, UINT8 y)
{
	UINT8 i;

	move_sprite(character->spriteId[0],x, y);
	move_sprite(character->spriteId[1],x + 8, y); 
	move_sprite(character->spriteId[2],x, y + 8);
	move_sprite(character->spriteId[3],x + 8, y + 8);

	for(i = 0;i < 4;i++)
	{
	set_sprite_prop(character->spriteId[i], get_sprite_prop(i) & ~S_FLIPX);
	}
}
//moving a 16x16 metaSprite to left in unison
void movePlayerL(struct gamePlayer *character, UINT8 x, UINT8 y)
{																		
	UINT8 i;

	move_sprite(character->spriteId[0],x + 8, y);		
	move_sprite(character->spriteId[1],x, y);			
	move_sprite(character->spriteId[2],x + 8, y + 8);
	move_sprite(character->spriteId[3],x, y + 8);

	for(i = 0;i < 4;i++)
	{
	set_sprite_prop(character->spriteId[i], S_FLIPX);
	}
}


//setup the player sprite struct
void setupPlayer()
{
	UINT8 i;
	UINT8 j;

	set_sprite_data(0, 20, playerTile);
	
	player.x= 24;
	player.y = 112;
	player.width = 16;
	player.height = 16;

	for(i = 0; i < 4; i++)
	{
	player.spriteId[i]=i;
	}

	for(j = 0; j < 4; j++)
	{
	set_sprite_prop(i, S_PALETTE);//using palette OBP1_REG
	}
}

UBYTE playerToBGCollision(UINT8 playerLocX, UINT8 playerLocY)
{
	UINT16 indexTlX, indexTlY, tileIndex;
	UBYTE result;

	indexTlX = (playerLocX - 8) / 8;
	indexTlY = (playerLocY - 16) / 8;
	tileIndex = 20 * indexTlY + indexTlX;

	if(level01Map[tileIndex] == blankMap[0] || level01Map[tileIndex] == blankMap[1] || level01Map[tileIndex] == blankMap[2] || level01Map[tileIndex] == blankMap[3] || level01Map[tileIndex] == blankMap[4]) 
	{
		result = 1;
	}
	else
	{
		result = 0;
	}
	return result;
}



void main()
{
	set_bkg_data(0, 11, level01Tile);
	set_bkg_tiles(0, 0, 20, 18, level01Map);
	setupPlayer();
	//set the palette for the tiles
	OBP0_REG = 0xE1;
	OBP1_REG = 0xE0;


	timerLocal = 0;
	timerKeyR = 0;
	timerKeyL = 0;

	SHOW_BKG;
	SHOW_SPRITES;
	DISPLAY_ON;

	movePlayerR(&player, player.x, player.y);


	while(1)
	{
		playerAnimation(1, 10, 20, 0, 4, 8);
		UPDATE_KEYS();

		if(KEY_PRESSED(J_RIGHT))
		{
			timerLocal = 0;
			if(playerToBGCollision(player.x + 17, player.y))
					{
						timerKeyR++;

						if(timerKeyR == 1)
						{
							for(index = 0; index < 8; index++)
							{
								player.x++;
								movePlayerR(&player, player.x, player.y);
								playerAnimation(1, 5, 10, 0, 8, 8);
								performantDelay(1);
							}
						}
						else if(timerKeyR == 2)
						{
							timerKeyR = 0;
						}
					}
		}
		else if(KEY_RELEASED(J_RIGHT))
		{
			timerLocal = 0;
			timerKeyR = 0;
		}


		if(KEY_PRESSED(J_LEFT))
		{
			if(playerToBGCollision(player.x - 1, player.y))
					{
						timerKeyL++;

						if(timerKeyL == 1)
						{
							for(index = 0; index < 8; index++)
							{
								player.x--;
								movePlayerL(&player, player.x, player.y);
								playerAnimation(1, 5, 10, 0, 8, 8);
								performantDelay(1);
							}
						}
						else if(timerKeyL == 2) 
						{
							timerKeyL = 0;
						}
					}
		}
		else if(KEY_RELEASED(J_LEFT))
		{
			timerLocal = 0;
			timerKeyL = 0;
		}




//		performantDelay(1);
		wait_vbl_done();
	}

}
