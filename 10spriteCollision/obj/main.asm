;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 19 2016) (Linux)
; This file was generated Sun Dec  1 15:03:48 2019
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _setupMata
	.globl _setupIngot
	.globl _moveGameCharacter
	.globl _checkCollisions
	.globl _performantDelay
	.globl _printf
	.globl _move_sprite
	.globl _set_sprite_tile
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _spriteSize
	.globl _mata
	.globl _ingot
	.globl _gameSprite
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_gameSprite::
	.ds 128
_ingot::
	.ds 8
_mata::
	.ds 8
_spriteSize::
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
;gameSprite.c:26: unsigned char gameSprite[] =
	ld	hl,#_gameSprite
	ld	(hl),#0x1F
	ld	hl,#(_gameSprite + 0x0001)
	ld	(hl),#0x1F
	ld	hl,#(_gameSprite + 0x0002)
	ld	(hl),#0x3F
	ld	hl,#(_gameSprite + 0x0003)
	ld	(hl),#0x3F
	ld	hl,#(_gameSprite + 0x0004)
	ld	(hl),#0x6F
	ld	hl,#(_gameSprite + 0x0005)
	ld	(hl),#0x6C
	ld	hl,#(_gameSprite + 0x0006)
	ld	(hl),#0x0F
	ld	hl,#(_gameSprite + 0x0007)
	ld	(hl),#0x0E
	ld	hl,#(_gameSprite + 0x0008)
	ld	(hl),#0x6F
	ld	hl,#(_gameSprite + 0x0009)
	ld	(hl),#0x6F
	ld	hl,#(_gameSprite + 0x000a)
	ld	(hl),#0x7F
	ld	hl,#(_gameSprite + 0x000b)
	ld	(hl),#0x5C
	ld	hl,#(_gameSprite + 0x000c)
	ld	(hl),#0x7F
	ld	hl,#(_gameSprite + 0x000d)
	ld	(hl),#0x47
	ld	hl,#(_gameSprite + 0x000e)
	ld	(hl),#0x7F
	ld	hl,#(_gameSprite + 0x000f)
	ld	(hl),#0x43
	ld	hl,#(_gameSprite + 0x0010)
	ld	(hl),#0xC0
	ld	hl,#(_gameSprite + 0x0011)
	ld	(hl),#0xC0
	ld	hl,#(_gameSprite + 0x0012)
	ld	(hl),#0xE0
	ld	hl,#(_gameSprite + 0x0013)
	ld	(hl),#0xE0
	ld	hl,#(_gameSprite + 0x0014)
	ld	(hl),#0xF0
	ld	hl,#(_gameSprite + 0x0015)
	ld	(hl),#0x30
	ld	hl,#(_gameSprite + 0x0016)
	ld	(hl),#0xF0
	ld	hl,#(_gameSprite + 0x0017)
	ld	(hl),#0x50
	ld	hl,#(_gameSprite + 0x0018)
	ld	(hl),#0xFC
	ld	hl,#(_gameSprite + 0x0019)
	ld	(hl),#0x1C
	ld	hl,#(_gameSprite + 0x001a)
	ld	(hl),#0xF8
	ld	hl,#(_gameSprite + 0x001b)
	ld	(hl),#0x38
	ld	hl,#(_gameSprite + 0x001c)
	ld	(hl),#0xE3
	ld	hl,#(_gameSprite + 0x001d)
	ld	(hl),#0xE3
	ld	hl,#(_gameSprite + 0x001e)
	ld	(hl),#0xFE
	ld	hl,#(_gameSprite + 0x001f)
	ld	(hl),#0xFE
	ld	hl,#(_gameSprite + 0x0020)
	ld	(hl),#0x3F
	ld	hl,#(_gameSprite + 0x0021)
	ld	(hl),#0x3E
	ld	hl,#(_gameSprite + 0x0022)
	ld	(hl),#0x03
	ld	hl,#(_gameSprite + 0x0023)
	ld	(hl),#0x02
	ld	hl,#(_gameSprite + 0x0024)
	ld	(hl),#0x03
	ld	hl,#(_gameSprite + 0x0025)
	ld	(hl),#0x02
	ld	hl,#(_gameSprite + 0x0026)
	ld	(hl),#0x07
	ld	hl,#(_gameSprite + 0x0027)
	ld	(hl),#0x07
	ld	hl,#(_gameSprite + 0x0028)
	ld	(hl),#0x2C
	ld	hl,#(_gameSprite + 0x0029)
	ld	(hl),#0x2C
	ld	hl,#(_gameSprite + 0x002a)
	ld	(hl),#0x78
	ld	hl,#(_gameSprite + 0x002b)
	ld	(hl),#0x78
	ld	hl,#(_gameSprite + 0x002c)
	ld	(hl),#0x50
	ld	hl,#(_gameSprite + 0x002d)
	ld	(hl),#0x50
	ld	bc,#_gameSprite + 46
	xor	a, a
	ld	(bc),a
	ld	bc,#_gameSprite + 47
	xor	a, a
	ld	(bc),a
	ld	hl,#(_gameSprite + 0x0030)
	ld	(hl),#0xE0
	ld	hl,#(_gameSprite + 0x0031)
	ld	(hl),#0x20
	ld	hl,#(_gameSprite + 0x0032)
	ld	(hl),#0xE0
	ld	hl,#(_gameSprite + 0x0033)
	ld	(hl),#0x20
	ld	hl,#(_gameSprite + 0x0034)
	ld	(hl),#0xF0
	ld	hl,#(_gameSprite + 0x0035)
	ld	(hl),#0x70
	ld	hl,#(_gameSprite + 0x0036)
	ld	(hl),#0xD8
	ld	hl,#(_gameSprite + 0x0037)
	ld	(hl),#0xD8
	ld	hl,#(_gameSprite + 0x0038)
	ld	(hl),#0x08
	ld	hl,#(_gameSprite + 0x0039)
	ld	(hl),#0x08
	ld	hl,#(_gameSprite + 0x003a)
	ld	(hl),#0x18
	ld	hl,#(_gameSprite + 0x003b)
	ld	(hl),#0x18
	ld	hl,#(_gameSprite + 0x003c)
	ld	(hl),#0x18
	ld	hl,#(_gameSprite + 0x003d)
	ld	(hl),#0x18
	ld	hl,#(_gameSprite + 0x003e)
	ld	(hl),#0x0C
	ld	hl,#(_gameSprite + 0x003f)
	ld	(hl),#0x0C
	ld	bc,#_gameSprite + 64
	xor	a, a
	ld	(bc),a
	ld	bc,#_gameSprite + 65
	xor	a, a
	ld	(bc),a
	ld	hl,#(_gameSprite + 0x0042)
	ld	(hl),#0x01
	ld	hl,#(_gameSprite + 0x0043)
	ld	(hl),#0x01
	ld	hl,#(_gameSprite + 0x0044)
	ld	(hl),#0x0F
	ld	hl,#(_gameSprite + 0x0045)
	ld	(hl),#0x0F
	ld	hl,#(_gameSprite + 0x0046)
	ld	(hl),#0x18
	ld	hl,#(_gameSprite + 0x0047)
	ld	(hl),#0x1F
	ld	hl,#(_gameSprite + 0x0048)
	ld	(hl),#0x10
	ld	hl,#(_gameSprite + 0x0049)
	ld	(hl),#0x1F
	ld	hl,#(_gameSprite + 0x004a)
	ld	(hl),#0x30
	ld	hl,#(_gameSprite + 0x004b)
	ld	(hl),#0x3F
	ld	hl,#(_gameSprite + 0x004c)
	ld	(hl),#0x21
	ld	hl,#(_gameSprite + 0x004d)
	ld	(hl),#0x3F
	ld	hl,#(_gameSprite + 0x004e)
	ld	(hl),#0x27
	ld	hl,#(_gameSprite + 0x004f)
	ld	(hl),#0x3F
	ld	bc,#_gameSprite + 80
	xor	a, a
	ld	(bc),a
	ld	bc,#_gameSprite + 81
	xor	a, a
	ld	(bc),a
	ld	hl,#(_gameSprite + 0x0052)
	ld	(hl),#0xC0
	ld	hl,#(_gameSprite + 0x0053)
	ld	(hl),#0xC0
	ld	hl,#(_gameSprite + 0x0054)
	ld	(hl),#0x30
	ld	hl,#(_gameSprite + 0x0055)
	ld	(hl),#0xF0
	ld	hl,#(_gameSprite + 0x0056)
	ld	(hl),#0x08
	ld	hl,#(_gameSprite + 0x0057)
	ld	(hl),#0xF8
	ld	hl,#(_gameSprite + 0x0058)
	ld	(hl),#0x3C
	ld	hl,#(_gameSprite + 0x0059)
	ld	(hl),#0xFC
	ld	hl,#(_gameSprite + 0x005a)
	ld	(hl),#0xFC
	ld	hl,#(_gameSprite + 0x005b)
	ld	(hl),#0xE4
	ld	hl,#(_gameSprite + 0x005c)
	ld	(hl),#0xFE
	ld	hl,#(_gameSprite + 0x005d)
	ld	(hl),#0x86
	ld	hl,#(_gameSprite + 0x005e)
	ld	(hl),#0xFE
	ld	hl,#(_gameSprite + 0x005f)
	ld	(hl),#0xC2
	ld	hl,#(_gameSprite + 0x0060)
	ld	(hl),#0x27
	ld	hl,#(_gameSprite + 0x0061)
	ld	(hl),#0x3C
	ld	hl,#(_gameSprite + 0x0062)
	ld	(hl),#0x2F
	ld	hl,#(_gameSprite + 0x0063)
	ld	(hl),#0x3C
	ld	hl,#(_gameSprite + 0x0064)
	ld	(hl),#0x2F
	ld	hl,#(_gameSprite + 0x0065)
	ld	(hl),#0x38
	ld	hl,#(_gameSprite + 0x0066)
	ld	(hl),#0x3F
	ld	hl,#(_gameSprite + 0x0067)
	ld	(hl),#0x38
	ld	hl,#(_gameSprite + 0x0068)
	ld	(hl),#0x1F
	ld	hl,#(_gameSprite + 0x0069)
	ld	(hl),#0x18
	ld	hl,#(_gameSprite + 0x006a)
	ld	(hl),#0x0F
	ld	hl,#(_gameSprite + 0x006b)
	ld	(hl),#0x0E
	ld	hl,#(_gameSprite + 0x006c)
	ld	(hl),#0x03
	ld	hl,#(_gameSprite + 0x006d)
	ld	(hl),#0x03
	ld	bc,#_gameSprite + 110
	xor	a, a
	ld	(bc),a
	ld	bc,#_gameSprite + 111
	xor	a, a
	ld	(bc),a
	ld	hl,#(_gameSprite + 0x0070)
	ld	(hl),#0xFE
	ld	hl,#(_gameSprite + 0x0071)
	ld	(hl),#0xC2
	ld	hl,#(_gameSprite + 0x0072)
	ld	(hl),#0xFE
	ld	hl,#(_gameSprite + 0x0073)
	ld	(hl),#0x06
	ld	hl,#(_gameSprite + 0x0074)
	ld	(hl),#0xFC
	ld	hl,#(_gameSprite + 0x0075)
	ld	(hl),#0x0C
	ld	hl,#(_gameSprite + 0x0076)
	ld	(hl),#0xF8
	ld	hl,#(_gameSprite + 0x0077)
	ld	(hl),#0x18
	ld	hl,#(_gameSprite + 0x0078)
	ld	(hl),#0xF0
	ld	hl,#(_gameSprite + 0x0079)
	ld	(hl),#0x30
	ld	hl,#(_gameSprite + 0x007a)
	ld	(hl),#0xE0
	ld	hl,#(_gameSprite + 0x007b)
	ld	(hl),#0xE0
	ld	hl,#(_gameSprite + 0x007c)
	ld	(hl),#0x80
	ld	hl,#(_gameSprite + 0x007d)
	ld	(hl),#0x80
	ld	bc,#_gameSprite + 126
	xor	a, a
	ld	(bc),a
	ld	bc,#_gameSprite + 127
	xor	a, a
	ld	(bc),a
;main.c:8: UBYTE spriteSize=8;
	ld	hl,#_spriteSize
	ld	(hl),#0x08
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:10: void performantDelay(UINT8 numloops){
;	---------------------------------
; Function performantDelay
; ---------------------------------
_performantDelay::
;main.c:13: for(i=0;i<numloops;i++){
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
;main.c:13: for(i=0;i<numloops;i++){
	inc	b
	jr	00103$
	ret
;main.c:18: UBYTE checkCollisions(gameCharacter* one, gameCharacter* two){
;	---------------------------------
; Function checkCollisions
; ---------------------------------
_checkCollisions::
	add	sp, #-19
;main.c:19: return(one->x +4 >= two->x +4 && one->x +4 <= two->x + two->width -4) && (one->y +4 >= two->y +4 && one->y +4 <= two->y + two->height -4) || (two->x +4 >= one->x +4 && two->x +4 <= one->x + one->width -4) && (two->y +4 >= one->y +4 && two->y +4 <= one->y + one->height -4);
	ldhl	sp,#21
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#17
	ld	(hl+),a
	ld	(hl),e
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ldhl	sp,#4
	ld	(hl+),a
	ld	(hl),#0x00
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#2
	ld	(hl+),a
	ld	(hl),d
	ldhl	sp,#23
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#0
	ld	(hl+),a
	ld	(hl),e
	pop	de
	push	de
	ld	hl,#0x0004
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ldhl	sp,#13
	ld	(hl+),a
	ld	(hl),#0x00
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#11
	ld	(hl+),a
	ld	(hl),d
	ldhl	sp,#18
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0005
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#9
	ld	(hl+),a
	ld	(hl),d
	pop	de
	push	de
	ld	hl,#0x0005
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#7
	ld	(hl+),a
	ld	(hl),d
	ldhl	sp,#2
	ld	d, h
	ld	e, l
	ldhl	sp,#11
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z,00146$
	bit	7, d
	jr	NZ,00147$
	cp	a, a
	jr	00147$
00146$:
	bit	7, d
	jr	Z,00147$
	scf
00147$:
	jp	C,00108$
	pop	de
	push	de
	ld	hl,#0x0006
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#13
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,c
	add	a,#0xFC
	ld	c,a
	ld	a,b
	adc	a,#0xFF
	ld	b,a
	ldhl	sp,#2
	ld	a,c
	sub	a, (hl)
	inc	hl
	ld	a,b
	sbc	a, (hl)
	ld	a,b
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z,00148$
	bit	7, d
	jr	NZ,00149$
	cp	a, a
	jr	00149$
00148$:
	bit	7, d
	jr	Z,00149$
	scf
00149$:
	jp	C,00108$
	ldhl	sp,#10
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	hl,#0x0004
	add	hl,bc
	ld	a,l
	ld	d,h
	ldhl	sp,#13
	ld	(hl+),a
	ld	(hl),d
	ldhl	sp,#8
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ldhl	sp,#15
	ld	(hl+),a
	ld	(hl),#0x00
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	b,l
	ld	c,h
	ldhl	sp,#13
	ld	a, (hl)
	sub	a, b
	inc	hl
	ld	a, (hl)
	sbc	a, c
	ld	d, (hl)
	ld	a,c
	ld	e, a
	bit	7, e
	jr	Z,00150$
	bit	7, d
	jr	NZ,00151$
	cp	a, a
	jr	00151$
00150$:
	bit	7, d
	jr	Z,00151$
	scf
00151$:
	jp	C,00108$
	pop	de
	push	de
	ld	hl,#0x0007
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ld	b,#0x00
	ldhl	sp,#15
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,c
	add	a,#0xFC
	ld	c,a
	ld	a,b
	adc	a,#0xFF
	ld	b,a
	ldhl	sp,#13
	ld	a,c
	sub	a, (hl)
	inc	hl
	ld	a,b
	sbc	a, (hl)
	ld	a,b
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z,00152$
	bit	7, d
	jr	NZ,00153$
	cp	a, a
	jr	00153$
00152$:
	bit	7, d
	jr	Z,00153$
	scf
00153$:
	jp	NC,00104$
00108$:
	ldhl	sp,#11
	ld	d, h
	ld	e, l
	ldhl	sp,#2
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z,00154$
	bit	7, d
	jr	NZ,00155$
	cp	a, a
	jr	00155$
00154$:
	bit	7, d
	jr	Z,00155$
	scf
00155$:
	jp	C,00103$
	ldhl	sp,#18
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0006
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#15
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	dec	hl
	ld	(hl),a
	ld	a,(hl)
	ld	(hl+),a
	ld	(hl),#0x00
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ldhl	sp,#4
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,de
	ld	b,l
	ld	c,h
	ld	a,b
	add	a,#0xFC
	ld	b,a
	ld	a,c
	adc	a,#0xFF
	ld	c,a
	ldhl	sp,#11
	ld	a,b
	sub	a, (hl)
	inc	hl
	ld	a,c
	sbc	a, (hl)
	ld	a,c
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z,00156$
	bit	7, d
	jr	NZ,00157$
	cp	a, a
	jr	00157$
00156$:
	bit	7, d
	jr	Z,00157$
	scf
00157$:
	jp	C,00103$
	ldhl	sp,#8
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ldhl	sp,#15
	ld	(hl+),a
	ld	(hl),#0x00
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#15
	ld	(hl+),a
	ld	(hl),d
	ldhl	sp,#10
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ldhl	sp,#6
	ld	(hl),a
	ld	a,(hl+)
	ld	(hl+),a
	ld	(hl),#0x00
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	add	hl,de
	ld	b,l
	ld	c,h
	ldhl	sp,#15
	ld	a, (hl)
	sub	a, b
	inc	hl
	ld	a, (hl)
	sbc	a, c
	ld	d, (hl)
	ld	a,c
	ld	e, a
	bit	7, e
	jr	Z,00158$
	bit	7, d
	jr	NZ,00159$
	cp	a, a
	jr	00159$
00158$:
	bit	7, d
	jr	Z,00159$
	scf
00159$:
	jp	C,00103$
	ldhl	sp,#18
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0007
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#9
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ldhl	sp,#6
	ld	(hl),a
	ld	a,(hl)
	ldhl	sp,#9
	ld	(hl+),a
	ld	(hl),#0x00
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ldhl	sp,#7
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#7
	ld	(hl+),a
	ld	(hl),d
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0004
	ld	a,e
	sub	a,l
	ld	e,a
	ld	a,d
	sbc	a,h
	ldhl	sp,#8
	ld	(hl-),a
	ld	(hl),e
	ld	d, h
	ld	e, l
	ldhl	sp,#15
	ld	a, (de)
	sub	a, (hl)
	inc	hl
	inc	de
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	ld	e, (hl)
	bit	7, e
	jr	Z,00160$
	bit	7, d
	jr	NZ,00161$
	cp	a, a
	jr	00161$
00160$:
	bit	7, d
	jr	Z,00161$
	scf
00161$:
	jr	NC,00104$
00103$:
	ldhl	sp,#15
	ld	(hl),#0x00
	jr	00105$
00104$:
	ldhl	sp,#15
	ld	(hl),#0x01
00105$:
	ldhl	sp,#15
	ld	e,(hl)
	add	sp, #19
	ret
;main.c:22: void moveGameCharacter(gameCharacter* character, UINT8 x, UINT8 y){
;	---------------------------------
; Function moveGameCharacter
; ---------------------------------
_moveGameCharacter::
	add	sp, #-4
;main.c:23: move_sprite(character->spriteId[0],x,y);
	ldhl	sp,#6
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#2
	ld	(hl+),a
	ld	(hl),e
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	b,a
	ldhl	sp,#9
	ld	a,(hl)
	push	af
	inc	sp
	dec	hl
	ld	a,(hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:24: move_sprite(character->spriteId[1],x+spriteSize,y);
	ldhl	sp,#8
	ld	a,(hl)
	ld	hl,#_spriteSize
	add	a, (hl)
	ldhl	sp,#0
	ld	(hl),a
	ldhl	sp,#3
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	ld	a,(bc)
	ld	d,a
	ldhl	sp,#9
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#1
	ld	a,(hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:25: move_sprite(character->spriteId[2],x,y+spriteSize);
	ldhl	sp,#9
	ld	a,(hl)
	ld	hl,#_spriteSize
	add	a, (hl)
	ldhl	sp,#0
	ld	(hl),a
	ldhl	sp,#3
	dec	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	ld	a,(bc)
	ld	d,a
	ldhl	sp,#0
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#9
	ld	a,(hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:26: move_sprite(character->spriteId[3],x+spriteSize,y+spriteSize);
	ldhl	sp,#9
	ld	a,(hl)
	ld	hl,#_spriteSize
	add	a, (hl)
	ldhl	sp,#0
	ld	(hl),a
	ldhl	sp,#8
	ld	a,(hl)
	ld	hl,#_spriteSize
	add	a, (hl)
	ldhl	sp,#1
	ld	(hl+),a
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	inc	bc
	ld	a,(bc)
	ld	d,a
	ldhl	sp,#0
	ld	a,(hl)
	push	af
	inc	sp
	inc	hl
	ld	a,(hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_move_sprite
	add	sp, #3
	add	sp, #4
	ret
;main.c:30: void setupIngot(){
;	---------------------------------
; Function setupIngot
; ---------------------------------
_setupIngot::
;main.c:31: ingot.x=80;
	ld	hl,#(_ingot + 0x0004)
	ld	(hl),#0x50
;main.c:32: ingot.y=130;
	ld	hl,#(_ingot + 0x0005)
	ld	(hl),#0x82
;main.c:33: ingot.width=16;
	ld	hl,#(_ingot + 0x0006)
	ld	(hl),#0x10
;main.c:34: ingot.height=16;
	ld	hl,#(_ingot + 0x0007)
	ld	(hl),#0x10
;main.c:36: set_sprite_tile(0,0);
	ld	hl,#0x0000
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:37: ingot.spriteId[0]=0;
	ld	hl,#_ingot
	ld	(hl),#0x00
;main.c:38: set_sprite_tile(1,1);
	ld	hl,#0x0101
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:39: ingot.spriteId[1]=1;
	ld	hl,#(_ingot + 0x0001)
	ld	(hl),#0x01
;main.c:40: set_sprite_tile(2,2);
	ld	hl,#0x0202
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:41: ingot.spriteId[2]=2;
	ld	hl,#(_ingot + 0x0002)
	ld	(hl),#0x02
;main.c:42: set_sprite_tile(3,3);
	ld	hl,#0x0303
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:43: ingot.spriteId[3]=3;
	ld	hl,#(_ingot + 0x0003)
	ld	(hl),#0x03
;main.c:45: moveGameCharacter(&ingot,ingot.x,ingot.y);
	ld	de, #(_ingot + 0x0005) + 0
	ld	a,(de)
	ld	c,a
	ld	de, #(_ingot + 0x0004) + 0
	ld	a,(de)
	ld	b,a
	ld	de,#_ingot
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	push	de
	call	_moveGameCharacter
	add	sp, #4
	ret
;main.c:48: void setupMata(){
;	---------------------------------
; Function setupMata
; ---------------------------------
_setupMata::
;main.c:49: mata.x=30;
	ld	hl,#(_mata + 0x0004)
	ld	(hl),#0x1E
;main.c:50: mata.y=0;
	ld	hl,#(_mata + 0x0005)
	ld	(hl),#0x00
;main.c:51: mata.width=16;
	ld	hl,#(_mata + 0x0006)
	ld	(hl),#0x10
;main.c:52: mata.height=16;
	ld	hl,#(_mata + 0x0007)
	ld	(hl),#0x10
;main.c:54: set_sprite_tile(4,4);
	ld	hl,#0x0404
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:55: mata.spriteId[0]=4;
	ld	hl,#_mata
	ld	(hl),#0x04
;main.c:56: set_sprite_tile(5,5);
	ld	hl,#0x0505
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:57: mata.spriteId[1]=5;
	ld	hl,#(_mata + 0x0001)
	ld	(hl),#0x05
;main.c:58: set_sprite_tile(6,6);
	ld	hl,#0x0606
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:59: mata.spriteId[2]=6;
	ld	hl,#(_mata + 0x0002)
	ld	(hl),#0x06
;main.c:60: set_sprite_tile(7,7);
	ld	hl,#0x0707
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:61: mata.spriteId[3]=7;
	ld	hl,#(_mata + 0x0003)
	ld	(hl),#0x07
;main.c:63: moveGameCharacter(&mata,mata.x,mata.y);
	ld	de, #(_mata + 0x0005) + 0
	ld	a,(de)
	ld	c,a
	ld	de, #(_mata + 0x0004) + 0
	ld	a,(de)
	ld	b,a
	ld	de,#_mata
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	push	de
	call	_moveGameCharacter
	add	sp, #4
	ret
;main.c:65: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:66: set_sprite_data(0,8,gameSprite);
	ld	de,#_gameSprite
	push	de
	ld	hl,#0x0800
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:67: setupIngot();
	call	_setupIngot
;main.c:68: setupMata();
	call	_setupMata
;main.c:70: SHOW_SPRITES;
	ld	de,#0xFF40
	ld	a,(de)
	ld	e,a
	ld	d,#0x00
	ld	a,e
	set	1, a
	ld	b,a
	ld	hl,#0xFF40
	ld	(hl),b
;main.c:71: DISPLAY_ON;
	ld	de,#0xFF40
	ld	a,(de)
	ld	e,a
	ld	d,#0x00
	ld	a,e
	set	7, a
	ld	b,a
	ld	l, #0x40
	ld	(hl),b
;main.c:73: while(!checkCollisions(&ingot, &mata)){
00107$:
	ld	de,#_ingot
	ld	hl,#_mata
	push	hl
	push	de
	call	_checkCollisions
	add	sp, #4
	ld	c,e
	ld	a,c
	or	a, a
	jp	NZ,00109$
;main.c:74: if(joypad() & J_LEFT){
	call	_joypad
	ld	b,e
	ld	c,#0x00
;main.c:75: ingot.x -= 4;
;main.c:76: moveGameCharacter(&ingot,ingot.x,ingot.y);
;main.c:74: if(joypad() & J_LEFT){
	bit	1, b
	jr	Z,00102$
;main.c:75: ingot.x -= 4;
	ld	a, (#(_ingot + 0x0004) + 0)
	add	a,#0xFC
	ld	b,a
	ld	hl,#(_ingot + 0x0004)
	ld	(hl),b
;main.c:76: moveGameCharacter(&ingot,ingot.x,ingot.y);
	ld	de, #(_ingot + 0x0005) + 0
	ld	a,(de)
	ld	c,a
	ld	de,#_ingot
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	push	de
	call	_moveGameCharacter
	add	sp, #4
00102$:
;main.c:79: if(joypad() & J_RIGHT){
	call	_joypad
	ld	d,#0x00
	bit	0, e
	jr	Z,00104$
;main.c:80: ingot.x += 4;
	ld	a, (#(_ingot + 0x0004) + 0)
	ld	b,a
	inc	b
	inc	b
	inc	b
	inc	b
	ld	hl,#(_ingot + 0x0004)
	ld	(hl),b
;main.c:81: moveGameCharacter(&ingot,ingot.x,ingot.y);
	ld	de, #(_ingot + 0x0005) + 0
	ld	a,(de)
	ld	c,a
	ld	de,#_ingot
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	push	de
	call	_moveGameCharacter
	add	sp, #4
00104$:
;main.c:84: mata.y+=5;
	ld	a, (#(_mata + 0x0005) + 0)
	add	a, #0x05
	ld	b,a
	ld	hl,#(_mata + 0x0005)
	ld	(hl),b
;main.c:85: moveGameCharacter(&mata,mata.x,mata.y);
	ld	de, #(_mata + 0x0004) + 0
	ld	a,(de)
	ld	c,a
	ld	de,#_mata
	push	bc
	inc	sp
	ld	a,c
	push	af
	inc	sp
	push	de
	call	_moveGameCharacter
	add	sp, #4
;main.c:87: if(mata.y>=144){
	ld	de, #(_mata + 0x0005) + 0
	ld	a,(de)
	ld	b,a
	sub	a, #0x90
	jr	C,00106$
;main.c:88: mata.y=0;
	ld	hl,#(_mata + 0x0005)
	ld	(hl),#0x00
;main.c:89: mata.x=ingot.x;
	ld	a, (#(_ingot + 0x0004) + 0)
	ld	de,#(_mata + 0x0004)
	ld	(de),a
00106$:
;main.c:93: performantDelay(2);
	ld	a,#0x02
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
	jp	00107$
00109$:
;main.c:95: printf("\n \n \n \n \n \n \n \n  ===Game Over===");
	ld	de,#___str_0+0
	push	de
	call	_printf
	add	sp, #2
	ret
___str_0:
	.db 0x0A
	.ascii " "
	.db 0x0A
	.ascii " "
	.db 0x0A
	.ascii " "
	.db 0x0A
	.ascii " "
	.db 0x0A
	.ascii " "
	.db 0x0A
	.ascii " "
	.db 0x0A
	.ascii " "
	.db 0x0A
	.ascii "  ===Game Over==="
	.db 0x00
	.area _CODE
	.area _CABS (ABS)
