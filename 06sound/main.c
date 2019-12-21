#include <gb/gb.h>
#include <stdio.h>

void performantDelay(UINT8 numloops){

	UINT8 i;
	for(i=0;i<numloops;i++){
		wait_vbl_done();
	}
}
void main(){

	//these registers must be in this specific order!
	NR52_REG = 0x80;//is 1000 0000 in binary and turns on sound
	NR50_REG = 0x77;//sets the volume for both left and right channel and just set to the max 0x77
	NR51_REG = 0xFF;//is 1111 1111 in binary, select which channels we want to use in this case, all of them. One bit for the L one bit for the R of all four channels.


	while(1){
		UBYTE joypad_state = joypad();

		if(joypad_state){ 
			//channel 1 register 0, Frequency sweep settings
			//7 unused
			//6-4 Sweep time(update rate) (if 0, sweeping is off)
			//3 Sweep direction(1: decrease, 0: increase)
			//2-0 Sweep RtShift amount(if 0, sweeping is off)
			// 0001 0110 is 0x16, sweep time 1, sweep direction increase, shift amount per step 110(6 decimal)
			NR10_REG = 0x16;
			NR11_REG = 0x40;
			NR12_REG = 0x73;
			NR13_REG = 0x00;
			NR14_REG = 0xc3;

		}

	performantDelay(1);
	}

}
