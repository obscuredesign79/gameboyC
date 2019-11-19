#include <gb/gb.h>
#include <stdio.h>

void performantDelay(UINT8 numloops){

	UINT8 i;
	for(i=0;i<numloops;i++){
		wait_vbl_done();
	}
}


void main() {
	INT8 a=1;
	INT8 b=2;
	INT8 c;

	c=a+b;

	printf("a=%x\n",a);
	printf("b=%x\n",b);

    printf("a + b = %x",c); 
	performantDelay(5);
}
