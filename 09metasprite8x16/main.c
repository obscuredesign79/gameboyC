#include <gb/gb.h>
#include "gameCharacter.c"
#include "gameSprite.c"

UINT8 timer = 0;

struct gameCharacter spider;

void performantDelay(UINT8 numloops){

	UINT8 i;
	for(i=0;i<numloops;i++){
		wait_vbl_done();
	}
}

// cycle through tiles for animation
void moveGameCharAnim(){
	
	if(timer == 5){
		set_sprite_tile(1, 3);
		set_sprite_tile(2, 4);
	}
	else if(timer == 10){
		set_sprite_tile(1, 1);
		set_sprite_tile(2, 2);
		timer = 0;
	}
	timer++;
}

void moveGameCharacter(struct gameCharacter *character, UINT8 x, UINT8 y){
	move_sprite(character->spriteId[1],x,y);
	move_sprite(character->spriteId[2],x,y + 8);

}

void setupSpider(){
	spider.x=80;
	spider.y=130;
	spider.width=8;
	spider.height=16;

	set_sprite_tile(0,0);
	spider.spriteId[0]=0;

	set_sprite_tile(1,1);
	spider.spriteId[1]=1;
	set_sprite_tile(2,2);
	spider.spriteId[2]=2;

//	set_sprite_tile(3,3);
//	spider.spriteId[3]=3;
//	set_sprite_tile(4,4);
//	spider.spriteId[4]=4;

	moveGameCharacter(&spider,spider.x,spider.y);
}

void main(){
	set_sprite_data(0,5,sprite);
	setupSpider();


	SHOW_SPRITES;
	DISPLAY_ON;


	while(1){
//		moveGameCharAnim();


		if(joypad() & J_LEFT){
			spider.x -= 2;
			moveGameCharacter(&spider,spider.x,spider.y);
			moveGameCharAnim();

		}

		if(joypad() & J_RIGHT){
			spider.x += 2;
			moveGameCharacter(&spider,spider.x,spider.y);
			moveGameCharAnim();
			
		}
		performantDelay(1);
	}
}
