#include <stdio.h>
#include <gb/gb.h>
#include "keys.h"
#include "playerTile.c"
#include "level01Tile.c"
#include "level01Map.c"

const char blankMap[10] = {0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09};
const INT8 gravity = 2;
//volatile variable (RAM)
UINT8 index;
UINT8 timerLocal;
UINT8 timerKey;
UINT8 playerDir;
UINT8 falling;

void performantDelay(UINT8 numLoops)
{
	UINT8 i;
	for(i = 0; i < numLoops; i++)
	{
		wait_vbl_done();
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

	set_sprite_data(0, 28, playerTile);
	
	player.x= 8;
	player.y = 24;
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

UBYTE playerToBGCollision(UINT8 playerLocX, UINT8 playerLocY, UBYTE opCollision)
{
	UINT16 indexTlX, indexTlY, tileIndex;
	UBYTE result;

	indexTlX = (playerLocX - 8) / 8;
	indexTlY = (playerLocY - 16) / 8;
	tileIndex = 21 * indexTlY + indexTlX;

	if(opCollision == 0)
	{
		if(level01Map[tileIndex] == blankMap[0] || level01Map[tileIndex] == blankMap[1] || level01Map[tileIndex] == blankMap[2] || level01Map[tileIndex] == blankMap[3] || level01Map[tileIndex] == blankMap[4]) 
		{
			result = 1;
		}
		else
		{
			result = 0;
		}
	}
	else if(opCollision == 1)
	{
		if(level01Map[tileIndex] == blankMap[5] || level01Map[tileIndex] == blankMap[6] || level01Map[tileIndex] == blankMap[7] || level01Map[tileIndex] == blankMap[8] || level01Map[tileIndex] == blankMap[9]) 
		{
			result = 1;
		}
		else
		{
			result = 0;
		}
	}
	return result;
}



void main()
{
	set_bkg_data(0, 13, level01Tile);
	set_bkg_tiles(0, 0, 21, 18, level01Map);
	setupPlayer();
	//set the palette for the tiles
	OBP0_REG = 0xE1;
	OBP1_REG = 0xE0;



	SHOW_BKG;
	SHOW_SPRITES;
	DISPLAY_ON;

	movePlayerR(&player, player.x, player.y);
	playerDir = 0;


	while(1)
	{
		playerAnimation(1, 10, 20, 0, 4, 1);
		UPDATE_KEYS();
		falling = 0;

		if(playerToBGCollision(player.x, player.y + 16, 0))
				{
					player.y += gravity;
					if(playerDir == 0)
					{
						movePlayerR(&player, player.x, player.y);	
						falling = 1;
					}
					else
					{
						movePlayerL(&player, player.x, player.y);
						falling = 1;
					}
				}
		if(falling == 1)
		{
			playerAnimation(1, 1, 1, 16, 16, 1);
		}
		if(KEY_PRESSED(J_RIGHT))
		{
			if(falling == 0)
			{
				playerDir = 0;
				timerLocal = 0;
				timerKey = 0;
				if(playerToBGCollision(player.x + 16, player.y, 0))
				{
					timerKey++;

					if(timerKey == 1)
					{
						for(index = 0; index < 8; index++)
						{
							player.x++;
							movePlayerR(&player, player.x, player.y);
							playerAnimation(1, 7, 13, 0, 8, 1);
							performantDelay(1);
						}
					}
					else if(timerKey == 4)
					{
						timerKey = 0;
					}
				}
				if(KEY_PRESSED(J_B))
				{
					timerLocal = 0;
					timerKey = 0;
					if(playerToBGCollision(player.x + 24, player.y, 0))
							{
								timerKey++;
								if(timerKey == 1)
								{

									for(index = 0; index < 8; index++) 
									{
										playerAnimation(1, 5, 7, 16, 4, 1);
										player.x++;
										player.x++;
										movePlayerR(&player, player.x, player.y);
										performantDelay(1);
									}
								}
								else if(timerKey == 2)
								{
									timerKey = 0;
								}
										
										
							}
				}
				if(playerToBGCollision(player.x + 24, player.y, 1))
				{
					playerAnimation(1, 7, 13, 20, 24, 1);
					performantDelay(1);
				}
			}
			else if(falling == 1)
			{
				
			}
		}


		if(KEY_PRESSED(J_LEFT))
		{
			if(falling == 0)
			{
				playerDir = 1;
				timerLocal = 0;
				timerKey = 0;
				if(playerToBGCollision(player.x - 8, player.y, 0))
						{
							timerKey++;

							if(timerKey == 1)
							{
								for(index = 0; index < 8; index++)
								{
									player.x--;
									movePlayerL(&player, player.x, player.y);
									playerAnimation(1, 7, 13, 0, 8, 1);
									performantDelay(1);
								}
							}
							else if(timerKey == 4) 
							{
								timerKey = 0;
							}
						}
				if(KEY_PRESSED(J_B))
				{
					timerLocal = 0;
					if(playerToBGCollision(player.x - 16, player.y, 0))
							{
								for(index = 0; index < 8; index++) {
									playerAnimation(1, 9, 10, 16, 4, 0);
									player.x--;
									player.x--;
									movePlayerL(&player, player.x, player.y);
									performantDelay(1);
								}
							}
				}
			}
			else if(falling == 1)
			{

			}
		}

		performantDelay(1);
	}

}
