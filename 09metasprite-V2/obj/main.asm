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
	.globl _playerToBGCollision
	.globl _setupPlayer
	.globl _movePlayerL
	.globl _movePlayerR
	.globl _playerAnimation
	.globl _performantDelay
	.globl _slowDown
	.globl _move_sprite
	.globl _get_sprite_prop
	.globl _set_sprite_prop
	.globl _set_sprite_tile
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _player
	.globl _timerKeyL
	.globl _timerKeyR
	.globl _timerLocal
	.globl _index
	.globl _level01Map
	.globl _level01Tile
	.globl _playerTile
	.globl _blankMap
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_playerTile::
	.ds 320
_level01Tile::
	.ds 176
_level01Map::
	.ds 360
_index::
	.ds 1
_timerLocal::
	.ds 1
_timerKeyR::
	.ds 1
_timerKeyL::
	.ds 1
_player::
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
;playerTile.c:26: unsigned char playerTile[] =
	ld	hl,#_playerTile
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0001)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0002)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0003)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0004)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0005)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0006)
	ld	(hl),#0x38
	ld	hl,#(_playerTile + 0x0007)
	ld	(hl),#0x38
	ld	hl,#(_playerTile + 0x0008)
	ld	(hl),#0x7c
	ld	hl,#(_playerTile + 0x0009)
	ld	(hl),#0x44
	ld	hl,#(_playerTile + 0x000a)
	ld	(hl),#0x7c
	ld	hl,#(_playerTile + 0x000b)
	ld	(hl),#0x44
	ld	hl,#(_playerTile + 0x000c)
	ld	(hl),#0x7c
	ld	hl,#(_playerTile + 0x000d)
	ld	(hl),#0x44
	ld	hl,#(_playerTile + 0x000e)
	ld	(hl),#0x7c
	ld	hl,#(_playerTile + 0x000f)
	ld	(hl),#0x44
	ld	hl,#(_playerTile + 0x0010)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0011)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0012)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0013)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0014)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0015)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0016)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0017)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0018)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0019)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x001a)
	ld	(hl),#0x20
	ld	hl,#(_playerTile + 0x001b)
	ld	(hl),#0x20
	ld	hl,#(_playerTile + 0x001c)
	ld	(hl),#0x78
	ld	hl,#(_playerTile + 0x001d)
	ld	(hl),#0x58
	ld	hl,#(_playerTile + 0x001e)
	ld	(hl),#0x7c
	ld	hl,#(_playerTile + 0x001f)
	ld	(hl),#0x44
	ld	hl,#(_playerTile + 0x0020)
	ld	(hl),#0x7f
	ld	hl,#(_playerTile + 0x0021)
	ld	(hl),#0x43
	ld	hl,#(_playerTile + 0x0022)
	ld	(hl),#0x7f
	ld	hl,#(_playerTile + 0x0023)
	ld	(hl),#0x40
	ld	hl,#(_playerTile + 0x0024)
	ld	(hl),#0x7f
	ld	hl,#(_playerTile + 0x0025)
	ld	(hl),#0x40
	ld	hl,#(_playerTile + 0x0026)
	ld	(hl),#0x7f
	ld	hl,#(_playerTile + 0x0027)
	ld	(hl),#0x40
	ld	hl,#(_playerTile + 0x0028)
	ld	(hl),#0x3f
	ld	hl,#(_playerTile + 0x0029)
	ld	(hl),#0x20
	ld	hl,#(_playerTile + 0x002a)
	ld	(hl),#0x3f
	ld	hl,#(_playerTile + 0x002b)
	ld	(hl),#0x27
	ld	hl,#(_playerTile + 0x002c)
	ld	(hl),#0x38
	ld	hl,#(_playerTile + 0x002d)
	ld	(hl),#0x28
	ld	hl,#(_playerTile + 0x002e)
	ld	(hl),#0x30
	ld	hl,#(_playerTile + 0x002f)
	ld	(hl),#0x30
	ld	hl,#(_playerTile + 0x0030)
	ld	(hl),#0xfe
	ld	hl,#(_playerTile + 0x0031)
	ld	(hl),#0x8a
	ld	hl,#(_playerTile + 0x0032)
	ld	(hl),#0xfe
	ld	hl,#(_playerTile + 0x0033)
	ld	(hl),#0x02
	ld	hl,#(_playerTile + 0x0034)
	ld	(hl),#0xfe
	ld	hl,#(_playerTile + 0x0035)
	ld	(hl),#0x02
	ld	hl,#(_playerTile + 0x0036)
	ld	(hl),#0xfe
	ld	hl,#(_playerTile + 0x0037)
	ld	(hl),#0x02
	ld	hl,#(_playerTile + 0x0038)
	ld	(hl),#0xfc
	ld	hl,#(_playerTile + 0x0039)
	ld	(hl),#0x04
	ld	hl,#(_playerTile + 0x003a)
	ld	(hl),#0xf8
	ld	hl,#(_playerTile + 0x003b)
	ld	(hl),#0xc8
	ld	hl,#(_playerTile + 0x003c)
	ld	(hl),#0x38
	ld	hl,#(_playerTile + 0x003d)
	ld	(hl),#0x28
	ld	hl,#(_playerTile + 0x003e)
	ld	(hl),#0x30
	ld	hl,#(_playerTile + 0x003f)
	ld	(hl),#0x30
	ld	hl,#(_playerTile + 0x0040)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0041)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0042)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0043)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0044)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0045)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0046)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0047)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0048)
	ld	(hl),#0x38
	ld	hl,#(_playerTile + 0x0049)
	ld	(hl),#0x38
	ld	hl,#(_playerTile + 0x004a)
	ld	(hl),#0x7c
	ld	hl,#(_playerTile + 0x004b)
	ld	(hl),#0x44
	ld	hl,#(_playerTile + 0x004c)
	ld	(hl),#0x7c
	ld	hl,#(_playerTile + 0x004d)
	ld	(hl),#0x44
	ld	hl,#(_playerTile + 0x004e)
	ld	(hl),#0x7c
	ld	hl,#(_playerTile + 0x004f)
	ld	(hl),#0x44
	ld	hl,#(_playerTile + 0x0050)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0051)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0052)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0053)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0054)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0055)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0056)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0057)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0058)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0059)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x005a)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x005b)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x005c)
	ld	(hl),#0x20
	ld	hl,#(_playerTile + 0x005d)
	ld	(hl),#0x20
	ld	hl,#(_playerTile + 0x005e)
	ld	(hl),#0x78
	ld	hl,#(_playerTile + 0x005f)
	ld	(hl),#0x58
	ld	hl,#(_playerTile + 0x0060)
	ld	(hl),#0x7c
	ld	hl,#(_playerTile + 0x0061)
	ld	(hl),#0x44
	ld	hl,#(_playerTile + 0x0062)
	ld	(hl),#0x7f
	ld	hl,#(_playerTile + 0x0063)
	ld	(hl),#0x43
	ld	hl,#(_playerTile + 0x0064)
	ld	(hl),#0x7f
	ld	hl,#(_playerTile + 0x0065)
	ld	(hl),#0x40
	ld	hl,#(_playerTile + 0x0066)
	ld	(hl),#0x7f
	ld	hl,#(_playerTile + 0x0067)
	ld	(hl),#0x40
	ld	hl,#(_playerTile + 0x0068)
	ld	(hl),#0x7f
	ld	hl,#(_playerTile + 0x0069)
	ld	(hl),#0x40
	ld	hl,#(_playerTile + 0x006a)
	ld	(hl),#0x3f
	ld	hl,#(_playerTile + 0x006b)
	ld	(hl),#0x20
	ld	hl,#(_playerTile + 0x006c)
	ld	(hl),#0x3f
	ld	hl,#(_playerTile + 0x006d)
	ld	(hl),#0x27
	ld	hl,#(_playerTile + 0x006e)
	ld	(hl),#0x38
	ld	hl,#(_playerTile + 0x006f)
	ld	(hl),#0x38
	ld	hl,#(_playerTile + 0x0070)
	ld	(hl),#0x7c
	ld	hl,#(_playerTile + 0x0071)
	ld	(hl),#0x44
	ld	hl,#(_playerTile + 0x0072)
	ld	(hl),#0xfe
	ld	hl,#(_playerTile + 0x0073)
	ld	(hl),#0x8a
	ld	hl,#(_playerTile + 0x0074)
	ld	(hl),#0xfe
	ld	hl,#(_playerTile + 0x0075)
	ld	(hl),#0x02
	ld	hl,#(_playerTile + 0x0076)
	ld	(hl),#0xfe
	ld	hl,#(_playerTile + 0x0077)
	ld	(hl),#0x02
	ld	hl,#(_playerTile + 0x0078)
	ld	(hl),#0xfe
	ld	hl,#(_playerTile + 0x0079)
	ld	(hl),#0x02
	ld	hl,#(_playerTile + 0x007a)
	ld	(hl),#0xfc
	ld	hl,#(_playerTile + 0x007b)
	ld	(hl),#0x04
	ld	hl,#(_playerTile + 0x007c)
	ld	(hl),#0xf8
	ld	hl,#(_playerTile + 0x007d)
	ld	(hl),#0xc8
	ld	hl,#(_playerTile + 0x007e)
	ld	(hl),#0x30
	ld	hl,#(_playerTile + 0x007f)
	ld	(hl),#0x30
	ld	hl,#(_playerTile + 0x0080)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0081)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0082)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0083)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0084)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0085)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0086)
	ld	(hl),#0x38
	ld	hl,#(_playerTile + 0x0087)
	ld	(hl),#0x38
	ld	hl,#(_playerTile + 0x0088)
	ld	(hl),#0x7c
	ld	hl,#(_playerTile + 0x0089)
	ld	(hl),#0x44
	ld	hl,#(_playerTile + 0x008a)
	ld	(hl),#0x7c
	ld	hl,#(_playerTile + 0x008b)
	ld	(hl),#0x44
	ld	hl,#(_playerTile + 0x008c)
	ld	(hl),#0x7c
	ld	hl,#(_playerTile + 0x008d)
	ld	(hl),#0x44
	ld	hl,#(_playerTile + 0x008e)
	ld	(hl),#0x7c
	ld	hl,#(_playerTile + 0x008f)
	ld	(hl),#0x44
	ld	hl,#(_playerTile + 0x0090)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0091)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0092)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0093)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0094)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0095)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0096)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0097)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0098)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0099)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x009a)
	ld	(hl),#0x20
	ld	hl,#(_playerTile + 0x009b)
	ld	(hl),#0x20
	ld	hl,#(_playerTile + 0x009c)
	ld	(hl),#0x78
	ld	hl,#(_playerTile + 0x009d)
	ld	(hl),#0x58
	ld	hl,#(_playerTile + 0x009e)
	ld	(hl),#0x7c
	ld	hl,#(_playerTile + 0x009f)
	ld	(hl),#0x44
	ld	hl,#(_playerTile + 0x00a0)
	ld	(hl),#0x7f
	ld	hl,#(_playerTile + 0x00a1)
	ld	(hl),#0x43
	ld	hl,#(_playerTile + 0x00a2)
	ld	(hl),#0x7f
	ld	hl,#(_playerTile + 0x00a3)
	ld	(hl),#0x40
	ld	hl,#(_playerTile + 0x00a4)
	ld	(hl),#0x7f
	ld	hl,#(_playerTile + 0x00a5)
	ld	(hl),#0x40
	ld	hl,#(_playerTile + 0x00a6)
	ld	(hl),#0x7f
	ld	hl,#(_playerTile + 0x00a7)
	ld	(hl),#0x40
	ld	hl,#(_playerTile + 0x00a8)
	ld	(hl),#0x7f
	ld	hl,#(_playerTile + 0x00a9)
	ld	(hl),#0x40
	ld	hl,#(_playerTile + 0x00aa)
	ld	(hl),#0xff
	ld	hl,#(_playerTile + 0x00ab)
	ld	(hl),#0x8f
	ld	hl,#(_playerTile + 0x00ac)
	ld	(hl),#0xf0
	ld	hl,#(_playerTile + 0x00ad)
	ld	(hl),#0xb0
	ld	hl,#(_playerTile + 0x00ae)
	ld	(hl),#0x40
	ld	hl,#(_playerTile + 0x00af)
	ld	(hl),#0x40
	ld	hl,#(_playerTile + 0x00b0)
	ld	(hl),#0xfe
	ld	hl,#(_playerTile + 0x00b1)
	ld	(hl),#0x8a
	ld	hl,#(_playerTile + 0x00b2)
	ld	(hl),#0xfe
	ld	hl,#(_playerTile + 0x00b3)
	ld	(hl),#0x02
	ld	hl,#(_playerTile + 0x00b4)
	ld	(hl),#0xfe
	ld	hl,#(_playerTile + 0x00b5)
	ld	(hl),#0x02
	ld	hl,#(_playerTile + 0x00b6)
	ld	(hl),#0xfe
	ld	hl,#(_playerTile + 0x00b7)
	ld	(hl),#0x02
	ld	hl,#(_playerTile + 0x00b8)
	ld	(hl),#0xfc
	ld	hl,#(_playerTile + 0x00b9)
	ld	(hl),#0x04
	ld	hl,#(_playerTile + 0x00ba)
	ld	(hl),#0xfe
	ld	hl,#(_playerTile + 0x00bb)
	ld	(hl),#0xe2
	ld	hl,#(_playerTile + 0x00bc)
	ld	(hl),#0x1e
	ld	hl,#(_playerTile + 0x00bd)
	ld	(hl),#0x1a
	ld	hl,#(_playerTile + 0x00be)
	ld	(hl),#0x04
	ld	hl,#(_playerTile + 0x00bf)
	ld	(hl),#0x04
	ld	hl,#(_playerTile + 0x00c0)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00c1)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00c2)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00c3)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00c4)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00c5)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00c6)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00c7)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00c8)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00c9)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00ca)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00cb)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00cc)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00cd)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00ce)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00cf)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00d0)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00d1)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00d2)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00d3)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00d4)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00d5)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00d6)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00d7)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00d8)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00d9)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00da)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00db)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00dc)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00dd)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00de)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00df)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00e0)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00e1)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00e2)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00e3)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00e4)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00e5)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00e6)
	ld	(hl),#0x3f
	ld	hl,#(_playerTile + 0x00e7)
	ld	(hl),#0x3f
	ld	hl,#(_playerTile + 0x00e8)
	ld	(hl),#0x7f
	ld	hl,#(_playerTile + 0x00e9)
	ld	(hl),#0x40
	ld	hl,#(_playerTile + 0x00ea)
	ld	(hl),#0xff
	ld	hl,#(_playerTile + 0x00eb)
	ld	(hl),#0x80
	ld	hl,#(_playerTile + 0x00ec)
	ld	(hl),#0xff
	ld	hl,#(_playerTile + 0x00ed)
	ld	(hl),#0x80
	ld	hl,#(_playerTile + 0x00ee)
	ld	(hl),#0x7f
	ld	hl,#(_playerTile + 0x00ef)
	ld	(hl),#0x7f
	ld	hl,#(_playerTile + 0x00f0)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00f1)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00f2)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00f3)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x00f4)
	ld	(hl),#0x20
	ld	hl,#(_playerTile + 0x00f5)
	ld	(hl),#0x20
	ld	hl,#(_playerTile + 0x00f6)
	ld	(hl),#0xf8
	ld	hl,#(_playerTile + 0x00f7)
	ld	(hl),#0xd8
	ld	hl,#(_playerTile + 0x00f8)
	ld	(hl),#0xfc
	ld	hl,#(_playerTile + 0x00f9)
	ld	(hl),#0x04
	ld	hl,#(_playerTile + 0x00fa)
	ld	(hl),#0xfe
	ld	hl,#(_playerTile + 0x00fb)
	ld	(hl),#0x0a
	ld	hl,#(_playerTile + 0x00fc)
	ld	(hl),#0xff
	ld	hl,#(_playerTile + 0x00fd)
	ld	(hl),#0x01
	ld	hl,#(_playerTile + 0x00fe)
	ld	(hl),#0xfe
	ld	hl,#(_playerTile + 0x00ff)
	ld	(hl),#0xfe
	ld	hl,#(_playerTile + 0x0100)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0101)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0102)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0103)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0104)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0105)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0106)
	ld	(hl),#0x3e
	ld	hl,#(_playerTile + 0x0107)
	ld	(hl),#0x3e
	ld	hl,#(_playerTile + 0x0108)
	ld	(hl),#0x7f
	ld	hl,#(_playerTile + 0x0109)
	ld	(hl),#0x41
	ld	hl,#(_playerTile + 0x010a)
	ld	(hl),#0x7f
	ld	hl,#(_playerTile + 0x010b)
	ld	(hl),#0x41
	ld	hl,#(_playerTile + 0x010c)
	ld	(hl),#0xfe
	ld	hl,#(_playerTile + 0x010d)
	ld	(hl),#0x86
	ld	hl,#(_playerTile + 0x010e)
	ld	(hl),#0xff
	ld	hl,#(_playerTile + 0x010f)
	ld	(hl),#0x8f
	ld	hl,#(_playerTile + 0x0110)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0111)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0112)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0113)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0114)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0115)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0116)
	ld	(hl),#0x70
	ld	hl,#(_playerTile + 0x0117)
	ld	(hl),#0x70
	ld	hl,#(_playerTile + 0x0118)
	ld	(hl),#0xfe
	ld	hl,#(_playerTile + 0x0119)
	ld	(hl),#0x8e
	ld	hl,#(_playerTile + 0x011a)
	ld	(hl),#0x7f
	ld	hl,#(_playerTile + 0x011b)
	ld	(hl),#0x49
	ld	hl,#(_playerTile + 0x011c)
	ld	(hl),#0xff
	ld	hl,#(_playerTile + 0x011d)
	ld	(hl),#0x81
	ld	hl,#(_playerTile + 0x011e)
	ld	(hl),#0xff
	ld	hl,#(_playerTile + 0x011f)
	ld	(hl),#0x01
	ld	hl,#(_playerTile + 0x0120)
	ld	(hl),#0xff
	ld	hl,#(_playerTile + 0x0121)
	ld	(hl),#0x80
	ld	hl,#(_playerTile + 0x0122)
	ld	(hl),#0xff
	ld	hl,#(_playerTile + 0x0123)
	ld	(hl),#0x80
	ld	hl,#(_playerTile + 0x0124)
	ld	(hl),#0x7f
	ld	hl,#(_playerTile + 0x0125)
	ld	(hl),#0x40
	ld	hl,#(_playerTile + 0x0126)
	ld	(hl),#0xff
	ld	hl,#(_playerTile + 0x0127)
	ld	(hl),#0xb8
	ld	hl,#(_playerTile + 0x0128)
	ld	(hl),#0xc7
	ld	hl,#(_playerTile + 0x0129)
	ld	(hl),#0xc7
	ld	hl,#(_playerTile + 0x012a)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x012b)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x012c)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x012d)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x012e)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x012f)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x0130)
	ld	(hl),#0xfe
	ld	hl,#(_playerTile + 0x0131)
	ld	(hl),#0x02
	ld	hl,#(_playerTile + 0x0132)
	ld	(hl),#0xfe
	ld	hl,#(_playerTile + 0x0133)
	ld	(hl),#0x02
	ld	hl,#(_playerTile + 0x0134)
	ld	(hl),#0xfc
	ld	hl,#(_playerTile + 0x0135)
	ld	(hl),#0x04
	ld	hl,#(_playerTile + 0x0136)
	ld	(hl),#0xfe
	ld	hl,#(_playerTile + 0x0137)
	ld	(hl),#0x32
	ld	hl,#(_playerTile + 0x0138)
	ld	(hl),#0xce
	ld	hl,#(_playerTile + 0x0139)
	ld	(hl),#0xce
	ld	hl,#(_playerTile + 0x013a)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x013b)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x013c)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x013d)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x013e)
	ld	(hl),#0x00
	ld	hl,#(_playerTile + 0x013f)
	ld	(hl),#0x00
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
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x0011)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0012)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0013)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0014)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0015)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0016)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0017)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0018)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0019)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x001a)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x001b)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x001c)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x001d)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x001e)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x001f)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0020)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x0021)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0022)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0023)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0024)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0025)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0026)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0027)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0028)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0029)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x002a)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x002b)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x002c)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x002d)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x002e)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x002f)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0030)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0031)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0032)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0033)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0034)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0035)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0036)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0037)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0038)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0039)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x003a)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x003b)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x003c)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x003d)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x003e)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x003f)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0040)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0041)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0042)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0043)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0044)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0045)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0046)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0047)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0048)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0049)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x004a)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x004b)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x004c)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x004d)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x004e)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x004f)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0050)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0051)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x0052)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x0053)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0054)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x0055)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0056)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x0057)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0058)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x0059)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x005a)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x005b)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x005c)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x005d)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x005e)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x005f)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0060)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0061)
	ld	(hl),#0xff
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
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x0071)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x0072)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x0073)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0074)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x0075)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0076)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x0077)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0078)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x0079)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x007a)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x007b)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x007c)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x007d)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x007e)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x007f)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0080)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x0081)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0082)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x0083)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0084)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x0085)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0086)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x0087)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0088)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x0089)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x008a)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x008b)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x008c)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x008d)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x008e)
	ld	(hl),#0x7f
	ld	hl,#(_level01Tile + 0x008f)
	ld	(hl),#0x80
	ld	hl,#(_level01Tile + 0x0090)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x0091)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0092)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x0093)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0094)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x0095)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0096)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x0097)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x0098)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x0099)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x009a)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x009b)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x009c)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x009d)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x009e)
	ld	(hl),#0xfe
	ld	hl,#(_level01Tile + 0x009f)
	ld	(hl),#0x01
	ld	hl,#(_level01Tile + 0x00a0)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x00a1)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x00a2)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x00a3)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x00a4)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x00a5)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x00a6)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x00a7)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x00a8)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x00a9)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x00aa)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x00ab)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x00ac)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x00ad)
	ld	(hl),#0x00
	ld	hl,#(_level01Tile + 0x00ae)
	ld	(hl),#0xff
	ld	hl,#(_level01Tile + 0x00af)
	ld	(hl),#0x00
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
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00a1)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00a2)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00a3)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00a4)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00a5)
	ld	(hl),#0x00
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
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00b5)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00b6)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00b7)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00b8)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00b9)
	ld	(hl),#0x00
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
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00c9)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00ca)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00cb)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00cc)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00cd)
	ld	(hl),#0x00
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
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00db)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00dc)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00dd)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00de)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00df)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00e0)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00e1)
	ld	(hl),#0x00
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
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00ef)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00f0)
	ld	(hl),#0x05
	ld	hl,#(_level01Map + 0x00f1)
	ld	(hl),#0x07
	ld	hl,#(_level01Map + 0x00f2)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00f3)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00f4)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x00f5)
	ld	(hl),#0x00
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
	ld	(hl),#0x05
	ld	hl,#(_level01Map + 0x0101)
	ld	(hl),#0x06
	ld	hl,#(_level01Map + 0x0102)
	ld	(hl),#0x06
	ld	hl,#(_level01Map + 0x0103)
	ld	(hl),#0x07
	ld	hl,#(_level01Map + 0x0104)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0105)
	ld	(hl),#0x09
	ld	hl,#(_level01Map + 0x0106)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0107)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0108)
	ld	(hl),#0x00
	ld	hl,#(_level01Map + 0x0109)
	ld	(hl),#0x00
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
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0115)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0116)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0117)
	ld	(hl),#0x09
	ld	hl,#(_level01Map + 0x0118)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0119)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x011a)
	ld	(hl),#0x06
	ld	hl,#(_level01Map + 0x011b)
	ld	(hl),#0x06
	ld	hl,#(_level01Map + 0x011c)
	ld	(hl),#0x06
	ld	hl,#(_level01Map + 0x011d)
	ld	(hl),#0x06
	ld	hl,#(_level01Map + 0x011e)
	ld	(hl),#0x06
	ld	hl,#(_level01Map + 0x011f)
	ld	(hl),#0x06
	ld	hl,#(_level01Map + 0x0120)
	ld	(hl),#0x06
	ld	hl,#(_level01Map + 0x0121)
	ld	(hl),#0x06
	ld	hl,#(_level01Map + 0x0122)
	ld	(hl),#0x06
	ld	hl,#(_level01Map + 0x0123)
	ld	(hl),#0x06
	ld	hl,#(_level01Map + 0x0124)
	ld	(hl),#0x06
	ld	hl,#(_level01Map + 0x0125)
	ld	(hl),#0x06
	ld	hl,#(_level01Map + 0x0126)
	ld	(hl),#0x06
	ld	hl,#(_level01Map + 0x0127)
	ld	(hl),#0x06
	ld	hl,#(_level01Map + 0x0128)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0129)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x012a)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x012b)
	ld	(hl),#0x09
	ld	hl,#(_level01Map + 0x012c)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x012d)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x012e)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x012f)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0130)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0131)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0132)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0133)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0134)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0135)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0136)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0137)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0138)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0139)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x013a)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x013b)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x013c)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x013d)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x013e)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x013f)
	ld	(hl),#0x09
	ld	hl,#(_level01Map + 0x0140)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0141)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0142)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0143)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0144)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0145)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0146)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0147)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0148)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0149)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x014a)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x014b)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x014c)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x014d)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x014e)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x014f)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0150)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0151)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0152)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0153)
	ld	(hl),#0x09
	ld	hl,#(_level01Map + 0x0154)
	ld	(hl),#0x08
	ld	hl,#(_level01Map + 0x0155)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0156)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0157)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0158)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0159)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x015a)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x015b)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x015c)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x015d)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x015e)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x015f)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0160)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0161)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0162)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0163)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0164)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0165)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0166)
	ld	(hl),#0x0a
	ld	hl,#(_level01Map + 0x0167)
	ld	(hl),#0x09
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:15: void slowDown(UINT8 steps)
;	---------------------------------
; Function slowDown
; ---------------------------------
_slowDown::
;main.c:22: for(i = 0; i < steps; i++)
	ld	c,#0x00
00103$:
	ld	a,c
	ldhl	sp,#2
	sub	a, (hl)
	ret	NC
	inc	c
	jr	00103$
	ret
_blankMap:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
;main.c:27: void performantDelay(UINT8 numLoops)
;	---------------------------------
; Function performantDelay
; ---------------------------------
_performantDelay::
;main.c:30: for(i = 0; i < numLoops; i++)
	ld	c,#0x00
00103$:
	ld	a,c
	ldhl	sp,#2
	sub	a, (hl)
	ret	NC
;main.c:32: slowDown(255);
	push	bc
	ld	a,#0xff
	push	af
	inc	sp
	call	_slowDown
	inc	sp
	pop	bc
;main.c:30: for(i = 0; i < numLoops; i++)
	inc	c
	jr	00103$
	ret
;main.c:50: void playerAnimation(UINT8 fStart, UINT8 fMid, UINT8 fEnd, UINT8 a0, UINT8 b0, UINT8 numLoops)
;	---------------------------------
; Function playerAnimation
; ---------------------------------
_playerAnimation::
;main.c:52: if(timerLocal == fStart)
	ld	hl,#_timerLocal
	ld	a,(hl)
	ldhl	sp,#2
	sub	a, (hl)
	jp	NZ,00107$
;main.c:54: set_sprite_tile(0, a0);
	ldhl	sp,#5
	ld	a,(hl)
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_tile
	add	sp, #2
;main.c:55: set_sprite_tile(1, a0 + 1);
	ldhl	sp,#5
	ld	b,(hl)
	inc	b
	push	bc
	inc	sp
	ld	a,#0x01
	push	af
	inc	sp
	call	_set_sprite_tile
	add	sp, #2
;main.c:56: set_sprite_tile(2, a0 + 2);
	ldhl	sp,#5
	ld	b,(hl)
	inc	b
	inc	b
	push	bc
	inc	sp
	ld	a,#0x02
	push	af
	inc	sp
	call	_set_sprite_tile
	add	sp, #2
;main.c:57: set_sprite_tile(3, a0 + 3);
	ldhl	sp,#5
	ld	b,(hl)
	inc	b
	inc	b
	inc	b
	push	bc
	inc	sp
	ld	a,#0x03
	push	af
	inc	sp
	call	_set_sprite_tile
	add	sp, #2
;main.c:58: performantDelay(numLoops);
	ldhl	sp,#7
	ld	a,(hl)
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
	jp	00108$
00107$:
;main.c:60: else if(timerLocal == fMid)
	ld	hl,#_timerLocal
	ld	a,(hl)
	ldhl	sp,#3
	sub	a, (hl)
	jp	NZ,00104$
;main.c:62: set_sprite_tile(0, b0);
	ldhl	sp,#6
	ld	a,(hl)
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_tile
	add	sp, #2
;main.c:63: set_sprite_tile(1, b0 + 1);
	ldhl	sp,#6
	ld	b,(hl)
	inc	b
	push	bc
	inc	sp
	ld	a,#0x01
	push	af
	inc	sp
	call	_set_sprite_tile
	add	sp, #2
;main.c:64: set_sprite_tile(2, b0 + 2);
	ldhl	sp,#6
	ld	b,(hl)
	inc	b
	inc	b
	push	bc
	inc	sp
	ld	a,#0x02
	push	af
	inc	sp
	call	_set_sprite_tile
	add	sp, #2
;main.c:65: set_sprite_tile(3, b0 + 3);
	ldhl	sp,#6
	ld	b,(hl)
	inc	b
	inc	b
	inc	b
	push	bc
	inc	sp
	ld	a,#0x03
	push	af
	inc	sp
	call	_set_sprite_tile
	add	sp, #2
;main.c:66: performantDelay(numLoops);
	ldhl	sp,#7
	ld	a,(hl)
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
	jr	00108$
00104$:
;main.c:68: else if(timerLocal == fEnd)
	ld	hl,#_timerLocal
	ld	a,(hl)
	ldhl	sp,#4
	sub	a, (hl)
	jr	NZ,00108$
;main.c:70: timerLocal = 0;
	ld	hl,#_timerLocal
	ld	(hl),#0x00
;main.c:71: performantDelay(numLoops);
	ldhl	sp,#7
	ld	a,(hl)
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
00108$:
;main.c:73: timerLocal++;
	ld	hl,#_timerLocal
	inc	(hl)
	ret
;main.c:76: void movePlayerR(struct gamePlayer *character, UINT8 x, UINT8 y)
;	---------------------------------
; Function movePlayerR
; ---------------------------------
_movePlayerR::
	add	sp, #-6
;main.c:80: move_sprite(character->spriteId[0],x, y);
	ldhl	sp,#8
	ld	a,(hl+)
	ld	e, (hl)
	ldhl	sp,#4
	ld	(hl+),a
	ld	(hl),e
	dec	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	b,a
	ldhl	sp,#11
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
;main.c:81: move_sprite(character->spriteId[1],x + 8, y); 
	ldhl	sp,#10
	ld	a,(hl)
	add	a, #0x08
	ldhl	sp,#3
	ld	(hl+),a
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	ld	a,(bc)
	ld	b,a
	ldhl	sp,#11
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#4
	ld	a,(hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:82: move_sprite(character->spriteId[2],x, y + 8);
	ldhl	sp,#11
	ld	a,(hl)
	add	a, #0x08
	ldhl	sp,#2
	ld	(hl),a
	ldhl	sp,#(5 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	ld	a,(bc)
	ld	b,a
	ldhl	sp,#2
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#11
	ld	a,(hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:83: move_sprite(character->spriteId[3],x + 8, y + 8);
	ldhl	sp,#(5 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	inc	bc
	ld	a,(bc)
	ld	b,a
	ldhl	sp,#2
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
;main.c:85: for(i = 0;i < 4;i++)
	ld	c,#0x00
00102$:
;main.c:87: set_sprite_prop(character->spriteId[i], get_sprite_prop(i) & ~S_FLIPX);
	push	bc
	ld	a,c
	push	af
	inc	sp
	call	_get_sprite_prop
	inc	sp
	pop	bc
	ld	b,e
	res	5, b
	ldhl	sp,#(5 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,c
	ld	h,#0x00
	add	hl,de
	inc	sp
	inc	sp
	push	hl
	pop	de
	push	de
	ld	a,(de)
	push	bc
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_set_sprite_prop
	add	sp, #2
	pop	bc
;main.c:85: for(i = 0;i < 4;i++)
	inc	c
	ld	a,c
	sub	a, #0x04
	jp	C,00102$
	add	sp, #6
	ret
;main.c:91: void movePlayerL(struct gamePlayer *character, UINT8 x, UINT8 y)
;	---------------------------------
; Function movePlayerL
; ---------------------------------
_movePlayerL::
	add	sp, #-5
;main.c:95: move_sprite(character->spriteId[0],x + 8, y);		
	ldhl	sp,#9
	ld	a,(hl)
	add	a, #0x08
	ldhl	sp,#4
	ld	(hl),a
	ldhl	sp,#7
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
	ldhl	sp,#10
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#5
	ld	a,(hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:96: move_sprite(character->spriteId[1],x, y);			
	ldhl	sp,#(3 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	ld	a,(bc)
	ld	b,a
	ldhl	sp,#10
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
;main.c:97: move_sprite(character->spriteId[2],x + 8, y + 8);
	ldhl	sp,#10
	ld	a,(hl)
	add	a, #0x08
	ldhl	sp,#1
	ld	(hl+),a
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	ld	a,(bc)
	ld	b,a
	dec	hl
	dec	hl
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#5
	ld	a,(hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:98: move_sprite(character->spriteId[3],x, y + 8);
	ldhl	sp,#(3 - 1)
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	bc
	inc	bc
	inc	bc
	ld	a,(bc)
	ld	b,a
	dec	hl
	dec	hl
	ld	a,(hl)
	push	af
	inc	sp
	ldhl	sp,#10
	ld	a,(hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:100: for(i = 0;i < 4;i++)
	ldhl	sp,#0
	ld	(hl),#0x00
00102$:
;main.c:102: set_sprite_prop(character->spriteId[i], S_FLIPX);
	ldhl	sp,#(3 - 1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ldhl	sp,#0
	ld	l,(hl)
	ld	h,#0x00
	add	hl,de
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	b,a
	ld	a,#0x20
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_sprite_prop
	add	sp, #2
;main.c:100: for(i = 0;i < 4;i++)
	ldhl	sp,#0
	inc	(hl)
	ld	a,(hl)
	sub	a, #0x04
	jr	C,00102$
	add	sp, #5
	ret
;main.c:108: void setupPlayer()
;	---------------------------------
; Function setupPlayer
; ---------------------------------
_setupPlayer::
	add	sp, #-2
;main.c:113: set_sprite_data(0, 20, playerTile);
	ld	hl,#_playerTile
	push	hl
	ld	hl,#0x1400
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:115: player.x= 24;
	ld	hl,#(_player + 0x0004)
	ld	(hl),#0x18
;main.c:116: player.y = 112;
	ld	hl,#(_player + 0x0005)
	ld	(hl),#0x70
;main.c:117: player.width = 16;
	ld	hl,#(_player + 0x0006)
	ld	(hl),#0x10
;main.c:118: player.height = 16;
	ld	hl,#(_player + 0x0007)
	ld	(hl),#0x10
;main.c:120: for(i = 0; i < 4; i++)
	ld	b,#0x00
00103$:
;main.c:122: player.spriteId[i]=i;
	ld	de,#_player
	ld	l,b
	ld	h,#0x00
	add	hl,de
	inc	sp
	inc	sp
	push	hl
	pop	hl
	push	hl
	ld	(hl),b
;main.c:120: for(i = 0; i < 4; i++)
	inc	b
	ld	a,b
	sub	a, #0x04
	jr	C,00103$
;main.c:125: for(j = 0; j < 4; j++)
	ld	c,#0x00
00105$:
;main.c:127: set_sprite_prop(i, S_PALETTE);//using palette OBP1_REG
	push	bc
	ld	a,#0x10
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_sprite_prop
	add	sp, #2
	pop	bc
;main.c:125: for(j = 0; j < 4; j++)
	inc	c
	ld	a,c
	sub	a, #0x04
	jr	C,00105$
	add	sp, #2
	ret
;main.c:131: UBYTE playerToBGCollision(UINT8 playerLocX, UINT8 playerLocY)
;	---------------------------------
; Function playerToBGCollision
; ---------------------------------
_playerToBGCollision::
	add	sp, #-6
;main.c:136: indexTlX = (playerLocX - 8) / 8;
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
	jr	Z,00110$
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
00110$:
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
;main.c:137: indexTlY = (playerLocY - 16) / 8;
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
	jr	Z,00111$
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
00111$:
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
;main.c:138: tileIndex = 20 * indexTlY + indexTlX;
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
;main.c:140: if(level01Map[tileIndex] == blankMap[0] || level01Map[tileIndex] == blankMap[1] || level01Map[tileIndex] == blankMap[2] || level01Map[tileIndex] == blankMap[3] || level01Map[tileIndex] == blankMap[4]) 
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
	jr	Z,00101$
	ld	de, #(_blankMap + 0x0001) + 0
	ld	a,(de)
	ld	b,a
	ld	a,c
	sub	a, b
	jr	Z,00101$
	ld	de, #(_blankMap + 0x0002) + 0
	ld	a,(de)
	ld	b,a
	ld	a,c
	sub	a, b
	jr	Z,00101$
	ld	de, #(_blankMap + 0x0003) + 0
	ld	a,(de)
	ld	b,a
	ld	a,c
	sub	a, b
	jr	Z,00101$
	ld	de, #(_blankMap + 0x0004) + 0
	ld	a,(de)
	ld	b,a
	ld	a,c
	sub	a, b
	jr	NZ,00102$
00101$:
;main.c:142: result = 1;
	ld	e,#0x01
	jr	00103$
00102$:
;main.c:146: result = 0;
	ld	e,#0x00
00103$:
;main.c:148: return result;
	add	sp, #6
	ret
;main.c:153: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:155: set_bkg_data(0, 11, level01Tile);
	ld	hl,#_level01Tile
	push	hl
	ld	hl,#0x0b00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:156: set_bkg_tiles(0, 0, 20, 18, level01Map);
	ld	hl,#_level01Map
	push	hl
	ld	hl,#0x1214
	push	hl
	ld	hl,#0x0000
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;main.c:157: setupPlayer();
	call	_setupPlayer
;main.c:159: OBP0_REG = 0xE1;
	ld	hl,#0xff48
	ld	(hl),#0xe1
;main.c:160: OBP1_REG = 0xE0;
	ld	l, #0x49
	ld	(hl),#0xe0
;main.c:163: timerLocal = 0;
	ld	hl,#_timerLocal
	ld	(hl),#0x00
;main.c:164: timerKeyR = 0;
	ld	hl,#_timerKeyR
	ld	(hl),#0x00
;main.c:165: timerKeyL = 0;
	ld	hl,#_timerKeyL
	ld	(hl),#0x00
;main.c:167: SHOW_BKG;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	0, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;main.c:168: SHOW_SPRITES;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	l, #0x40
	ld	(hl),c
;main.c:169: DISPLAY_ON;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	7, a
	ld	c,a
	ld	l, #0x40
	ld	(hl),c
;main.c:171: movePlayerR(&player, player.x, player.y);
	ld	de, #(_player + 0x0005) + 0
	ld	a,(de)
	ld	b,a
	ld	de, #(_player + 0x0004) + 0
	ld	a,(de)
	ld	c,a
	push	bc
	inc	sp
	ld	a,c
	push	af
	inc	sp
	ld	hl,#_player
	push	hl
	call	_movePlayerR
	add	sp, #4
;main.c:174: while(1)
00130$:
;main.c:176: playerAnimation(1, 10, 20, 0, 4, 8);
	ld	hl,#0x0804
	push	hl
	ld	hl,#0x0014
	push	hl
	ld	hl,#0x0a01
	push	hl
	call	_playerAnimation
	add	sp, #6
;main.c:177: UPDATE_KEYS();
	push	hl
	ld	hl,#_keys
	ld	a,(hl)
	ld	hl,#_previousKeys
	ld	(hl),a
	pop	hl
	call	_joypad
	ld	hl,#_keys
	ld	(hl),e
;main.c:179: if(KEY_PRESSED(J_RIGHT))
	ld	c,(hl)
	ld	b,#0x00
	ld	a,c
	and	a, #0x01
	ld	c,a
	ld	b,#0x00
	ld	a,b
	or	a,c
	jp	Z,00113$
;main.c:181: timerLocal = 0;
	ld	hl,#_timerLocal
	ld	(hl),#0x00
;main.c:182: if(playerToBGCollision(player.x + 17, player.y))
	ld	de, #(_player + 0x0005) + 0
	ld	a,(de)
	ld	b,a
	ld	a, (#(_player + 0x0004) + 0)
	add	a, #0x11
	ld	d,a
	push	bc
	inc	sp
	push	de
	inc	sp
	call	_playerToBGCollision
	add	sp, #2
	ld	a,e
	or	a, a
	jp	Z,00114$
;main.c:184: timerKeyR++;
	ld	hl,#_timerKeyR
	inc	(hl)
;main.c:186: if(timerKeyR == 1)
	ld	a,(hl)
	dec	a
	jp	NZ,00105$
;main.c:188: for(index = 0; index < 8; index++)
	ld	hl,#_index
	ld	(hl),#0x00
00132$:
;main.c:190: player.x++;
	ld	a, (#(_player + 0x0004) + 0)
	ld	c,a
	inc	c
	ld	hl,#(_player + 0x0004)
	ld	(hl),c
;main.c:191: movePlayerR(&player, player.x, player.y);
	ld	de, #(_player + 0x0005) + 0
	ld	a,(de)
	ld	b,a
	push	bc
	inc	sp
	ld	a,c
	push	af
	inc	sp
	ld	hl,#_player
	push	hl
	call	_movePlayerR
	add	sp, #4
;main.c:192: playerAnimation(1, 5, 10, 0, 8, 8);
	ld	hl,#0x0808
	push	hl
	ld	hl,#0x000a
	push	hl
	ld	hl,#0x0501
	push	hl
	call	_playerAnimation
	add	sp, #6
;main.c:193: performantDelay(1);
	ld	a,#0x01
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
;main.c:188: for(index = 0; index < 8; index++)
	ld	hl,#_index
	inc	(hl)
	ld	a,(hl)
	sub	a, #0x08
	jp	C,00132$
	jr	00114$
00105$:
;main.c:196: else if(timerKeyR == 2)
	ld	hl,#_timerKeyR
	ld	a,(hl)
	sub	a, #0x02
	jr	NZ,00114$
;main.c:198: timerKeyR = 0;
	ld	hl,#_timerKeyR
	ld	(hl),#0x00
	jr	00114$
00113$:
;main.c:202: else if(KEY_RELEASED(J_RIGHT))
	ld	hl,#_previousKeys
	ld	e,(hl)
	ld	d,#0x00
	bit	0, e
	jr	Z,00114$
	ld	a,b
	or	a,c
	jr	NZ,00114$
;main.c:204: timerLocal = 0;
	ld	hl,#_timerLocal
	ld	(hl),#0x00
;main.c:205: timerKeyR = 0;
	ld	hl,#_timerKeyR
	ld	(hl),#0x00
00114$:
;main.c:209: if(KEY_PRESSED(J_LEFT))
	ld	hl,#_keys
	ld	c,(hl)
	ld	b,#0x00
	ld	a,c
	and	a, #0x02
	ld	c,a
	ld	b,#0x00
	ld	a,b
	or	a,c
	jp	Z,00127$
;main.c:211: if(playerToBGCollision(player.x - 1, player.y))
	ld	de, #(_player + 0x0005) + 0
	ld	a,(de)
	ld	b,a
	ld	a, (#(_player + 0x0004) + 0)
	add	a,#0xff
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_playerToBGCollision
	add	sp, #2
	ld	a,e
	or	a, a
	jp	Z,00128$
;main.c:213: timerKeyL++;
	ld	hl,#_timerKeyL
	inc	(hl)
;main.c:215: if(timerKeyL == 1)
	ld	a,(hl)
	dec	a
	jp	NZ,00119$
;main.c:217: for(index = 0; index < 8; index++)
	ld	hl,#_index
	ld	(hl),#0x00
00134$:
;main.c:219: player.x--;
	ld	a, (#(_player + 0x0004) + 0)
	ld	c,a
	dec	c
	ld	hl,#(_player + 0x0004)
	ld	(hl),c
;main.c:220: movePlayerL(&player, player.x, player.y);
	ld	de, #(_player + 0x0005) + 0
	ld	a,(de)
	ld	b,a
	push	bc
	inc	sp
	ld	a,c
	push	af
	inc	sp
	ld	hl,#_player
	push	hl
	call	_movePlayerL
	add	sp, #4
;main.c:221: playerAnimation(1, 5, 10, 0, 8, 8);
	ld	hl,#0x0808
	push	hl
	ld	hl,#0x000a
	push	hl
	ld	hl,#0x0501
	push	hl
	call	_playerAnimation
	add	sp, #6
;main.c:222: performantDelay(1);
	ld	a,#0x01
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
;main.c:217: for(index = 0; index < 8; index++)
	ld	hl,#_index
	inc	(hl)
	ld	a,(hl)
	sub	a, #0x08
	jp	C,00134$
	jr	00128$
00119$:
;main.c:225: else if(timerKeyL == 2) 
	ld	hl,#_timerKeyL
	ld	a,(hl)
	sub	a, #0x02
	jr	NZ,00128$
;main.c:227: timerKeyL = 0;
	ld	hl,#_timerKeyL
	ld	(hl),#0x00
	jr	00128$
00127$:
;main.c:231: else if(KEY_RELEASED(J_LEFT))
	ld	hl,#_previousKeys
	ld	e,(hl)
	ld	d,#0x00
	bit	1, e
	jr	Z,00128$
	ld	a,b
	or	a,c
	jr	NZ,00128$
;main.c:233: timerLocal = 0;
	ld	hl,#_timerLocal
	ld	(hl),#0x00
;main.c:234: timerKeyL = 0;
	ld	hl,#_timerKeyL
	ld	(hl),#0x00
00128$:
;main.c:241: wait_vbl_done();
	call	_wait_vbl_done
	jp	00130$
	ret
	.area _CODE
	.area _CABS (ABS)
