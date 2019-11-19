;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 19 2016) (Linux)
; This file was generated Fri Nov 15 10:40:49 2019
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _performantDelay
	.globl _scroll_sprite
	.globl _move_sprite
	.globl _set_sprite_tile
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl _pacMan
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_pacMan::
	.ds 32
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
;spritePac.c:26: unsigned char pacMan[] =
	ld	hl,#_pacMan
	ld	(hl),#0x3C
	ld	hl,#(_pacMan + 0x0001)
	ld	(hl),#0x3C
	ld	hl,#(_pacMan + 0x0002)
	ld	(hl),#0x7E
	ld	hl,#(_pacMan + 0x0003)
	ld	(hl),#0x42
	ld	hl,#(_pacMan + 0x0004)
	ld	(hl),#0xFF
	ld	hl,#(_pacMan + 0x0005)
	ld	(hl),#0x91
	ld	hl,#(_pacMan + 0x0006)
	ld	(hl),#0xFF
	ld	hl,#(_pacMan + 0x0007)
	ld	(hl),#0x81
	ld	hl,#(_pacMan + 0x0008)
	ld	(hl),#0xFF
	ld	hl,#(_pacMan + 0x0009)
	ld	(hl),#0x8F
	ld	hl,#(_pacMan + 0x000a)
	ld	(hl),#0xFF
	ld	hl,#(_pacMan + 0x000b)
	ld	(hl),#0x81
	ld	hl,#(_pacMan + 0x000c)
	ld	(hl),#0x7E
	ld	hl,#(_pacMan + 0x000d)
	ld	(hl),#0x42
	ld	hl,#(_pacMan + 0x000e)
	ld	(hl),#0x3C
	ld	hl,#(_pacMan + 0x000f)
	ld	(hl),#0x3C
	ld	hl,#(_pacMan + 0x0010)
	ld	(hl),#0x3C
	ld	hl,#(_pacMan + 0x0011)
	ld	(hl),#0x3C
	ld	hl,#(_pacMan + 0x0012)
	ld	(hl),#0x7E
	ld	hl,#(_pacMan + 0x0013)
	ld	(hl),#0x42
	ld	hl,#(_pacMan + 0x0014)
	ld	(hl),#0xFF
	ld	hl,#(_pacMan + 0x0015)
	ld	(hl),#0x91
	ld	hl,#(_pacMan + 0x0016)
	ld	(hl),#0xFE
	ld	hl,#(_pacMan + 0x0017)
	ld	(hl),#0x86
	ld	hl,#(_pacMan + 0x0018)
	ld	(hl),#0xF0
	ld	hl,#(_pacMan + 0x0019)
	ld	(hl),#0x90
	ld	hl,#(_pacMan + 0x001a)
	ld	(hl),#0xF8
	ld	hl,#(_pacMan + 0x001b)
	ld	(hl),#0x88
	ld	hl,#(_pacMan + 0x001c)
	ld	(hl),#0x7C
	ld	hl,#(_pacMan + 0x001d)
	ld	(hl),#0x44
	ld	hl,#(_pacMan + 0x001e)
	ld	(hl),#0x38
	ld	hl,#(_pacMan + 0x001f)
	ld	(hl),#0x38
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:5: void performantDelay(UINT8 numloops){
;	---------------------------------
; Function performantDelay
; ---------------------------------
_performantDelay::
;main.c:8: for(i=0;i<numloops;i++){
	ld	b,#0x00
00103$:
	ld	a,b
	ldhl	sp,#2
	sub	a, (hl)
	ret	NC
;main.c:9: wait_vbl_done();
	push	bc
	call	_wait_vbl_done
	pop	bc
;main.c:8: for(i=0;i<numloops;i++){
	inc	b
	jr	00103$
	ret
;main.c:12: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:13: UINT8 currentSpriteIndex = 0;
	ld	b,#0x00
;main.c:15: set_sprite_data(0, 2, pacMan);//set_sprite_data(starts of tile, how manytiles, name of variable sprite)
	ld	de,#_pacMan
	push	bc
	push	de
	ld	hl,#0x0200
	push	hl
	call	_set_sprite_data
	add	sp, #4
	pop	bc
;main.c:16: set_sprite_tile(0, 0);//set_sprite_tile(tile number to load, sprite index if more than one tile can change)
	push	bc
	ld	hl,#0x0000
	push	hl
	call	_set_sprite_tile
	add	sp, #2
	pop	bc
;main.c:17: move_sprite(0, 88, 78);//move_sprite(sprite ID, x, y)
	push	bc
	ld	hl,#0x4E58
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
	pop	bc
;main.c:18: SHOW_SPRITES;
	ld	de,#0xFF40
	ld	a,(de)
	ld	e,a
	ld	d,#0x00
	ld	a,e
	set	1, a
	ld	c,a
	ld	hl,#0xFF40
	ld	(hl),c
;main.c:20: while(1){
00105$:
;main.c:21: if(currentSpriteIndex == 0){
	ld	a,b
	or	a, a
	jr	NZ,00102$
;main.c:22: currentSpriteIndex = 1;
	ld	b,#0x01
	jr	00103$
00102$:
;main.c:25: currentSpriteIndex = 0;
	ld	b,#0x00
00103$:
;main.c:27: set_sprite_tile(0, currentSpriteIndex);
	push	bc
	push	bc
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_tile
	add	sp, #2
	pop	bc
;main.c:29: performantDelay(4);
	push	bc
	ld	a,#0x04
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
	pop	bc
;main.c:30: scroll_sprite(0, 1, 0);
	push	bc
	ld	hl,#0x0001
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_scroll_sprite
	add	sp, #3
	pop	bc
;main.c:32: wait_vbl_done();
	push	bc
	call	_wait_vbl_done
	pop	bc
	jp	00105$
	ret
	.area _CODE
	.area _CABS (ABS)
