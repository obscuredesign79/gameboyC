#include <gb/gb.h>
#include "gameSprite.c"

void performantDelay(UINT8 numloops){

	UINT8 i;
	for(i=0;i<numloops;i++){
		wait_vbl_done();
	}
}

void main(){
	set_sprite_data(0, 5, sprite);

	set_sprite_tile(1, 1);
	set_sprite_tile(2, 2);
	
	set_sprite_tile(3, 3);
	set_sprite_tile(4, 4);
	
	move_sprite(1, 75, 75);
	move_sprite(2, 75, 75+8);


	SHOW_SPRITES;

	while(1){
		set_sprite_tile(1, 3);
		set_sprite_tile(2, 4);
		performantDelay(5);

		set_sprite_tile(1, 1);
		set_sprite_tile(2, 2);
		performantDelay(5);
	
	}
}

