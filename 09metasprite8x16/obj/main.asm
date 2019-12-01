;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 19 2016) (Linux)
; This file was generated Sun Dec  1 16:48:48 2019
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _setupSpider
	.globl _moveGameCharacter
	.globl _moveGameCharAnim
	.globl _performantDelay
	.globl _move_sprite
	.globl _set_sprite_tile
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _spider
	.globl _timer
	.globl _sprite
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_sprite::
	.ds 80
_timer::
	.ds 1
_spider::
	.ds 9
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
;main.c:5: UINT8 timer = 0;
	ld	hl,#_timer
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
;main.c:9: void performantDelay(UINT8 numloops){
;	---------------------------------
; Function performantDelay
; ---------------------------------
_performantDelay::
;main.c:12: for(i=0;i<numloops;i++){
	ld	b,#0x00
00103$:
	ld	a,b
	ldhl	sp,#2
	sub	a, (hl)
	ret	NC
;main.c:13: wait_vbl_done();
	push	bc
	call	_wait_vbl_done
	pop	bc
;main.c:12: for(i=0;i<numloops;i++){
	inc	b
	jr	00103$
	ret
;main.c:18: void moveGameCharAnim(){
;	---------------------------------
; Function moveGameCharAnim
; ---------------------------------
_moveGameCharAnim::
;main.c:20: if(timer == 5){
	ld	hl,#_timer
	ld	a,(hl)
	sub	a, #0x05
	jr	NZ,00104$
;main.c:21: set_sprite_tile(1, 3);
	ld	hl,#0x0301
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:22: set_sprite_tile(2, 4);
	ld	hl,#0x0402
	push	hl
	call	_set_sprite_tile
	add	sp, #2
	jr	00105$
00104$:
;main.c:24: else if(timer == 10){
	ld	hl,#_timer
	ld	a,(hl)
	sub	a, #0x0A
	jr	NZ,00105$
;main.c:25: set_sprite_tile(1, 1);
	ld	hl,#0x0101
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:26: set_sprite_tile(2, 2);
	ld	hl,#0x0202
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:27: timer = 0;
	ld	hl,#_timer
	ld	(hl),#0x00
00105$:
;main.c:29: timer++;
	ld	hl,#_timer
	inc	(hl)
	ret
;main.c:32: void moveGameCharacter(struct gameCharacter *character, UINT8 x, UINT8 y){
;	---------------------------------
; Function moveGameCharacter
; ---------------------------------
_moveGameCharacter::
	add	sp, #-3
;main.c:33: move_sprite(character->spriteId[1],x,y);
	ldhl	sp,#5
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#0
	ld	(hl+),a
	ld	(hl),e
	pop	bc
	push	bc
	inc	bc
	ld	a,(bc)
	ld	d,a
	ldhl	sp,#8
	ld	a,(hl)
	push	af
	inc	sp
	dec	hl
	ld	a,(hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:34: move_sprite(character->spriteId[2],x,y + 8);
	ldhl	sp,#8
	ld	a,(hl)
	add	a, #0x08
	ldhl	sp,#2
	ld	(hl),a
	pop	bc
	push	bc
	inc	bc
	inc	bc
	ld	a,(bc)
	ld	d,a
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#8
	ld	a,(hl)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_move_sprite
	add	sp, #3
	add	sp, #3
	ret
;main.c:38: void setupSpider(){
;	---------------------------------
; Function setupSpider
; ---------------------------------
_setupSpider::
;main.c:39: spider.x=80;
	ld	hl,#(_spider + 0x0005)
	ld	(hl),#0x50
;main.c:40: spider.y=130;
	ld	hl,#(_spider + 0x0006)
	ld	(hl),#0x82
;main.c:41: spider.width=8;
	ld	hl,#(_spider + 0x0007)
	ld	(hl),#0x08
;main.c:42: spider.height=16;
	ld	hl,#(_spider + 0x0008)
	ld	(hl),#0x10
;main.c:44: set_sprite_tile(0,0);
	ld	hl,#0x0000
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:45: spider.spriteId[0]=0;
	ld	hl,#_spider
	ld	(hl),#0x00
;main.c:47: set_sprite_tile(1,1);
	ld	hl,#0x0101
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:48: spider.spriteId[1]=1;
	ld	hl,#(_spider + 0x0001)
	ld	(hl),#0x01
;main.c:49: set_sprite_tile(2,2);
	ld	hl,#0x0202
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:50: spider.spriteId[2]=2;
	ld	hl,#(_spider + 0x0002)
	ld	(hl),#0x02
;main.c:57: moveGameCharacter(&spider,spider.x,spider.y);
	ld	de, #(_spider + 0x0006) + 0
	ld	a,(de)
	ld	c,a
	ld	de, #(_spider + 0x0005) + 0
	ld	a,(de)
	ld	b,a
	ld	de,#_spider
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	push	de
	call	_moveGameCharacter
	add	sp, #4
	ret
;main.c:60: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:61: set_sprite_data(0,5,sprite);
	ld	de,#_sprite
	push	de
	ld	hl,#0x0500
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:62: setupSpider();
	call	_setupSpider
;main.c:65: SHOW_SPRITES;
	ld	de,#0xFF40
	ld	a,(de)
	ld	e,a
	ld	d,#0x00
	ld	a,e
	set	1, a
	ld	b,a
	ld	hl,#0xFF40
	ld	(hl),b
;main.c:66: DISPLAY_ON;
	ld	de,#0xFF40
	ld	a,(de)
	ld	e,a
	ld	d,#0x00
	ld	a,e
	set	7, a
	ld	b,a
	ld	l, #0x40
	ld	(hl),b
;main.c:69: while(1){
00106$:
;main.c:73: if(joypad() & J_LEFT){
	call	_joypad
	ld	d,#0x00
	bit	1, e
	jr	Z,00102$
;main.c:74: spider.x -= 2;
	ld	a, (#(_spider + 0x0005) + 0)
	ld	b,a
	dec	b
	dec	b
	ld	hl,#(_spider + 0x0005)
	ld	(hl),b
;main.c:75: moveGameCharacter(&spider,spider.x,spider.y);
	ld	de, #(_spider + 0x0006) + 0
	ld	a,(de)
	ld	c,a
	ld	de,#_spider
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	push	de
	call	_moveGameCharacter
	add	sp, #4
;main.c:76: moveGameCharAnim();
	call	_moveGameCharAnim
00102$:
;main.c:80: if(joypad() & J_RIGHT){
	call	_joypad
	ld	d,#0x00
	bit	0, e
	jr	Z,00104$
;main.c:81: spider.x += 2;
	ld	a, (#(_spider + 0x0005) + 0)
	ld	b,a
	inc	b
	inc	b
	ld	hl,#(_spider + 0x0005)
	ld	(hl),b
;main.c:82: moveGameCharacter(&spider,spider.x,spider.y);
	ld	de, #(_spider + 0x0006) + 0
	ld	a,(de)
	ld	c,a
	ld	de,#_spider
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	push	de
	call	_moveGameCharacter
	add	sp, #4
;main.c:83: moveGameCharAnim();
	call	_moveGameCharAnim
00104$:
;main.c:86: performantDelay(1);
	ld	a,#0x01
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
	jp	00106$
	ret
	.area _CODE
	.area _CABS (ABS)
