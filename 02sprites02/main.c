#include <gb/gb.h>
#include "smile.c"
#include "frown.c"

void performantDelay(UINT8 numloops)
{

	UINT8 i;
	for(i=0;i<numloops;i++)
	{
		wait_vbl_done();
	}
}
void main()
{
	SPRITES_8x16;

	set_sprite_data(0, 8, smile);
	set_sprite_tile(0, 0);
	move_sprite(0, 75, 75);
	set_sprite_tile(1, 2);
	move_sprite(1, 75 + 8, 75);

	set_sprite_data(8, 8, frown);
	set_sprite_tile(2, 8);
	move_sprite(2, 95, 75);
	set_sprite_tile(3, 10);
	move_sprite(3, 95 + 8, 75);

	SHOW_SPRITES;

	while(1)
	{
		set_sprite_tile(1, 6);
		set_sprite_tile(2, 12);
		set_sprite_tile(3, 14);
		performantDelay(10);
		set_sprite_tile(1, 2);
		set_sprite_tile(2, 8);
		set_sprite_tile(3, 10);
		performantDelay(10);
	}
	

}

