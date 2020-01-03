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
	.globl _animateSprite
	.globl _canPlayerMove
	.globl _performantdelay
	.globl _scroll_sprite
	.globl _move_sprite
	.globl _set_sprite_tile
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _playerlocation
	.globl _Snail
	.globl _MazeMap
	.globl _MazeSprites
	.globl _blankmap
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_MazeSprites::
	.ds 64
_MazeMap::
	.ds 360
_Snail::
	.ds 16
_playerlocation::
	.ds 2
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
;MazeSprites.c:26: unsigned char MazeSprites[] =
	ld	hl,#_MazeSprites
	ld	(hl),#0x00
	ld	hl,#(_MazeSprites + 0x0001)
	ld	(hl),#0x00
	ld	hl,#(_MazeSprites + 0x0002)
	ld	(hl),#0x00
	ld	hl,#(_MazeSprites + 0x0003)
	ld	(hl),#0x00
	ld	hl,#(_MazeSprites + 0x0004)
	ld	(hl),#0x00
	ld	hl,#(_MazeSprites + 0x0005)
	ld	(hl),#0x00
	ld	hl,#(_MazeSprites + 0x0006)
	ld	(hl),#0x00
	ld	hl,#(_MazeSprites + 0x0007)
	ld	(hl),#0x00
	ld	hl,#(_MazeSprites + 0x0008)
	ld	(hl),#0x00
	ld	hl,#(_MazeSprites + 0x0009)
	ld	(hl),#0x00
	ld	hl,#(_MazeSprites + 0x000a)
	ld	(hl),#0x00
	ld	hl,#(_MazeSprites + 0x000b)
	ld	(hl),#0x00
	ld	hl,#(_MazeSprites + 0x000c)
	ld	(hl),#0x00
	ld	hl,#(_MazeSprites + 0x000d)
	ld	(hl),#0x00
	ld	hl,#(_MazeSprites + 0x000e)
	ld	(hl),#0x00
	ld	hl,#(_MazeSprites + 0x000f)
	ld	(hl),#0x00
	ld	hl,#(_MazeSprites + 0x0010)
	ld	(hl),#0x7e
	ld	hl,#(_MazeSprites + 0x0011)
	ld	(hl),#0x7e
	ld	hl,#(_MazeSprites + 0x0012)
	ld	(hl),#0xdf
	ld	hl,#(_MazeSprites + 0x0013)
	ld	(hl),#0xe3
	ld	hl,#(_MazeSprites + 0x0014)
	ld	(hl),#0xb7
	ld	hl,#(_MazeSprites + 0x0015)
	ld	(hl),#0xc9
	ld	hl,#(_MazeSprites + 0x0016)
	ld	(hl),#0xab
	ld	hl,#(_MazeSprites + 0x0017)
	ld	(hl),#0xd5
	ld	hl,#(_MazeSprites + 0x0018)
	ld	(hl),#0x97
	ld	hl,#(_MazeSprites + 0x0019)
	ld	(hl),#0xe9
	ld	hl,#(_MazeSprites + 0x001a)
	ld	(hl),#0xab
	ld	hl,#(_MazeSprites + 0x001b)
	ld	(hl),#0xd5
	ld	hl,#(_MazeSprites + 0x001c)
	ld	(hl),#0xc7
	ld	hl,#(_MazeSprites + 0x001d)
	ld	(hl),#0xfb
	ld	hl,#(_MazeSprites + 0x001e)
	ld	(hl),#0x7e
	ld	hl,#(_MazeSprites + 0x001f)
	ld	(hl),#0x7e
	ld	hl,#(_MazeSprites + 0x0020)
	ld	(hl),#0x18
	ld	hl,#(_MazeSprites + 0x0021)
	ld	(hl),#0x18
	ld	hl,#(_MazeSprites + 0x0022)
	ld	(hl),#0x76
	ld	hl,#(_MazeSprites + 0x0023)
	ld	(hl),#0x6e
	ld	hl,#(_MazeSprites + 0x0024)
	ld	(hl),#0xd7
	ld	hl,#(_MazeSprites + 0x0025)
	ld	(hl),#0xeb
	ld	hl,#(_MazeSprites + 0x0026)
	ld	(hl),#0xd5
	ld	hl,#(_MazeSprites + 0x0027)
	ld	(hl),#0xab
	ld	hl,#(_MazeSprites + 0x0028)
	ld	(hl),#0xd5
	ld	hl,#(_MazeSprites + 0x0029)
	ld	(hl),#0xab
	ld	hl,#(_MazeSprites + 0x002a)
	ld	(hl),#0xd5
	ld	hl,#(_MazeSprites + 0x002b)
	ld	(hl),#0xab
	ld	hl,#(_MazeSprites + 0x002c)
	ld	(hl),#0xd5
	ld	hl,#(_MazeSprites + 0x002d)
	ld	(hl),#0xab
	ld	hl,#(_MazeSprites + 0x002e)
	ld	(hl),#0xd5
	ld	hl,#(_MazeSprites + 0x002f)
	ld	(hl),#0xab
	ld	hl,#(_MazeSprites + 0x0030)
	ld	(hl),#0x00
	ld	hl,#(_MazeSprites + 0x0031)
	ld	(hl),#0x38
	ld	hl,#(_MazeSprites + 0x0032)
	ld	(hl),#0x28
	ld	hl,#(_MazeSprites + 0x0033)
	ld	(hl),#0x44
	ld	hl,#(_MazeSprites + 0x0034)
	ld	(hl),#0x28
	ld	hl,#(_MazeSprites + 0x0035)
	ld	(hl),#0x44
	ld	hl,#(_MazeSprites + 0x0036)
	ld	(hl),#0x00
	ld	hl,#(_MazeSprites + 0x0037)
	ld	(hl),#0x38
	ld	hl,#(_MazeSprites + 0x0038)
	ld	(hl),#0x00
	ld	hl,#(_MazeSprites + 0x0039)
	ld	(hl),#0x10
	ld	hl,#(_MazeSprites + 0x003a)
	ld	(hl),#0x00
	ld	hl,#(_MazeSprites + 0x003b)
	ld	(hl),#0x18
	ld	hl,#(_MazeSprites + 0x003c)
	ld	(hl),#0x00
	ld	hl,#(_MazeSprites + 0x003d)
	ld	(hl),#0x10
	ld	hl,#(_MazeSprites + 0x003e)
	ld	(hl),#0x00
	ld	hl,#(_MazeSprites + 0x003f)
	ld	(hl),#0x1c
;MazeMap.c:25: unsigned char MazeMap[] =
	ld	hl,#_MazeMap
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0001)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0002)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0003)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0004)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0005)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0006)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0007)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0008)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0009)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x000a)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x000b)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x000c)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x000d)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x000e)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x000f)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0010)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0011)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0012)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0013)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0014)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0015)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0016)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0017)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0018)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0019)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x001a)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x001b)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x001c)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x001d)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x001e)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x001f)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0020)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0021)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0022)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0023)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0024)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0025)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0026)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0027)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0028)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0029)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x002a)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x002b)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x002c)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x002d)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x002e)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x002f)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0030)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0031)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0032)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0033)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0034)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0035)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0036)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0037)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0038)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0039)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x003a)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x003b)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x003c)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x003d)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x003e)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x003f)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0040)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0041)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0042)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0043)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0044)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0045)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0046)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0047)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0048)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0049)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x004a)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x004b)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x004c)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x004d)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x004e)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x004f)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0050)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0051)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0052)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0053)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0054)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0055)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0056)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0057)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0058)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0059)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x005a)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x005b)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x005c)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x005d)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x005e)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x005f)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0060)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0061)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0062)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0063)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0064)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0065)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0066)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0067)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0068)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0069)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x006a)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x006b)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x006c)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x006d)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x006e)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x006f)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0070)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0071)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0072)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0073)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0074)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0075)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0076)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0077)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0078)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0079)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x007a)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x007b)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x007c)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x007d)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x007e)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x007f)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0080)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0081)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0082)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0083)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0084)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0085)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0086)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0087)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0088)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0089)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x008a)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x008b)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x008c)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x008d)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x008e)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x008f)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0090)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0091)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0092)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0093)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0094)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0095)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0096)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0097)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0098)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0099)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x009a)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x009b)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x009c)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x009d)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x009e)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x009f)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00a0)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00a1)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00a2)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00a3)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00a4)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00a5)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00a6)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00a7)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00a8)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00a9)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00aa)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00ab)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00ac)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00ad)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00ae)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00af)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00b0)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00b1)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00b2)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00b3)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00b4)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00b5)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00b6)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00b7)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00b8)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00b9)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00ba)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00bb)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00bc)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00bd)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00be)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00bf)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00c0)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00c1)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00c2)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00c3)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00c4)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00c5)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00c6)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00c7)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00c8)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00c9)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00ca)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00cb)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00cc)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00cd)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00ce)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00cf)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00d0)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00d1)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00d2)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00d3)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00d4)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00d5)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00d6)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00d7)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00d8)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00d9)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00da)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00db)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00dc)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00dd)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00de)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00df)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00e0)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00e1)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00e2)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00e3)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00e4)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00e5)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00e6)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00e7)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00e8)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00e9)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00ea)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00eb)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00ec)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00ed)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00ee)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00ef)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00f0)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00f1)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00f2)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00f3)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00f4)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00f5)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00f6)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00f7)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00f8)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00f9)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00fa)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00fb)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x00fc)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00fd)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00fe)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x00ff)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0100)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0101)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0102)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0103)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0104)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0105)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0106)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0107)
	ld	(hl),#0x02
	ld	hl,#(_MazeMap + 0x0108)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0109)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x010a)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x010b)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x010c)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x010d)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x010e)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x010f)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0110)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0111)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0112)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0113)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0114)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0115)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0116)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0117)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0118)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0119)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x011a)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x011b)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x011c)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x011d)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x011e)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x011f)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0120)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0121)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0122)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0123)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0124)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0125)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0126)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0127)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0128)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0129)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x012a)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x012b)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x012c)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x012d)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x012e)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x012f)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0130)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0131)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0132)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0133)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0134)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0135)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0136)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0137)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0138)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0139)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x013a)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x013b)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x013c)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x013d)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x013e)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x013f)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0140)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0141)
	ld	(hl),#0x03
	ld	hl,#(_MazeMap + 0x0142)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0143)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0144)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0145)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0146)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0147)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0148)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0149)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x014a)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x014b)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x014c)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x014d)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x014e)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x014f)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0150)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0151)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0152)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0153)
	ld	(hl),#0x00
	ld	hl,#(_MazeMap + 0x0154)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0155)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0156)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0157)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0158)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0159)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x015a)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x015b)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x015c)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x015d)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x015e)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x015f)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0160)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0161)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0162)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0163)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0164)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0165)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0166)
	ld	(hl),#0x01
	ld	hl,#(_MazeMap + 0x0167)
	ld	(hl),#0x01
;Snail.c:26: unsigned char Snail[] =
	ld	hl,#_Snail
	ld	(hl),#0x00
	ld	hl,#(_Snail + 0x0001)
	ld	(hl),#0x00
	ld	hl,#(_Snail + 0x0002)
	ld	(hl),#0x00
	ld	hl,#(_Snail + 0x0003)
	ld	(hl),#0x00
	ld	hl,#(_Snail + 0x0004)
	ld	(hl),#0x30
	ld	hl,#(_Snail + 0x0005)
	ld	(hl),#0x30
	ld	hl,#(_Snail + 0x0006)
	ld	(hl),#0x78
	ld	hl,#(_Snail + 0x0007)
	ld	(hl),#0x78
	ld	hl,#(_Snail + 0x0008)
	ld	(hl),#0x7a
	ld	hl,#(_Snail + 0x0009)
	ld	(hl),#0x78
	ld	hl,#(_Snail + 0x000a)
	ld	(hl),#0x7c
	ld	hl,#(_Snail + 0x000b)
	ld	(hl),#0x7a
	ld	hl,#(_Snail + 0x000c)
	ld	(hl),#0x3e
	ld	hl,#(_Snail + 0x000d)
	ld	(hl),#0x30
	ld	hl,#(_Snail + 0x000e)
	ld	(hl),#0x00
	ld	hl,#(_Snail + 0x000f)
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
;main.c:10: void performantdelay(UINT8 numloops){
;	---------------------------------
; Function performantdelay
; ---------------------------------
_performantdelay::
;main.c:12: for(i = 0; i < numloops; i++){
	ld	c,#0x00
00103$:
	ld	a,c
	ldhl	sp,#2
	sub	a, (hl)
	ret	NC
;main.c:13: wait_vbl_done();
	push	bc
	call	_wait_vbl_done
	pop	bc
;main.c:12: for(i = 0; i < numloops; i++){
	inc	c
	jr	00103$
	ret
_blankmap:
	.db #0x00	; 0
;main.c:17: UBYTE canPlayerMove(UINT8 newPlayerX, UINT8 newPlayerY){
;	---------------------------------
; Function canPlayerMove
; ---------------------------------
_canPlayerMove::
	add	sp, #-6
;main.c:22: indexTLx = (newPlayerX - 8) / 8;
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
;main.c:23: indexTLy = (newPlayerY - 16) / 8;
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
;main.c:24: tileIndexTL = 20 * indexTLy + indexTLx;
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
;main.c:26: result = MazeMap[tileIndexTL] == blankmap[0];
	ld	hl,#_MazeMap
	add	hl,bc
	ld	c,l
	ld	b,h
	ld	a,(bc)
	ld	c,a
	ld	de, #_blankmap + 0
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
;main.c:28: return result;
	add	sp, #6
	ret
;main.c:31: void animateSprite(UINT8 spriteIndex, INT8 moveX, INT8 moveY){
;	---------------------------------
; Function animateSprite
; ---------------------------------
_animateSprite::
;main.c:32: while(moveX!=0){
00101$:
	ldhl	sp,#3
	ld	a,(hl)
	or	a, a
	jp	Z,00104$
;main.c:33: scroll_sprite(spriteIndex, moveX < 0 ? -1 : 1, 0);
	ld	a,#0x00
	ld	e,a
	ld	a,(hl)
	ld	d,a
	ld	a,(hl)
	rlca
	and	a,#0x01
	ld	c,a
	or	a, a
	jr	Z,00109$
	ld	b,#0xff
	jr	00110$
00109$:
	ld	b,#0x01
00110$:
	push	bc
	xor	a, a
	push	af
	inc	sp
	push	bc
	inc	sp
	ldhl	sp,#6
	ld	a,(hl)
	push	af
	inc	sp
	call	_scroll_sprite
	add	sp, #3
	pop	bc
;main.c:34: moveX += (moveX < 0 ? 2 : -2);
	ld	a,c
	or	a, a
	jr	Z,00111$
	ld	c,#0x02
	jr	00112$
00111$:
	ld	c,#0xfe
00112$:
	ldhl	sp,#3
	ld	a,(hl)
	add	a, c
	ld	(hl),a
;main.c:35: wait_vbl_done();
	call	_wait_vbl_done
	jp	00101$
;main.c:37: while(moveY!=0){
00104$:
	ldhl	sp,#4
	ld	a,(hl)
	or	a, a
	ret	Z
;main.c:38: scroll_sprite(spriteIndex, 0, moveY < 0 ? -1 : 1);
	ld	a,#0x00
	ld	e,a
	ld	a,(hl)
	ld	d,a
	ld	a,(hl)
	rlca
	and	a,#0x01
	ld	c,a
	or	a, a
	jr	Z,00113$
	ld	b,#0xff
	jr	00114$
00113$:
	ld	b,#0x01
00114$:
	push	bc
	push	bc
	inc	sp
	xor	a, a
	push	af
	inc	sp
	ldhl	sp,#6
	ld	a,(hl)
	push	af
	inc	sp
	call	_scroll_sprite
	add	sp, #3
	pop	bc
;main.c:39: moveY += (moveY < 0 ? 1 : -1);
	ld	a,c
	or	a, a
	jr	Z,00115$
	ld	c,#0x01
	jr	00116$
00115$:
	ld	c,#0xff
00116$:
	ldhl	sp,#4
	ld	a,(hl)
	add	a, c
	ld	(hl),a
;main.c:40: wait_vbl_done();
	call	_wait_vbl_done
	jp	00104$
	ret
;main.c:46: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:48: set_bkg_data(0, 4, MazeSprites);
	ld	hl,#_MazeSprites
	push	hl
	ld	hl,#0x0400
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:49: set_bkg_tiles(0, 0, 20, 18, MazeMap);
	ld	hl,#_MazeMap
	push	hl
	ld	hl,#0x1214
	push	hl
	ld	hl,#0x0000
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;main.c:51: set_sprite_data(0, 1, Snail);   /* defines the sprite data */
	ld	hl,#_Snail
	push	hl
	ld	hl,#0x0100
	push	hl
	call	_set_sprite_data
	add	sp, #4
;main.c:52: set_sprite_tile(0,0);            /* defines the tiles numbers */
	ld	hl,#0x0000
	push	hl
	call	_set_sprite_tile
	add	sp, #2
;main.c:54: playerlocation[0] = 16;
	ld	hl,#_playerlocation
	ld	(hl),#0x10
;main.c:55: playerlocation[1] = 24;
	ld	hl,#(_playerlocation + 0x0001)
	ld	(hl),#0x18
;main.c:57: move_sprite(0,playerlocation[0],playerlocation[1]);
	ld	de, #(_playerlocation + 0x0001) + 0
	ld	a,(de)
	ld	b,a
	ld	a, (#_playerlocation + 0)
	push	bc
	inc	sp
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_move_sprite
	add	sp, #3
;main.c:60: SHOW_SPRITES;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	1, a
	ld	c,a
	ld	hl,#0xff40
	ld	(hl),c
;main.c:61: SHOW_BKG;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	0, a
	ld	c,a
	ld	l, #0x40
	ld	(hl),c
;main.c:62: DISPLAY_ON;
	ld	de,#0xff40
	ld	a,(de)
	ld	c,a
	ld	b,#0x00
	ld	a,c
	set	7, a
	ld	c,a
	ld	l, #0x40
	ld	(hl),c
;main.c:64: while(1){
00121$:
;main.c:65: if(joypad() & J_LEFT){
	call	_joypad
	ld	c,#0x00
	bit	1, e
	jr	Z,00118$
;main.c:66: if(canPlayerMove(playerlocation[0]-8, playerlocation[1])){
	ld	de, #(_playerlocation + 0x0001) + 0
	ld	a,(de)
	ld	b,a
	ld	a, (#_playerlocation + 0)
	add	a,#0xf8
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_canPlayerMove
	add	sp, #2
	ld	a,e
	or	a, a
	jp	Z,00119$
;main.c:67: playerlocation[0] -= 8;
	ld	a, (#_playerlocation + 0)
	add	a,#0xf8
	ld	de,#_playerlocation
	ld	(de),a
;main.c:68: animateSprite(0,-8,0);
	ld	hl,#0x00f8
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_animateSprite
	add	sp, #3
	jp	00119$
00118$:
;main.c:72: else if(joypad() & J_RIGHT){
	call	_joypad
	ld	c,#0x00
	bit	0, e
	jr	Z,00115$
;main.c:73: if(canPlayerMove(playerlocation[0]+8, playerlocation[1])){
	ld	de, #(_playerlocation + 0x0001) + 0
	ld	a,(de)
	ld	b,a
	ld	a, (#_playerlocation + 0)
	add	a, #0x08
	ld	d,a
	push	bc
	inc	sp
	push	de
	inc	sp
	call	_canPlayerMove
	add	sp, #2
	ld	a,e
	or	a, a
	jp	Z,00119$
;main.c:74: playerlocation[0] += 8;
	ld	a, (#_playerlocation + 0)
	add	a, #0x08
	ld	de,#_playerlocation
	ld	(de),a
;main.c:75: animateSprite(0,8,0);
	ld	hl,#0x0008
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_animateSprite
	add	sp, #3
	jp	00119$
00115$:
;main.c:78: else if(joypad() & J_UP){
	call	_joypad
	ld	c,#0x00
	bit	2, e
	jr	Z,00112$
;main.c:79: if(canPlayerMove(playerlocation[0], playerlocation[1]-8)){
	ld	a, (#(_playerlocation + 0x0001) + 0)
	add	a,#0xf8
	ld	b,a
	ld	a, (#_playerlocation + 0)
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_canPlayerMove
	add	sp, #2
	ld	a,e
	or	a, a
	jp	Z,00119$
;main.c:80: playerlocation[1] -= 8;
	ld	a, (#(_playerlocation + 0x0001) + 0)
	add	a,#0xf8
	ld	de,#(_playerlocation + 0x0001)
	ld	(de),a
;main.c:81: animateSprite(0,0,-8);
	ld	hl,#0xf800
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_animateSprite
	add	sp, #3
	jr	00119$
00112$:
;main.c:84: else if(joypad() & J_DOWN){
	call	_joypad
	ld	c,#0x00
	bit	3, e
	jr	Z,00119$
;main.c:85: if(canPlayerMove(playerlocation[0], playerlocation[1]+8)){
	ld	a, (#(_playerlocation + 0x0001) + 0)
	add	a, #0x08
	ld	b,a
	ld	a, (#_playerlocation + 0)
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_canPlayerMove
	add	sp, #2
	ld	a,e
	or	a, a
	jr	Z,00119$
;main.c:86: playerlocation[1] += 8;
	ld	a, (#(_playerlocation + 0x0001) + 0)
	add	a, #0x08
	ld	de,#(_playerlocation + 0x0001)
	ld	(de),a
;main.c:87: animateSprite(0,0,8);
	ld	hl,#0x0800
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_animateSprite
	add	sp, #3
00119$:
;main.c:91: performantdelay(6);
	ld	a,#0x06
	push	af
	inc	sp
	call	_performantdelay
	inc	sp
	jp	00121$
	ret
	.area _CODE
	.area _CABS (ABS)
