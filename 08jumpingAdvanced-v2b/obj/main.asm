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
	.globl _ballAfterJumpMoving
	.globl _ballMoveX
	.globl _jump
	.globl _wouldHitSurf
	.globl _jumpSound
	.globl _canPlayerMove
	.globl _setupBallSprite01
	.globl _moveGameCharacter
	.globl _gameBallSprite03
	.globl _gameBallSprite02
	.globl _gameBallSprite01b
	.globl _gameBallSprite01a
	.globl _anyKey
	.globl _keyReleased
	.globl _keyTicked
	.globl _keyPressed
	.globl _updateKeys
	.globl _performantDelay
	.globl _move_sprite
	.globl _set_sprite_tile
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _ballSprite01
	.globl _keys
	.globl _previousKeys
	.globl _currentSpeedY
	.globl _timerAnimation
	.globl _possibleYSurface
	.globl _floorYPosition
	.globl _gravity
	.globl _jumping
	.globl _keyPressed_LEFT
	.globl _keyPressed_RIGHT
	.globl _keyPressed_A
	.globl _levelMap
	.globl _levelTile
	.globl _ballSprite
	.globl _blankMap
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_ballSprite::
	.ds 240
_levelTile::
	.ds 48
_levelMap::
	.ds 360
_keyPressed_A::
	.ds 1
_keyPressed_RIGHT::
	.ds 1
_keyPressed_LEFT::
	.ds 1
_jumping::
	.ds 1
_gravity::
	.ds 1
_floorYPosition::
	.ds 1
_possibleYSurface::
	.ds 1
_timerAnimation::
	.ds 1
_currentSpeedY::
	.ds 1
_previousKeys::
	.ds 1
_keys::
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
;levelTile.c:26: unsigned char levelTile[] =
	ld	hl,#_levelTile
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x0001)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x0002)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x0003)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x0004)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x0005)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x0006)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x0007)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x0008)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x0009)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x000a)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x000b)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x000c)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x000d)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x000e)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x000f)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x0010)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x0011)
	ld	(hl),#0xff
	ld	hl,#(_levelTile + 0x0012)
	ld	(hl),#0xff
	ld	hl,#(_levelTile + 0x0013)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x0014)
	ld	(hl),#0xff
	ld	hl,#(_levelTile + 0x0015)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x0016)
	ld	(hl),#0xff
	ld	hl,#(_levelTile + 0x0017)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x0018)
	ld	(hl),#0xff
	ld	hl,#(_levelTile + 0x0019)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x001a)
	ld	(hl),#0xff
	ld	hl,#(_levelTile + 0x001b)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x001c)
	ld	(hl),#0xff
	ld	hl,#(_levelTile + 0x001d)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x001e)
	ld	(hl),#0xff
	ld	hl,#(_levelTile + 0x001f)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x0020)
	ld	(hl),#0xff
	ld	hl,#(_levelTile + 0x0021)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x0022)
	ld	(hl),#0xff
	ld	hl,#(_levelTile + 0x0023)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x0024)
	ld	(hl),#0xff
	ld	hl,#(_levelTile + 0x0025)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x0026)
	ld	(hl),#0xff
	ld	hl,#(_levelTile + 0x0027)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x0028)
	ld	(hl),#0xff
	ld	hl,#(_levelTile + 0x0029)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x002a)
	ld	(hl),#0xff
	ld	hl,#(_levelTile + 0x002b)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x002c)
	ld	(hl),#0xff
	ld	hl,#(_levelTile + 0x002d)
	ld	(hl),#0x00
	ld	hl,#(_levelTile + 0x002e)
	ld	(hl),#0xff
	ld	hl,#(_levelTile + 0x002f)
	ld	(hl),#0x00
;levelMap.c:25: unsigned char levelMap[] =
	ld	hl,#_levelMap
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0001)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0002)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0003)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0004)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0005)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0006)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0007)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0008)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0009)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x000a)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x000b)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x000c)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x000d)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x000e)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x000f)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0010)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0011)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0012)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0013)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0014)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0015)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0016)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0017)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0018)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0019)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x001a)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x001b)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x001c)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x001d)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x001e)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x001f)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0020)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0021)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0022)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0023)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0024)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0025)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0026)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0027)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0028)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0029)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x002a)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x002b)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x002c)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x002d)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x002e)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x002f)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0030)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0031)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0032)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0033)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0034)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0035)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0036)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0037)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0038)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0039)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x003a)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x003b)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x003c)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x003d)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x003e)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x003f)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0040)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0041)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0042)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0043)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0044)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0045)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0046)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0047)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0048)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0049)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x004a)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x004b)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x004c)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x004d)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x004e)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x004f)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0050)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0051)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0052)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0053)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0054)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0055)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0056)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0057)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0058)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0059)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x005a)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x005b)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x005c)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x005d)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x005e)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x005f)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0060)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0061)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0062)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0063)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0064)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0065)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0066)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0067)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0068)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0069)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x006a)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x006b)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x006c)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x006d)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x006e)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x006f)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0070)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0071)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0072)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0073)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0074)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0075)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0076)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0077)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0078)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0079)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x007a)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x007b)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x007c)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x007d)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x007e)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x007f)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0080)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0081)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0082)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0083)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0084)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0085)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0086)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0087)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0088)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0089)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x008a)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x008b)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x008c)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x008d)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x008e)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x008f)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0090)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0091)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0092)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0093)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0094)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0095)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0096)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0097)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0098)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0099)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x009a)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x009b)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x009c)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x009d)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x009e)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x009f)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00a0)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00a1)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00a2)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00a3)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00a4)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00a5)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00a6)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00a7)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00a8)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00a9)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00aa)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00ab)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00ac)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00ad)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00ae)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00af)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00b0)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00b1)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00b2)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00b3)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00b4)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00b5)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00b6)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00b7)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00b8)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00b9)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00ba)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00bb)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00bc)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00bd)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00be)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00bf)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00c0)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00c1)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00c2)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00c3)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00c4)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00c5)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00c6)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00c7)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00c8)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00c9)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00ca)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00cb)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00cc)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00cd)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00ce)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00cf)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00d0)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00d1)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00d2)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00d3)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00d4)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00d5)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00d6)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00d7)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00d8)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00d9)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00da)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00db)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00dc)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00dd)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00de)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00df)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00e0)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00e1)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00e2)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00e3)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00e4)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00e5)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00e6)
	ld	(hl),#0x01
	ld	hl,#(_levelMap + 0x00e7)
	ld	(hl),#0x01
	ld	hl,#(_levelMap + 0x00e8)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00e9)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00ea)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00eb)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00ec)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00ed)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00ee)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00ef)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00f0)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x00f1)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00f2)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00f3)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00f4)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00f5)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00f6)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00f7)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00f8)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00f9)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00fa)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00fb)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00fc)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00fd)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00fe)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x00ff)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0100)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0101)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0102)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0103)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x0104)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x0105)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0106)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0107)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0108)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0109)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x010a)
	ld	(hl),#0x01
	ld	hl,#(_levelMap + 0x010b)
	ld	(hl),#0x01
	ld	hl,#(_levelMap + 0x010c)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x010d)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x010e)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x010f)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0110)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0111)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0112)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0113)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0114)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0115)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0116)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0117)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x0118)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x0119)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x011a)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x011b)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x011c)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x011d)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x011e)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x011f)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0120)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0121)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0122)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0123)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0124)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0125)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0126)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0127)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0128)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0129)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x012a)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x012b)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x012c)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x012d)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x012e)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x012f)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0130)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0131)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0132)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0133)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0134)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0135)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0136)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0137)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0138)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x0139)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x013a)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x013b)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x013c)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x013d)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x013e)
	ld	(hl),#0x00
	ld	hl,#(_levelMap + 0x013f)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x0140)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x0141)
	ld	(hl),#0x01
	ld	hl,#(_levelMap + 0x0142)
	ld	(hl),#0x01
	ld	hl,#(_levelMap + 0x0143)
	ld	(hl),#0x01
	ld	hl,#(_levelMap + 0x0144)
	ld	(hl),#0x01
	ld	hl,#(_levelMap + 0x0145)
	ld	(hl),#0x01
	ld	hl,#(_levelMap + 0x0146)
	ld	(hl),#0x01
	ld	hl,#(_levelMap + 0x0147)
	ld	(hl),#0x01
	ld	hl,#(_levelMap + 0x0148)
	ld	(hl),#0x01
	ld	hl,#(_levelMap + 0x0149)
	ld	(hl),#0x01
	ld	hl,#(_levelMap + 0x014a)
	ld	(hl),#0x01
	ld	hl,#(_levelMap + 0x014b)
	ld	(hl),#0x01
	ld	hl,#(_levelMap + 0x014c)
	ld	(hl),#0x01
	ld	hl,#(_levelMap + 0x014d)
	ld	(hl),#0x01
	ld	hl,#(_levelMap + 0x014e)
	ld	(hl),#0x01
	ld	hl,#(_levelMap + 0x014f)
	ld	(hl),#0x01
	ld	hl,#(_levelMap + 0x0150)
	ld	(hl),#0x01
	ld	hl,#(_levelMap + 0x0151)
	ld	(hl),#0x01
	ld	hl,#(_levelMap + 0x0152)
	ld	(hl),#0x01
	ld	hl,#(_levelMap + 0x0153)
	ld	(hl),#0x01
	ld	hl,#(_levelMap + 0x0154)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x0155)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x0156)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x0157)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x0158)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x0159)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x015a)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x015b)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x015c)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x015d)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x015e)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x015f)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x0160)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x0161)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x0162)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x0163)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x0164)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x0165)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x0166)
	ld	(hl),#0x02
	ld	hl,#(_levelMap + 0x0167)
	ld	(hl),#0x02
;main.c:12: INT8 gravity = -2;
	ld	hl,#_gravity
	ld	(hl),#0xfe
;main.c:13: UINT8 floorYPosition = 128;
	ld	hl,#_floorYPosition
	ld	(hl),#0x80
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:23: void performantDelay(UINT8 numloops)
;	---------------------------------
; Function performantDelay
; ---------------------------------
_performantDelay::
;main.c:26: for(i=0;i < numloops;i++)
	ld	c,#0x00
00103$:
	ld	a,c
	ldhl	sp,#2
	sub	a, (hl)
	ret	NC
;main.c:28: wait_vbl_done();
	push	bc
	call	_wait_vbl_done
	pop	bc
;main.c:26: for(i=0;i < numloops;i++)
	inc	c
	jr	00103$
	ret
_blankMap:
	.db #0x00	; 0
;main.c:42: void updateKeys()
;	---------------------------------
; Function updateKeys
; ---------------------------------
_updateKeys::
;main.c:44: previousKeys = keys;
	push	hl
	ld	hl,#_keys
	ld	a,(hl)
	ld	hl,#_previousKeys
	ld	(hl),a
	pop	hl
;main.c:45: keys = joypad();
	call	_joypad
	ld	hl,#_keys
	ld	(hl),e
	ret
;main.c:48: INT8 keyPressed(INT8 K)
;	---------------------------------
; Function keyPressed
; ---------------------------------
_keyPressed::
;main.c:50: return keys & (K);
	ld	hl,#_keys
	ld	a,(hl)
	ldhl	sp,#2
	and	a, (hl)
	ld	e,a
	ret
;main.c:53: INT8 keyTicked(INT8 K)
;	---------------------------------
; Function keyTicked
; ---------------------------------
_keyTicked::
;main.c:55: return (keys & (K) && !(previousKeys & (K)));
	ld	hl,#_keys
	ld	a,(hl)
	ldhl	sp,#2
	and	a,(hl)
	jr	Z,00103$
	ld	hl,#_previousKeys
	ld	a,(hl)
	ldhl	sp,#2
	and	a,(hl)
	jr	Z,00104$
00103$:
	ld	e,#0x00
	ret
00104$:
	ld	e,#0x01
	ret
;main.c:58: INT8 keyReleased(INT8 K)
;	---------------------------------
; Function keyReleased
; ---------------------------------
_keyReleased::
;main.c:60: return previousKeys & (K) && !(keys & (K));
	ld	hl,#_previousKeys
	ld	a,(hl)
	ldhl	sp,#2
	and	a,(hl)
	jr	Z,00103$
	ld	hl,#_keys
	ld	a,(hl)
	ldhl	sp,#2
	and	a,(hl)
	jr	Z,00104$
00103$:
	ld	e,#0x00
	ret
00104$:
	ld	e,#0x01
	ret
;main.c:63: void anyKey()
;	---------------------------------
; Function anyKey
; ---------------------------------
_anyKey::
;main.c:65: keys;
	ret
;main.c:69: void gameBallSprite01a()//ball sprite rest A
;	---------------------------------
; Function gameBallSprite01a
; ---------------------------------
_gameBallSprite01a::
;main.c:71: set_sprite_tile(1, 1);
	ld	hl,#0x0101
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:72: set_sprite_tile(2, 2);
	ld	hl,#0x0202
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:73: set_sprite_tile(3, 3);
	ld	hl,#0x0303
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:74: set_sprite_tile(4, 4);
	ld	hl,#0x0404
	push	hl
	call	_set_sprite_tile
	add	sp, #2
	ret
;main.c:76: void gameBallSprite01b()//ball sprite rest B
;	---------------------------------
; Function gameBallSprite01b
; ---------------------------------
_gameBallSprite01b::
;main.c:79: set_sprite_tile(1, 5);
	ld	hl,#0x0501
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:80: set_sprite_tile(2, 6);
	ld	hl,#0x0602
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:81: set_sprite_tile(3, 7);
	ld	hl,#0x0703
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:82: set_sprite_tile(4, 8);
	ld	hl,#0x0804
	push	hl
	call	_set_sprite_tile
	add	sp, #2
	ret
;main.c:85: void gameBallSprite02()//ball sprite stretched
;	---------------------------------
; Function gameBallSprite02
; ---------------------------------
_gameBallSprite02::
;main.c:87: set_sprite_tile(1, 9);
	ld	hl,#0x0901
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:88: set_sprite_tile(2, 10);
	ld	hl,#0x0a02
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:89: set_sprite_tile(3, 11);
	ld	hl,#0x0b03
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:90: set_sprite_tile(4, 12);
	ld	hl,#0x0c04
	push	hl
	call	_set_sprite_tile
	add	sp, #2
	ret
;main.c:93: void gameBallSprite03()//ball sprite squashed
;	---------------------------------
; Function gameBallSprite03
; ---------------------------------
_gameBallSprite03::
;main.c:95: set_sprite_tile(1, 0);
	ld	hl,#0x0001
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:96: set_sprite_tile(2, 0);
	ld	hl,#0x0002
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:97: set_sprite_tile(3, 13);
	ld	hl,#0x0d03
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:98: set_sprite_tile(4, 14);
	ld	hl,#0x0e04
	push	hl
	call	_set_sprite_tile
	add	sp, #2
	ret
;main.c:102: void moveGameCharacter(struct gameCharacter *character, UINT8 x, UINT8 y)
;	---------------------------------
; Function moveGameCharacter
; ---------------------------------
_moveGameCharacter::
	add	sp, #-4
;main.c:104: move_sprite(character->spriteId[0],x, y);
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
;main.c:105: move_sprite(character->spriteId[1],x + 8, y);
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
;main.c:106: move_sprite(character->spriteId[2],x, y + 8);
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
;main.c:107: move_sprite(character->spriteId[3],x + 8, y + 8);
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
;main.c:111: void setupBallSprite01()
;	---------------------------------
; Function setupBallSprite01
; ---------------------------------
_setupBallSprite01::
;main.c:113: set_sprite_data(0, 15, ballSprite);
	ld	hl,#_ballSprite
	push	hl
	ld	hl,#0x0f00
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:115: ballSprite01.x=16;
	ld	hl,#(_ballSprite01 + 0x0004)
	ld	(hl),#0x10
;main.c:116: ballSprite01.y = floorYPosition;
	ld	de,#(_ballSprite01 + 0x0005)
	ld	hl,#_floorYPosition
	ld	a,(hl)
	ld	(de),a
;main.c:117: ballSprite01.width=16;
	ld	hl,#(_ballSprite01 + 0x0006)
	ld	(hl),#0x10
;main.c:118: ballSprite01.height=16;
	ld	hl,#(_ballSprite01 + 0x0007)
	ld	(hl),#0x10
;main.c:120: set_sprite_tile(1,1);
	ld	hl,#0x0101
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:121: ballSprite01.spriteId[0]=1;
	ld	hl,#_ballSprite01
	ld	(hl),#0x01
;main.c:122: set_sprite_tile(2,2);
	ld	hl,#0x0202
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:123: ballSprite01.spriteId[1]=2;
	ld	hl,#(_ballSprite01 + 0x0001)
	ld	(hl),#0x02
;main.c:124: set_sprite_tile(3,3);
	ld	hl,#0x0303
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:125: ballSprite01.spriteId[2]=3;
	ld	hl,#(_ballSprite01 + 0x0002)
	ld	(hl),#0x03
;main.c:126: set_sprite_tile(4,4);
	ld	hl,#0x0404
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:127: ballSprite01.spriteId[3]=4;
	ld	hl,#(_ballSprite01 + 0x0003)
	ld	(hl),#0x04
;main.c:129: moveGameCharacter(&ballSprite01,ballSprite01.x,ballSprite01.y);
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
;main.c:132: UBYTE canPlayerMove(UINT8 newPlayerX, UINT8 newPlayerY)
;	---------------------------------
; Function canPlayerMove
; ---------------------------------
_canPlayerMove::
	add	sp, #-6
;main.c:137: indexTlX = (newPlayerX - 8) / 8;
	ldhl	sp,#8
	ld	a,(hl)
	ldhl	sp,#4
	ld	(hl+),a
	ld	(hl),#0x00
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0008
	ld	a,e
	sub	a,l
	ld	e,a
	ld	a,d
	sbc	a,h
	ld	b,a
	ld	c,e
	ldhl	sp,#2
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ld	a,#0x00
	ld	e,a
	ld	a,b
	ld	d,a
	bit	7, b
	jr	Z,00103$
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0xffff
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#2
	ld	(hl+),a
	ld	(hl),d
00103$:
	ldhl	sp,#2
	ld	a,(hl-)
	dec	hl
	ld	(hl),a
	ldhl	sp,#3
	ld	a,(hl-)
	dec	hl
	ld	(hl),a
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	srl	(hl)
	dec	hl
	rr	(hl)
;main.c:138: indexTlY = (newPlayerY - 16) / 8;
	ldhl	sp,#9
	ld	a,(hl)
	ldhl	sp,#2
	ld	(hl+),a
	ld	(hl),#0x00
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0010
	ld	a,e
	sub	a,l
	ld	e,a
	ld	a,d
	sbc	a,h
	ld	b,a
	ld	c,e
	ldhl	sp,#4
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ld	a,#0x00
	ld	e,a
	ld	a,b
	ld	d,a
	bit	7, b
	jr	Z,00104$
	dec	hl
	dec	hl
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0xfff7
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#4
	ld	(hl+),a
	ld	(hl),d
00104$:
	ldhl	sp,#(5 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
;main.c:139: tileIndexTl = 20 * indexTlY + indexTlX;
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	c,l
	ld	b,h
	pop	hl
	push	hl
	add	hl,bc
	ld	c,l
	ld	b,h
;main.c:141: result = levelMap[tileIndexTl] == blankMap[0];
	ld	hl,#_levelMap
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ld	de, #_blankMap + 0
	ld	a,(de)
	ld	b,a
	ld	a,c
	sub	a, b
	jr	NZ,00113$
	ld	a,#0x01
	jr	00114$
00113$:
	xor	a,a
00114$:
	ld	e,a
;main.c:143: return result;
	add	sp, #6
	ret
;main.c:149: void jumpSound()
;	---------------------------------
; Function jumpSound
; ---------------------------------
_jumpSound::
;main.c:151: NR10_REG = 0x16;
	ld	hl,#0xff10
	ld	(hl),#0x16
;main.c:152: NR11_REG = 0x40;
	ld	l, #0x11
	ld	(hl),#0x40
;main.c:153: NR12_REG = 0x73;
	ld	l, #0x12
	ld	(hl),#0x73
;main.c:154: NR13_REG = 0x00;
	ld	l, #0x13
	ld	(hl),#0x00
;main.c:155: NR14_REG = 0xC3;
	ld	l, #0x14
	ld	(hl),#0xc3
	ret
;main.c:158: INT8 wouldHitSurf(UINT8 projectedYPosition)
;	---------------------------------
; Function wouldHitSurf
; ---------------------------------
_wouldHitSurf::
;main.c:160: if(projectedYPosition >= floorYPosition){
	ldhl	sp,#2
	ld	a,(hl)
	ld	hl,#_floorYPosition
	sub	a, (hl)
	jr	C,00102$
;main.c:161: return floorYPosition;
	ld	e,(hl)
	ret
00102$:
;main.c:163: return -1;
	ld	e,#0xff
	ret
;main.c:167: void jump(UINT8 setSpeedY)
;	---------------------------------
; Function jump
; ---------------------------------
_jump::
;main.c:169: if(jumping == 0)
	ld	hl,#_jumping
	ld	a,(hl)
	or	a, a
	jr	NZ,00102$
;main.c:171: jumping = 1;
	ld	(hl),#0x01
;main.c:172: currentSpeedY = setSpeedY;
	push	hl
	ldhl	sp,#4
	ld	a,(hl)
	ld	hl,#_currentSpeedY
	ld	(hl),a
	pop	hl
00102$:
;main.c:175: currentSpeedY = currentSpeedY + gravity;
	ld	hl,#_currentSpeedY
	ld	c,(hl)
	ld	a,c
	ld	hl,#_gravity
	add	a, (hl)
	ld	hl,#_currentSpeedY
	ld	(hl),a
;main.c:177: ballSprite01.y -= currentSpeedY;
	ld	de, #(_ballSprite01 + 0x0005) + 0
	ld	a,(de)
	ld	c,a
	sub	a, (hl)
	ld	b,a
	ld	hl,#(_ballSprite01 + 0x0005)
	ld	(hl),b
;main.c:179: possibleYSurface = wouldHitSurf(ballSprite01.y);
	push	bc
	inc	sp
	call	_wouldHitSurf
	inc	sp
	ld	hl,#_possibleYSurface
	ld	(hl),e
;main.c:185: moveGameCharacter(&ballSprite01,ballSprite01.x, possibleYSurface);
	ld	bc,#_ballSprite01 + 4
	ld	a,(bc)
	ld	b,a
;main.c:182: if(possibleYSurface == floorYPosition)
	ld	a,(hl)
	ld	hl,#_floorYPosition
	sub	a, (hl)
	jr	NZ,00104$
;main.c:184: jumping = 0;
	ld	hl,#_jumping
	ld	(hl),#0x00
;main.c:185: moveGameCharacter(&ballSprite01,ballSprite01.x, possibleYSurface);
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
;main.c:190: moveGameCharacter(&ballSprite01, ballSprite01.x, ballSprite01.y);
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
;main.c:195: void ballMoveX(UINT8 direction)
;	---------------------------------
; Function ballMoveX
; ---------------------------------
_ballMoveX::
;main.c:197: if(direction == 1)
	ldhl	sp,#2
	ld	a,(hl)
	dec	a
	jr	NZ,00104$
;main.c:199: ballSprite01.x += 3;
	ld	de,#_ballSprite01+4
	ld	a,(de)
	add	a, #0x03
	ld	(de),a
	jr	00105$
00104$:
;main.c:201: else if(direction == 0)
	ldhl	sp,#2
	ld	a,(hl)
	or	a, a
	jr	NZ,00105$
;main.c:203: ballSprite01.x -= 3;
	ld	a, (#(_ballSprite01 + 0x0004) + 0)
	add	a,#0xfd
	ld	de,#(_ballSprite01 + 0x0004)
	ld	(de),a
00105$:
;main.c:205: moveGameCharacter(&ballSprite01, ballSprite01.x, ballSprite01.y);
	ld	de, #(_ballSprite01 + 0x0005) + 0
	ld	a,(de)
	ld	c,a
	ld	de, #(_ballSprite01 + 0x0004) + 0
	ld	a,(de)
	ld	b,a
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl,#_ballSprite01
	push	hl
	call	_moveGameCharacter
	add	sp, #4
;main.c:206: if(timerAnimation == 1)
	ld	hl,#_timerAnimation
	ld	a,(hl)
	dec	a
	jr	NZ,00109$
;main.c:208: gameBallSprite01a();
	call	_gameBallSprite01a
	jr	00110$
00109$:
;main.c:210: else if(timerAnimation == 2)
	ld	hl,#_timerAnimation
	ld	a,(hl)
	sub	a, #0x02
	jr	NZ,00110$
;main.c:212: gameBallSprite01b();
	call	_gameBallSprite01b
;main.c:213: timerAnimation = 0;
	ld	hl,#_timerAnimation
	ld	(hl),#0x00
00110$:
;main.c:215: timerAnimation++;
	ld	hl,#_timerAnimation
	inc	(hl)
	ret
;main.c:219: void ballAfterJumpMoving(UINT8 direction)
;	---------------------------------
; Function ballAfterJumpMoving
; ---------------------------------
_ballAfterJumpMoving::
;main.c:222: if(jumping == 0)
	ld	hl,#_jumping
	ld	a,(hl)
	or	a, a
	ret	NZ
;main.c:224: gameBallSprite03();
	call	_gameBallSprite03
;main.c:225: performantDelay(2);
	ld	a,#0x02
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
;main.c:226: if(direction == 0)
	ldhl	sp,#2
	ld	a,(hl)
	or	a, a
	jr	NZ,00104$
;main.c:228: keyPressed_LEFT = 0;
	ld	hl,#_keyPressed_LEFT
	ld	(hl),#0x00
	ret
00104$:
;main.c:230: else if(direction == 1)
	ldhl	sp,#2
	ld	a,(hl)
	dec	a
	ret	NZ
;main.c:232: keyPressed_RIGHT = 0;
	ld	hl,#_keyPressed_RIGHT
	ld	(hl),#0x00
	ret
;main.c:239: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:242: setupBallSprite01();
	call	_setupBallSprite01
;main.c:245: set_bkg_data(0, 2, levelTile);
	ld	hl,#_levelTile
	push	hl
	ld	hl,#0x0200
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:246: set_bkg_tiles(0, 0, 20, 18, levelMap);
	ld	hl,#_levelMap
	push	hl
	ld	hl,#0x1214
	push	hl
	ld	hl,#0x0000
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;main.c:249: jumping = 0;
	ld	hl,#_jumping
	ld	(hl),#0x00
;main.c:252: NR52_REG = 0x80;
	ld	hl,#0xff26
	ld	(hl),#0x80
;main.c:253: NR50_REG = 0x77;
	ld	l, #0x24
	ld	(hl),#0x77
;main.c:254: NR51_REG = 0xFF;
	ld	l, #0x25
	ld	(hl),#0xff
;main.c:256: keyPressed_A = 1;
	ld	hl,#_keyPressed_A
	ld	(hl),#0x01
;main.c:257: keyPressed_LEFT = 1;
	ld	hl,#_keyPressed_LEFT
	ld	(hl),#0x01
;main.c:258: keyPressed_RIGHT = 1;
	ld	hl,#_keyPressed_RIGHT
	ld	(hl),#0x01
;main.c:261: SHOW_BKG;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	0, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;main.c:262: SHOW_SPRITES;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	l, #0x40
	ld	(hl),c
;main.c:263: DISPLAY_ON;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	7, a
	ld	c,a
	ld	l, #0x40
	ld	(hl),c
;main.c:265: timerAnimation = 0;
	ld	hl,#_timerAnimation
	ld	(hl),#0x00
;main.c:267: while(1)
00131$:
;main.c:269: updateKeys();
	call	_updateKeys
;main.c:270: gameBallSprite01a();
	call	_gameBallSprite01a
;main.c:272: if(canPlayerMove(ballSprite01.x, ballSprite01.y + 16))
	ld	a, (#(_ballSprite01 + 0x0005) + 0)
	add	a, #0x10
	ld	b,a
	ld	a, (#(_ballSprite01 + 0x0004) + 0)
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_canPlayerMove
	add	sp, #2
	ld	a,e
	or	a, a
	jr	Z,00104$
;main.c:274: ballSprite01.y += gravity;
	ld	a, (#(_ballSprite01 + 0x0005) + 0)
	ld	c,a
	ld	hl,#_gravity
	add	a, (hl)
	ld	de,#(_ballSprite01 + 0x0005)
	ld	(de),a
;main.c:275: moveGameCharacter(&ballSprite01, ballSprite01.x, ballSprite01.y);
	ld	de, #(_ballSprite01 + 0x0005) + 0
	ld	a,(de)
	ld	c,a
	ld	de, #(_ballSprite01 + 0x0004) + 0
	ld	a,(de)
	ld	b,a
	ld	a,c
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	hl,#_ballSprite01
	push	hl
	call	_moveGameCharacter
	add	sp, #4
;main.c:277: if(keyTicked(J_A))
	ld	a,#0x10
	push	af
	inc	sp
	call	_keyTicked
	inc	sp
	ld	a,e
	or	a, a
	jr	Z,00104$
;main.c:279: jumpSound();
	call	_jumpSound
00104$:
;main.c:283: if((keyTicked(J_A) || jumping == 1) && keyPressed_A == 1)
	ld	a,#0x10
	push	af
	inc	sp
	call	_keyTicked
	inc	sp
	ld	a,e
	or	a, a
	jr	NZ,00113$
	ld	hl,#_jumping
	ld	a,(hl)
	dec	a
	jr	NZ,00110$
00113$:
	ld	hl,#_keyPressed_A
	ld	a,(hl)
	dec	a
	jr	NZ,00110$
;main.c:286: gameBallSprite02();//sprite for stretched ball
	call	_gameBallSprite02
;main.c:287: jump(15);	
	ld	a,#0x0f
	push	af
	inc	sp
	call	_jump
	inc	sp
;main.c:288: if(jumping == 0)
	ld	hl,#_jumping
	ld	a,(hl)
	or	a, a
	jr	NZ,00111$
;main.c:290: keyPressed_A = 0;
	ld	hl,#_keyPressed_A
	ld	(hl),#0x00
;main.c:291: gameBallSprite03();
	call	_gameBallSprite03
;main.c:292: performantDelay(2);
	ld	a,#0x02
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
	jr	00111$
00110$:
;main.c:296: else if(!(keyReleased(J_A)))
	ld	a,#0x10
	push	af
	inc	sp
	call	_keyReleased
	inc	sp
	ld	a,e
	or	a, a
	jr	NZ,00111$
;main.c:298: keyPressed_A = 1;
	ld	hl,#_keyPressed_A
	ld	(hl),#0x01
00111$:
;main.c:301: if(keyPressed(J_LEFT))
	ld	a,#0x02
	push	af
	inc	sp
	call	_keyPressed
	inc	sp
	ld	a,e
	or	a, a
	jr	Z,00121$
;main.c:303: if(canPlayerMove(ballSprite01.x - 1, ballSprite01.y))
	ld	de, #(_ballSprite01 + 0x0005) + 0
	ld	a,(de)
	ld	b,a
	ld	a, (#(_ballSprite01 + 0x0004) + 0)
	add	a,#0xff
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_canPlayerMove
	add	sp, #2
	ld	a,e
	or	a, a
	jr	Z,00122$
;main.c:306: ballMoveX(0);// 1 for moving to right 0 for moving left
	xor	a, a
	push	af
	inc	sp
	call	_ballMoveX
	inc	sp
;main.c:307: if(jumping == 1)
	ld	hl,#_jumping
	ld	a,(hl)
	dec	a
	jr	NZ,00122$
;main.c:309: gameBallSprite02();
	call	_gameBallSprite02
;main.c:310: ballAfterJumpMoving(0);
	xor	a, a
	push	af
	inc	sp
	call	_ballAfterJumpMoving
	inc	sp
	jr	00122$
00121$:
;main.c:314: else if(!(keyReleased(J_LEFT)))
	ld	a,#0x02
	push	af
	inc	sp
	call	_keyReleased
	inc	sp
	ld	a,e
	or	a, a
	jr	NZ,00122$
;main.c:316: keyPressed_LEFT = 1;
	ld	hl,#_keyPressed_LEFT
	ld	(hl),#0x01
00122$:
;main.c:319: if(keyPressed(J_RIGHT))
	ld	a,#0x01
	push	af
	inc	sp
	call	_keyPressed
	inc	sp
	ld	a,e
	or	a, a
	jr	Z,00128$
;main.c:322: ballMoveX(1);// 1 for moving to right 0 for moving left
	ld	a,#0x01
	push	af
	inc	sp
	call	_ballMoveX
	inc	sp
;main.c:323: if(jumping == 1)
	ld	hl,#_jumping
	ld	a,(hl)
	dec	a
	jr	NZ,00129$
;main.c:325: gameBallSprite02();
	call	_gameBallSprite02
;main.c:326: ballAfterJumpMoving(1);
	ld	a,#0x01
	push	af
	inc	sp
	call	_ballAfterJumpMoving
	inc	sp
	jr	00129$
00128$:
;main.c:329: else if(!(keyReleased(J_RIGHT)))
	ld	a,#0x01
	push	af
	inc	sp
	call	_keyReleased
	inc	sp
	ld	a,e
	or	a, a
	jr	NZ,00129$
;main.c:331: keyPressed_RIGHT = 1;
	ld	hl,#_keyPressed_RIGHT
	ld	(hl),#0x01
00129$:
;main.c:334: performantDelay(2);
	ld	a,#0x02
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
	jp	00131$
	ret
	.area _CODE
	.area _CABS (ABS)
