#include <gb/gb.h>
#include <stdio.h>
#include "MazeSprites.c"
#include "MazeMap.c"
#include "Snail.c"

const char blankmap[1] = {0x00};
UINT8 playerlocation[2];

void performantdelay(UINT8 numloops){
    UINT8 i;
    for(i = 0; i < numloops; i++){
        wait_vbl_done();
    }     
}

UBYTE canPlayerMove(UINT8 newPlayerX, UINT8 newPlayerY){

	UINT16 indexTLx, indexTLy, tileIndexTL;
	UBYTE result;

	indexTLx = (newPlayerX - 8) / 8;
	indexTLy = (newPlayerY - 16) / 8;
	tileIndexTL = 20 * indexTLy + indexTLx;

	result = MazeMap[tileIndexTL] == blankmap[0];
	
	return result;
}

void animateSprite(UINT8 spriteIndex, INT8 moveX, INT8 moveY){
	while(moveX!=0){
		scroll_sprite(spriteIndex, moveX < 0 ? -1 : 1, 0);
		moveX += (moveX < 0 ? 2 : -2);
		wait_vbl_done();
	}
	while(moveY!=0){
		scroll_sprite(spriteIndex, 0, moveY < 0 ? -1 : 1);
		moveY += (moveY < 0 ? 1 : -1);
		wait_vbl_done();
		
	}
}


void main(){

    set_bkg_data(0, 4, MazeSprites);
    set_bkg_tiles(0, 0, 20, 18, MazeMap);

	set_sprite_data(0, 1, Snail);   /* defines the sprite data */
	set_sprite_tile(0,0);            /* defines the tiles numbers */

    playerlocation[0] = 16;
    playerlocation[1] = 24;

    move_sprite(0,playerlocation[0],playerlocation[1]);


    SHOW_SPRITES;
    SHOW_BKG;
    DISPLAY_ON;

    while(1){
        if(joypad() & J_LEFT){
			if(canPlayerMove(playerlocation[0]-8, playerlocation[1])){
				playerlocation[0] -= 8;
				animateSprite(0,-8,0);
			}
            
        }
        else if(joypad() & J_RIGHT){
			if(canPlayerMove(playerlocation[0]+8, playerlocation[1])){
				playerlocation[0] += 8;
				animateSprite(0,8,0);
			} 
        }
        else if(joypad() & J_UP){
			if(canPlayerMove(playerlocation[0], playerlocation[1]-8)){
				playerlocation[1] -= 8;
				animateSprite(0,0,-8);
			} 
        }
        else if(joypad() & J_DOWN){
			if(canPlayerMove(playerlocation[0], playerlocation[1]+8)){
				playerlocation[1] += 8;
				animateSprite(0,0,8);
			}
        }
        
        performantdelay(6);
    }
}
