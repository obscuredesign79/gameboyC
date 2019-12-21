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
	.globl _keyPressedRight
	.globl _performantDelay
	.globl _move_sprite
	.globl _set_sprite_tile
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _currentSpritePacMan
	.globl _keyPress
	.globl _pacMan
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_pacMan::
	.ds 32
_keyPress::
	.ds 1
_currentSpritePacMan::
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
;spritePac.c:26: unsigned char pacMan[] =
	ld	hl,#_pacMan
	ld	(hl),#0x3c
	ld	hl,#(_pacMan + 0x0001)
	ld	(hl),#0x3c
	ld	hl,#(_pacMan + 0x0002)
	ld	(hl),#0x7e
	ld	hl,#(_pacMan + 0x0003)
	ld	(hl),#0x42
	ld	hl,#(_pacMan + 0x0004)
	ld	(hl),#0xff
	ld	hl,#(_pacMan + 0x0005)
	ld	(hl),#0x91
	ld	hl,#(_pacMan + 0x0006)
	ld	(hl),#0xff
	ld	hl,#(_pacMan + 0x0007)
	ld	(hl),#0x81
	ld	hl,#(_pacMan + 0x0008)
	ld	(hl),#0xff
	ld	hl,#(_pacMan + 0x0009)
	ld	(hl),#0x8f
	ld	hl,#(_pacMan + 0x000a)
	ld	(hl),#0xff
	ld	hl,#(_pacMan + 0x000b)
	ld	(hl),#0x81
	ld	hl,#(_pacMan + 0x000c)
	ld	(hl),#0x7e
	ld	hl,#(_pacMan + 0x000d)
	ld	(hl),#0x42
	ld	hl,#(_pacMan + 0x000e)
	ld	(hl),#0x3c
	ld	hl,#(_pacMan + 0x000f)
	ld	(hl),#0x3c
	ld	hl,#(_pacMan + 0x0010)
	ld	(hl),#0x3c
	ld	hl,#(_pacMan + 0x0011)
	ld	(hl),#0x3c
	ld	hl,#(_pacMan + 0x0012)
	ld	(hl),#0x7e
	ld	hl,#(_pacMan + 0x0013)
	ld	(hl),#0x42
	ld	hl,#(_pacMan + 0x0014)
	ld	(hl),#0xff
	ld	hl,#(_pacMan + 0x0015)
	ld	(hl),#0x91
	ld	hl,#(_pacMan + 0x0016)
	ld	(hl),#0xfe
	ld	hl,#(_pacMan + 0x0017)
	ld	(hl),#0x86
	ld	hl,#(_pacMan + 0x0018)
	ld	(hl),#0xf0
	ld	hl,#(_pacMan + 0x0019)
	ld	(hl),#0x90
	ld	hl,#(_pacMan + 0x001a)
	ld	(hl),#0xf8
	ld	hl,#(_pacMan + 0x001b)
	ld	(hl),#0x88
	ld	hl,#(_pacMan + 0x001c)
	ld	(hl),#0x7c
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
;main.c:8: void performantDelay(UINT8 numloops)
;	---------------------------------
; Function performantDelay
; ---------------------------------
_performantDelay::
;main.c:12: for(i=0;i<numloops;i++)
	ld	c,#0x00
00103$:
	ld	a,c
	ldhl	sp,#2
	sub	a, (hl)
	ret	NC
;main.c:14: wait_vbl_done();
	push	bc
	call	_wait_vbl_done
	pop	bc
;main.c:12: for(i=0;i<numloops;i++)
	inc	c
	jr	00103$
	ret
;main.c:18: void keyPressedRight()
;	---------------------------------
; Function keyPressedRight
; ---------------------------------
_keyPressedRight::
;main.c:20: if(keyPress & J_A)
	ld	hl,#_keyPress
	ld	c,(hl)
	ld	b,#0x00
	bit	4, c
	ret	Z
;main.c:22: currentSpritePacMan = 1;
	ld	hl,#_currentSpritePacMan
	ld	(hl),#0x01
;main.c:23: set_sprite_tile(0, currentSpritePacMan);
	ld	hl,#0x0100
	push	hl
	call	_set_sprite_tile
	add	sp, #2
	ret
;main.c:28: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:35: set_sprite_data(0, 2, pacMan);
	ld	hl,#_pacMan
	push	hl
	ld	hl,#0x0200
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:36: move_sprite(0, x, y);
	ld	hl,#0x4e58
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:37: SHOW_SPRITES;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;main.c:40: while(1)
	ld	b,#0x58
00107$:
;main.c:42: keyPress = joypad();
	push	bc
	call	_joypad
	pop	bc
	ld	hl,#_keyPress
	ld	(hl),e
;main.c:49: set_sprite_tile(0, currentSpritePacMan);
	push	bc
	ld	hl,#0x0000
	push	hl
	call	_set_sprite_tile
	add	sp, #2
	pop	bc
;main.c:51: if(keyPress == J_RIGHT)
	ld	hl,#_keyPress
	ld	a,(hl)
	dec	a
	jr	NZ,00104$
;main.c:53: x += 2;
	inc	b
	inc	b
;main.c:54: move_sprite(0, x, y);
	push	bc
	ld	a,#0x4e
	push	af
	inc	sp
	push	bc
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
	pop	bc
	jr	00105$
00104$:
;main.c:57: else if(keyPress == J_A)
	ld	hl,#_keyPress
	ld	a,(hl)
	sub	a, #0x10
	jr	NZ,00105$
;main.c:60: set_sprite_tile(0, currentSpritePacMan);
	push	bc
	ld	hl,#0x0100
	push	hl
	call	_set_sprite_tile
	add	sp, #2
	pop	bc
00105$:
;main.c:63: performantDelay(1);
	push	bc
	ld	a,#0x01
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
	pop	bc
	jp	00107$
	ret
	.area _CODE
	.area _CABS (ABS)
