#include <gb/gb.h>
#include <stdio.h>

// performantDelay(): Delay to free up CPU usage
void performantDelay(UINT8 numloops){

	UINT8 i;
	for(i=0;i<numloops;i++){
		wait_vbl_done();
	}
}


void main(){

	performantDelay(5);
}
