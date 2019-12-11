/*
   code by obscuredesign79
   A.K.A. Ayan

   Bryan Lorenzo
*/

#include <gb/gb.h>
#include "pomiSprite.c"

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
	UBYTE spriteId[9];
	UINT8 x;
	UINT8 y;
	UINT8 width;
	UINT8 height;
};
//inializes gameCharacter to pomi
struct gameCharacter pomi;
//cycle through tiles for animation
void gameCharAnim01(){
	
	if(timer == 8){
		set_sprite_tile(0, 0);
		set_sprite_tile(1, 0);
		set_sprite_tile(2, 0);

		set_sprite_tile(3, 7);
		set_sprite_tile(4, 8);
		set_sprite_tile(5, 9);
		
		set_sprite_tile(6, 10);
		set_sprite_tile(7, 11);
		set_sprite_tile(8, 12);
	}
	else if(timer == 16){
		set_sprite_tile(0, 0);
		set_sprite_tile(1, 0);
		set_sprite_tile(2, 0);

		set_sprite_tile(3, 1);
		set_sprite_tile(4, 2);
		set_sprite_tile(5, 3);
		
		set_sprite_tile(6, 4);
		set_sprite_tile(7, 5);
		set_sprite_tile(8, 6);
		timer = 0;
	}
	timer++;
}
//moving metaSprite in unison
void moveGameCharacter(struct gameCharacter *character, UINT8 x, UINT8 y){
	move_sprite(character->spriteId[0],x, y);
	move_sprite(character->spriteId[1],x + 8, y);
	move_sprite(character->spriteId[2],x + 16, y);
	move_sprite(character->spriteId[3],x, y + 8);
	move_sprite(character->spriteId[4],x + 8, y + 8);
	move_sprite(character->spriteId[5],x + 16, y + 8);
	move_sprite(character->spriteId[6],x, y + 16);
	move_sprite(character->spriteId[7],x + 8, y + 16);
	move_sprite(character->spriteId[8],x + 16, y + 16);

}
//setup the pomi sprite struct
void setupPomi(){
	set_sprite_data(0,13,pomiSprite);
	
	pomi.x=80;
	pomi.y=130;
	pomi.width=24;
	pomi.height=24;

	set_sprite_tile(0,0);
	pomi.spriteId[0]=0;
	set_sprite_tile(1,0);
	pomi.spriteId[1]=1;
	set_sprite_tile(2,0);
	pomi.spriteId[2]=2;

	set_sprite_tile(3,1);
	pomi.spriteId[3]=3;
	set_sprite_tile(4,2);
	pomi.spriteId[4]=4;
	set_sprite_tile(5,3);
	pomi.spriteId[5]=5;

	set_sprite_tile(6,4);
	pomi.spriteId[6]=6;
	set_sprite_tile(7,5);
	pomi.spriteId[7]=7;
	set_sprite_tile(8,6);
	pomi.spriteId[8]=8;
	moveGameCharacter(&pomi,pomi.x,pomi.y);
}

void main(){
	//loads pomi sprite
	setupPomi();

	SHOW_SPRITES;
	DISPLAY_ON;


	while(1){


		if(joypad() & J_LEFT && pomi.x > 8 - 2){
			pomi.x -= 1;
			moveGameCharacter(&pomi,pomi.x,pomi.y);
			gameCharAnim01();

		}

		if(joypad() & J_RIGHT && pomi.x < 160 - 14){
			pomi.x += 1;
			moveGameCharacter(&pomi,pomi.x,pomi.y);
			gameCharAnim01();
			
		}
		performantDelay(2);
	}
}
