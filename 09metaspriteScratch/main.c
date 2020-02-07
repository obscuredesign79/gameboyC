#include <gb/gb.h>
#include "gameTile.c"
UINT8 i;
UINT8 j;

void performantDelay(UINT8 numloops){

	UINT8 i;
	for(i=0;i<numloops;i++){
		wait_vbl_done();
	}
}


void main(){
	set_sprite_data(0, 5, gameTile);

	set_sprite_tile(0, 1);
	set_sprite_tile(1, 2);
	
	set_sprite_tile(2, 3);
	set_sprite_tile(3, 4);
	
	move_sprite(0, 75, 75);
	move_sprite(1, 75 + 8, 75);
	move_sprite(2, 75, 75 + 8);
	move_sprite(3, 75 + 8, 75 + 8);


	SHOW_SPRITES;

	while(1){
		performantDelay(1);
	
	}
}

