;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Mar 19 2016) (Linux)
; This file was generated Wed Nov 27 22:31:44 2019
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _performantDelay
	.globl _printf
	.globl _wait_vbl_done
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
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
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:4: void performantDelay(UINT8 numloops){
;	---------------------------------
; Function performantDelay
; ---------------------------------
_performantDelay::
;main.c:7: for(i=0;i<numloops;i++){
	ld	b,#0x00
00103$:
	ld	a,b
	ldhl	sp,#2
	sub	a, (hl)
	ret	NC
;main.c:8: wait_vbl_done();
	push	bc
	call	_wait_vbl_done
	pop	bc
;main.c:7: for(i=0;i<numloops;i++){
	inc	b
	jr	00103$
	ret
;main.c:13: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:20: printf("a=%x\n",a);
	ld	de,#___str_0
	ld	hl,#0x0001
	push	hl
	push	de
	call	_printf
	add	sp, #4
;main.c:21: printf("b=%x\n",b);
	ld	de,#___str_1
	ld	hl,#0x0002
	push	hl
	push	de
	call	_printf
	add	sp, #4
;main.c:23: printf("a + b = %x\n",c); 
	ld	de,#___str_2
	ld	hl,#0x0003
	push	hl
	push	de
	call	_printf
	add	sp, #4
;main.c:24: printf("Hello Gameboy World");
	ld	de,#___str_3
	push	de
	call	_printf
	add	sp, #2
;main.c:25: performantDelay(5);
	ld	a,#0x05
	push	af
	inc	sp
	call	_performantDelay
	inc	sp
	ret
___str_0:
	.ascii "a=%x"
	.db 0x0A
	.db 0x00
___str_1:
	.ascii "b=%x"
	.db 0x0A
	.db 0x00
___str_2:
	.ascii "a + b = %x"
	.db 0x0A
	.db 0x00
___str_3:
	.ascii "Hello Gameboy World"
	.db 0x00
	.area _CODE
	.area _CABS (ABS)
