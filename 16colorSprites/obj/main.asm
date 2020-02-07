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
	.globl _move_sprite
	.globl _set_sprite_prop
	.globl _set_sprite_tile
	.globl _set_sprite_data
	.globl _set_sprite_palette
	.globl _set_bkg_palette
	.globl _spritepalette
	.globl _backgroundpalette
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
;main.c:27: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:29: SPRITES_8x16;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	2, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;main.c:31: set_bkg_palette(0,1,&backgroundpalette[0]);
	ld	hl,#_backgroundpalette
	push	hl
	ld	hl,#0x0100
	push	hl
	call	_set_bkg_palette
	add	sp, #4
;main.c:33: set_sprite_palette(0,3,&spritepalette[0]);
	ld	hl,#_spritepalette
	push	hl
	ld	hl,#0x0300
	push	hl
	call	_set_sprite_palette
	add	sp, #4
;main.c:35: set_sprite_data(0, 6, sprites);
	ld	hl,#_sprites
	push	hl
	ld	hl,#0x0600
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:37: set_sprite_tile(0, 0);
	ld	hl,#0x0000
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:38: set_sprite_prop(0,0);
	ld	hl,#0x0000
	push	hl
	call	_set_sprite_prop
	add	sp, #2
;main.c:39: move_sprite(0, 20, 78);
	ld	hl,#0x4e14
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:41: set_sprite_tile(1, 2);
	ld	hl,#0x0201
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:42: set_sprite_prop(1,1);
	ld	hl,#0x0101
	push	hl
	call	_set_sprite_prop
	add	sp, #2
;main.c:43: move_sprite(1, 80, 78);
	ld	hl,#0x4e50
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:45: set_sprite_tile(2, 4);
	ld	hl,#0x0402
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:46: set_sprite_prop(2,2);
	ld	hl,#0x0202
	push	hl
	call	_set_sprite_prop
	add	sp, #2
;main.c:47: move_sprite(2, 140, 78);
	ld	hl,#0x4e8c
	push	hl
	ld	a,#0x02
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:49: SHOW_SPRITES;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;main.c:50: SHOW_BKG;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	0, a
	ld	c,a
	ld	l, #0x40
	ld	(hl),c
	ret
_backgroundpalette:
	.dw #0x294a
	.dw #0x294a
	.dw #0x294a
	.dw #0x294a
_spritepalette:
	.dw #0x7fff
	.dw #0x0000
	.dw #0x22e7
	.dw #0x7cd5
	.dw #0x7d36
	.dw #0x7fff
	.dw #0x0000
	.dw #0x439e
	.dw #0x7d36
	.dw #0x18c6
	.dw #0x439e
	.dw #0x7403
	.area _CODE
	.area _CABS (ABS)
