#include <gb/gb.h>
#include <stdio.h>

// stores two INT8 x and y position of player
INT8 playerLocation[2];
BYTE jumping;
INT8 gravity=-2;
UINT8 currentSpeedY;
UINT8 floorYPosition=100;


unsigned char bloke2[] =
{
  0x7E,0x7E,0x81,0xFF,0x00,0xFF,0x1C,0xE7,
  0x1C,0xE3,0x00,0xFE,0x1E,0x7E,0x3F,0x3F
};
unsigned char bloke1[] =
{
    0x00,0x00,0x38,0x38,0x7C,0x44,0x7F,0x7F,
    0x44,0x74,0x46,0x7C,0x40,0x78,0x24,0x3C,
    0x18,0x3C,0x00,0x24,0x00,0x24,0x00,0x24,
    0x00,0x24,0x00,0x36,0x00,0x00,0x00,0x00,
    0x00,0x00,0x38,0x38,0x7C,0x44,0x7F,0x7F,
    0x44,0x74,0x46,0x7C,0x40,0x78,0x24,0x3C,
    0x18,0x3C,0x00,0x22,0x00,0x22,0x00,0x22,
    0x00,0x23,0x00,0x30,0x00,0x00,0x00,0x00,
    0x00,0x00,0x38,0x38,0x7C,0x44,0x7F,0x7F,
    0x44,0x74,0x46,0x7C,0x40,0x78,0x24,0x3C,
    0x18,0x3C,0x00,0x42,0x00,0x42,0x00,0x42,
    0x00,0x42,0x00,0x63,0x00,0x00,0x00,0x00,
    0x00,0x00,0x38,0x38,0x7C,0x44,0x7F,0x7F,
    0x44,0x74,0x46,0x7C,0x40,0x78,0x24,0x3C,
    0x18,0x3C,0x00,0x44,0x00,0x44,0x00,0x44,
    0x00,0x64,0x00,0x06,0x00,0x00,0x00,0x00
};

void performantDelay(UINT8 numloops){

	UINT8 i;
	for(i=0;i<numloops;i++){
		wait_vbl_done();
	}
}

INT8 wouldHitSurf(UINT8 projectedYPosition){
	if(projectedYPosition>=floorYPosition){
		return floorYPosition;
	}
	return -1;
				
			}
void jump(UINT8 spriteId,UINT8 spriteLocation[2]){
	INT8 possibleSurfaceY;

	if(jumping==0){
		jumping=1;
		currentSpeedY=15;
	}

	currentSpeedY=currentSpeedY+gravity;

	spriteLocation[1]=spriteLocation[1]-currentSpeedY;
	possibleSurfaceY=wouldHitSurf(spriteLocation[1]);

	if(possibleSurfaceY != -1){
		jumping=0;
		move_sprite(spriteId,spriteLocation[0],possibleSurfaceY);
	}
	else{
		
		move_sprite(spriteId,spriteLocation[0],spriteLocation[1]);
	}

}
void main(){

	set_sprite_data(0,8,bloke1);//(first tile,last tile,char name) 
	set_sprite_tile(1,0);//(sprite tile number used,sprite ID)
	
	set_sprite_data(0,0,bloke2);
	set_sprite_tile(0,1);

	playerLocation[0]=10;
	playerLocation[1]=floorYPosition;
	jumping=0;

	move_sprite(0,playerLocation[0],playerLocation[1]);
	move_sprite(1,20,100);//(sprite ID,x location,y location)

	DISPLAY_ON;
	SHOW_SPRITES;

	while(1){
		if((joypad() & J_A)|| jumping==1){
			jump(0,playerLocation);	
		}
		if(joypad() & J_LEFT){
			playerLocation[0]=playerLocation[0]-2;
			move_sprite(0,playerLocation[0],playerLocation[1]);
		}
		if(joypad() & J_RIGHT){
			playerLocation[0]=playerLocation[0]+2;
			move_sprite(0,playerLocation[0],playerLocation[1]);
		}

		performantDelay(2);
	}

}

		



