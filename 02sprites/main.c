#include <gb/gb.h>
#include <stdio.h>
#include "spritePac.c"

void performantDelay(UINT8 numloops){

	UINT8 i;
	for(i=0;i<numloops;i++){
		wait_vbl_done();
	}
}
void main(){
    UINT8 currentSpriteIndex = 0;

    set_sprite_data(0, 2, pacMan);//set_sprite_data(starts of tile, how manytiles, name of variable sprite)
    set_sprite_tile(0, 0);//set_sprite_tile(tile number to load, sprite index if more than one tile can change)
    move_sprite(0, 88, 78);//move_sprite(sprite ID, x, y)
    SHOW_SPRITES;
    
    while(1){
	if(currentSpriteIndex == 0){
	    currentSpriteIndex = 1;
	}
	else{
	    currentSpriteIndex = 0;
	}
	set_sprite_tile(0, currentSpriteIndex);

	performantDelay(4);
	scroll_sprite(0, 1, 0);

	wait_vbl_done();
//	scroll_sprite(0, 1, 0);
    }
}

