;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 19 2016) (Linux)
; This file was generated Fri Nov 29 17:14:30 2019
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _performantDelay
	.globl _scroll_bkg
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _level01Map
	.globl _level01Tiles
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_level01Tiles::
	.ds 208
_level01Map::
	.ds 720
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
;level01Tiles.c:26: unsigned char level01Tiles[] =
	ld	hl,#_level01Tiles
	ld	(hl),#0x00
	ld	bc,#_level01Tiles + 1
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 2
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 3
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 4
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 5
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 6
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 7
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 8
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 9
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 10
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 11
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 12
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 13
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 14
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 15
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 16
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x0011)
	ld	(hl),#0xFF
	ld	hl,#(_level01Tiles + 0x0012)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 19
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x0014)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 21
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x0016)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 23
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x0018)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 25
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x001a)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 27
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x001c)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 29
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x001e)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 31
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 32
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x0021)
	ld	(hl),#0x0F
	ld	hl,#(_level01Tiles + 0x0022)
	ld	(hl),#0x0F
	ld	hl,#(_level01Tiles + 0x0023)
	ld	(hl),#0x30
	ld	hl,#(_level01Tiles + 0x0024)
	ld	(hl),#0x3F
	ld	hl,#(_level01Tiles + 0x0025)
	ld	(hl),#0x40
	ld	hl,#(_level01Tiles + 0x0026)
	ld	(hl),#0x3F
	ld	hl,#(_level01Tiles + 0x0027)
	ld	(hl),#0x40
	ld	hl,#(_level01Tiles + 0x0028)
	ld	(hl),#0x7F
	ld	hl,#(_level01Tiles + 0x0029)
	ld	(hl),#0x80
	ld	hl,#(_level01Tiles + 0x002a)
	ld	(hl),#0x7F
	ld	hl,#(_level01Tiles + 0x002b)
	ld	(hl),#0x80
	ld	hl,#(_level01Tiles + 0x002c)
	ld	(hl),#0x7F
	ld	hl,#(_level01Tiles + 0x002d)
	ld	(hl),#0x80
	ld	hl,#(_level01Tiles + 0x002e)
	ld	(hl),#0x7F
	ld	hl,#(_level01Tiles + 0x002f)
	ld	(hl),#0x80
	ld	bc,#_level01Tiles + 48
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x0031)
	ld	(hl),#0xF0
	ld	hl,#(_level01Tiles + 0x0032)
	ld	(hl),#0xF0
	ld	hl,#(_level01Tiles + 0x0033)
	ld	(hl),#0x0C
	ld	hl,#(_level01Tiles + 0x0034)
	ld	(hl),#0xFC
	ld	hl,#(_level01Tiles + 0x0035)
	ld	(hl),#0x02
	ld	hl,#(_level01Tiles + 0x0036)
	ld	(hl),#0xFC
	ld	hl,#(_level01Tiles + 0x0037)
	ld	(hl),#0x02
	ld	hl,#(_level01Tiles + 0x0038)
	ld	(hl),#0xFE
	ld	hl,#(_level01Tiles + 0x0039)
	ld	(hl),#0x01
	ld	hl,#(_level01Tiles + 0x003a)
	ld	(hl),#0xFE
	ld	hl,#(_level01Tiles + 0x003b)
	ld	(hl),#0x01
	ld	hl,#(_level01Tiles + 0x003c)
	ld	(hl),#0xFE
	ld	hl,#(_level01Tiles + 0x003d)
	ld	(hl),#0x01
	ld	hl,#(_level01Tiles + 0x003e)
	ld	(hl),#0xFE
	ld	hl,#(_level01Tiles + 0x003f)
	ld	(hl),#0x01
	ld	hl,#(_level01Tiles + 0x0040)
	ld	(hl),#0x7F
	ld	hl,#(_level01Tiles + 0x0041)
	ld	(hl),#0x80
	ld	hl,#(_level01Tiles + 0x0042)
	ld	(hl),#0x7F
	ld	hl,#(_level01Tiles + 0x0043)
	ld	(hl),#0x80
	ld	hl,#(_level01Tiles + 0x0044)
	ld	(hl),#0x7F
	ld	hl,#(_level01Tiles + 0x0045)
	ld	(hl),#0x80
	ld	hl,#(_level01Tiles + 0x0046)
	ld	(hl),#0x7F
	ld	hl,#(_level01Tiles + 0x0047)
	ld	(hl),#0x80
	ld	hl,#(_level01Tiles + 0x0048)
	ld	(hl),#0x7F
	ld	hl,#(_level01Tiles + 0x0049)
	ld	(hl),#0x80
	ld	hl,#(_level01Tiles + 0x004a)
	ld	(hl),#0x7F
	ld	hl,#(_level01Tiles + 0x004b)
	ld	(hl),#0x80
	ld	hl,#(_level01Tiles + 0x004c)
	ld	(hl),#0x7F
	ld	hl,#(_level01Tiles + 0x004d)
	ld	(hl),#0x80
	ld	hl,#(_level01Tiles + 0x004e)
	ld	(hl),#0x7F
	ld	hl,#(_level01Tiles + 0x004f)
	ld	(hl),#0x80
	ld	hl,#(_level01Tiles + 0x0050)
	ld	(hl),#0x7F
	ld	hl,#(_level01Tiles + 0x0051)
	ld	(hl),#0x80
	ld	hl,#(_level01Tiles + 0x0052)
	ld	(hl),#0x7F
	ld	hl,#(_level01Tiles + 0x0053)
	ld	(hl),#0x80
	ld	hl,#(_level01Tiles + 0x0054)
	ld	(hl),#0x7F
	ld	hl,#(_level01Tiles + 0x0055)
	ld	(hl),#0x80
	ld	hl,#(_level01Tiles + 0x0056)
	ld	(hl),#0x7F
	ld	hl,#(_level01Tiles + 0x0057)
	ld	(hl),#0x80
	ld	hl,#(_level01Tiles + 0x0058)
	ld	(hl),#0x7F
	ld	hl,#(_level01Tiles + 0x0059)
	ld	(hl),#0x80
	ld	hl,#(_level01Tiles + 0x005a)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 91
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x005c)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 93
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x005e)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 95
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 96
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 97
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 98
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 99
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 100
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 101
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 102
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 103
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 104
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 105
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 106
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x006b)
	ld	(hl),#0x01
	ld	bc,#_level01Tiles + 108
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x006d)
	ld	(hl),#0x01
	ld	hl,#(_level01Tiles + 0x006e)
	ld	(hl),#0x01
	ld	hl,#(_level01Tiles + 0x006f)
	ld	(hl),#0x06
	ld	hl,#(_level01Tiles + 0x0070)
	ld	(hl),#0x07
	ld	hl,#(_level01Tiles + 0x0071)
	ld	(hl),#0xF8
	ld	hl,#(_level01Tiles + 0x0072)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 115
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x0074)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 117
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x0076)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 119
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x0078)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 121
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x007a)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 123
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x007c)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 125
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x007e)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 127
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x0080)
	ld	(hl),#0xFE
	ld	hl,#(_level01Tiles + 0x0081)
	ld	(hl),#0x01
	ld	hl,#(_level01Tiles + 0x0082)
	ld	(hl),#0xFE
	ld	hl,#(_level01Tiles + 0x0083)
	ld	(hl),#0x01
	ld	hl,#(_level01Tiles + 0x0084)
	ld	(hl),#0xFE
	ld	hl,#(_level01Tiles + 0x0085)
	ld	(hl),#0x01
	ld	hl,#(_level01Tiles + 0x0086)
	ld	(hl),#0xFE
	ld	hl,#(_level01Tiles + 0x0087)
	ld	(hl),#0x01
	ld	hl,#(_level01Tiles + 0x0088)
	ld	(hl),#0xFE
	ld	hl,#(_level01Tiles + 0x0089)
	ld	(hl),#0x01
	ld	hl,#(_level01Tiles + 0x008a)
	ld	(hl),#0xFE
	ld	hl,#(_level01Tiles + 0x008b)
	ld	(hl),#0x01
	ld	hl,#(_level01Tiles + 0x008c)
	ld	(hl),#0xFE
	ld	hl,#(_level01Tiles + 0x008d)
	ld	(hl),#0x01
	ld	hl,#(_level01Tiles + 0x008e)
	ld	(hl),#0xFE
	ld	hl,#(_level01Tiles + 0x008f)
	ld	(hl),#0x01
	ld	hl,#(_level01Tiles + 0x0090)
	ld	(hl),#0xFE
	ld	hl,#(_level01Tiles + 0x0091)
	ld	(hl),#0x01
	ld	hl,#(_level01Tiles + 0x0092)
	ld	(hl),#0xFE
	ld	hl,#(_level01Tiles + 0x0093)
	ld	(hl),#0x01
	ld	hl,#(_level01Tiles + 0x0094)
	ld	(hl),#0xFE
	ld	hl,#(_level01Tiles + 0x0095)
	ld	(hl),#0x01
	ld	hl,#(_level01Tiles + 0x0096)
	ld	(hl),#0xFE
	ld	hl,#(_level01Tiles + 0x0097)
	ld	(hl),#0x01
	ld	hl,#(_level01Tiles + 0x0098)
	ld	(hl),#0xFE
	ld	hl,#(_level01Tiles + 0x0099)
	ld	(hl),#0x01
	ld	hl,#(_level01Tiles + 0x009a)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 155
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x009c)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 157
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x009e)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 159
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 160
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 161
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 162
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 163
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 164
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 165
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 166
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 167
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 168
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 169
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Tiles + 170
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x00ab)
	ld	(hl),#0x80
	ld	bc,#_level01Tiles + 172
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x00ad)
	ld	(hl),#0x80
	ld	hl,#(_level01Tiles + 0x00ae)
	ld	(hl),#0x80
	ld	hl,#(_level01Tiles + 0x00af)
	ld	(hl),#0x60
	ld	hl,#(_level01Tiles + 0x00b0)
	ld	(hl),#0xE0
	ld	hl,#(_level01Tiles + 0x00b1)
	ld	(hl),#0x1F
	ld	hl,#(_level01Tiles + 0x00b2)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 179
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x00b4)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 181
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x00b6)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 183
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x00b8)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 185
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x00ba)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 187
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x00bc)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 189
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x00be)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 191
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x00c0)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 193
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x00c2)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 195
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x00c4)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 197
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x00c6)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 199
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x00c8)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 201
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x00ca)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 203
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x00cc)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 205
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Tiles + 0x00ce)
	ld	(hl),#0xFF
	ld	bc,#_level01Tiles + 207
	xor	a, a
	ld	(bc),a
;level01Map.c:25: unsigned char level01Map[] =
	ld	hl,#_level01Map
	ld	(hl),#0x00
	ld	bc,#_level01Map + 1
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 2
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 3
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 4
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 5
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 6
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 7
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 8
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 9
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 10
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 11
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 12
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 13
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 14
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 15
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 16
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 17
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 18
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 19
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 20
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 21
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 22
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 23
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 24
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 25
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 26
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 27
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 28
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 29
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 30
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 31
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 32
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 33
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 34
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 35
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 36
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 37
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 38
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 39
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 40
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 41
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 42
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 43
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 44
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 45
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 46
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 47
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 48
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 49
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 50
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 51
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 52
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 53
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 54
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 55
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 56
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 57
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 58
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 59
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 60
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 61
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 62
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 63
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 64
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 65
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 66
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 67
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 68
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 69
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 70
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 71
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 72
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 73
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 74
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 75
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 76
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 77
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 78
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 79
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 80
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 81
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 82
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 83
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 84
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 85
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 86
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 87
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 88
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 89
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 90
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 91
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 92
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 93
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 94
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 95
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 96
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 97
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 98
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 99
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 100
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 101
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 102
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 103
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 104
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 105
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 106
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 107
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 108
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 109
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 110
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 111
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 112
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 113
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 114
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 115
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 116
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 117
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 118
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 119
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 120
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 121
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 122
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 123
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 124
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 125
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 126
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 127
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 128
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 129
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 130
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 131
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 132
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 133
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 134
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 135
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 136
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 137
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 138
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 139
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 140
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 141
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 142
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 143
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 144
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 145
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 146
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 147
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 148
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 149
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 150
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 151
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 152
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 153
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 154
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 155
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 156
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 157
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 158
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 159
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 160
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 161
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 162
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 163
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 164
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 165
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 166
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 167
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 168
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 169
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 170
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 171
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 172
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 173
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 174
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 175
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 176
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 177
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 178
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 179
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 180
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 181
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 182
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 183
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 184
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 185
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 186
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 187
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 188
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 189
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 190
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 191
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 192
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 193
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 194
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 195
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 196
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 197
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 198
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 199
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 200
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 201
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 202
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 203
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 204
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 205
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 206
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 207
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 208
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 209
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 210
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 211
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 212
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 213
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 214
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 215
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 216
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 217
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 218
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 219
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 220
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 221
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 222
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 223
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 224
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 225
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 226
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 227
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 228
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 229
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 230
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 231
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 232
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 233
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 234
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 235
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 236
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 237
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 238
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 239
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 240
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 241
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 242
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 243
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 244
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 245
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 246
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 247
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 248
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 249
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 250
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 251
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 252
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 253
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 254
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 255
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 256
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 257
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 258
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 259
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 260
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 261
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 262
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 263
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 264
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 265
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 266
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 267
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 268
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 269
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 270
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 271
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 272
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 273
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 274
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 275
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 276
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 277
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 278
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 279
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 280
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 281
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 282
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 283
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 284
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 285
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 286
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 287
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 288
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 289
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 290
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 291
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Map + 0x0124)
	ld	(hl),#0x02
	ld	hl,#(_level01Map + 0x0125)
	ld	(hl),#0x03
	ld	bc,#_level01Map + 294
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 295
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 296
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 297
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 298
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 299
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 300
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 301
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 302
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 303
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 304
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 305
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 306
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 307
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 308
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 309
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 310
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 311
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 312
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 313
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 314
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 315
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 316
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 317
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 318
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 319
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 320
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 321
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 322
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 323
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 324
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 325
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 326
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Map + 0x0147)
	ld	(hl),#0x02
	ld	hl,#(_level01Map + 0x0148)
	ld	(hl),#0x03
	ld	bc,#_level01Map + 329
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 330
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 331
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Map + 0x014c)
	ld	(hl),#0x04
	ld	hl,#(_level01Map + 0x014d)
	ld	(hl),#0x08
	ld	bc,#_level01Map + 334
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 335
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 336
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 337
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 338
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 339
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 340
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 341
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 342
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 343
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 344
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 345
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 346
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 347
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Map + 0x015c)
	ld	(hl),#0x02
	ld	hl,#(_level01Map + 0x015d)
	ld	(hl),#0x03
	ld	bc,#_level01Map + 350
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 351
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 352
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 353
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 354
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 355
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 356
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 357
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 358
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 359
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 360
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 361
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 362
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 363
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 364
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 365
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 366
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Map + 0x016f)
	ld	(hl),#0x04
	ld	hl,#(_level01Map + 0x0170)
	ld	(hl),#0x08
	ld	bc,#_level01Map + 369
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 370
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 371
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Map + 0x0174)
	ld	(hl),#0x04
	ld	hl,#(_level01Map + 0x0175)
	ld	(hl),#0x08
	ld	bc,#_level01Map + 374
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 375
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 376
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 377
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 378
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 379
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 380
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 381
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 382
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 383
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 384
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 385
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 386
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 387
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Map + 0x0184)
	ld	(hl),#0x04
	ld	hl,#(_level01Map + 0x0185)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0186)
	ld	(hl),#0x03
	ld	bc,#_level01Map + 391
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 392
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 393
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 394
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 395
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 396
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 397
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 398
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 399
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 400
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 401
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 402
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 403
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 404
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 405
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 406
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Map + 0x0197)
	ld	(hl),#0x04
	ld	hl,#(_level01Map + 0x0198)
	ld	(hl),#0x08
	ld	bc,#_level01Map + 409
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 410
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 411
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Map + 0x019c)
	ld	(hl),#0x04
	ld	hl,#(_level01Map + 0x019d)
	ld	(hl),#0x08
	ld	bc,#_level01Map + 414
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 415
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Map + 0x01a0)
	ld	(hl),#0x02
	ld	hl,#(_level01Map + 0x01a1)
	ld	(hl),#0x01
	ld	hl,#(_level01Map + 0x01a2)
	ld	(hl),#0x03
	ld	bc,#_level01Map + 419
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 420
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Map + 0x01a5)
	ld	(hl),#0x02
	ld	hl,#(_level01Map + 0x01a6)
	ld	(hl),#0x03
	ld	bc,#_level01Map + 423
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 424
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 425
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 426
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 427
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Map + 0x01ac)
	ld	(hl),#0x04
	ld	hl,#(_level01Map + 0x01ad)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x01ae)
	ld	(hl),#0x08
	ld	bc,#_level01Map + 431
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 432
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 433
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 434
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 435
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 436
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 437
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 438
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 439
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 440
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 441
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 442
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 443
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 444
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 445
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 446
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Map + 0x01bf)
	ld	(hl),#0x04
	ld	hl,#(_level01Map + 0x01c0)
	ld	(hl),#0x08
	ld	bc,#_level01Map + 449
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 450
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 451
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Map + 0x01c4)
	ld	(hl),#0x04
	ld	hl,#(_level01Map + 0x01c5)
	ld	(hl),#0x08
	ld	bc,#_level01Map + 454
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 455
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Map + 0x01c8)
	ld	(hl),#0x04
	ld	hl,#(_level01Map + 0x01c9)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x01ca)
	ld	(hl),#0x08
	ld	bc,#_level01Map + 459
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 460
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Map + 0x01cd)
	ld	(hl),#0x04
	ld	hl,#(_level01Map + 0x01ce)
	ld	(hl),#0x08
	ld	bc,#_level01Map + 463
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 464
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 465
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 466
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 467
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Map + 0x01d4)
	ld	(hl),#0x04
	ld	hl,#(_level01Map + 0x01d5)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x01d6)
	ld	(hl),#0x08
	ld	bc,#_level01Map + 471
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 472
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 473
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 474
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 475
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 476
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 477
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 478
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 479
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 480
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 481
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 482
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 483
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 484
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 485
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 486
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Map + 0x01e7)
	ld	(hl),#0x04
	ld	hl,#(_level01Map + 0x01e8)
	ld	(hl),#0x09
	ld	hl,#(_level01Map + 0x01e9)
	ld	(hl),#0x0A
	ld	bc,#_level01Map + 490
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Map + 0x01eb)
	ld	(hl),#0x06
	ld	hl,#(_level01Map + 0x01ec)
	ld	(hl),#0x05
	ld	hl,#(_level01Map + 0x01ed)
	ld	(hl),#0x09
	ld	hl,#(_level01Map + 0x01ee)
	ld	(hl),#0x0A
	ld	hl,#(_level01Map + 0x01ef)
	ld	(hl),#0x06
	ld	hl,#(_level01Map + 0x01f0)
	ld	(hl),#0x05
	ld	hl,#(_level01Map + 0x01f1)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x01f2)
	ld	(hl),#0x09
	ld	hl,#(_level01Map + 0x01f3)
	ld	(hl),#0x0A
	ld	hl,#(_level01Map + 0x01f4)
	ld	(hl),#0x06
	ld	hl,#(_level01Map + 0x01f5)
	ld	(hl),#0x05
	ld	hl,#(_level01Map + 0x01f6)
	ld	(hl),#0x08
	ld	bc,#_level01Map + 503
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 504
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 505
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 506
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 507
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Map + 0x01fc)
	ld	(hl),#0x04
	ld	hl,#(_level01Map + 0x01fd)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x01fe)
	ld	(hl),#0x08
	ld	bc,#_level01Map + 511
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 512
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 513
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 514
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 515
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 516
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 517
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 518
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 519
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 520
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 521
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 522
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 523
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 524
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 525
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Map + 0x020e)
	ld	(hl),#0x06
	ld	hl,#(_level01Map + 0x020f)
	ld	(hl),#0x05
	ld	hl,#(_level01Map + 0x0210)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0211)
	ld	(hl),#0x0B
	ld	hl,#(_level01Map + 0x0212)
	ld	(hl),#0x01
	ld	hl,#(_level01Map + 0x0213)
	ld	(hl),#0x07
	ld	hl,#(_level01Map + 0x0214)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0215)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0216)
	ld	(hl),#0x0B
	ld	hl,#(_level01Map + 0x0217)
	ld	(hl),#0x07
	ld	hl,#(_level01Map + 0x0218)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0219)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x021a)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x021b)
	ld	(hl),#0x0B
	ld	hl,#(_level01Map + 0x021c)
	ld	(hl),#0x07
	ld	hl,#(_level01Map + 0x021d)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x021e)
	ld	(hl),#0x09
	ld	hl,#(_level01Map + 0x021f)
	ld	(hl),#0x0A
	ld	bc,#_level01Map + 544
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 545
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 546
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Map + 0x0223)
	ld	(hl),#0x06
	ld	hl,#(_level01Map + 0x0224)
	ld	(hl),#0x05
	ld	hl,#(_level01Map + 0x0225)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0226)
	ld	(hl),#0x09
	ld	hl,#(_level01Map + 0x0227)
	ld	(hl),#0x0A
	ld	bc,#_level01Map + 552
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 553
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 554
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 555
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 556
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 557
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 558
	xor	a, a
	ld	(bc),a
	ld	bc,#_level01Map + 559
	xor	a, a
	ld	(bc),a
	ld	hl,#(_level01Map + 0x0230)
	ld	(hl),#0x01
	ld	hl,#(_level01Map + 0x0231)
	ld	(hl),#0x01
	ld	hl,#(_level01Map + 0x0232)
	ld	(hl),#0x01
	ld	hl,#(_level01Map + 0x0233)
	ld	(hl),#0x01
	ld	hl,#(_level01Map + 0x0234)
	ld	(hl),#0x01
	ld	hl,#(_level01Map + 0x0235)
	ld	(hl),#0x01
	ld	hl,#(_level01Map + 0x0236)
	ld	(hl),#0x07
	ld	hl,#(_level01Map + 0x0237)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0238)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0239)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x023a)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x023b)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x023c)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x023d)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x023e)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x023f)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0240)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0241)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0242)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0243)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0244)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0245)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0246)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0247)
	ld	(hl),#0x0B
	ld	hl,#(_level01Map + 0x0248)
	ld	(hl),#0x01
	ld	hl,#(_level01Map + 0x0249)
	ld	(hl),#0x01
	ld	hl,#(_level01Map + 0x024a)
	ld	(hl),#0x01
	ld	hl,#(_level01Map + 0x024b)
	ld	(hl),#0x07
	ld	hl,#(_level01Map + 0x024c)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x024d)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x024e)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x024f)
	ld	(hl),#0x0B
	ld	hl,#(_level01Map + 0x0250)
	ld	(hl),#0x01
	ld	hl,#(_level01Map + 0x0251)
	ld	(hl),#0x01
	ld	hl,#(_level01Map + 0x0252)
	ld	(hl),#0x01
	ld	hl,#(_level01Map + 0x0253)
	ld	(hl),#0x01
	ld	hl,#(_level01Map + 0x0254)
	ld	(hl),#0x01
	ld	hl,#(_level01Map + 0x0255)
	ld	(hl),#0x01
	ld	hl,#(_level01Map + 0x0256)
	ld	(hl),#0x01
	ld	hl,#(_level01Map + 0x0257)
	ld	(hl),#0x01
	ld	hl,#(_level01Map + 0x0258)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0259)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x025a)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x025b)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x025c)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x025d)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x025e)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x025f)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0260)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0261)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0262)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0263)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0264)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0265)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0266)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0267)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0268)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0269)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x026a)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x026b)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x026c)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x026d)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x026e)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x026f)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0270)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0271)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0272)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0273)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0274)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0275)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0276)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0277)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0278)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0279)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x027a)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x027b)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x027c)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x027d)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x027e)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x027f)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0280)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0281)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0282)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0283)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0284)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0285)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0286)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0287)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0288)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0289)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x028a)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x028b)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x028c)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x028d)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x028e)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x028f)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0290)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0291)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0292)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0293)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0294)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0295)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0296)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0297)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0298)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x0299)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x029a)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x029b)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x029c)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x029d)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x029e)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x029f)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02a0)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02a1)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02a2)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02a3)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02a4)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02a5)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02a6)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02a7)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02a8)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02a9)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02aa)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02ab)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02ac)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02ad)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02ae)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02af)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02b0)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02b1)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02b2)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02b3)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02b4)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02b5)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02b6)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02b7)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02b8)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02b9)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02ba)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02bb)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02bc)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02bd)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02be)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02bf)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02c0)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02c1)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02c2)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02c3)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02c4)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02c5)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02c6)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02c7)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02c8)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02c9)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02ca)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02cb)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02cc)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02cd)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02ce)
	ld	(hl),#0x0C
	ld	hl,#(_level01Map + 0x02cf)
	ld	(hl),#0x0C
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:5: void performantDelay(UINT8 numloops){
;	---------------------------------
; Function performantDelay
; ---------------------------------
_performantDelay::
;main.c:8: for(i=0;i<numloops;i++){
	ld	b,#0x00
00103$:
	ld	a,b
	ldhl	sp,#2
	sub	a, (hl)
	ret	NC
;main.c:9: wait_vbl_done();
	push	bc
	call	_wait_vbl_done
	pop	bc
;main.c:8: for(i=0;i<numloops;i++){
	inc	b
	jr	00103$
	ret
;main.c:13: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:15: set_bkg_data(0, 13, level01Tiles);
	ld	de,#_level01Tiles+0
	push	de
	ld	hl,#0x0D00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;main.c:16: set_bkg_tiles(0, 0, 40, 18, level01Map);
	ld	de,#_level01Map+0
	push	de
	ld	hl,#0x1228
	push	hl
	ld	hl,#0x0000
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;main.c:18: SHOW_BKG;
	ld	de,#0xFF40
	ld	a,(de)
	ld	d,a
	ld	e,#0x00
	ld	a,d
	set	0, a
	ld	b,a
	ld	hl,#0xFF40
	ld	(hl),b
;main.c:19: DISPLAY_ON;
	ld	de,#0xFF40
	ld	a,(de)
	ld	d,a
	ld	e,#0x00
	ld	a,d
	set	7, a
	ld	b,a
	ld	l, #0x40
	ld	(hl),b
;main.c:21: while(1){
00102$:
;main.c:22: scroll_bkg(1, 0);
	ld	hl,#0x0001
	push	hl
	call	_scroll_bkg
	add	sp, #2
;main.c:23: performantDelay(2);
	ld	a,#0x02
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
	jr	00102$
	ret
	.area _CODE
	.area _CABS (ABS)
