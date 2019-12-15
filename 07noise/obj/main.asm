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
	.globl _joypad
	.globl _delay
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
;main.c:4: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:6: NR52_REG = 0x80;
	ld	hl,#0xff26
	ld	(hl),#0x80
;main.c:7: NR50_REG = 0x77;
	ld	l, #0x24
	ld	(hl),#0x77
;main.c:8: NR51_REG = 0xFF;
	ld	l, #0x25
	ld	(hl),#0xff
;main.c:10: while(1){
00104$:
;main.c:11: UBYTE joypad_state = joypad();
	call	_joypad
;main.c:13: if(joypad_state){ 
	ld	a,e
	or	a, a
	jr	Z,00104$
;main.c:14: NR41_REG = 0x1f;
	ld	hl,#0xff20
	ld	(hl),#0x1f
;main.c:15: NR42_REG = 0xf1;
	ld	l, #0x21
	ld	(hl),#0xf1
;main.c:16: NR43_REG = 0x30;
	ld	l, #0x22
	ld	(hl),#0x30
;main.c:17: NR44_REG = 0xc0;
	ld	l, #0x23
	ld	(hl),#0xc0
;main.c:19: delay(100);
	ld	hl,#0x0064
	push	hl
	call	_delay
	add	sp, #2
	jr	00104$
	ret
	.area _CODE
	.area _CABS (ABS)
