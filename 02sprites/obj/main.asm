;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 19 2016) (Linux)
; This file was generated Sat Nov 30 18:53:57 2019
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
	.globl _blinker
	.globl _pacMan
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_pacMan::
	.ds 32
_blinker::
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
;spriteBlink.c:26: unsigned char blinker[] =
	ld	hl,#_blinker
	ld	(hl),#0x7E
	ld	hl,#(_blinker + 0x0001)
	ld	(hl),#0x7E
	ld	hl,#(_blinker + 0x0002)
	ld	(hl),#0x81
	ld	hl,#(_blinker + 0x0003)
	ld	(hl),#0xFF
	ld	hl,#(_blinker + 0x0004)
	ld	(hl),#0x99
	ld	hl,#(_blinker + 0x0005)
	ld	(hl),#0xFF
	ld	hl,#(_blinker + 0x0006)
	ld	(hl),#0xA5
	ld	hl,#(_blinker + 0x0007)
	ld	(hl),#0xFF
	ld	hl,#(_blinker + 0x0008)
	ld	(hl),#0xDB
	ld	hl,#(_blinker + 0x0009)
	ld	(hl),#0xFF
	ld	hl,#(_blinker + 0x000a)
	ld	(hl),#0x99
	ld	hl,#(_blinker + 0x000b)
	ld	(hl),#0xFF
	ld	hl,#(_blinker + 0x000c)
	ld	(hl),#0x81
	ld	hl,#(_blinker + 0x000d)
	ld	(hl),#0xFF
	ld	hl,#(_blinker + 0x000e)
	ld	(hl),#0x7E
	ld	hl,#(_blinker + 0x000f)
	ld	(hl),#0x7E
	ld	hl,#(_blinker + 0x0010)
	ld	(hl),#0x7E
	ld	hl,#(_blinker + 0x0011)
	ld	(hl),#0x7E
	ld	hl,#(_blinker + 0x0012)
	ld	(hl),#0x81
	ld	hl,#(_blinker + 0x0013)
	ld	(hl),#0xFF
	ld	hl,#(_blinker + 0x0014)
	ld	(hl),#0x81
	ld	hl,#(_blinker + 0x0015)
	ld	(hl),#0xFF
	ld	hl,#(_blinker + 0x0016)
	ld	(hl),#0x81
	ld	hl,#(_blinker + 0x0017)
	ld	(hl),#0xFF
	ld	hl,#(_blinker + 0x0018)
	ld	(hl),#0xC3
	ld	hl,#(_blinker + 0x0019)
	ld	(hl),#0xFF
	ld	hl,#(_blinker + 0x001a)
	ld	(hl),#0xBD
	ld	hl,#(_blinker + 0x001b)
	ld	(hl),#0xFF
	ld	hl,#(_blinker + 0x001c)
	ld	(hl),#0x81
	ld	hl,#(_blinker + 0x001d)
	ld	(hl),#0xFF
	ld	hl,#(_blinker + 0x001e)
	ld	(hl),#0x7E
	ld	hl,#(_blinker + 0x001f)
	ld	(hl),#0x7E
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:8: void performantDelay(UINT8 numloops)
;	---------------------------------
; Function performantDelay
; ---------------------------------
_performantDelay::
;main.c:12: for(i=0;i<numloops;i++)
	ld	b,#0x00
00103$:
	ld	a,b
	ldhl	sp,#2
	sub	a, (hl)
	ret	NC
;main.c:14: wait_vbl_done();
	push	bc
	call	_wait_vbl_done
	pop	bc
;main.c:12: for(i=0;i<numloops;i++)
	inc	b
	jr	00103$
	ret
;main.c:18: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
	dec	sp
;main.c:20: UINT8 currentSpriteBlinker = 0;
	ldhl	sp,#0
	ld	(hl),#0x00
;main.c:43: set_sprite_data(0, 2, blinker);
	ld	de,#_blinker
	push	de
	ld	hl,#0x0200
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:44: set_sprite_tile(0, 0);
	ld	hl,#0x0000
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:45: move_sprite(0, 8, 16);
	ld	hl,#0x1008
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:47: set_sprite_data(2, 2, pacMan);
	ld	de,#_pacMan
	push	de
	ld	hl,#0x0202
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:48: set_sprite_tile(1, 2);
	ld	hl,#0x0201
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:49: move_sprite(1, 16, 16);
	ld	hl,#0x1010
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:52: SHOW_SPRITES;
	ld	de,#0xFF40
	ld	a,(de)
	ld	e,a
	ld	d,#0x00
	ld	a,e
	set	1, a
	ld	b,a
	ld	hl,#0xFF40
	ld	(hl),b
;main.c:54: while(1)
00105$:
;main.c:56: if(currentSpriteBlinker == 0)
	ldhl	sp,#0
	ld	a,(hl)
	or	a, a
	jr	NZ,00102$
;main.c:58: currentSpriteBlinker = 1;
	ld	(hl),#0x01
;main.c:59: currentSpritePacMan = 3;
	ld	d,#0x03
	jr	00103$
00102$:
;main.c:63: currentSpriteBlinker = 0;
	ldhl	sp,#0
	ld	(hl),#0x00
;main.c:64: currentSpritePacMan = 2;
	ld	d,#0x02
00103$:
;main.c:66: set_sprite_tile(0, currentSpriteBlinker);
	push	de
	ldhl	sp,#2
	ld	a,(hl)
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_tile
	add	sp, #2
	pop	de
;main.c:67: set_sprite_tile(1, currentSpritePacMan);
	push	de
	inc	sp
	ld	a,#0x01
	push	af
	inc	sp
	call	_set_sprite_tile
	add	sp, #2
;main.c:69: performantDelay(5);
	ld	a,#0x05
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
	jp	00105$
	inc	sp
	ret
	.area _CODE
	.area _CABS (ABS)
