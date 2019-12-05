/*
   code by obscuredesign79
   A.K.A. Ayan

   Bryan Lorenzo
*/

#include <gb/gb.h>
#include "gameSprite.c"

//global variables
UINT8 timer = 0;

//performance delay to free up CPU
void performantDelay(UINT8 numloops){

	UINT8 i;
	for(i=0;i<numloops;i++){
		wait_vbl_done();
	}
}
//gameCharacter struct
struct gameCharacter{
	UBYTE spriteId[5];
	UINT8 x;
	UINT8 y;
	UINT8 width;
	UINT8 height;
};
//inializes gameCharacter to spider
struct gameCharacter spider;
//cycle through tiles for animation
void gameCharAnim01(){
	
	if(timer == 30){
		set_sprite_tile(1, 3);
		set_sprite_tile(2, 4);
	}
	else if(timer == 60){
		set_sprite_tile(1, 1);
		set_sprite_tile(2, 2);
		timer = 0;
	}
	timer++;
}
//moving metaSprite in unison
void moveGameCharacter(struct gameCharacter *character, UINT8 x, UINT8 y){
	move_sprite(character->spriteId[1],x,y);
	move_sprite(character->spriteId[2],x,y + 8);

}
//setup the spider sprite struct
void setupSpider(){
	set_sprite_data(0,5,sprite);
	
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

	moveGameCharacter(&spider,spider.x,spider.y);
}

void main(){
	//loads spider sprite
	setupSpider();

	SHOW_SPRITES;
	DISPLAY_ON;


	while(1){
		gameCharAnim01();


		if(joypad() & J_LEFT && spider.x > 8){
			spider.x -= 3;
			moveGameCharacter(&spider,spider.x,spider.y);
			gameCharAnim01();

		}

		if(joypad() & J_RIGHT && spider.x < 160){
			spider.x += 3;
			moveGameCharacter(&spider,spider.x,spider.y);
			gameCharAnim01();
			
		}
		performantDelay(1);
	}
}
