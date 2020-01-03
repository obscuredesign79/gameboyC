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
	.globl _canPlayerMove
	.globl _setupPlayerSprite
	.globl _moveGameCharacter
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
	.globl _playerSprite01
	.globl _gravity
	.globl _keys
	.globl _previousKeys
	.globl _playerSprite
	.globl _level01Tile
	.globl _level01Map
	.globl _blankMap
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_level01Map::
	.ds 360
_level01Tile::
	.ds 144
_playerSprite::
	.ds 80
_previousKeys::
	.ds 1
_keys::
	.ds 1
_gravity::
	.ds 1
_playerSprite01::
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
;level01Map.c:25: unsigned char level01Map[] =
	ld	hl,#_level01Map
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0001)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0002)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0003)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0004)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0005)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0006)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0007)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0008)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0009)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x000a)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x000b)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x000c)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x000d)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x000e)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x000f)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0010)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0011)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0012)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0013)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0014)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0015)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0016)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0017)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0018)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0019)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x001a)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x001b)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x001c)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x001d)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x001e)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x001f)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0020)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0021)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0022)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0023)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0024)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0025)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0026)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0027)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0028)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0029)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x002a)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x002b)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x002c)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x002d)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x002e)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x002f)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0030)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0031)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0032)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0033)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0034)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0035)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0036)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0037)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0038)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0039)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x003a)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x003b)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x003c)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x003d)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x003e)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x003f)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0040)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0041)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0042)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0043)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0044)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0045)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0046)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0047)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0048)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0049)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x004a)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x004b)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x004c)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x004d)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x004e)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x004f)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0050)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0051)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0052)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0053)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0054)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0055)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0056)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0057)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0058)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0059)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x005a)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x005b)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x005c)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x005d)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x005e)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x005f)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0060)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0061)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0062)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0063)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0064)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0065)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0066)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0067)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0068)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0069)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x006a)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x006b)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x006c)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x006d)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x006e)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x006f)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0070)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0071)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0072)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0073)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0074)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0075)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0076)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0077)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0078)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0079)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x007a)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x007b)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x007c)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x007d)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x007e)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x007f)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0080)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0081)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0082)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0083)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0084)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0085)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0086)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0087)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0088)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0089)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x008a)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x008b)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x008c)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x008d)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x008e)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x008f)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0090)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0091)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0092)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0093)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0094)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0095)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0096)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0097)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0098)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0099)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x009a)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x009b)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x009c)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x009d)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x009e)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x009f)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00a0)
	ld	(hl),#0x02
	ld	hl,#(_level01Map + 0x00a1)
	ld	(hl),#0x02
	ld	hl,#(_level01Map + 0x00a2)
	ld	(hl),#0x02
	ld	hl,#(_level01Map + 0x00a3)
	ld	(hl),#0x02
	ld	hl,#(_level01Map + 0x00a4)
	ld	(hl),#0x02
	ld	hl,#(_level01Map + 0x00a5)
	ld	(hl),#0x03
	ld	hl,#(_level01Map + 0x00a6)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00a7)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00a8)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00a9)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00aa)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00ab)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00ac)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00ad)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00ae)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00af)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00b0)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00b1)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00b2)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00b3)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00b4)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x00b5)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x00b6)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x00b7)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x00b8)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x00b9)
	ld	(hl),#0x05
	ld	hl,#(_level01Map + 0x00ba)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00bb)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00bc)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00bd)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00be)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00bf)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00c0)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00c1)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00c2)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00c3)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00c4)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00c5)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00c6)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00c7)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00c8)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x00c9)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x00ca)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x00cb)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x00cc)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x00cd)
	ld	(hl),#0x05
	ld	hl,#(_level01Map + 0x00ce)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00cf)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00d0)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00d1)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00d2)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00d3)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00d4)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00d5)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00d6)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00d7)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00d8)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00d9)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00da)
	ld	(hl),#0x01
	ld	hl,#(_level01Map + 0x00db)
	ld	(hl),#0x02
	ld	hl,#(_level01Map + 0x00dc)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x00dd)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x00de)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x00df)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x00e0)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x00e1)
	ld	(hl),#0x05
	ld	hl,#(_level01Map + 0x00e2)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00e3)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00e4)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00e5)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00e6)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00e7)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00e8)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00e9)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00ea)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00eb)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00ec)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00ed)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00ee)
	ld	(hl),#0x04
	ld	hl,#(_level01Map + 0x00ef)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x00f0)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x00f1)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x00f2)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x00f3)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x00f4)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x00f5)
	ld	(hl),#0x05
	ld	hl,#(_level01Map + 0x00f6)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00f7)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00f8)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00f9)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00fa)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00fb)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00fc)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00fd)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00fe)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00ff)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0100)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0101)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0102)
	ld	(hl),#0x04
	ld	hl,#(_level01Map + 0x0103)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0104)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0105)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0106)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0107)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0108)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0109)
	ld	(hl),#0x05
	ld	hl,#(_level01Map + 0x010a)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x010b)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x010c)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x010d)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x010e)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x010f)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0110)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0111)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0112)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0113)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0114)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0115)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0116)
	ld	(hl),#0x04
	ld	hl,#(_level01Map + 0x0117)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0118)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0119)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x011a)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x011b)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x011c)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x011d)
	ld	(hl),#0x07
	ld	hl,#(_level01Map + 0x011e)
	ld	(hl),#0x02
	ld	hl,#(_level01Map + 0x011f)
	ld	(hl),#0x02
	ld	hl,#(_level01Map + 0x0120)
	ld	(hl),#0x02
	ld	hl,#(_level01Map + 0x0121)
	ld	(hl),#0x02
	ld	hl,#(_level01Map + 0x0122)
	ld	(hl),#0x02
	ld	hl,#(_level01Map + 0x0123)
	ld	(hl),#0x02
	ld	hl,#(_level01Map + 0x0124)
	ld	(hl),#0x02
	ld	hl,#(_level01Map + 0x0125)
	ld	(hl),#0x02
	ld	hl,#(_level01Map + 0x0126)
	ld	(hl),#0x02
	ld	hl,#(_level01Map + 0x0127)
	ld	(hl),#0x02
	ld	hl,#(_level01Map + 0x0128)
	ld	(hl),#0x02
	ld	hl,#(_level01Map + 0x0129)
	ld	(hl),#0x02
	ld	hl,#(_level01Map + 0x012a)
	ld	(hl),#0x06
	ld	hl,#(_level01Map + 0x012b)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x012c)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x012d)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x012e)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x012f)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0130)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0131)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0132)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0133)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0134)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0135)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0136)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0137)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0138)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0139)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x013a)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x013b)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x013c)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x013d)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x013e)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x013f)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0140)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0141)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0142)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0143)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0144)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0145)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0146)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0147)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0148)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0149)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x014a)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x014b)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x014c)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x014d)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x014e)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x014f)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0150)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0151)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0152)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0153)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0154)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0155)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0156)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0157)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0158)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0159)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x015a)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x015b)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x015c)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x015d)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x015e)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x015f)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0160)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0161)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0162)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0163)
	ld	(hl),#0x06
	ld	hl,#(_level01Map + 0x0164)
	ld	(hl),#0x06
	ld	hl,#(_level01Map + 0x0165)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0166)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0167)
	ld	(hl),#0x08
;level01Tile.c:26: unsigned char level01Tile[] =
	ld	hl,#_level01Tile
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0001)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0002)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0003)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0004)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0005)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0006)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0007)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0008)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0009)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x000a)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x000b)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x000c)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x000d)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x000e)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x000f)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0010)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0011)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x0012)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x0013)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0014)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x0015)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0016)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x0017)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0018)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x0019)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x001a)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x001b)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x001c)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x001d)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x001e)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x001f)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0020)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0021)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x0022)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x0023)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0024)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x0025)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0026)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x0027)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0028)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x0029)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x002a)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x002b)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x002c)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x002d)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x002e)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x002f)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0030)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0031)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x0032)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x0033)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0034)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x0035)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0036)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x0037)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0038)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x0039)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x003a)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x003b)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x003c)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x003d)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x003e)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x003f)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0040)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x0041)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0042)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x0043)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0044)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x0045)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0046)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x0047)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0048)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x0049)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x004a)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x004b)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x004c)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x004d)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x004e)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x004f)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0050)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x0051)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0052)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x0053)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0054)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x0055)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0056)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x0057)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0058)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x0059)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x005a)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x005b)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x005c)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x005d)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x005e)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x005f)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0060)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x0061)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0062)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x0063)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0064)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x0065)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0066)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x0067)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0068)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x0069)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x006a)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x006b)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x006c)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x006d)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x006e)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x006f)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0070)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x0071)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0072)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x0073)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0074)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x0075)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0076)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x0077)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0078)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x0079)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x007a)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x007b)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x007c)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x007d)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x007e)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x007f)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0080)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x0081)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0082)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x0083)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0084)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x0085)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0086)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x0087)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0088)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x0089)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x008a)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x008b)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x008c)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x008d)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x008e)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x008f)
	ld	(hl),#0x00
;playerSprite.c:26: unsigned char playerSprite[] =
	ld	hl,#_playerSprite
	ld	(hl),#0x00
	ld	hl,#(_playerSprite + 0x0001)
	ld	(hl),#0x00
	ld	hl,#(_playerSprite + 0x0002)
	ld	(hl),#0x00
	ld	hl,#(_playerSprite + 0x0003)
	ld	(hl),#0x00
	ld	hl,#(_playerSprite + 0x0004)
	ld	(hl),#0x00
	ld	hl,#(_playerSprite + 0x0005)
	ld	(hl),#0x00
	ld	hl,#(_playerSprite + 0x0006)
	ld	(hl),#0x00
	ld	hl,#(_playerSprite + 0x0007)
	ld	(hl),#0x00
	ld	hl,#(_playerSprite + 0x0008)
	ld	(hl),#0x00
	ld	hl,#(_playerSprite + 0x0009)
	ld	(hl),#0x00
	ld	hl,#(_playerSprite + 0x000a)
	ld	(hl),#0x00
	ld	hl,#(_playerSprite + 0x000b)
	ld	(hl),#0x00
	ld	hl,#(_playerSprite + 0x000c)
	ld	(hl),#0x00
	ld	hl,#(_playerSprite + 0x000d)
	ld	(hl),#0x00
	ld	hl,#(_playerSprite + 0x000e)
	ld	(hl),#0x00
	ld	hl,#(_playerSprite + 0x000f)
	ld	(hl),#0x00
	ld	hl,#(_playerSprite + 0x0010)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x0011)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x0012)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x0013)
	ld	(hl),#0x80
	ld	hl,#(_playerSprite + 0x0014)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x0015)
	ld	(hl),#0x80
	ld	hl,#(_playerSprite + 0x0016)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x0017)
	ld	(hl),#0x80
	ld	hl,#(_playerSprite + 0x0018)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x0019)
	ld	(hl),#0x80
	ld	hl,#(_playerSprite + 0x001a)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x001b)
	ld	(hl),#0x80
	ld	hl,#(_playerSprite + 0x001c)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x001d)
	ld	(hl),#0x80
	ld	hl,#(_playerSprite + 0x001e)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x001f)
	ld	(hl),#0x80
	ld	hl,#(_playerSprite + 0x0020)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x0021)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x0022)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x0023)
	ld	(hl),#0x01
	ld	hl,#(_playerSprite + 0x0024)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x0025)
	ld	(hl),#0x01
	ld	hl,#(_playerSprite + 0x0026)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x0027)
	ld	(hl),#0x01
	ld	hl,#(_playerSprite + 0x0028)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x0029)
	ld	(hl),#0x01
	ld	hl,#(_playerSprite + 0x002a)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x002b)
	ld	(hl),#0x01
	ld	hl,#(_playerSprite + 0x002c)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x002d)
	ld	(hl),#0x01
	ld	hl,#(_playerSprite + 0x002e)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x002f)
	ld	(hl),#0x01
	ld	hl,#(_playerSprite + 0x0030)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x0031)
	ld	(hl),#0x80
	ld	hl,#(_playerSprite + 0x0032)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x0033)
	ld	(hl),#0x80
	ld	hl,#(_playerSprite + 0x0034)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x0035)
	ld	(hl),#0x80
	ld	hl,#(_playerSprite + 0x0036)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x0037)
	ld	(hl),#0x80
	ld	hl,#(_playerSprite + 0x0038)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x0039)
	ld	(hl),#0x80
	ld	hl,#(_playerSprite + 0x003a)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x003b)
	ld	(hl),#0x80
	ld	hl,#(_playerSprite + 0x003c)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x003d)
	ld	(hl),#0x80
	ld	hl,#(_playerSprite + 0x003e)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x003f)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x0040)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x0041)
	ld	(hl),#0x01
	ld	hl,#(_playerSprite + 0x0042)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x0043)
	ld	(hl),#0x01
	ld	hl,#(_playerSprite + 0x0044)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x0045)
	ld	(hl),#0x01
	ld	hl,#(_playerSprite + 0x0046)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x0047)
	ld	(hl),#0x01
	ld	hl,#(_playerSprite + 0x0048)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x0049)
	ld	(hl),#0x01
	ld	hl,#(_playerSprite + 0x004a)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x004b)
	ld	(hl),#0x01
	ld	hl,#(_playerSprite + 0x004c)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x004d)
	ld	(hl),#0x01
	ld	hl,#(_playerSprite + 0x004e)
	ld	(hl),#0xff
	ld	hl,#(_playerSprite + 0x004f)
	ld	(hl),#0xff
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:13: void performantDelay(UINT8 numloops)
;	---------------------------------
; Function performantDelay
; ---------------------------------
_performantDelay::
;main.c:16: for(i=0;i < numloops;i++)
	ld	c,#0x00
00103$:
	ld	a,c
	ldhl	sp,#2
	sub	a, (hl)
	ret	NC
;main.c:18: wait_vbl_done();
	push	bc
	call	_wait_vbl_done
	pop	bc
;main.c:16: for(i=0;i < numloops;i++)
	inc	c
	jr	00103$
	ret
_blankMap:
	.db #0x00	; 0
;main.c:23: void updateKeys()
;	---------------------------------
; Function updateKeys
; ---------------------------------
_updateKeys::
;main.c:25: previousKeys = keys;
	push	hl
	ld	hl,#_keys
	ld	a,(hl)
	ld	hl,#_previousKeys
	ld	(hl),a
	pop	hl
;main.c:26: keys = joypad();
	call	_joypad
	ld	hl,#_keys
	ld	(hl),e
	ret
;main.c:29: INT8 keyPressed(INT8 K)
;	---------------------------------
; Function keyPressed
; ---------------------------------
_keyPressed::
;main.c:31: return keys & (K);
	ld	hl,#_keys
	ld	a,(hl)
	ldhl	sp,#2
	and	a, (hl)
	ld	e,a
	ret
;main.c:34: INT8 keyTicked(INT8 K)
;	---------------------------------
; Function keyTicked
; ---------------------------------
_keyTicked::
;main.c:36: return (keys & (K) && !(previousKeys & (K)));
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
;main.c:39: INT8 keyReleased(INT8 K)
;	---------------------------------
; Function keyReleased
; ---------------------------------
_keyReleased::
;main.c:41: return previousKeys & (K) && !(keys & (K));
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
;main.c:44: void anyKey()
;	---------------------------------
; Function anyKey
; ---------------------------------
_anyKey::
;main.c:46: keys;
	ret
;main.c:61: void moveGameCharacter(struct gameCharacter *character, UINT8 x, UINT8 y)
;	---------------------------------
; Function moveGameCharacter
; ---------------------------------
_moveGameCharacter::
	add	sp, #-4
;main.c:63: move_sprite(character->spriteId[0],x, y);
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
;main.c:64: move_sprite(character->spriteId[1],x + 8, y);
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
;main.c:65: move_sprite(character->spriteId[2],x, y + 8);
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
;main.c:66: move_sprite(character->spriteId[3],x + 8, y + 8);
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
;main.c:71: void setupPlayerSprite()
;	---------------------------------
; Function setupPlayerSprite
; ---------------------------------
_setupPlayerSprite::
;main.c:73: set_sprite_data(0, 5, playerSprite);
	ld	hl,#_playerSprite
	push	hl
	ld	hl,#0x0500
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:75: playerSprite01.x = 8;
	ld	hl,#(_playerSprite01 + 0x0004)
	ld	(hl),#0x08
;main.c:76: playerSprite01.y = 16;
	ld	hl,#(_playerSprite01 + 0x0005)
	ld	(hl),#0x10
;main.c:77: playerSprite01.width = 16;
	ld	hl,#(_playerSprite01 + 0x0006)
	ld	(hl),#0x10
;main.c:78: playerSprite01.height = 16;
	ld	hl,#(_playerSprite01 + 0x0007)
	ld	(hl),#0x10
;main.c:80: set_sprite_tile(1,1);
	ld	hl,#0x0101
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:81: playerSprite01.spriteId[0]=1;
	ld	hl,#_playerSprite01
	ld	(hl),#0x01
;main.c:82: set_sprite_tile(2,2);
	ld	hl,#0x0202
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:83: playerSprite01.spriteId[1]=2;
	ld	hl,#(_playerSprite01 + 0x0001)
	ld	(hl),#0x02
;main.c:84: set_sprite_tile(3,3);
	ld	hl,#0x0303
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:85: playerSprite01.spriteId[2]=3;
	ld	hl,#(_playerSprite01 + 0x0002)
	ld	(hl),#0x03
;main.c:86: set_sprite_tile(4,4);
	ld	hl,#0x0404
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:87: playerSprite01.spriteId[3]=4;
	ld	hl,#(_playerSprite01 + 0x0003)
	ld	(hl),#0x04
;main.c:89: moveGameCharacter(&playerSprite01,playerSprite01.x,playerSprite01.y);
	ld	de, #(_playerSprite01 + 0x0005) + 0
	ld	a,(de)
	ld	b,a
	ld	de, #(_playerSprite01 + 0x0004) + 0
	ld	a,(de)
	ld	c,a
	push	bc
	inc	sp
	ld	a,c
	push	af
	inc	sp
	ld	hl,#_playerSprite01
	push	hl
	call	_moveGameCharacter
	add	sp, #4
	ret
;main.c:92: UBYTE canPlayerMove(UINT8 newPlayerX, UINT8 newPlayerY)
;	---------------------------------
; Function canPlayerMove
; ---------------------------------
_canPlayerMove::
	add	sp, #-6
;main.c:97: indexTlX = (newPlayerX - 8) / 8;
	ldhl	sp,#8
	ld	a,(hl)
	ldhl	sp,#2
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
	ldhl	sp,#4
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ld	a,#0x00
	ld	e,a
	ld	a,b
	ld	d,a
	bit	7, b
	jr	Z,00103$
	dec	hl
	dec	hl
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0xffff
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#4
	ld	(hl+),a
	ld	(hl),d
00103$:
	ldhl	sp,#4
	ld	a,(hl)
	ldhl	sp,#0
	ld	(hl),a
	ldhl	sp,#5
	ld	a,(hl)
	ldhl	sp,#1
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
;main.c:98: indexTlY = (newPlayerY - 16) / 8;
	ldhl	sp,#9
	ld	a,(hl)
	ldhl	sp,#4
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
	ldhl	sp,#2
	ld	(hl),c
	inc	hl
	ld	(hl),b
	ld	a,#0x00
	ld	e,a
	ld	a,b
	ld	d,a
	bit	7, b
	jr	Z,00104$
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0xfff7
	add	hl,de
	ld	a,l
	ld	d,h
	ldhl	sp,#2
	ld	(hl+),a
	ld	(hl),d
00104$:
	pop	de
	pop	bc
	push	bc
	push	de
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
;main.c:99: tileIndexTl = 20 * indexTlY + indexTlX;
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
;main.c:101: result = level01Map[tileIndexTl] == blankMap[0];
	ld	hl,#_level01Map
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
;main.c:103: return result;
	add	sp, #6
	ret
;main.c:108: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:110: setupPlayerSprite();
	call	_setupPlayerSprite
;main.c:112: set_bkg_data(0, 9, level01Tile);
	ld	hl,#_level01Tile
	push	hl
	ld	hl,#0x0900
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:113: set_bkg_tiles(0, 0, 20, 18, level01Map);
	ld	hl,#_level01Map
	push	hl
	ld	hl,#0x1214
	push	hl
	ld	hl,#0x0000
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;main.c:115: SHOW_BKG;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	0, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;main.c:116: SHOW_SPRITES;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	l, #0x40
	ld	(hl),c
;main.c:117: DISPLAY_ON;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	7, a
	ld	c,a
	ld	l, #0x40
	ld	(hl),c
;main.c:119: gravity = 2;
	ld	hl,#_gravity
	ld	(hl),#0x02
;main.c:121: while(1)
00112$:
;main.c:123: updateKeys();
	call	_updateKeys
;main.c:125: if(canPlayerMove(playerSprite01.x, playerSprite01.y + 16))
	ld	a, (#(_playerSprite01 + 0x0005) + 0)
	add	a, #0x10
	ld	b,a
	ld	a, (#(_playerSprite01 + 0x0004) + 0)
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_canPlayerMove
	add	sp, #2
	ld	a,e
	or	a, a
	jr	Z,00102$
;main.c:127: playerSprite01.y += gravity;
	ld	a, (#(_playerSprite01 + 0x0005) + 0)
	ld	c,a
	ld	hl,#_gravity
	add	a, (hl)
	ld	de,#(_playerSprite01 + 0x0005)
	ld	(de),a
00102$:
;main.c:130: if(keyPressed(J_LEFT))
	ld	a,#0x02
	push	af
	inc	sp
	call	_keyPressed
	inc	sp
	ld	a,e
	or	a, a
	jp	Z,00106$
;main.c:132: if(canPlayerMove(playerSprite01.x - 1, playerSprite01.y))
	ld	de, #(_playerSprite01 + 0x0005) + 0
	ld	a,(de)
	ld	b,a
	ld	a, (#(_playerSprite01 + 0x0004) + 0)
	add	a,#0xff
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_canPlayerMove
	add	sp, #2
	ld	a,e
	or	a, a
	jr	Z,00106$
;main.c:134: playerSprite01.x -= 2;
	ld	a, (#(_playerSprite01 + 0x0004) + 0)
	ld	c,a
	dec	c
	dec	c
	ld	hl,#(_playerSprite01 + 0x0004)
	ld	(hl),c
;main.c:135: moveGameCharacter(&playerSprite01, playerSprite01.x, playerSprite01.y);
	ld	de, #(_playerSprite01 + 0x0005) + 0
	ld	a,(de)
	ld	b,a
	push	bc
	inc	sp
	ld	a,c
	push	af
	inc	sp
	ld	hl,#_playerSprite01
	push	hl
	call	_moveGameCharacter
	add	sp, #4
00106$:
;main.c:139: if(keyPressed(J_RIGHT))
	ld	a,#0x01
	push	af
	inc	sp
	call	_keyPressed
	inc	sp
	ld	a,e
	or	a, a
	jp	Z,00110$
;main.c:141: if(canPlayerMove(playerSprite01.x + 16, playerSprite01.y))
	ld	de, #(_playerSprite01 + 0x0005) + 0
	ld	a,(de)
	ld	b,a
	ld	a, (#(_playerSprite01 + 0x0004) + 0)
	add	a, #0x10
	ld	d,a
	push	bc
	inc	sp
	push	de
	inc	sp
	call	_canPlayerMove
	add	sp, #2
	ld	a,e
	or	a, a
	jr	Z,00110$
;main.c:143: playerSprite01.x += 2;
	ld	a, (#(_playerSprite01 + 0x0004) + 0)
	ld	c,a
	inc	c
	inc	c
	ld	hl,#(_playerSprite01 + 0x0004)
	ld	(hl),c
;main.c:144: moveGameCharacter(&playerSprite01, playerSprite01.x, playerSprite01.y);
	ld	de, #(_playerSprite01 + 0x0005) + 0
	ld	a,(de)
	ld	b,a
	push	bc
	inc	sp
	ld	a,c
	push	af
	inc	sp
	ld	hl,#_playerSprite01
	push	hl
	call	_moveGameCharacter
	add	sp, #4
00110$:
;main.c:148: performantDelay(1);
	ld	a,#0x01
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
	jp	00112$
	ret
	.area _CODE
	.area _CABS (ABS)
