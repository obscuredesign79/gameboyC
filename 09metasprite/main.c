#include <gb/gb.h>
#include <stdio.h>
#include "gameCharacter.c"
#include "gameSprite.c"

struct gameCharacter ingot;
struct gameCharacter mata;
UBYTE spriteSize=8;

void performantDelay(UINT8 numloops){

	UINT8 i;
	for(i=0;i<numloops;i++){
		wait_vbl_done();
	}
}

void moveGameCharacter(struct gameCharacter* character, UINT8 x, UINT8 y){
	move_sprite(character->spriteId[0],x,y);
	move_sprite(character->spriteId[1],x+spriteSize,y);
	move_sprite(character->spriteId[2],x,y+spriteSize);
	move_sprite(character->spriteId[3],x+spriteSize,y+spriteSize);
	
}

void setupIngot(){
	ingot.x=80;
	ingot.y=130;
	ingot.width=16;
	ingot.height=16;

	set_sprite_tile(0,0);
	ingot.spriteId[0]=0;
	set_sprite_tile(1,1);
	ingot.spriteId[1]=1;
	set_sprite_tile(2,2);
	ingot.spriteId[2]=2;
	set_sprite_tile(3,3);
	ingot.spriteId[3]=3;

	moveGameCharacter(&ingot,ingot.x,ingot.y);
}

void setupMata(){
	mata.x=30;
	mata.y=0;
	mata.width=16;
	mata.height=16;

	set_sprite_tile(4,4);
	mata.spriteId[0]=4;
	set_sprite_tile(5,5);
	mata.spriteId[1]=5;
	set_sprite_tile(6,6);
	mata.spriteId[2]=6;
	set_sprite_tile(7,7);
	mata.spriteId[3]=7;

	moveGameCharacter(&mata,mata.x,mata.y);
}
void main(){
	set_sprite_data(0,8,gameSprite);
	setupIngot();
	setupMata();

	SHOW_SPRITES;
	DISPLAY_ON;

	while(1){
		if(joypad() & J_LEFT){
			ingot.x -= 4;
			moveGameCharacter(&ingot,ingot.x,ingot.y);
		}

		if(joypad() & J_RIGHT){
			ingot.x += 4;
			moveGameCharacter(&ingot,ingot.x,ingot.y);
		}

		mata.y+=5;
		moveGameCharacter(&mata,mata.x,mata.y);

		if(mata.y>=144){
			mata.y=0;
			mata.x=ingot.x;
		}


		performantDelay(2);
	}
}
