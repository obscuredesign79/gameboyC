#include <gb/gb.h>
//#include <stdio.h>
#include "spritePac.c"

void main(){
    UINT8 currentSpriteIndex = 0;

    set_sprite_data(0, 2, pacMan);
    set_sprite_tile(0, 1);
    move_sprite(0, 88, 78);
    SHOW_SPRITES;
    
    while(1){
	switch(joypad()){
	    case J_LEFT:
		scroll_sprite(0, -4, 0);
		break;
	
	    case J_RIGHT:
		scroll_sprite(0, 4, 0);
		break;
	
	    case J_UP:
		scroll_sprite(0, 0, -4);
		break;
	
	    case J_DOWN:
		scroll_sprite(0, 0, 4);
		break;
	}

	delay(50);
    }
}

