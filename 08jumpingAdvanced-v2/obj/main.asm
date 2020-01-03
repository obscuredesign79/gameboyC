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
	.globl _jumpSound
	.globl _jump
	.globl _wouldHitSurf
	.globl _setupBallSprite01
	.globl _moveGameCharacter
	.globl _gameBallSprite03
	.globl _gameBallSprite02
	.globl _gameBallSprite01b
	.globl _gameBallSprite01a
	.globl _performantDelay
	.globl _move_sprite
	.globl _set_sprite_tile
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _ballSprite01
	.globl _timerAnimation
	.globl _possibleYSurface
	.globl _floorYPosition
	.globl _currentSpeedY
	.globl _gravity
	.globl _jumping
	.globl _keyPressed_A
	.globl _keys
	.globl _previousKeys
	.globl _ballSprite
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_ballSprite::
	.ds 240
_previousKeys::
	.ds 1
_keys::
	.ds 1
_keyPressed_A::
	.ds 1
_jumping::
	.ds 1
_gravity::
	.ds 1
_currentSpeedY::
	.ds 1
_floorYPosition::
	.ds 1
_possibleYSurface::
	.ds 1
_timerAnimation::
	.ds 1
_ballSprite01::
	.ds 8
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
;ballSprite.c:26: unsigned char ballSprite[] =
	ld	hl,#_ballSprite
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0001)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0002)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0003)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0004)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0005)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0006)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0007)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0008)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0009)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x000a)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x000b)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x000c)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x000d)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x000e)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x000f)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0010)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0011)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0012)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0013)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0014)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0015)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0016)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0017)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0018)
	ld	(hl),#0x07
	ld	hl,#(_ballSprite + 0x0019)
	ld	(hl),#0x07
	ld	hl,#(_ballSprite + 0x001a)
	ld	(hl),#0x08
	ld	hl,#(_ballSprite + 0x001b)
	ld	(hl),#0x0f
	ld	hl,#(_ballSprite + 0x001c)
	ld	(hl),#0x16
	ld	hl,#(_ballSprite + 0x001d)
	ld	(hl),#0x19
	ld	hl,#(_ballSprite + 0x001e)
	ld	(hl),#0x26
	ld	hl,#(_ballSprite + 0x001f)
	ld	(hl),#0x39
	ld	hl,#(_ballSprite + 0x0020)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0021)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0022)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0023)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0024)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0025)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0026)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0027)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0028)
	ld	(hl),#0xe0
	ld	hl,#(_ballSprite + 0x0029)
	ld	(hl),#0xe0
	ld	hl,#(_ballSprite + 0x002a)
	ld	(hl),#0x10
	ld	hl,#(_ballSprite + 0x002b)
	ld	(hl),#0xf0
	ld	hl,#(_ballSprite + 0x002c)
	ld	(hl),#0x08
	ld	hl,#(_ballSprite + 0x002d)
	ld	(hl),#0xf8
	ld	hl,#(_ballSprite + 0x002e)
	ld	(hl),#0x04
	ld	hl,#(_ballSprite + 0x002f)
	ld	(hl),#0xfc
	ld	hl,#(_ballSprite + 0x0030)
	ld	(hl),#0x20
	ld	hl,#(_ballSprite + 0x0031)
	ld	(hl),#0x3f
	ld	hl,#(_ballSprite + 0x0032)
	ld	(hl),#0x20
	ld	hl,#(_ballSprite + 0x0033)
	ld	(hl),#0x3f
	ld	hl,#(_ballSprite + 0x0034)
	ld	(hl),#0x20
	ld	hl,#(_ballSprite + 0x0035)
	ld	(hl),#0x3f
	ld	hl,#(_ballSprite + 0x0036)
	ld	(hl),#0x20
	ld	hl,#(_ballSprite + 0x0037)
	ld	(hl),#0x3f
	ld	hl,#(_ballSprite + 0x0038)
	ld	(hl),#0x20
	ld	hl,#(_ballSprite + 0x0039)
	ld	(hl),#0x3f
	ld	hl,#(_ballSprite + 0x003a)
	ld	(hl),#0x10
	ld	hl,#(_ballSprite + 0x003b)
	ld	(hl),#0x1f
	ld	hl,#(_ballSprite + 0x003c)
	ld	(hl),#0x08
	ld	hl,#(_ballSprite + 0x003d)
	ld	(hl),#0x0f
	ld	hl,#(_ballSprite + 0x003e)
	ld	(hl),#0x07
	ld	hl,#(_ballSprite + 0x003f)
	ld	(hl),#0x07
	ld	hl,#(_ballSprite + 0x0040)
	ld	(hl),#0x04
	ld	hl,#(_ballSprite + 0x0041)
	ld	(hl),#0xfc
	ld	hl,#(_ballSprite + 0x0042)
	ld	(hl),#0x04
	ld	hl,#(_ballSprite + 0x0043)
	ld	(hl),#0xfc
	ld	hl,#(_ballSprite + 0x0044)
	ld	(hl),#0x04
	ld	hl,#(_ballSprite + 0x0045)
	ld	(hl),#0xfc
	ld	hl,#(_ballSprite + 0x0046)
	ld	(hl),#0x04
	ld	hl,#(_ballSprite + 0x0047)
	ld	(hl),#0xfc
	ld	hl,#(_ballSprite + 0x0048)
	ld	(hl),#0x04
	ld	hl,#(_ballSprite + 0x0049)
	ld	(hl),#0xfc
	ld	hl,#(_ballSprite + 0x004a)
	ld	(hl),#0x08
	ld	hl,#(_ballSprite + 0x004b)
	ld	(hl),#0xf8
	ld	hl,#(_ballSprite + 0x004c)
	ld	(hl),#0x10
	ld	hl,#(_ballSprite + 0x004d)
	ld	(hl),#0xf0
	ld	hl,#(_ballSprite + 0x004e)
	ld	(hl),#0xe0
	ld	hl,#(_ballSprite + 0x004f)
	ld	(hl),#0xe0
	ld	hl,#(_ballSprite + 0x0050)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0051)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0052)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0053)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0054)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0055)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0056)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0057)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0058)
	ld	(hl),#0x07
	ld	hl,#(_ballSprite + 0x0059)
	ld	(hl),#0x07
	ld	hl,#(_ballSprite + 0x005a)
	ld	(hl),#0x08
	ld	hl,#(_ballSprite + 0x005b)
	ld	(hl),#0x0f
	ld	hl,#(_ballSprite + 0x005c)
	ld	(hl),#0x11
	ld	hl,#(_ballSprite + 0x005d)
	ld	(hl),#0x1e
	ld	hl,#(_ballSprite + 0x005e)
	ld	(hl),#0x21
	ld	hl,#(_ballSprite + 0x005f)
	ld	(hl),#0x3e
	ld	hl,#(_ballSprite + 0x0060)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0061)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0062)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0063)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0064)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0065)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0066)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0067)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0068)
	ld	(hl),#0xe0
	ld	hl,#(_ballSprite + 0x0069)
	ld	(hl),#0xe0
	ld	hl,#(_ballSprite + 0x006a)
	ld	(hl),#0x90
	ld	hl,#(_ballSprite + 0x006b)
	ld	(hl),#0x70
	ld	hl,#(_ballSprite + 0x006c)
	ld	(hl),#0x88
	ld	hl,#(_ballSprite + 0x006d)
	ld	(hl),#0x78
	ld	hl,#(_ballSprite + 0x006e)
	ld	(hl),#0x04
	ld	hl,#(_ballSprite + 0x006f)
	ld	(hl),#0xfc
	ld	hl,#(_ballSprite + 0x0070)
	ld	(hl),#0x20
	ld	hl,#(_ballSprite + 0x0071)
	ld	(hl),#0x3f
	ld	hl,#(_ballSprite + 0x0072)
	ld	(hl),#0x20
	ld	hl,#(_ballSprite + 0x0073)
	ld	(hl),#0x3f
	ld	hl,#(_ballSprite + 0x0074)
	ld	(hl),#0x20
	ld	hl,#(_ballSprite + 0x0075)
	ld	(hl),#0x3f
	ld	hl,#(_ballSprite + 0x0076)
	ld	(hl),#0x20
	ld	hl,#(_ballSprite + 0x0077)
	ld	(hl),#0x3f
	ld	hl,#(_ballSprite + 0x0078)
	ld	(hl),#0x20
	ld	hl,#(_ballSprite + 0x0079)
	ld	(hl),#0x3f
	ld	hl,#(_ballSprite + 0x007a)
	ld	(hl),#0x10
	ld	hl,#(_ballSprite + 0x007b)
	ld	(hl),#0x1f
	ld	hl,#(_ballSprite + 0x007c)
	ld	(hl),#0x08
	ld	hl,#(_ballSprite + 0x007d)
	ld	(hl),#0x0f
	ld	hl,#(_ballSprite + 0x007e)
	ld	(hl),#0x07
	ld	hl,#(_ballSprite + 0x007f)
	ld	(hl),#0x07
	ld	hl,#(_ballSprite + 0x0080)
	ld	(hl),#0x04
	ld	hl,#(_ballSprite + 0x0081)
	ld	(hl),#0xfc
	ld	hl,#(_ballSprite + 0x0082)
	ld	(hl),#0x04
	ld	hl,#(_ballSprite + 0x0083)
	ld	(hl),#0xfc
	ld	hl,#(_ballSprite + 0x0084)
	ld	(hl),#0x04
	ld	hl,#(_ballSprite + 0x0085)
	ld	(hl),#0xfc
	ld	hl,#(_ballSprite + 0x0086)
	ld	(hl),#0x04
	ld	hl,#(_ballSprite + 0x0087)
	ld	(hl),#0xfc
	ld	hl,#(_ballSprite + 0x0088)
	ld	(hl),#0x04
	ld	hl,#(_ballSprite + 0x0089)
	ld	(hl),#0xfc
	ld	hl,#(_ballSprite + 0x008a)
	ld	(hl),#0x08
	ld	hl,#(_ballSprite + 0x008b)
	ld	(hl),#0xf8
	ld	hl,#(_ballSprite + 0x008c)
	ld	(hl),#0x10
	ld	hl,#(_ballSprite + 0x008d)
	ld	(hl),#0xf0
	ld	hl,#(_ballSprite + 0x008e)
	ld	(hl),#0xe0
	ld	hl,#(_ballSprite + 0x008f)
	ld	(hl),#0xe0
	ld	hl,#(_ballSprite + 0x0090)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0091)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x0092)
	ld	(hl),#0x01
	ld	hl,#(_ballSprite + 0x0093)
	ld	(hl),#0x01
	ld	hl,#(_ballSprite + 0x0094)
	ld	(hl),#0x02
	ld	hl,#(_ballSprite + 0x0095)
	ld	(hl),#0x03
	ld	hl,#(_ballSprite + 0x0096)
	ld	(hl),#0x05
	ld	hl,#(_ballSprite + 0x0097)
	ld	(hl),#0x06
	ld	hl,#(_ballSprite + 0x0098)
	ld	(hl),#0x07
	ld	hl,#(_ballSprite + 0x0099)
	ld	(hl),#0x04
	ld	hl,#(_ballSprite + 0x009a)
	ld	(hl),#0x08
	ld	hl,#(_ballSprite + 0x009b)
	ld	(hl),#0x0f
	ld	hl,#(_ballSprite + 0x009c)
	ld	(hl),#0x08
	ld	hl,#(_ballSprite + 0x009d)
	ld	(hl),#0x0f
	ld	hl,#(_ballSprite + 0x009e)
	ld	(hl),#0x08
	ld	hl,#(_ballSprite + 0x009f)
	ld	(hl),#0x0f
	ld	hl,#(_ballSprite + 0x00a0)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x00a1)
	ld	(hl),#0x00
	ld	hl,#(_ballSprite + 0x00a2)
	ld	(hl),#0x80
	ld	hl,#(_ballSprite + 0x00a3)
	ld	(hl),#0x80
	ld	hl,#(_ballSprite + 0x00a4)
	ld	(hl),#0x40
	ld	hl,#(_ballSprite + 0x00a5)
	ld	(hl),#0xc0
	ld	hl,#(_ballSprite + 0x00a6)
	ld	(hl),#0x20
	ld	hl,#(_ballSprite + 0x00a7)
	ld	(hl),#0xe0
	ld	hl,#(_ballSprite + 0x00a8)
	ld	(hl),#0x20
	ld	hl,#(_ballSprite + 0x00a9)
	ld	(hl),#0xe0
	ld	hl,#(_ballSprite + 0x00aa)
	ld	(hl),#0x10
	ld	hl,#(_ballSprite + 0x00ab)
	ld	(hl),#0xf0
	ld	hl,#(_ballSprite + 0x00ac)
	ld	(hl),#0x10
	ld	hl,#(_ballSprite + 0x00ad)
	ld	(hl),#0xf0
	ld	hl,#(_ballSprite + 0x00ae)
	ld	(hl),#0x10
	ld	hl,#(_ballSprite + 0x00af)
	ld	(hl),#0xf0
	ld	hl,#(_ballSprite + 0x00b0)
	ld	(hl),#0x08
	ld	hl,#(_ballSprite + 0x00b1)
	ld	(hl),#0x0f
	ld	hl,#(_ballSprite + 0x00b2)
	ld	(hl),#0x08
	ld	hl,#(_ballSprite + 0x00b3)
	ld	(hl),#0x0f
	ld	hl,#(_ballSprite + 0x00b4)
	ld	(hl),#0x08
	ld	hl,#(_ballSprite + 0x00b5)
	ld	(hl),#0x0f
	ld	hl,#(_ballSprite + 0x00b6)
	ld	(hl),#0x08
	ld	hl,#(_ballSprite + 0x00b7)
	ld	(hl),#0x0f
	ld	hl,#(_ballSprite + 0x00b8)
	ld	(hl),#0x04
	ld	hl,#(_ballSprite + 0x00b9)
	ld	(hl),#0x07
	ld	hl,#(_ballSprite + 0x00ba)
	ld	(hl),#0x04
	ld	hl,#(_ballSprite + 0x00bb)
	ld	(hl),#0x07
	ld	hl,#(_ballSprite + 0x00bc)
	ld	(hl),#0x02
	ld	hl,#(_ballSprite + 0x00bd)
	ld	(hl),#0x03
	ld	hl,#(_ballSprite + 0x00be)
	ld	(hl),#0x01
	ld	hl,#(_ballSprite + 0x00bf)
	ld	(hl),#0x01
	ld	hl,#(_ballSprite + 0x00c0)
	ld	(hl),#0x10
	ld	hl,#(_ballSprite + 0x00c1)
	ld	(hl),#0xf0
	ld	hl,#(_ballSprite + 0x00c2)
	ld	(hl),#0x10
	ld	hl,#(_ballSprite + 0x00c3)
	ld	(hl),#0xf0
	ld	hl,#(_ballSprite + 0x00c4)
	ld	(hl),#0x10
	ld	hl,#(_ballSprite + 0x00c5)
	ld	(hl),#0xf0
	ld	hl,#(_ballSprite + 0x00c6)
	ld	(hl),#0x10
	ld	hl,#(_ballSprite + 0x00c7)
	ld	(hl),#0xf0
	ld	hl,#(_ballSprite + 0x00c8)
	ld	(hl),#0x20
	ld	hl,#(_ballSprite + 0x00c9)
	ld	(hl),#0xe0
	ld	hl,#(_ballSprite + 0x00ca)
	ld	(hl),#0x20
	ld	hl,#(_ballSprite + 0x00cb)
	ld	(hl),#0xe0
	ld	hl,#(_ballSprite + 0x00cc)
	ld	(hl),#0x40
	ld	hl,#(_ballSprite + 0x00cd)
	ld	(hl),#0xc0
	ld	hl,#(_ballSprite + 0x00ce)
	ld	(hl),#0x80
	ld	hl,#(_ballSprite + 0x00cf)
	ld	(hl),#0x80
	ld	hl,#(_ballSprite + 0x00d0)
	ld	(hl),#0x03
	ld	hl,#(_ballSprite + 0x00d1)
	ld	(hl),#0x03
	ld	hl,#(_ballSprite + 0x00d2)
	ld	(hl),#0x0c
	ld	hl,#(_ballSprite + 0x00d3)
	ld	(hl),#0x0f
	ld	hl,#(_ballSprite + 0x00d4)
	ld	(hl),#0x36
	ld	hl,#(_ballSprite + 0x00d5)
	ld	(hl),#0x39
	ld	hl,#(_ballSprite + 0x00d6)
	ld	(hl),#0x4e
	ld	hl,#(_ballSprite + 0x00d7)
	ld	(hl),#0x71
	ld	hl,#(_ballSprite + 0x00d8)
	ld	(hl),#0x80
	ld	hl,#(_ballSprite + 0x00d9)
	ld	(hl),#0xff
	ld	hl,#(_ballSprite + 0x00da)
	ld	(hl),#0x80
	ld	hl,#(_ballSprite + 0x00db)
	ld	(hl),#0xff
	ld	hl,#(_ballSprite + 0x00dc)
	ld	(hl),#0x40
	ld	hl,#(_ballSprite + 0x00dd)
	ld	(hl),#0x7f
	ld	hl,#(_ballSprite + 0x00de)
	ld	(hl),#0x3f
	ld	hl,#(_ballSprite + 0x00df)
	ld	(hl),#0x3f
	ld	hl,#(_ballSprite + 0x00e0)
	ld	(hl),#0xc0
	ld	hl,#(_ballSprite + 0x00e1)
	ld	(hl),#0xc0
	ld	hl,#(_ballSprite + 0x00e2)
	ld	(hl),#0x30
	ld	hl,#(_ballSprite + 0x00e3)
	ld	(hl),#0xf0
	ld	hl,#(_ballSprite + 0x00e4)
	ld	(hl),#0x0c
	ld	hl,#(_ballSprite + 0x00e5)
	ld	(hl),#0xfc
	ld	hl,#(_ballSprite + 0x00e6)
	ld	(hl),#0x02
	ld	hl,#(_ballSprite + 0x00e7)
	ld	(hl),#0xfe
	ld	hl,#(_ballSprite + 0x00e8)
	ld	(hl),#0x01
	ld	hl,#(_ballSprite + 0x00e9)
	ld	(hl),#0xff
	ld	hl,#(_ballSprite + 0x00ea)
	ld	(hl),#0x01
	ld	hl,#(_ballSprite + 0x00eb)
	ld	(hl),#0xff
	ld	hl,#(_ballSprite + 0x00ec)
	ld	(hl),#0x02
	ld	hl,#(_ballSprite + 0x00ed)
	ld	(hl),#0xfe
	ld	hl,#(_ballSprite + 0x00ee)
	ld	(hl),#0xfc
	ld	hl,#(_ballSprite + 0x00ef)
	ld	(hl),#0xfc
;keys.c:3: UBYTE previousKeys = 0;
	ld	hl,#_previousKeys
	ld	(hl),#0x00
;keys.c:4: UBYTE keys = 0;
	ld	hl,#_keys
	ld	(hl),#0x00
;main.c:9: INT8 gravity = -2;
	ld	hl,#_gravity
	ld	(hl),#0xfe
;main.c:11: UINT8 floorYPosition = 136;
	ld	hl,#_floorYPosition
	ld	(hl),#0x88
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:16: void performantDelay(UINT8 numloops)
;	---------------------------------
; Function performantDelay
; ---------------------------------
_performantDelay::
;main.c:19: for(i=0;i < numloops;i++)
	ld	c,#0x00
00103$:
	ld	a,c
	ldhl	sp,#2
	sub	a, (hl)
	ret	NC
;main.c:21: wait_vbl_done();
	push	bc
	call	_wait_vbl_done
	pop	bc
;main.c:19: for(i=0;i < numloops;i++)
	inc	c
	jr	00103$
	ret
;main.c:37: void gameBallSprite01a()//ball sprite rest A
;	---------------------------------
; Function gameBallSprite01a
; ---------------------------------
_gameBallSprite01a::
;main.c:39: set_sprite_tile(1, 1);
	ld	hl,#0x0101
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:40: set_sprite_tile(2, 2);
	ld	hl,#0x0202
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:41: set_sprite_tile(3, 3);
	ld	hl,#0x0303
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:42: set_sprite_tile(4, 4);
	ld	hl,#0x0404
	push	hl
	call	_set_sprite_tile
	add	sp, #2
	ret
;main.c:44: void gameBallSprite01b()//ball sprite rest B
;	---------------------------------
; Function gameBallSprite01b
; ---------------------------------
_gameBallSprite01b::
;main.c:47: set_sprite_tile(1, 5);
	ld	hl,#0x0501
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:48: set_sprite_tile(2, 6);
	ld	hl,#0x0602
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:49: set_sprite_tile(3, 7);
	ld	hl,#0x0703
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:50: set_sprite_tile(4, 8);
	ld	hl,#0x0804
	push	hl
	call	_set_sprite_tile
	add	sp, #2
	ret
;main.c:53: void gameBallSprite02()//ball sprite stretched
;	---------------------------------
; Function gameBallSprite02
; ---------------------------------
_gameBallSprite02::
;main.c:55: set_sprite_tile(1, 9);
	ld	hl,#0x0901
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:56: set_sprite_tile(2, 10);
	ld	hl,#0x0a02
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:57: set_sprite_tile(3, 11);
	ld	hl,#0x0b03
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:58: set_sprite_tile(4, 12);
	ld	hl,#0x0c04
	push	hl
	call	_set_sprite_tile
	add	sp, #2
	ret
;main.c:61: void gameBallSprite03()//ball sprite squashed
;	---------------------------------
; Function gameBallSprite03
; ---------------------------------
_gameBallSprite03::
;main.c:63: set_sprite_tile(1, 0);
	ld	hl,#0x0001
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:64: set_sprite_tile(2, 0);
	ld	hl,#0x0002
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:65: set_sprite_tile(3, 13);
	ld	hl,#0x0d03
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:66: set_sprite_tile(4, 14);
	ld	hl,#0x0e04
	push	hl
	call	_set_sprite_tile
	add	sp, #2
	ret
;main.c:70: void moveGameCharacter(struct gameCharacter *character, UINT8 x, UINT8 y)
;	---------------------------------
; Function moveGameCharacter
; ---------------------------------
_moveGameCharacter::
	add	sp, #-4
;main.c:72: move_sprite(character->spriteId[0],x, y);
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
;main.c:73: move_sprite(character->spriteId[1],x + 8, y);
	ldhl	sp,#8
	ld	a,(hl)
	add	a, #0x08
	ldhl	sp,#1
	ld	(hl+),a
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	ld	a,(bc)
	ld	b,a
	ldhl	sp,#9
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#2
	ld	a,(hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:74: move_sprite(character->spriteId[2],x, y + 8);
	ldhl	sp,#9
	ld	a,(hl)
	add	a, #0x08
	ldhl	sp,#0
	ld	(hl),a
	ldhl	sp,#(3 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	ld	a,(bc)
	ld	b,a
	ldhl	sp,#0
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#9
	ld	a,(hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:75: move_sprite(character->spriteId[3],x + 8, y + 8);
	ldhl	sp,#(3 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	inc	bc
	ld	a,(bc)
	ld	b,a
	ldhl	sp,#0
	ld	a,(hl)
	push	af
	inc	sp
	inc	hl
	ld	a,(hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_move_sprite
	add	sp, #3
	add	sp, #4
	ret
;main.c:79: void setupBallSprite01()
;	---------------------------------
; Function setupBallSprite01
; ---------------------------------
_setupBallSprite01::
;main.c:81: set_sprite_data(0, 15, ballSprite);
	ld	hl,#_ballSprite
	push	hl
	ld	hl,#0x0f00
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:83: ballSprite01.x=16;
	ld	hl,#(_ballSprite01 + 0x0004)
	ld	(hl),#0x10
;main.c:84: ballSprite01.y = floorYPosition;
	ld	de,#(_ballSprite01 + 0x0005)
	ld	hl,#_floorYPosition
	ld	a,(hl)
	ld	(de),a
;main.c:85: ballSprite01.width=16;
	ld	hl,#(_ballSprite01 + 0x0006)
	ld	(hl),#0x10
;main.c:86: ballSprite01.height=16;
	ld	hl,#(_ballSprite01 + 0x0007)
	ld	(hl),#0x10
;main.c:88: set_sprite_tile(1,1);
	ld	hl,#0x0101
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:89: ballSprite01.spriteId[0]=1;
	ld	hl,#_ballSprite01
	ld	(hl),#0x01
;main.c:90: set_sprite_tile(2,2);
	ld	hl,#0x0202
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:91: ballSprite01.spriteId[1]=2;
	ld	hl,#(_ballSprite01 + 0x0001)
	ld	(hl),#0x02
;main.c:92: set_sprite_tile(3,3);
	ld	hl,#0x0303
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:93: ballSprite01.spriteId[2]=3;
	ld	hl,#(_ballSprite01 + 0x0002)
	ld	(hl),#0x03
;main.c:94: set_sprite_tile(4,4);
	ld	hl,#0x0404
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:95: ballSprite01.spriteId[3]=4;
	ld	hl,#(_ballSprite01 + 0x0003)
	ld	(hl),#0x04
;main.c:97: moveGameCharacter(&ballSprite01,ballSprite01.x,ballSprite01.y);
	ld	de, #(_ballSprite01 + 0x0005) + 0
	ld	a,(de)
	ld	b,a
	ld	de, #(_ballSprite01 + 0x0004) + 0
	ld	a,(de)
	ld	c,a
	push	bc
	inc	sp
	ld	a,c
	push	af
	inc	sp
	ld	hl,#_ballSprite01
	push	hl
	call	_moveGameCharacter
	add	sp, #4
	ret
;main.c:100: INT8 wouldHitSurf(UINT8 projectedYPosition)
;	---------------------------------
; Function wouldHitSurf
; ---------------------------------
_wouldHitSurf::
;main.c:102: if(projectedYPosition >= floorYPosition){
	ldhl	sp,#2
	ld	a,(hl)
	ld	hl,#_floorYPosition
	sub	a, (hl)
	jr	C,00102$
;main.c:103: return floorYPosition;
	ld	e,(hl)
	ret
00102$:
;main.c:105: return -1;
	ld	e,#0xff
	ret
;main.c:109: void jump()
;	---------------------------------
; Function jump
; ---------------------------------
_jump::
;main.c:111: if(jumping == 0)
	ld	hl,#_jumping
	ld	a,(hl)
	or	a, a
	jr	NZ,00102$
;main.c:113: jumping = 1;
	ld	(hl),#0x01
;main.c:114: currentSpeedY = 10;
	ld	hl,#_currentSpeedY
	ld	(hl),#0x0a
00102$:
;main.c:117: currentSpeedY = currentSpeedY + gravity;
	ld	hl,#_currentSpeedY
	ld	c,(hl)
	ld	a,c
	ld	hl,#_gravity
	add	a, (hl)
	ld	hl,#_currentSpeedY
	ld	(hl),a
;main.c:119: ballSprite01.y -= currentSpeedY;
	ld	de, #(_ballSprite01 + 0x0005) + 0
	ld	a,(de)
	ld	c,a
	sub	a, (hl)
	ld	b,a
	ld	hl,#(_ballSprite01 + 0x0005)
	ld	(hl),b
;main.c:121: possibleYSurface = wouldHitSurf(ballSprite01.y);
	push	bc
	inc	sp
	call	_wouldHitSurf
	inc	sp
	ld	hl,#_possibleYSurface
	ld	(hl),e
;main.c:127: moveGameCharacter(&ballSprite01,ballSprite01.x, possibleYSurface);
	ld	bc,#_ballSprite01 + 4
	ld	a,(bc)
	ld	b,a
;main.c:124: if(possibleYSurface == floorYPosition)
	ld	a,(hl)
	ld	hl,#_floorYPosition
	sub	a, (hl)
	jr	NZ,00104$
;main.c:126: jumping = 0;
	ld	hl,#_jumping
	ld	(hl),#0x00
;main.c:127: moveGameCharacter(&ballSprite01,ballSprite01.x, possibleYSurface);
	ld	hl,#_possibleYSurface
	ld	a,(hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl,#_ballSprite01
	push	hl
	call	_moveGameCharacter
	add	sp, #4
	ret
00104$:
;main.c:132: moveGameCharacter(&ballSprite01,ballSprite01.x,ballSprite01.y);
	ld	de, #(_ballSprite01 + 0x0005) + 0
	ld	a,(de)
	ld	c,a
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl,#_ballSprite01
	push	hl
	call	_moveGameCharacter
	add	sp, #4
	ret
;main.c:138: void jumpSound()
;	---------------------------------
; Function jumpSound
; ---------------------------------
_jumpSound::
;main.c:140: NR10_REG = 0x16;
	ld	hl,#0xff10
	ld	(hl),#0x16
;main.c:141: NR11_REG = 0x40;
	ld	l, #0x11
	ld	(hl),#0x40
;main.c:142: NR12_REG = 0x73;
	ld	l, #0x12
	ld	(hl),#0x73
;main.c:143: NR13_REG = 0x00;
	ld	l, #0x13
	ld	(hl),#0x00
;main.c:144: NR14_REG = 0xC3;
	ld	l, #0x14
	ld	(hl),#0xc3
	ret
;main.c:146: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:149: setupBallSprite01();
	call	_setupBallSprite01
;main.c:152: jumping = 0;
	ld	hl,#_jumping
	ld	(hl),#0x00
;main.c:155: NR52_REG = 0x80;
	ld	hl,#0xff26
	ld	(hl),#0x80
;main.c:156: NR50_REG = 0x77;
	ld	l, #0x24
	ld	(hl),#0x77
;main.c:157: NR51_REG = 0xFF;
	ld	l, #0x25
	ld	(hl),#0xff
;main.c:159: keyPressed_A = 1;
	ld	hl,#_keyPressed_A
	ld	(hl),#0x01
;main.c:162: DISPLAY_ON;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	7, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;main.c:163: SHOW_SPRITES;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	l, #0x40
	ld	(hl),c
;main.c:164: SHOW_BKG;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	0, a
	ld	c,a
	ld	l, #0x40
	ld	(hl),c
;main.c:166: timerAnimation = 0;
	ld	hl,#_timerAnimation
	ld	(hl),#0x00
;main.c:168: while(1)
00128$:
;main.c:171: UPDATE_KEYS();
	push	hl
	ld	hl,#_keys
	ld	a,(hl)
	ld	hl,#_previousKeys
	ld	(hl),a
	pop	hl
	call	_joypad
	ld	hl,#_keys
	ld	(hl),e
;main.c:172: gameBallSprite01a();
	call	_gameBallSprite01a
;main.c:174: if((KEY_TICKED(J_A) || jumping == 1) && keyPressed_A == 1)
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	4, c
	jr	Z,00109$
	ld	hl,#_previousKeys
	ld	c,(hl)
	ld	b,#0x00
	bit	4, c
	jr	Z,00110$
00109$:
	ld	hl,#_jumping
	ld	a,(hl)
	dec	a
	jr	NZ,00106$
00110$:
	ld	hl,#_keyPressed_A
	ld	a,(hl)
	dec	a
	jr	NZ,00106$
;main.c:177: gameBallSprite02();//sprite for stretched ball
	call	_gameBallSprite02
;main.c:178: jump();	
	call	_jump
;main.c:179: jumpSound();
	call	_jumpSound
;main.c:180: if(jumping == 0)
	ld	hl,#_jumping
	ld	a,(hl)
	or	a, a
	jr	NZ,00107$
;main.c:182: keyPressed_A = 0;
	ld	hl,#_keyPressed_A
	ld	(hl),#0x00
;main.c:183: gameBallSprite03();
	call	_gameBallSprite03
	jr	00107$
00106$:
;main.c:187: else if(joypad() != J_A)
	call	_joypad
	ld	a,e
	sub	a, #0x10
	jr	Z,00107$
;main.c:189: keyPressed_A = 1;
	ld	hl,#_keyPressed_A
	ld	(hl),#0x01
00107$:
;main.c:193: if(KEY_PRESSED(J_RIGHT))
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	bit	0, c
	jp	Z,00126$
;main.c:196: ballSprite01.x += 3;
	ld	a, (#(_ballSprite01 + 0x0004) + 0)
	ld	c,a
	inc	c
	inc	c
	inc	c
	ld	hl,#(_ballSprite01 + 0x0004)
	ld	(hl),c
;main.c:197: moveGameCharacter(&ballSprite01, ballSprite01.x, ballSprite01.y);
	ld	de, #(_ballSprite01 + 0x0005) + 0
	ld	a,(de)
	ld	b,a
	push	bc
	inc	sp
	ld	a,c
	push	af
	inc	sp
	ld	hl,#_ballSprite01
	push	hl
	call	_moveGameCharacter
	add	sp, #4
;main.c:198: if(timerAnimation == 1)
	ld	hl,#_timerAnimation
	ld	a,(hl)
	dec	a
	jr	NZ,00114$
;main.c:200: gameBallSprite01a();
	call	_gameBallSprite01a
	jr	00115$
00114$:
;main.c:202: else if(timerAnimation == 2)
	ld	hl,#_timerAnimation
	ld	a,(hl)
	sub	a, #0x02
	jr	NZ,00115$
;main.c:204: gameBallSprite01b();
	call	_gameBallSprite01b
00115$:
;main.c:206: if(jumping == 1)
	ld	hl,#_jumping
	ld	a,(hl)
	dec	a
	jr	NZ,00123$
;main.c:208: gameBallSprite02();
	call	_gameBallSprite02
	jr	00124$
00123$:
;main.c:210: else if(jumping == 0 && timerAnimation == 10)
	ld	hl,#_jumping
	ld	a,(hl)
	or	a, a
	jr	NZ,00119$
	ld	hl,#_timerAnimation
	ld	a,(hl)
	sub	a, #0x0a
	jr	NZ,00119$
;main.c:212: gameBallSprite03();
	call	_gameBallSprite03
	jr	00124$
00119$:
;main.c:214: else if(timerAnimation == 12)
	ld	hl,#_timerAnimation
	ld	a,(hl)
	sub	a, #0x0c
	jr	NZ,00124$
;main.c:216: timerAnimation = 0;
	ld	hl,#_timerAnimation
	ld	(hl),#0x00
00124$:
;main.c:218: timerAnimation++;
	ld	hl,#_timerAnimation
	inc	(hl)
00126$:
;main.c:220: performantDelay(2);
	ld	a,#0x02
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
	jp	00128$
	ret
	.area _CODE
	.area _CABS (ABS)
