;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 19 2016) (Linux)
; This file was generated Tue Oct 29 20:25:29 2019
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _jump
	.globl _wouldHitSurf
	.globl _performantDelay
	.globl _move_sprite
	.globl _set_sprite_tile
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _bloke1
	.globl _bloke2
	.globl _floorYPosition
	.globl _currentSpeedY
	.globl _gravity
	.globl _jumping
	.globl _playerLocation
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_playerLocation::
	.ds 2
_jumping::
	.ds 1
_gravity::
	.ds 1
_currentSpeedY::
	.ds 1
_floorYPosition::
	.ds 1
_bloke2::
	.ds 16
_bloke1::
	.ds 128
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
;main.c:7: INT8 gravity=-2;
	ld	hl,#_gravity
	ld	(hl),#0xFE
;main.c:9: UINT8 floorYPosition=100;
	ld	hl,#_floorYPosition
	ld	(hl),#0x64
;main.c:12: unsigned char bloke2[] =
	ld	hl,#_bloke2
	ld	(hl),#0x7E
	ld	hl,#(_bloke2 + 0x0001)
	ld	(hl),#0x7E
	ld	hl,#(_bloke2 + 0x0002)
	ld	(hl),#0x81
	ld	hl,#(_bloke2 + 0x0003)
	ld	(hl),#0xFF
	ld	bc,#_bloke2 + 4
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke2 + 0x0005)
	ld	(hl),#0xFF
	ld	hl,#(_bloke2 + 0x0006)
	ld	(hl),#0x1C
	ld	hl,#(_bloke2 + 0x0007)
	ld	(hl),#0xE7
	ld	hl,#(_bloke2 + 0x0008)
	ld	(hl),#0x1C
	ld	hl,#(_bloke2 + 0x0009)
	ld	(hl),#0xE3
	ld	bc,#_bloke2 + 10
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke2 + 0x000b)
	ld	(hl),#0xFE
	ld	hl,#(_bloke2 + 0x000c)
	ld	(hl),#0x1E
	ld	hl,#(_bloke2 + 0x000d)
	ld	(hl),#0x7E
	ld	hl,#(_bloke2 + 0x000e)
	ld	(hl),#0x3F
	ld	hl,#(_bloke2 + 0x000f)
	ld	(hl),#0x3F
;main.c:17: unsigned char bloke1[] =
	ld	hl,#_bloke1
	ld	(hl),#0x00
	ld	bc,#_bloke1 + 1
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke1 + 0x0002)
	ld	(hl),#0x38
	ld	hl,#(_bloke1 + 0x0003)
	ld	(hl),#0x38
	ld	hl,#(_bloke1 + 0x0004)
	ld	(hl),#0x7C
	ld	hl,#(_bloke1 + 0x0005)
	ld	(hl),#0x44
	ld	hl,#(_bloke1 + 0x0006)
	ld	(hl),#0x7F
	ld	hl,#(_bloke1 + 0x0007)
	ld	(hl),#0x7F
	ld	hl,#(_bloke1 + 0x0008)
	ld	(hl),#0x44
	ld	hl,#(_bloke1 + 0x0009)
	ld	(hl),#0x74
	ld	hl,#(_bloke1 + 0x000a)
	ld	(hl),#0x46
	ld	hl,#(_bloke1 + 0x000b)
	ld	(hl),#0x7C
	ld	hl,#(_bloke1 + 0x000c)
	ld	(hl),#0x40
	ld	hl,#(_bloke1 + 0x000d)
	ld	(hl),#0x78
	ld	hl,#(_bloke1 + 0x000e)
	ld	(hl),#0x24
	ld	hl,#(_bloke1 + 0x000f)
	ld	(hl),#0x3C
	ld	hl,#(_bloke1 + 0x0010)
	ld	(hl),#0x18
	ld	hl,#(_bloke1 + 0x0011)
	ld	(hl),#0x3C
	ld	bc,#_bloke1 + 18
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke1 + 0x0013)
	ld	(hl),#0x24
	ld	bc,#_bloke1 + 20
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke1 + 0x0015)
	ld	(hl),#0x24
	ld	bc,#_bloke1 + 22
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke1 + 0x0017)
	ld	(hl),#0x24
	ld	bc,#_bloke1 + 24
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke1 + 0x0019)
	ld	(hl),#0x24
	ld	bc,#_bloke1 + 26
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke1 + 0x001b)
	ld	(hl),#0x36
	ld	bc,#_bloke1 + 28
	xor	a, a
	ld	(bc),a
	ld	bc,#_bloke1 + 29
	xor	a, a
	ld	(bc),a
	ld	bc,#_bloke1 + 30
	xor	a, a
	ld	(bc),a
	ld	bc,#_bloke1 + 31
	xor	a, a
	ld	(bc),a
	ld	bc,#_bloke1 + 32
	xor	a, a
	ld	(bc),a
	ld	bc,#_bloke1 + 33
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke1 + 0x0022)
	ld	(hl),#0x38
	ld	hl,#(_bloke1 + 0x0023)
	ld	(hl),#0x38
	ld	hl,#(_bloke1 + 0x0024)
	ld	(hl),#0x7C
	ld	hl,#(_bloke1 + 0x0025)
	ld	(hl),#0x44
	ld	hl,#(_bloke1 + 0x0026)
	ld	(hl),#0x7F
	ld	hl,#(_bloke1 + 0x0027)
	ld	(hl),#0x7F
	ld	hl,#(_bloke1 + 0x0028)
	ld	(hl),#0x44
	ld	hl,#(_bloke1 + 0x0029)
	ld	(hl),#0x74
	ld	hl,#(_bloke1 + 0x002a)
	ld	(hl),#0x46
	ld	hl,#(_bloke1 + 0x002b)
	ld	(hl),#0x7C
	ld	hl,#(_bloke1 + 0x002c)
	ld	(hl),#0x40
	ld	hl,#(_bloke1 + 0x002d)
	ld	(hl),#0x78
	ld	hl,#(_bloke1 + 0x002e)
	ld	(hl),#0x24
	ld	hl,#(_bloke1 + 0x002f)
	ld	(hl),#0x3C
	ld	hl,#(_bloke1 + 0x0030)
	ld	(hl),#0x18
	ld	hl,#(_bloke1 + 0x0031)
	ld	(hl),#0x3C
	ld	bc,#_bloke1 + 50
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke1 + 0x0033)
	ld	(hl),#0x22
	ld	bc,#_bloke1 + 52
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke1 + 0x0035)
	ld	(hl),#0x22
	ld	bc,#_bloke1 + 54
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke1 + 0x0037)
	ld	(hl),#0x22
	ld	bc,#_bloke1 + 56
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke1 + 0x0039)
	ld	(hl),#0x23
	ld	bc,#_bloke1 + 58
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke1 + 0x003b)
	ld	(hl),#0x30
	ld	bc,#_bloke1 + 60
	xor	a, a
	ld	(bc),a
	ld	bc,#_bloke1 + 61
	xor	a, a
	ld	(bc),a
	ld	bc,#_bloke1 + 62
	xor	a, a
	ld	(bc),a
	ld	bc,#_bloke1 + 63
	xor	a, a
	ld	(bc),a
	ld	bc,#_bloke1 + 64
	xor	a, a
	ld	(bc),a
	ld	bc,#_bloke1 + 65
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke1 + 0x0042)
	ld	(hl),#0x38
	ld	hl,#(_bloke1 + 0x0043)
	ld	(hl),#0x38
	ld	hl,#(_bloke1 + 0x0044)
	ld	(hl),#0x7C
	ld	hl,#(_bloke1 + 0x0045)
	ld	(hl),#0x44
	ld	hl,#(_bloke1 + 0x0046)
	ld	(hl),#0x7F
	ld	hl,#(_bloke1 + 0x0047)
	ld	(hl),#0x7F
	ld	hl,#(_bloke1 + 0x0048)
	ld	(hl),#0x44
	ld	hl,#(_bloke1 + 0x0049)
	ld	(hl),#0x74
	ld	hl,#(_bloke1 + 0x004a)
	ld	(hl),#0x46
	ld	hl,#(_bloke1 + 0x004b)
	ld	(hl),#0x7C
	ld	hl,#(_bloke1 + 0x004c)
	ld	(hl),#0x40
	ld	hl,#(_bloke1 + 0x004d)
	ld	(hl),#0x78
	ld	hl,#(_bloke1 + 0x004e)
	ld	(hl),#0x24
	ld	hl,#(_bloke1 + 0x004f)
	ld	(hl),#0x3C
	ld	hl,#(_bloke1 + 0x0050)
	ld	(hl),#0x18
	ld	hl,#(_bloke1 + 0x0051)
	ld	(hl),#0x3C
	ld	bc,#_bloke1 + 82
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke1 + 0x0053)
	ld	(hl),#0x42
	ld	bc,#_bloke1 + 84
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke1 + 0x0055)
	ld	(hl),#0x42
	ld	bc,#_bloke1 + 86
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke1 + 0x0057)
	ld	(hl),#0x42
	ld	bc,#_bloke1 + 88
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke1 + 0x0059)
	ld	(hl),#0x42
	ld	bc,#_bloke1 + 90
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke1 + 0x005b)
	ld	(hl),#0x63
	ld	bc,#_bloke1 + 92
	xor	a, a
	ld	(bc),a
	ld	bc,#_bloke1 + 93
	xor	a, a
	ld	(bc),a
	ld	bc,#_bloke1 + 94
	xor	a, a
	ld	(bc),a
	ld	bc,#_bloke1 + 95
	xor	a, a
	ld	(bc),a
	ld	bc,#_bloke1 + 96
	xor	a, a
	ld	(bc),a
	ld	bc,#_bloke1 + 97
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke1 + 0x0062)
	ld	(hl),#0x38
	ld	hl,#(_bloke1 + 0x0063)
	ld	(hl),#0x38
	ld	hl,#(_bloke1 + 0x0064)
	ld	(hl),#0x7C
	ld	hl,#(_bloke1 + 0x0065)
	ld	(hl),#0x44
	ld	hl,#(_bloke1 + 0x0066)
	ld	(hl),#0x7F
	ld	hl,#(_bloke1 + 0x0067)
	ld	(hl),#0x7F
	ld	hl,#(_bloke1 + 0x0068)
	ld	(hl),#0x44
	ld	hl,#(_bloke1 + 0x0069)
	ld	(hl),#0x74
	ld	hl,#(_bloke1 + 0x006a)
	ld	(hl),#0x46
	ld	hl,#(_bloke1 + 0x006b)
	ld	(hl),#0x7C
	ld	hl,#(_bloke1 + 0x006c)
	ld	(hl),#0x40
	ld	hl,#(_bloke1 + 0x006d)
	ld	(hl),#0x78
	ld	hl,#(_bloke1 + 0x006e)
	ld	(hl),#0x24
	ld	hl,#(_bloke1 + 0x006f)
	ld	(hl),#0x3C
	ld	hl,#(_bloke1 + 0x0070)
	ld	(hl),#0x18
	ld	hl,#(_bloke1 + 0x0071)
	ld	(hl),#0x3C
	ld	bc,#_bloke1 + 114
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke1 + 0x0073)
	ld	(hl),#0x44
	ld	bc,#_bloke1 + 116
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke1 + 0x0075)
	ld	(hl),#0x44
	ld	bc,#_bloke1 + 118
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke1 + 0x0077)
	ld	(hl),#0x44
	ld	bc,#_bloke1 + 120
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke1 + 0x0079)
	ld	(hl),#0x64
	ld	bc,#_bloke1 + 122
	xor	a, a
	ld	(bc),a
	ld	hl,#(_bloke1 + 0x007b)
	ld	(hl),#0x06
	ld	bc,#_bloke1 + 124
	xor	a, a
	ld	(bc),a
	ld	bc,#_bloke1 + 125
	xor	a, a
	ld	(bc),a
	ld	bc,#_bloke1 + 126
	xor	a, a
	ld	(bc),a
	ld	bc,#_bloke1 + 127
	xor	a, a
	ld	(bc),a
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:37: void performantDelay(UINT8 numloops){
;	---------------------------------
; Function performantDelay
; ---------------------------------
_performantDelay::
;main.c:40: for(i=0;i<numloops;i++){
	ld	b,#0x00
00103$:
	ld	a,b
	ldhl	sp,#2
	sub	a, (hl)
	ret	NC
;main.c:41: wait_vbl_done();
	push	bc
	call	_wait_vbl_done
	pop	bc
;main.c:40: for(i=0;i<numloops;i++){
	inc	b
	jr	00103$
	ret
;main.c:45: INT8 wouldHitSurf(UINT8 projectedYPosition){
;	---------------------------------
; Function wouldHitSurf
; ---------------------------------
_wouldHitSurf::
;main.c:46: if(projectedYPosition>=floorYPosition){
	ldhl	sp,#2
	ld	a,(hl)
	ld	hl,#_floorYPosition
	sub	a, (hl)
	jr	C,00102$
;main.c:47: return floorYPosition;
	ld	e,(hl)
	ret
00102$:
;main.c:49: return -1;
	ld	e,#0xFF
	ret
;main.c:52: void jump(UINT8 spriteId,UINT8 spriteLocation[2]){
;	---------------------------------
; Function jump
; ---------------------------------
_jump::
	add	sp, #-2
;main.c:55: if(jumping==0){
	ld	hl,#_jumping
	ld	a,(hl)
	or	a, a
	jr	NZ,00102$
;main.c:56: jumping=1;
	ld	(hl),#0x01
;main.c:57: currentSpeedY=15;
	ld	hl,#_currentSpeedY
	ld	(hl),#0x0F
00102$:
;main.c:60: currentSpeedY=currentSpeedY+gravity;
	ld	hl,#_currentSpeedY
	ld	d,(hl)
	ld	a,d
	ld	hl,#_gravity
	add	a, (hl)
	ld	hl,#_currentSpeedY
	ld	(hl),a
;main.c:62: spriteLocation[1]=spriteLocation[1]-currentSpeedY;
	ldhl	sp,#6
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0001
	add	hl,de
	inc	sp
	inc	sp
	push	hl
	pop	de
	push	de
	ld	a,(de)
	ld	b,a
	ld	hl,#_currentSpeedY
	sub	a, (hl)
	ld	b,a
	pop	hl
	push	hl
	ld	(hl),b
;main.c:63: possibleSurfaceY=wouldHitSurf(spriteLocation[1]);
	push	bc
	inc	sp
	call	_wouldHitSurf
	inc	sp
	ld	c,e
;main.c:67: move_sprite(spriteId,spriteLocation[0],possibleSurfaceY);
	ldhl	sp,#6
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	b,a
;main.c:65: if(possibleSurfaceY>-1){
	ld	a,c
	ld	e,a
	ld	a,#0xFF
	ld	d,a
	ld	a,#0xFF
	sub	a, c
	bit	7, e
	jr	Z,00116$
	bit	7, d
	jr	NZ,00117$
	cp	a, a
	jr	00117$
00116$:
	bit	7, d
	jr	Z,00117$
	scf
00117$:
	jr	NC,00104$
;main.c:66: jumping=0;
	ld	hl,#_jumping
	ld	(hl),#0x00
;main.c:67: move_sprite(spriteId,spriteLocation[0],possibleSurfaceY);
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,#6
	ld	a,(hl)
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
	jr	00106$
00104$:
;main.c:71: move_sprite(spriteId,spriteLocation[0],spriteLocation[1]);
	pop	de
	push	de
	ld	a,(de)
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,#6
	ld	a,(hl)
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
00106$:
	add	sp, #2
	ret
;main.c:75: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:77: set_sprite_data(0,8,bloke1);//(first tile,last tile,char name) 
	ld	de,#_bloke1
	push	de
	ld	hl,#0x0800
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:78: set_sprite_tile(1,0);//(sprite tile number used,sprite ID)
	ld	hl,#0x0001
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:80: set_sprite_data(0,0,bloke2);
	ld	de,#_bloke2
	push	de
	ld	hl,#0x0000
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:81: set_sprite_tile(0,1);
	ld	hl,#0x0100
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:83: playerLocation[0]=10;
	ld	hl,#_playerLocation
	ld	(hl),#0x0A
;main.c:84: playerLocation[1]=floorYPosition;
	ld	de,#(_playerLocation + 0x0001)
	ld	hl,#_floorYPosition
	ld	a,(hl)
	ld	(de),a
;main.c:85: jumping=0;
	ld	hl,#_jumping
	ld	(hl),#0x00
;main.c:87: move_sprite(0,playerLocation[0],playerLocation[1]);
	ld	de, #(_playerLocation + 0x0001) + 0
	ld	a,(de)
	ld	b,a
	ld	a, (#_playerLocation + 0)
	push	bc
	inc	sp
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:88: move_sprite(1,20,100);//(sprite ID,x location,y location)
	ld	hl,#0x6414
	push	hl
	ld	a,#0x01
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:90: DISPLAY_ON;
	ld	de,#0xFF40
	ld	a,(de)
	ld	e,a
	ld	d,#0x00
	ld	a,e
	set	7, a
	ld	b,a
	ld	hl,#0xFF40
	ld	(hl),b
;main.c:91: SHOW_SPRITES;
	ld	de,#0xFF40
	ld	a,(de)
	ld	e,a
	ld	d,#0x00
	ld	a,e
	set	1, a
	ld	b,a
	ld	l, #0x40
	ld	(hl),b
;main.c:93: while(1){
00109$:
;main.c:94: if((joypad() & J_A)|| jumping==1){
	call	_joypad
	ld	d,#0x00
	bit	4, e
	jr	NZ,00101$
	ld	hl,#_jumping
	ld	a,(hl)
	dec	a
	jr	NZ,00102$
00101$:
;main.c:95: jump(0,playerLocation);	
	ld	de,#_playerLocation
	push	de
	xor	a, a
	push	af
	inc	sp
	call	_jump
	add	sp, #3
00102$:
;main.c:97: if(joypad() & J_LEFT){
	call	_joypad
	ld	d,#0x00
	bit	1, e
	jr	Z,00105$
;main.c:98: playerLocation[0]=playerLocation[0]-2;
	ld	a, (#_playerLocation + 0)
	ld	b,a
	dec	b
	dec	b
	ld	hl,#_playerLocation
	ld	(hl),b
;main.c:99: move_sprite(0,playerLocation[0],playerLocation[1]);
	ld	a, (#(_playerLocation + 0x0001) + 0)
	push	af
	inc	sp
	push	bc
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
00105$:
;main.c:101: if(joypad() & J_RIGHT){
	call	_joypad
	ld	d,#0x00
	bit	0, e
	jr	Z,00107$
;main.c:102: playerLocation[0]=playerLocation[0]+2;
	ld	a, (#_playerLocation + 0)
	ld	b,a
	inc	b
	inc	b
	ld	hl,#_playerLocation
	ld	(hl),b
;main.c:103: move_sprite(0,playerLocation[0],playerLocation[1]);
	ld	a, (#(_playerLocation + 0x0001) + 0)
	push	af
	inc	sp
	push	bc
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
00107$:
;main.c:106: performantDelay(2);
	ld	a,#0x02
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
	jp	00109$
	ret
	.area _CODE
	.area _CABS (ABS)
