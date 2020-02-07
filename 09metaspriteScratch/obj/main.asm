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
	.globl _move_sprite
	.globl _set_sprite_tile
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl _j
	.globl _i
	.globl _gameTile
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_gameTile::
	.ds 96
_i::
	.ds 1
_j::
	.ds 1
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
;gameTile.c:26: unsigned char gameTile[] =
	ld	hl,#_gameTile
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x0001)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x0002)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x0003)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x0004)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x0005)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x0006)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x0007)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x0008)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x0009)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x000a)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x000b)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x000c)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x000d)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x000e)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x000f)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x0010)
	ld	(hl),#0xff
	ld	hl,#(_gameTile + 0x0011)
	ld	(hl),#0xff
	ld	hl,#(_gameTile + 0x0012)
	ld	(hl),#0x81
	ld	hl,#(_gameTile + 0x0013)
	ld	(hl),#0x80
	ld	hl,#(_gameTile + 0x0014)
	ld	(hl),#0x89
	ld	hl,#(_gameTile + 0x0015)
	ld	(hl),#0x88
	ld	hl,#(_gameTile + 0x0016)
	ld	(hl),#0x99
	ld	hl,#(_gameTile + 0x0017)
	ld	(hl),#0x98
	ld	hl,#(_gameTile + 0x0018)
	ld	(hl),#0x89
	ld	hl,#(_gameTile + 0x0019)
	ld	(hl),#0x88
	ld	hl,#(_gameTile + 0x001a)
	ld	(hl),#0x89
	ld	hl,#(_gameTile + 0x001b)
	ld	(hl),#0x88
	ld	hl,#(_gameTile + 0x001c)
	ld	(hl),#0x89
	ld	hl,#(_gameTile + 0x001d)
	ld	(hl),#0x88
	ld	hl,#(_gameTile + 0x001e)
	ld	(hl),#0x81
	ld	hl,#(_gameTile + 0x001f)
	ld	(hl),#0xfe
	ld	hl,#(_gameTile + 0x0020)
	ld	(hl),#0xff
	ld	hl,#(_gameTile + 0x0021)
	ld	(hl),#0xff
	ld	hl,#(_gameTile + 0x0022)
	ld	(hl),#0x81
	ld	hl,#(_gameTile + 0x0023)
	ld	(hl),#0x01
	ld	hl,#(_gameTile + 0x0024)
	ld	(hl),#0x99
	ld	hl,#(_gameTile + 0x0025)
	ld	(hl),#0x19
	ld	hl,#(_gameTile + 0x0026)
	ld	(hl),#0x85
	ld	hl,#(_gameTile + 0x0027)
	ld	(hl),#0x05
	ld	hl,#(_gameTile + 0x0028)
	ld	(hl),#0x89
	ld	hl,#(_gameTile + 0x0029)
	ld	(hl),#0x09
	ld	hl,#(_gameTile + 0x002a)
	ld	(hl),#0x91
	ld	hl,#(_gameTile + 0x002b)
	ld	(hl),#0x11
	ld	hl,#(_gameTile + 0x002c)
	ld	(hl),#0x9d
	ld	hl,#(_gameTile + 0x002d)
	ld	(hl),#0x1d
	ld	hl,#(_gameTile + 0x002e)
	ld	(hl),#0x81
	ld	hl,#(_gameTile + 0x002f)
	ld	(hl),#0x7f
	ld	hl,#(_gameTile + 0x0030)
	ld	(hl),#0x81
	ld	hl,#(_gameTile + 0x0031)
	ld	(hl),#0xfe
	ld	hl,#(_gameTile + 0x0032)
	ld	(hl),#0x81
	ld	hl,#(_gameTile + 0x0033)
	ld	(hl),#0x80
	ld	hl,#(_gameTile + 0x0034)
	ld	(hl),#0x99
	ld	hl,#(_gameTile + 0x0035)
	ld	(hl),#0x98
	ld	hl,#(_gameTile + 0x0036)
	ld	(hl),#0x85
	ld	hl,#(_gameTile + 0x0037)
	ld	(hl),#0x84
	ld	hl,#(_gameTile + 0x0038)
	ld	(hl),#0x99
	ld	hl,#(_gameTile + 0x0039)
	ld	(hl),#0x98
	ld	hl,#(_gameTile + 0x003a)
	ld	(hl),#0x85
	ld	hl,#(_gameTile + 0x003b)
	ld	(hl),#0x84
	ld	hl,#(_gameTile + 0x003c)
	ld	(hl),#0x99
	ld	hl,#(_gameTile + 0x003d)
	ld	(hl),#0x98
	ld	hl,#(_gameTile + 0x003e)
	ld	(hl),#0xff
	ld	hl,#(_gameTile + 0x003f)
	ld	(hl),#0xff
	ld	hl,#(_gameTile + 0x0040)
	ld	(hl),#0x81
	ld	hl,#(_gameTile + 0x0041)
	ld	(hl),#0x7f
	ld	hl,#(_gameTile + 0x0042)
	ld	(hl),#0x81
	ld	hl,#(_gameTile + 0x0043)
	ld	(hl),#0x01
	ld	hl,#(_gameTile + 0x0044)
	ld	(hl),#0x89
	ld	hl,#(_gameTile + 0x0045)
	ld	(hl),#0x09
	ld	hl,#(_gameTile + 0x0046)
	ld	(hl),#0x99
	ld	hl,#(_gameTile + 0x0047)
	ld	(hl),#0x19
	ld	hl,#(_gameTile + 0x0048)
	ld	(hl),#0xbd
	ld	hl,#(_gameTile + 0x0049)
	ld	(hl),#0x3d
	ld	hl,#(_gameTile + 0x004a)
	ld	(hl),#0x89
	ld	hl,#(_gameTile + 0x004b)
	ld	(hl),#0x09
	ld	hl,#(_gameTile + 0x004c)
	ld	(hl),#0x89
	ld	hl,#(_gameTile + 0x004d)
	ld	(hl),#0x09
	ld	hl,#(_gameTile + 0x004e)
	ld	(hl),#0xff
	ld	hl,#(_gameTile + 0x004f)
	ld	(hl),#0xff
	ld	hl,#(_gameTile + 0x0050)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x0051)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x0052)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x0053)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x0054)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x0055)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x0056)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x0057)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x0058)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x0059)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x005a)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x005b)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x005c)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x005d)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x005e)
	ld	(hl),#0x00
	ld	hl,#(_gameTile + 0x005f)
	ld	(hl),#0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:6: void performantDelay(UINT8 numloops){
;	---------------------------------
; Function performantDelay
; ---------------------------------
_performantDelay::
;main.c:9: for(i=0;i<numloops;i++){
	ld	c,#0x00
00103$:
	ld	a,c
	ldhl	sp,#2
	sub	a, (hl)
	ret	NC
;main.c:10: wait_vbl_done();
	push	bc
	call	_wait_vbl_done
	pop	bc
;main.c:9: for(i=0;i<numloops;i++){
	inc	c
	jr	00103$
	ret
;main.c:15: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:16: set_sprite_data(0, 5, gameTile);
	ld	hl,#_gameTile
	push	hl
	ld	hl,#0x0500
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:18: set_sprite_tile(0, 1);
	ld	hl,#0x0100
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:19: set_sprite_tile(1, 2);
	ld	hl,#0x0201
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:21: set_sprite_tile(2, 3);
	ld	hl,#0x0302
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:22: set_sprite_tile(3, 4);
	ld	hl,#0x0403
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:24: move_sprite(0, 75, 75);
	ld	hl,#0x4b4b
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:25: move_sprite(1, 75 + 8, 75);
	ld	hl,#0x4b53
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:26: move_sprite(2, 75, 75 + 8);
	ld	hl,#0x534b
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:27: move_sprite(3, 75 + 8, 75 + 8);
	ld	hl,#0x5353
	push	hl
	ld	a,#0x03
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:30: SHOW_SPRITES;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;main.c:32: while(1){
00102$:
;main.c:33: performantDelay(1);
	ld	a,#0x01
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
	jr	00102$
	ret
	.area _CODE
	.area _CABS (ABS)
