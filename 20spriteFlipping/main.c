#include <gb/gb.h>
#include "playerSprite.c"
#include "levelTile.c"
#include "levelMap.c"

// performantDelay(): Delay to free up CPU usage
void performantDelay(UINT8 numloops){

	UINT8 i;
	for(i=0;i<numloops;i++){
		wait_vbl_done();
	}
}


void main(){

	set_bkg_data(0, 3, levelTile);
	set_bkg_tiles(0, 0, 20, 18, levelMap);

	set_sprite_data(0, 2, playerSprite);

	set_sprite_tile(0, 1);

	move_sprite(0, 8, 16);

	set_sprite_prop(0, S_FLIPY);

	SHOW_SPRITES;
	SHOW_BKG;

	performantDelay(1);
}
