;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _performantDelay
	.globl _wait_vbl_done
	.globl _joypad
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:4: void performantDelay(UINT8 numloops){
;	---------------------------------
; Function performantDelay
; ---------------------------------
_performantDelay::
;main.c:7: for(i=0;i<numloops;i++){
	ld	c,#0x00
00103$:
	ld	a,c
	ldhl	sp,#2
	sub	a, (hl)
	ret	NC
;main.c:8: wait_vbl_done();
	push	bc
	call	_wait_vbl_done
	pop	bc
;main.c:7: for(i=0;i<numloops;i++){
	inc	c
	jr	00103$
	ret
;main.c:11: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:14: NR52_REG = 0x80;//is 1000 0000 in binary and turns on sound
	ld	hl,#0xff26
	ld	(hl),#0x80
;main.c:15: NR50_REG = 0x77;//sets the volume for both left and right channel and just set to the max 0x77
	ld	l, #0x24
	ld	(hl),#0x77
;main.c:16: NR51_REG = 0xFF;//is 1111 1111 in binary, select which channels we want to use in this case, all of them. One bit for the L one bit for the R of all four channels.
	ld	l, #0x25
	ld	(hl),#0xff
;main.c:19: while(1){
00104$:
;main.c:20: UBYTE joypad_state = joypad();
	call	_joypad
;main.c:22: if(joypad_state){ 
	ld	a,e
	or	a, a
	jr	Z,00102$
;main.c:29: NR10_REG = 0x16;
	ld	hl,#0xff10
	ld	(hl),#0x16
;main.c:30: NR11_REG = 0x40;
	ld	l, #0x11
	ld	(hl),#0x40
;main.c:31: NR12_REG = 0x73;
	ld	l, #0x12
	ld	(hl),#0x73
;main.c:32: NR13_REG = 0x00;
	ld	l, #0x13
	ld	(hl),#0x00
;main.c:33: NR14_REG = 0xc3;
	ld	l, #0x14
	ld	(hl),#0xc3
00102$:
;main.c:37: performantDelay(2);
	ld	a,#0x02
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
	jr	00104$
	ret
	.area _CODE
	.area _CABS (ABS)
