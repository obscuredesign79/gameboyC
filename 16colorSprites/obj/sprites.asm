;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Linux)
;--------------------------------------------------------
	.module sprites
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _sprites
	.globl _spritesCGB
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_spritesCGB::
	.ds 3
_sprites::
	.ds 96
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
;sprites.c:26: unsigned char spritesCGB[] =
	ld	hl,#_spritesCGB
	ld	(hl),#0x00
	ld	hl,#(_spritesCGB + 0x0001)
	ld	(hl),#0x01
	ld	hl,#(_spritesCGB + 0x0002)
	ld	(hl),#0x02
;sprites.c:31: unsigned char sprites[] =
	ld	hl,#_sprites
	ld	(hl),#0x0c
	ld	hl,#(_sprites + 0x0001)
	ld	(hl),#0x0c
	ld	hl,#(_sprites + 0x0002)
	ld	(hl),#0x38
	ld	hl,#(_sprites + 0x0003)
	ld	(hl),#0x18
	ld	hl,#(_sprites + 0x0004)
	ld	(hl),#0x18
	ld	hl,#(_sprites + 0x0005)
	ld	(hl),#0x00
	ld	hl,#(_sprites + 0x0006)
	ld	(hl),#0x28
	ld	hl,#(_sprites + 0x0007)
	ld	(hl),#0x38
	ld	hl,#(_sprites + 0x0008)
	ld	(hl),#0x38
	ld	hl,#(_sprites + 0x0009)
	ld	(hl),#0x38
	ld	hl,#(_sprites + 0x000a)
	ld	(hl),#0x6c
	ld	hl,#(_sprites + 0x000b)
	ld	(hl),#0x7c
	ld	hl,#(_sprites + 0x000c)
	ld	(hl),#0x46
	ld	hl,#(_sprites + 0x000d)
	ld	(hl),#0x6e
	ld	hl,#(_sprites + 0x000e)
	ld	(hl),#0xc7
	ld	hl,#(_sprites + 0x000f)
	ld	(hl),#0xff
	ld	hl,#(_sprites + 0x0010)
	ld	(hl),#0xfe
	ld	hl,#(_sprites + 0x0011)
	ld	(hl),#0xfe
	ld	hl,#(_sprites + 0x0012)
	ld	(hl),#0xc6
	ld	hl,#(_sprites + 0x0013)
	ld	(hl),#0xfe
	ld	hl,#(_sprites + 0x0014)
	ld	(hl),#0xc6
	ld	hl,#(_sprites + 0x0015)
	ld	(hl),#0xfe
	ld	hl,#(_sprites + 0x0016)
	ld	(hl),#0xc6
	ld	hl,#(_sprites + 0x0017)
	ld	(hl),#0xfe
	ld	hl,#(_sprites + 0x0018)
	ld	(hl),#0xc7
	ld	hl,#(_sprites + 0x0019)
	ld	(hl),#0xff
	ld	hl,#(_sprites + 0x001a)
	ld	(hl),#0x7e
	ld	hl,#(_sprites + 0x001b)
	ld	(hl),#0xff
	ld	hl,#(_sprites + 0x001c)
	ld	(hl),#0x00
	ld	hl,#(_sprites + 0x001d)
	ld	(hl),#0x7e
	ld	hl,#(_sprites + 0x001e)
	ld	(hl),#0x00
	ld	hl,#(_sprites + 0x001f)
	ld	(hl),#0x00
	ld	hl,#(_sprites + 0x0020)
	ld	(hl),#0x07
	ld	hl,#(_sprites + 0x0021)
	ld	(hl),#0x00
	ld	hl,#(_sprites + 0x0022)
	ld	(hl),#0x1f
	ld	hl,#(_sprites + 0x0023)
	ld	(hl),#0x18
	ld	hl,#(_sprites + 0x0024)
	ld	(hl),#0x07
	ld	hl,#(_sprites + 0x0025)
	ld	(hl),#0x38
	ld	hl,#(_sprites + 0x0026)
	ld	(hl),#0xfe
	ld	hl,#(_sprites + 0x0027)
	ld	(hl),#0xfe
	ld	hl,#(_sprites + 0x0028)
	ld	(hl),#0x9a
	ld	hl,#(_sprites + 0x0029)
	ld	(hl),#0xe4
	ld	hl,#(_sprites + 0x002a)
	ld	(hl),#0xfe
	ld	hl,#(_sprites + 0x002b)
	ld	(hl),#0xe6
	ld	hl,#(_sprites + 0x002c)
	ld	(hl),#0x7e
	ld	hl,#(_sprites + 0x002d)
	ld	(hl),#0x7e
	ld	hl,#(_sprites + 0x002e)
	ld	(hl),#0x1c
	ld	hl,#(_sprites + 0x002f)
	ld	(hl),#0x10
	ld	hl,#(_sprites + 0x0030)
	ld	(hl),#0x0e
	ld	hl,#(_sprites + 0x0031)
	ld	(hl),#0x0e
	ld	hl,#(_sprites + 0x0032)
	ld	(hl),#0x1c
	ld	hl,#(_sprites + 0x0033)
	ld	(hl),#0x04
	ld	hl,#(_sprites + 0x0034)
	ld	(hl),#0x3e
	ld	hl,#(_sprites + 0x0035)
	ld	(hl),#0x00
	ld	hl,#(_sprites + 0x0036)
	ld	(hl),#0x3f
	ld	hl,#(_sprites + 0x0037)
	ld	(hl),#0x00
	ld	hl,#(_sprites + 0x0038)
	ld	(hl),#0x3f
	ld	hl,#(_sprites + 0x0039)
	ld	(hl),#0x00
	ld	hl,#(_sprites + 0x003a)
	ld	(hl),#0x3f
	ld	hl,#(_sprites + 0x003b)
	ld	(hl),#0x21
	ld	hl,#(_sprites + 0x003c)
	ld	(hl),#0x00
	ld	hl,#(_sprites + 0x003d)
	ld	(hl),#0x0c
	ld	hl,#(_sprites + 0x003e)
	ld	(hl),#0x00
	ld	hl,#(_sprites + 0x003f)
	ld	(hl),#0x1e
	ld	hl,#(_sprites + 0x0040)
	ld	(hl),#0x1c
	ld	hl,#(_sprites + 0x0041)
	ld	(hl),#0x1c
	ld	hl,#(_sprites + 0x0042)
	ld	(hl),#0x3e
	ld	hl,#(_sprites + 0x0043)
	ld	(hl),#0x1e
	ld	hl,#(_sprites + 0x0044)
	ld	(hl),#0x7f
	ld	hl,#(_sprites + 0x0045)
	ld	(hl),#0x00
	ld	hl,#(_sprites + 0x0046)
	ld	(hl),#0x66
	ld	hl,#(_sprites + 0x0047)
	ld	(hl),#0x18
	ld	hl,#(_sprites + 0x0048)
	ld	(hl),#0xc3
	ld	hl,#(_sprites + 0x0049)
	ld	(hl),#0x3c
	ld	hl,#(_sprites + 0x004a)
	ld	(hl),#0xc3
	ld	hl,#(_sprites + 0x004b)
	ld	(hl),#0x24
	ld	hl,#(_sprites + 0x004c)
	ld	(hl),#0xa5
	ld	hl,#(_sprites + 0x004d)
	ld	(hl),#0x18
	ld	hl,#(_sprites + 0x004e)
	ld	(hl),#0x7e
	ld	hl,#(_sprites + 0x004f)
	ld	(hl),#0x00
	ld	hl,#(_sprites + 0x0050)
	ld	(hl),#0xff
	ld	hl,#(_sprites + 0x0051)
	ld	(hl),#0x00
	ld	hl,#(_sprites + 0x0052)
	ld	(hl),#0xff
	ld	hl,#(_sprites + 0x0053)
	ld	(hl),#0x00
	ld	hl,#(_sprites + 0x0054)
	ld	(hl),#0x7e
	ld	hl,#(_sprites + 0x0055)
	ld	(hl),#0x81
	ld	hl,#(_sprites + 0x0056)
	ld	(hl),#0x42
	ld	hl,#(_sprites + 0x0057)
	ld	(hl),#0xbd
	ld	hl,#(_sprites + 0x0058)
	ld	(hl),#0xff
	ld	hl,#(_sprites + 0x0059)
	ld	(hl),#0xff
	ld	hl,#(_sprites + 0x005a)
	ld	(hl),#0x7e
	ld	hl,#(_sprites + 0x005b)
	ld	(hl),#0x7e
	ld	hl,#(_sprites + 0x005c)
	ld	(hl),#0x3c
	ld	hl,#(_sprites + 0x005d)
	ld	(hl),#0x3c
	ld	hl,#(_sprites + 0x005e)
	ld	(hl),#0x66
	ld	hl,#(_sprites + 0x005f)
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
	.area _CODE
	.area _CABS (ABS)
