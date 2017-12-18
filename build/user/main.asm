;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Mac OS X x86_64)
;--------------------------------------------------------
	.module main
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _TIM4_UPD_OVF_IRQHandler
	.globl _delay
	.globl _TEXT_Manage
	.globl _TEXT_GetStringToBuff
	.globl _TEXT_Init
	.globl _TIMER_Inc
	.globl _TIMER_Init
	.globl _Screen
	.globl _Init
	.globl _MaxMatrix
	.globl _TIM4_ClearITPendingBit
	.globl _IWDG_Enable
	.globl _IWDG_ReloadCounter
	.globl _IWDG_SetReload
	.globl _IWDG_SetPrescaler
	.globl _IWDG_WriteAccessCmd
	.globl _CLK_Config
	.globl _IWDG_Config
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ;reset
	int 0x0000 ;trap
	int 0x0000 ;int0
	int 0x0000 ;int1
	int 0x0000 ;int2
	int 0x0000 ;int3
	int 0x0000 ;int4
	int 0x0000 ;int5
	int 0x0000 ;int6
	int 0x0000 ;int7
	int 0x0000 ;int8
	int 0x0000 ;int9
	int 0x0000 ;int10
	int 0x0000 ;int11
	int 0x0000 ;int12
	int 0x0000 ;int13
	int 0x0000 ;int14
	int 0x0000 ;int15
	int 0x0000 ;int16
	int 0x0000 ;int17
	int 0x0000 ;int18
	int 0x0000 ;int19
	int 0x0000 ;int20
	int 0x0000 ;int21
	int 0x0000 ;int22
	int _TIM4_UPD_OVF_IRQHandler ;int23
	int 0x0000 ;int24
	int 0x0000 ;int25
	int 0x0000 ;int26
	int 0x0000 ;int27
	int 0x0000 ;int28
	int 0x0000 ;int29
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	user/main.c: 27: void delay(uint16_t x)
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	pushw	x
;	user/main.c: 29: while(x--);
	ldw	x, (0x05, sp)
00101$:
	ldw	(0x01, sp), x
	decw	x
	ldw	y, (0x01, sp)
	jrne	00101$
	popw	x
	ret
;	user/main.c: 32: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
;	-----------------------------------------
;	 function TIM4_UPD_OVF_IRQHandler
;	-----------------------------------------
_TIM4_UPD_OVF_IRQHandler:
	div	x, a
;	user/main.c: 34: TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
	push	#0x01
	call	_TIM4_ClearITPendingBit
	pop	a
;	user/main.c: 35: TIMER_Inc();
	call	_TIMER_Inc
;	user/main.c: 36: IWDG_ReloadCounter();
	call	_IWDG_ReloadCounter
	iret
;	user/main.c: 39: void IWDG_Config(void)
;	-----------------------------------------
;	 function IWDG_Config
;	-----------------------------------------
_IWDG_Config:
;	user/main.c: 43: IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
	push	#0x55
	call	_IWDG_WriteAccessCmd
	pop	a
;	user/main.c: 45: IWDG_SetPrescaler(IWDG_Prescaler_256);
	push	#0x06
	call	_IWDG_SetPrescaler
	pop	a
;	user/main.c: 49: IWDG_SetReload(250);
	push	#0xfa
	call	_IWDG_SetReload
	pop	a
;	user/main.c: 51: IWDG_ReloadCounter();
	call	_IWDG_ReloadCounter
;	user/main.c: 53: IWDG_Enable();
	jp	_IWDG_Enable
;	user/main.c: 57: void main() 
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #20
;	user/main.c: 61: uint8_t buff[] = "TRUONG TRUNG NHAN";
	ldw	x, sp
	incw	x
	ldw	(0x13, sp), x
	ldw	x, (0x13, sp)
	ld	a, #0x54
	ld	(x), a
	ldw	x, (0x13, sp)
	incw	x
	ld	a, #0x52
	ld	(x), a
	ldw	x, (0x13, sp)
	incw	x
	incw	x
	ld	a, #0x55
	ld	(x), a
	ldw	x, (0x13, sp)
	ld	a, #0x4f
	ld	(0x0003, x), a
	ldw	x, (0x13, sp)
	ld	a, #0x4e
	ld	(0x0004, x), a
	ldw	x, (0x13, sp)
	ld	a, #0x47
	ld	(0x0005, x), a
	ldw	x, (0x13, sp)
	ld	a, #0x20
	ld	(0x0006, x), a
	ldw	x, (0x13, sp)
	ld	a, #0x54
	ld	(0x0007, x), a
	ldw	x, (0x13, sp)
	ld	a, #0x52
	ld	(0x0008, x), a
	ldw	x, (0x13, sp)
	ld	a, #0x55
	ld	(0x0009, x), a
	ldw	x, (0x13, sp)
	ld	a, #0x4e
	ld	(0x000a, x), a
	ldw	x, (0x13, sp)
	ld	a, #0x47
	ld	(0x000b, x), a
	ldw	x, (0x13, sp)
	ld	a, #0x20
	ld	(0x000c, x), a
	ldw	x, (0x13, sp)
	ld	a, #0x4e
	ld	(0x000d, x), a
	ldw	x, (0x13, sp)
	ld	a, #0x48
	ld	(0x000e, x), a
	ldw	x, (0x13, sp)
	ld	a, #0x41
	ld	(0x000f, x), a
	ldw	x, (0x13, sp)
	ld	a, #0x4e
	ld	(0x0010, x), a
	ldw	x, (0x13, sp)
	addw	x, #0x0011
	clr	(x)
;	user/main.c: 64: CLK_Config();
	call	_CLK_Config
;	user/main.c: 67: MaxMatrix(GPIOC, GPIO_PIN_6, GPIO_PIN_4, GPIO_PIN_5, 8);
	push	#0x08
	push	#0x20
	push	#0x10
	push	#0x40
	push	#0x0a
	push	#0x50
	call	_MaxMatrix
	addw	sp, #6
;	user/main.c: 68: Init();
	call	_Init
;	user/main.c: 69: Screen();
	call	_Screen
;	user/main.c: 70: TEXT_Init();
	call	_TEXT_Init
;	user/main.c: 71: TIMER_Init();
	call	_TIMER_Init
;	user/main.c: 72: IWDG_Config();
	call	_IWDG_Config
;	user/main.c: 73: enableInterrupts();
	rim
;	user/main.c: 74: TEXT_GetStringToBuff(buff);
	ldw	x, (0x13, sp)
	pushw	x
	call	_TEXT_GetStringToBuff
	popw	x
;	user/main.c: 104: while(TRUE) 
00102$:
;	user/main.c: 106: TEXT_Manage();
	call	_TEXT_Manage
	jra	00102$
	addw	sp, #20
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
