;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 19 2016) (Linux)
; This file was generated Sat Nov 16 13:31:54 2019
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _performantDelay
	.globl _move_sprite
	.globl _set_sprite_tile
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl _sprite
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_sprite::
	.ds 80
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
;gameSprite.c:26: unsigned char sprite[] =
	ld	hl,#_sprite
	ld	(hl),#0x00
	ld	bc,#_sprite + 1
	xor	a, a
	ld	(bc),a
	ld	bc,#_sprite + 2
	xor	a, a
	ld	(bc),a
	ld	bc,#_sprite + 3
	xor	a, a
	ld	(bc),a
	ld	bc,#_sprite + 4
	xor	a, a
	ld	(bc),a
	ld	bc,#_sprite + 5
	xor	a, a
	ld	(bc),a
	ld	bc,#_sprite + 6
	xor	a, a
	ld	(bc),a
	ld	bc,#_sprite + 7
	xor	a, a
	ld	(bc),a
	ld	bc,#_sprite + 8
	xor	a, a
	ld	(bc),a
	ld	bc,#_sprite + 9
	xor	a, a
	ld	(bc),a
	ld	bc,#_sprite + 10
	xor	a, a
	ld	(bc),a
	ld	bc,#_sprite + 11
	xor	a, a
	ld	(bc),a
	ld	bc,#_sprite + 12
	xor	a, a
	ld	(bc),a
	ld	bc,#_sprite + 13
	xor	a, a
	ld	(bc),a
	ld	bc,#_sprite + 14
	xor	a, a
	ld	(bc),a
	ld	bc,#_sprite + 15
	xor	a, a
	ld	(bc),a
	ld	hl,#(_sprite + 0x0010)
	ld	(hl),#0x18
	ld	hl,#(_sprite + 0x0011)
	ld	(hl),#0x18
	ld	hl,#(_sprite + 0x0012)
	ld	(hl),#0x18
	ld	hl,#(_sprite + 0x0013)
	ld	(hl),#0x18
	ld	hl,#(_sprite + 0x0014)
	ld	(hl),#0xE7
	ld	hl,#(_sprite + 0x0015)
	ld	(hl),#0xFF
	ld	hl,#(_sprite + 0x0016)
	ld	(hl),#0x24
	ld	hl,#(_sprite + 0x0017)
	ld	(hl),#0x3C
	ld	hl,#(_sprite + 0x0018)
	ld	(hl),#0x42
	ld	hl,#(_sprite + 0x0019)
	ld	(hl),#0x7E
	ld	hl,#(_sprite + 0x001a)
	ld	(hl),#0x42
	ld	hl,#(_sprite + 0x001b)
	ld	(hl),#0x7E
	ld	hl,#(_sprite + 0x001c)
	ld	(hl),#0x99
	ld	hl,#(_sprite + 0x001d)
	ld	(hl),#0xFF
	ld	hl,#(_sprite + 0x001e)
	ld	(hl),#0xBD
	ld	hl,#(_sprite + 0x001f)
	ld	(hl),#0xE7
	ld	hl,#(_sprite + 0x0020)
	ld	(hl),#0xBD
	ld	hl,#(_sprite + 0x0021)
	ld	(hl),#0xE7
	ld	hl,#(_sprite + 0x0022)
	ld	(hl),#0x9A
	ld	hl,#(_sprite + 0x0023)
	ld	(hl),#0xFE
	ld	hl,#(_sprite + 0x0024)
	ld	(hl),#0x42
	ld	hl,#(_sprite + 0x0025)
	ld	(hl),#0x7E
	ld	hl,#(_sprite + 0x0026)
	ld	(hl),#0x44
	ld	hl,#(_sprite + 0x0027)
	ld	(hl),#0x7C
	ld	hl,#(_sprite + 0x0028)
	ld	(hl),#0x24
	ld	hl,#(_sprite + 0x0029)
	ld	(hl),#0x3C
	ld	hl,#(_sprite + 0x002a)
	ld	(hl),#0x66
	ld	hl,#(_sprite + 0x002b)
	ld	(hl),#0x7E
	ld	hl,#(_sprite + 0x002c)
	ld	(hl),#0x99
	ld	hl,#(_sprite + 0x002d)
	ld	(hl),#0x99
	ld	hl,#(_sprite + 0x002e)
	ld	(hl),#0x18
	ld	hl,#(_sprite + 0x002f)
	ld	(hl),#0x18
	ld	hl,#(_sprite + 0x0030)
	ld	(hl),#0x99
	ld	hl,#(_sprite + 0x0031)
	ld	(hl),#0x99
	ld	hl,#(_sprite + 0x0032)
	ld	(hl),#0x5A
	ld	hl,#(_sprite + 0x0033)
	ld	(hl),#0x5A
	ld	hl,#(_sprite + 0x0034)
	ld	(hl),#0x24
	ld	hl,#(_sprite + 0x0035)
	ld	(hl),#0x3C
	ld	hl,#(_sprite + 0x0036)
	ld	(hl),#0x24
	ld	hl,#(_sprite + 0x0037)
	ld	(hl),#0x3C
	ld	hl,#(_sprite + 0x0038)
	ld	(hl),#0x42
	ld	hl,#(_sprite + 0x0039)
	ld	(hl),#0x7E
	ld	hl,#(_sprite + 0x003a)
	ld	(hl),#0x42
	ld	hl,#(_sprite + 0x003b)
	ld	(hl),#0x7E
	ld	hl,#(_sprite + 0x003c)
	ld	(hl),#0x99
	ld	hl,#(_sprite + 0x003d)
	ld	(hl),#0xFF
	ld	hl,#(_sprite + 0x003e)
	ld	(hl),#0xBD
	ld	hl,#(_sprite + 0x003f)
	ld	(hl),#0xE7
	ld	hl,#(_sprite + 0x0040)
	ld	(hl),#0xBD
	ld	hl,#(_sprite + 0x0041)
	ld	(hl),#0xE7
	ld	hl,#(_sprite + 0x0042)
	ld	(hl),#0x9A
	ld	hl,#(_sprite + 0x0043)
	ld	(hl),#0xFE
	ld	hl,#(_sprite + 0x0044)
	ld	(hl),#0x42
	ld	hl,#(_sprite + 0x0045)
	ld	(hl),#0x7E
	ld	hl,#(_sprite + 0x0046)
	ld	(hl),#0x44
	ld	hl,#(_sprite + 0x0047)
	ld	(hl),#0x7C
	ld	hl,#(_sprite + 0x0048)
	ld	(hl),#0x24
	ld	hl,#(_sprite + 0x0049)
	ld	(hl),#0x3C
	ld	hl,#(_sprite + 0x004a)
	ld	(hl),#0x66
	ld	hl,#(_sprite + 0x004b)
	ld	(hl),#0x7E
	ld	hl,#(_sprite + 0x004c)
	ld	(hl),#0x5A
	ld	hl,#(_sprite + 0x004d)
	ld	(hl),#0x5A
	ld	hl,#(_sprite + 0x004e)
	ld	(hl),#0x5A
	ld	hl,#(_sprite + 0x004f)
	ld	(hl),#0x5A
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
	ld	b,#0x00
00103$:
	ld	a,b
	ldhl	sp,#2
	sub	a, (hl)
	ret	NC
;main.c:8: wait_vbl_done();
	push	bc
	call	_wait_vbl_done
	pop	bc
;main.c:7: for(i=0;i<numloops;i++){
	inc	b
	jr	00103$
	ret
;main.c:12: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:13: set_sprite_data(0, 5, sprite);
	ld	de,#_sprite+0
	push	de
	ld	hl,#0x0500
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:15: set_sprite_tile(1, 1);
	ld	hl,#0x0101
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:16: set_sprite_tile(2, 2);
	ld	hl,#0x0202
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:18: set_sprite_tile(3, 3);
	ld	hl,#0x0303
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:19: set_sprite_tile(4, 4);
	ld	hl,#0x0404
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:21: move_sprite(1, 75, 75);
	ld	hl,#0x4B4B
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:22: move_sprite(2, 75, 75+8);
	ld	hl,#0x534B
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:25: SHOW_SPRITES;
	ld	de,#0xFF40
	ld	a,(de)
	ld	d,a
	ld	e,#0x00
	ld	a,d
	set	1, a
	ld	b,a
	ld	hl,#0xFF40
	ld	(hl),b
;main.c:27: while(1){
00102$:
;main.c:28: set_sprite_tile(1, 3);
	ld	hl,#0x0301
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:29: set_sprite_tile(2, 4);
	ld	hl,#0x0402
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:30: performantDelay(5);
	ld	a,#0x05
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
;main.c:32: set_sprite_tile(1, 1);
	ld	hl,#0x0101
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:33: set_sprite_tile(2, 2);
	ld	hl,#0x0202
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:34: performantDelay(5);
	ld	a,#0x05
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
	jr	00102$
	ret
	.area _CODE
	.area _CABS (ABS)
