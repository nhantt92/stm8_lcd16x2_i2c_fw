                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _main
                                     12 	.globl _TIM4_UPD_OVF_IRQHandler
                                     13 	.globl _delay
                                     14 	.globl _TEXT_Manage
                                     15 	.globl _TEXT_GetStringToBuff
                                     16 	.globl _TEXT_Init
                                     17 	.globl _TIMER_Inc
                                     18 	.globl _TIMER_Init
                                     19 	.globl _Screen
                                     20 	.globl _Init
                                     21 	.globl _MaxMatrix
                                     22 	.globl _TIM4_ClearITPendingBit
                                     23 	.globl _IWDG_Enable
                                     24 	.globl _IWDG_ReloadCounter
                                     25 	.globl _IWDG_SetReload
                                     26 	.globl _IWDG_SetPrescaler
                                     27 	.globl _IWDG_WriteAccessCmd
                                     28 	.globl _CLK_Config
                                     29 	.globl _IWDG_Config
                                     30 ;--------------------------------------------------------
                                     31 ; ram data
                                     32 ;--------------------------------------------------------
                                     33 	.area DATA
                                     34 ;--------------------------------------------------------
                                     35 ; ram data
                                     36 ;--------------------------------------------------------
                                     37 	.area INITIALIZED
                                     38 ;--------------------------------------------------------
                                     39 ; Stack segment in internal ram 
                                     40 ;--------------------------------------------------------
                                     41 	.area	SSEG
      009394                         42 __start__stack:
      009394                         43 	.ds	1
                                     44 
                                     45 ;--------------------------------------------------------
                                     46 ; absolute external ram data
                                     47 ;--------------------------------------------------------
                                     48 	.area DABS (ABS)
                                     49 ;--------------------------------------------------------
                                     50 ; interrupt vector 
                                     51 ;--------------------------------------------------------
                                     52 	.area HOME
      008000                         53 __interrupt_vect:
      008000 82 00 80 83             54 	int s_GSINIT ;reset
      008004 82 00 00 00             55 	int 0x0000 ;trap
      008008 82 00 00 00             56 	int 0x0000 ;int0
      00800C 82 00 00 00             57 	int 0x0000 ;int1
      008010 82 00 00 00             58 	int 0x0000 ;int2
      008014 82 00 00 00             59 	int 0x0000 ;int3
      008018 82 00 00 00             60 	int 0x0000 ;int4
      00801C 82 00 00 00             61 	int 0x0000 ;int5
      008020 82 00 00 00             62 	int 0x0000 ;int6
      008024 82 00 00 00             63 	int 0x0000 ;int7
      008028 82 00 00 00             64 	int 0x0000 ;int8
      00802C 82 00 00 00             65 	int 0x0000 ;int9
      008030 82 00 00 00             66 	int 0x0000 ;int10
      008034 82 00 00 00             67 	int 0x0000 ;int11
      008038 82 00 00 00             68 	int 0x0000 ;int12
      00803C 82 00 00 00             69 	int 0x0000 ;int13
      008040 82 00 00 00             70 	int 0x0000 ;int14
      008044 82 00 00 00             71 	int 0x0000 ;int15
      008048 82 00 00 00             72 	int 0x0000 ;int16
      00804C 82 00 00 00             73 	int 0x0000 ;int17
      008050 82 00 00 00             74 	int 0x0000 ;int18
      008054 82 00 00 00             75 	int 0x0000 ;int19
      008058 82 00 00 00             76 	int 0x0000 ;int20
      00805C 82 00 00 00             77 	int 0x0000 ;int21
      008060 82 00 00 00             78 	int 0x0000 ;int22
      008064 82 00 89 DD             79 	int _TIM4_UPD_OVF_IRQHandler ;int23
      008068 82 00 00 00             80 	int 0x0000 ;int24
      00806C 82 00 00 00             81 	int 0x0000 ;int25
      008070 82 00 00 00             82 	int 0x0000 ;int26
      008074 82 00 00 00             83 	int 0x0000 ;int27
      008078 82 00 00 00             84 	int 0x0000 ;int28
      00807C 82 00 00 00             85 	int 0x0000 ;int29
                                     86 ;--------------------------------------------------------
                                     87 ; global & static initialisations
                                     88 ;--------------------------------------------------------
                                     89 	.area HOME
                                     90 	.area GSINIT
                                     91 	.area GSFINAL
                                     92 	.area GSINIT
      008083                         93 __sdcc_gs_init_startup:
      008083                         94 __sdcc_init_data:
                                     95 ; stm8_genXINIT() start
      008083 AE 01 31         [ 2]   96 	ldw x, #l_DATA
      008086 27 07            [ 1]   97 	jreq	00002$
      008088                         98 00001$:
      008088 72 4F 00 00      [ 1]   99 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  100 	decw x
      00808D 26 F9            [ 1]  101 	jrne	00001$
      00808F                        102 00002$:
      00808F AE 00 00         [ 2]  103 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  104 	jreq	00004$
      008094                        105 00003$:
      008094 D6 93 93         [ 1]  106 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 01 31         [ 1]  107 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  108 	decw	x
      00809B 26 F7            [ 1]  109 	jrne	00003$
      00809D                        110 00004$:
                                    111 ; stm8_genXINIT() end
                                    112 	.area GSFINAL
      00809D CC 80 80         [ 2]  113 	jp	__sdcc_program_startup
                                    114 ;--------------------------------------------------------
                                    115 ; Home
                                    116 ;--------------------------------------------------------
                                    117 	.area HOME
                                    118 	.area HOME
      008080                        119 __sdcc_program_startup:
      008080 CC 8A 03         [ 2]  120 	jp	_main
                                    121 ;	return from main will return to caller
                                    122 ;--------------------------------------------------------
                                    123 ; code
                                    124 ;--------------------------------------------------------
                                    125 	.area CODE
                                    126 ;	user/main.c: 27: void delay(uint16_t x)
                                    127 ;	-----------------------------------------
                                    128 ;	 function delay
                                    129 ;	-----------------------------------------
      0089D1                        130 _delay:
      0089D1 89               [ 2]  131 	pushw	x
                                    132 ;	user/main.c: 29: while(x--);
      0089D2 1E 05            [ 2]  133 	ldw	x, (0x05, sp)
      0089D4                        134 00101$:
      0089D4 1F 01            [ 2]  135 	ldw	(0x01, sp), x
      0089D6 5A               [ 2]  136 	decw	x
      0089D7 16 01            [ 2]  137 	ldw	y, (0x01, sp)
      0089D9 26 F9            [ 1]  138 	jrne	00101$
      0089DB 85               [ 2]  139 	popw	x
      0089DC 81               [ 4]  140 	ret
                                    141 ;	user/main.c: 32: INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
                                    142 ;	-----------------------------------------
                                    143 ;	 function TIM4_UPD_OVF_IRQHandler
                                    144 ;	-----------------------------------------
      0089DD                        145 _TIM4_UPD_OVF_IRQHandler:
      0089DD 62               [ 2]  146 	div	x, a
                                    147 ;	user/main.c: 34: TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
      0089DE 4B 01            [ 1]  148 	push	#0x01
      0089E0 CD 93 11         [ 4]  149 	call	_TIM4_ClearITPendingBit
      0089E3 84               [ 1]  150 	pop	a
                                    151 ;	user/main.c: 35: TIMER_Inc();
      0089E4 CD 8E 16         [ 4]  152 	call	_TIMER_Inc
                                    153 ;	user/main.c: 36: IWDG_ReloadCounter();
      0089E7 CD 91 3A         [ 4]  154 	call	_IWDG_ReloadCounter
      0089EA 80               [11]  155 	iret
                                    156 ;	user/main.c: 39: void IWDG_Config(void)
                                    157 ;	-----------------------------------------
                                    158 ;	 function IWDG_Config
                                    159 ;	-----------------------------------------
      0089EB                        160 _IWDG_Config:
                                    161 ;	user/main.c: 43: IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
      0089EB 4B 55            [ 1]  162 	push	#0x55
      0089ED CD 91 25         [ 4]  163 	call	_IWDG_WriteAccessCmd
      0089F0 84               [ 1]  164 	pop	a
                                    165 ;	user/main.c: 45: IWDG_SetPrescaler(IWDG_Prescaler_256);
      0089F1 4B 06            [ 1]  166 	push	#0x06
      0089F3 CD 91 2C         [ 4]  167 	call	_IWDG_SetPrescaler
      0089F6 84               [ 1]  168 	pop	a
                                    169 ;	user/main.c: 49: IWDG_SetReload(250);
      0089F7 4B FA            [ 1]  170 	push	#0xfa
      0089F9 CD 91 33         [ 4]  171 	call	_IWDG_SetReload
      0089FC 84               [ 1]  172 	pop	a
                                    173 ;	user/main.c: 51: IWDG_ReloadCounter();
      0089FD CD 91 3A         [ 4]  174 	call	_IWDG_ReloadCounter
                                    175 ;	user/main.c: 53: IWDG_Enable();
      008A00 CC 91 3F         [ 2]  176 	jp	_IWDG_Enable
                                    177 ;	user/main.c: 57: void main() 
                                    178 ;	-----------------------------------------
                                    179 ;	 function main
                                    180 ;	-----------------------------------------
      008A03                        181 _main:
      008A03 52 14            [ 2]  182 	sub	sp, #20
                                    183 ;	user/main.c: 61: uint8_t buff[] = "TRUONG TRUNG NHAN";
      008A05 96               [ 1]  184 	ldw	x, sp
      008A06 5C               [ 2]  185 	incw	x
      008A07 1F 13            [ 2]  186 	ldw	(0x13, sp), x
      008A09 1E 13            [ 2]  187 	ldw	x, (0x13, sp)
      008A0B A6 54            [ 1]  188 	ld	a, #0x54
      008A0D F7               [ 1]  189 	ld	(x), a
      008A0E 1E 13            [ 2]  190 	ldw	x, (0x13, sp)
      008A10 5C               [ 2]  191 	incw	x
      008A11 A6 52            [ 1]  192 	ld	a, #0x52
      008A13 F7               [ 1]  193 	ld	(x), a
      008A14 1E 13            [ 2]  194 	ldw	x, (0x13, sp)
      008A16 5C               [ 2]  195 	incw	x
      008A17 5C               [ 2]  196 	incw	x
      008A18 A6 55            [ 1]  197 	ld	a, #0x55
      008A1A F7               [ 1]  198 	ld	(x), a
      008A1B 1E 13            [ 2]  199 	ldw	x, (0x13, sp)
      008A1D A6 4F            [ 1]  200 	ld	a, #0x4f
      008A1F E7 03            [ 1]  201 	ld	(0x0003, x), a
      008A21 1E 13            [ 2]  202 	ldw	x, (0x13, sp)
      008A23 A6 4E            [ 1]  203 	ld	a, #0x4e
      008A25 E7 04            [ 1]  204 	ld	(0x0004, x), a
      008A27 1E 13            [ 2]  205 	ldw	x, (0x13, sp)
      008A29 A6 47            [ 1]  206 	ld	a, #0x47
      008A2B E7 05            [ 1]  207 	ld	(0x0005, x), a
      008A2D 1E 13            [ 2]  208 	ldw	x, (0x13, sp)
      008A2F A6 20            [ 1]  209 	ld	a, #0x20
      008A31 E7 06            [ 1]  210 	ld	(0x0006, x), a
      008A33 1E 13            [ 2]  211 	ldw	x, (0x13, sp)
      008A35 A6 54            [ 1]  212 	ld	a, #0x54
      008A37 E7 07            [ 1]  213 	ld	(0x0007, x), a
      008A39 1E 13            [ 2]  214 	ldw	x, (0x13, sp)
      008A3B A6 52            [ 1]  215 	ld	a, #0x52
      008A3D E7 08            [ 1]  216 	ld	(0x0008, x), a
      008A3F 1E 13            [ 2]  217 	ldw	x, (0x13, sp)
      008A41 A6 55            [ 1]  218 	ld	a, #0x55
      008A43 E7 09            [ 1]  219 	ld	(0x0009, x), a
      008A45 1E 13            [ 2]  220 	ldw	x, (0x13, sp)
      008A47 A6 4E            [ 1]  221 	ld	a, #0x4e
      008A49 E7 0A            [ 1]  222 	ld	(0x000a, x), a
      008A4B 1E 13            [ 2]  223 	ldw	x, (0x13, sp)
      008A4D A6 47            [ 1]  224 	ld	a, #0x47
      008A4F E7 0B            [ 1]  225 	ld	(0x000b, x), a
      008A51 1E 13            [ 2]  226 	ldw	x, (0x13, sp)
      008A53 A6 20            [ 1]  227 	ld	a, #0x20
      008A55 E7 0C            [ 1]  228 	ld	(0x000c, x), a
      008A57 1E 13            [ 2]  229 	ldw	x, (0x13, sp)
      008A59 A6 4E            [ 1]  230 	ld	a, #0x4e
      008A5B E7 0D            [ 1]  231 	ld	(0x000d, x), a
      008A5D 1E 13            [ 2]  232 	ldw	x, (0x13, sp)
      008A5F A6 48            [ 1]  233 	ld	a, #0x48
      008A61 E7 0E            [ 1]  234 	ld	(0x000e, x), a
      008A63 1E 13            [ 2]  235 	ldw	x, (0x13, sp)
      008A65 A6 41            [ 1]  236 	ld	a, #0x41
      008A67 E7 0F            [ 1]  237 	ld	(0x000f, x), a
      008A69 1E 13            [ 2]  238 	ldw	x, (0x13, sp)
      008A6B A6 4E            [ 1]  239 	ld	a, #0x4e
      008A6D E7 10            [ 1]  240 	ld	(0x0010, x), a
      008A6F 1E 13            [ 2]  241 	ldw	x, (0x13, sp)
      008A71 1C 00 11         [ 2]  242 	addw	x, #0x0011
      008A74 7F               [ 1]  243 	clr	(x)
                                    244 ;	user/main.c: 64: CLK_Config();
      008A75 CD 8F 0F         [ 4]  245 	call	_CLK_Config
                                    246 ;	user/main.c: 67: MaxMatrix(GPIOC, GPIO_PIN_6, GPIO_PIN_4, GPIO_PIN_5, 8);
      008A78 4B 08            [ 1]  247 	push	#0x08
      008A7A 4B 20            [ 1]  248 	push	#0x20
      008A7C 4B 10            [ 1]  249 	push	#0x10
      008A7E 4B 40            [ 1]  250 	push	#0x40
      008A80 4B 0A            [ 1]  251 	push	#0x0a
      008A82 4B 50            [ 1]  252 	push	#0x50
      008A84 CD 8A B4         [ 4]  253 	call	_MaxMatrix
      008A87 5B 06            [ 2]  254 	addw	sp, #6
                                    255 ;	user/main.c: 68: Init();
      008A89 CD 8B 9A         [ 4]  256 	call	_Init
                                    257 ;	user/main.c: 69: Screen();
      008A8C CD 8C 0A         [ 4]  258 	call	_Screen
                                    259 ;	user/main.c: 70: TEXT_Init();
      008A8F CD 80 A0         [ 4]  260 	call	_TEXT_Init
                                    261 ;	user/main.c: 71: TIMER_Init();
      008A92 CD 8D E3         [ 4]  262 	call	_TIMER_Init
                                    263 ;	user/main.c: 72: IWDG_Config();
      008A95 CD 89 EB         [ 4]  264 	call	_IWDG_Config
                                    265 ;	user/main.c: 73: enableInterrupts();
      008A98 9A               [ 1]  266 	rim
                                    267 ;	user/main.c: 74: TEXT_GetStringToBuff(buff);
      008A99 1E 13            [ 2]  268 	ldw	x, (0x13, sp)
      008A9B 89               [ 2]  269 	pushw	x
      008A9C CD 80 F6         [ 4]  270 	call	_TEXT_GetStringToBuff
      008A9F 85               [ 2]  271 	popw	x
                                    272 ;	user/main.c: 104: while(TRUE) 
      008AA0                        273 00102$:
                                    274 ;	user/main.c: 106: TEXT_Manage();
      008AA0 CD 81 92         [ 4]  275 	call	_TEXT_Manage
      008AA3 20 FB            [ 2]  276 	jra	00102$
      008AA5 5B 14            [ 2]  277 	addw	sp, #20
      008AA7 81               [ 4]  278 	ret
                                    279 	.area CODE
                                    280 	.area INITIALIZER
                                    281 	.area CABS (ABS)
