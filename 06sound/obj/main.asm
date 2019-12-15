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
;main.c:13: NR52_REG = 0x80;
	ld	hl,#0xff26
	ld	(hl),#0x80
;main.c:14: NR50_REG = 0x77;
	ld	l, #0x24
	ld	(hl),#0x77
;main.c:15: NR51_REG = 0xFF;
	ld	l, #0x25
	ld	(hl),#0xff
;main.c:18: while(1){
00104$:
;main.c:19: UBYTE joypad_state = joypad();
	call	_joypad
;main.c:21: if(joypad_state){ 
	ld	a,e
	or	a, a
	jr	Z,00102$
;main.c:22: NR10_REG = 0x16;
	ld	hl,#0xff10
	ld	(hl),#0x16
;main.c:23: NR11_REG = 0x40;
	ld	l, #0x11
	ld	(hl),#0x40
;main.c:24: NR12_REG = 0x73;
	ld	l, #0x12
	ld	(hl),#0x73
;main.c:25: NR13_REG = 0x00;
	ld	l, #0x13
	ld	(hl),#0x00
;main.c:26: NR14_REG = 0xc3;
	ld	l, #0x14
	ld	(hl),#0xc3
00102$:
;main.c:30: performantDelay(5);
	ld	a,#0x05
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
	jr	00104$
	ret
	.area _CODE
	.area _CABS (ABS)
