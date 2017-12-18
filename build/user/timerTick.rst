                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module timerTick
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _TIM4_ClearFlag
                                     12 	.globl _TIM4_GetCounter
                                     13 	.globl _TIM4_ITConfig
                                     14 	.globl _TIM4_Cmd
                                     15 	.globl _TIM4_TimeBaseInit
                                     16 	.globl _TIM4_DeInit
                                     17 	.globl _CLK_PeripheralClockConfig
                                     18 	.globl _timeTickUs
                                     19 	.globl _timeTickMs
                                     20 	.globl _timeBack
                                     21 	.globl _timeGet
                                     22 	.globl _TIMER_Init
                                     23 	.globl _TIMER_Inc
                                     24 	.globl _TIMER_InitTime
                                     25 	.globl _TIMER_CheckTimeUS
                                     26 	.globl _TIMER_CheckTimeMS
                                     27 ;--------------------------------------------------------
                                     28 ; ram data
                                     29 ;--------------------------------------------------------
                                     30 	.area DATA
      000129                         31 _timeGet::
      000129                         32 	.ds 2
      00012B                         33 _timeBack::
      00012B                         34 	.ds 2
      00012D                         35 _timeTickMs::
      00012D                         36 	.ds 4
      000131                         37 _timeTickUs::
      000131                         38 	.ds 1
                                     39 ;--------------------------------------------------------
                                     40 ; ram data
                                     41 ;--------------------------------------------------------
                                     42 	.area INITIALIZED
                                     43 ;--------------------------------------------------------
                                     44 ; absolute external ram data
                                     45 ;--------------------------------------------------------
                                     46 	.area DABS (ABS)
                                     47 ;--------------------------------------------------------
                                     48 ; global & static initialisations
                                     49 ;--------------------------------------------------------
                                     50 	.area HOME
                                     51 	.area GSINIT
                                     52 	.area GSFINAL
                                     53 	.area GSINIT
                                     54 ;--------------------------------------------------------
                                     55 ; Home
                                     56 ;--------------------------------------------------------
                                     57 	.area HOME
                                     58 	.area HOME
                                     59 ;--------------------------------------------------------
                                     60 ; code
                                     61 ;--------------------------------------------------------
                                     62 	.area CODE
                                     63 ;	user/timerTick.c: 18: void TIMER_Init(void)
                                     64 ;	-----------------------------------------
                                     65 ;	 function TIMER_Init
                                     66 ;	-----------------------------------------
      008DE3                         67 _TIMER_Init:
                                     68 ;	user/timerTick.c: 20: CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4 , ENABLE); 
      008DE3 4B 01            [ 1]   69 	push	#0x01
      008DE5 4B 04            [ 1]   70 	push	#0x04
      008DE7 CD 8F 60         [ 4]   71 	call	_CLK_PeripheralClockConfig
      008DEA 85               [ 2]   72 	popw	x
                                     73 ;	user/timerTick.c: 21: TIM4_DeInit(); 
      008DEB CD 92 C0         [ 4]   74 	call	_TIM4_DeInit
                                     75 ;	user/timerTick.c: 23: TIM4_TimeBaseInit(TIM4_PRESCALER_16, CYCLE_US);
      008DEE 4B C8            [ 1]   76 	push	#0xc8
      008DF0 4B 04            [ 1]   77 	push	#0x04
      008DF2 CD 92 D9         [ 4]   78 	call	_TIM4_TimeBaseInit
      008DF5 85               [ 2]   79 	popw	x
                                     80 ;	user/timerTick.c: 24: TIM4_ClearFlag(TIM4_FLAG_UPDATE); 
      008DF6 4B 01            [ 1]   81 	push	#0x01
      008DF8 CD 93 09         [ 4]   82 	call	_TIM4_ClearFlag
      008DFB 84               [ 1]   83 	pop	a
                                     84 ;	user/timerTick.c: 25: TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
      008DFC 4B 01            [ 1]   85 	push	#0x01
      008DFE 4B 01            [ 1]   86 	push	#0x01
      008E00 CD 92 EB         [ 4]   87 	call	_TIM4_ITConfig
      008E03 85               [ 2]   88 	popw	x
                                     89 ;	user/timerTick.c: 26: TIM4_Cmd(ENABLE);    // Enable TIM4 
      008E04 4B 01            [ 1]   90 	push	#0x01
      008E06 CD 92 E6         [ 4]   91 	call	_TIM4_Cmd
      008E09 84               [ 1]   92 	pop	a
                                     93 ;	user/timerTick.c: 27: timeTickMs = 0;
      008E0A 5F               [ 1]   94 	clrw	x
      008E0B CF 01 2F         [ 2]   95 	ldw	_timeTickMs+2, x
      008E0E CF 01 2D         [ 2]   96 	ldw	_timeTickMs+0, x
                                     97 ;	user/timerTick.c: 28: timeTickUs = 0;
      008E11 72 5F 01 31      [ 1]   98 	clr	_timeTickUs+0
      008E15 81               [ 4]   99 	ret
                                    100 ;	user/timerTick.c: 31: void TIMER_Inc(void)
                                    101 ;	-----------------------------------------
                                    102 ;	 function TIMER_Inc
                                    103 ;	-----------------------------------------
      008E16                        104 _TIMER_Inc:
                                    105 ;	user/timerTick.c: 33: timeTickUs++;
      008E16 72 5C 01 31      [ 1]  106 	inc	_timeTickUs+0
                                    107 ;	user/timerTick.c: 34: if(timeTickUs%5 == 0){
      008E1A 5F               [ 1]  108 	clrw	x
      008E1B C6 01 31         [ 1]  109 	ld	a, _timeTickUs+0
      008E1E 97               [ 1]  110 	ld	xl, a
      008E1F A6 05            [ 1]  111 	ld	a, #0x05
      008E21 62               [ 2]  112 	div	x, a
      008E22 4D               [ 1]  113 	tnz	a
      008E23 27 01            [ 1]  114 	jreq	00109$
      008E25 81               [ 4]  115 	ret
      008E26                        116 00109$:
                                    117 ;	user/timerTick.c: 35: timeTickMs++;
      008E26 CE 01 2F         [ 2]  118 	ldw	x, _timeTickMs+2
      008E29 1C 00 01         [ 2]  119 	addw	x, #0x0001
      008E2C C6 01 2E         [ 1]  120 	ld	a, _timeTickMs+1
      008E2F A9 00            [ 1]  121 	adc	a, #0x00
      008E31 90 97            [ 1]  122 	ld	yl, a
      008E33 C6 01 2D         [ 1]  123 	ld	a, _timeTickMs+0
      008E36 A9 00            [ 1]  124 	adc	a, #0x00
      008E38 90 95            [ 1]  125 	ld	yh, a
      008E3A CF 01 2F         [ 2]  126 	ldw	_timeTickMs+2, x
      008E3D 90 CF 01 2D      [ 2]  127 	ldw	_timeTickMs+0, y
      008E41 81               [ 4]  128 	ret
                                    129 ;	user/timerTick.c: 39: void TIMER_InitTime(TIME *pTime)
                                    130 ;	-----------------------------------------
                                    131 ;	 function TIMER_InitTime
                                    132 ;	-----------------------------------------
      008E42                        133 _TIMER_InitTime:
                                    134 ;	user/timerTick.c: 41: pTime->timeMS = timeTickMs;
      008E42 1E 03            [ 2]  135 	ldw	x, (0x03, sp)
      008E44 5C               [ 2]  136 	incw	x
      008E45 5C               [ 2]  137 	incw	x
      008E46 90 CE 01 2F      [ 2]  138 	ldw	y, _timeTickMs+2
      008E4A EF 02            [ 2]  139 	ldw	(0x2, x), y
      008E4C 90 CE 01 2D      [ 2]  140 	ldw	y, _timeTickMs+0
      008E50 FF               [ 2]  141 	ldw	(x), y
      008E51 81               [ 4]  142 	ret
                                    143 ;	user/timerTick.c: 44: uint8_t TIMER_CheckTimeUS(TIME *pTime, uint16_t time)
                                    144 ;	-----------------------------------------
                                    145 ;	 function TIMER_CheckTimeUS
                                    146 ;	-----------------------------------------
      008E52                        147 _TIMER_CheckTimeUS:
      008E52 52 04            [ 2]  148 	sub	sp, #4
                                    149 ;	user/timerTick.c: 46: timeGet = TIM4_GetCounter();
      008E54 CD 92 F6         [ 4]  150 	call	_TIM4_GetCounter
      008E57 5F               [ 1]  151 	clrw	x
      008E58 97               [ 1]  152 	ld	xl, a
      008E59 CF 01 29         [ 2]  153 	ldw	_timeGet+0, x
                                    154 ;	user/timerTick.c: 47: if(((timeGet > pTime->timeUS)&&((timeGet - pTime->timeUS) >= time))||((timeGet < pTime->timeUS)&&(((CYCLE_US -  pTime->timeUS) + timeGet + 1) >= time))){
      008E5C 16 07            [ 2]  155 	ldw	y, (0x07, sp)
      008E5E 17 03            [ 2]  156 	ldw	(0x03, sp), y
      008E60 1E 03            [ 2]  157 	ldw	x, (0x03, sp)
      008E62 FE               [ 2]  158 	ldw	x, (x)
      008E63 1F 01            [ 2]  159 	ldw	(0x01, sp), x
      008E65 1E 01            [ 2]  160 	ldw	x, (0x01, sp)
      008E67 C3 01 29         [ 2]  161 	cpw	x, _timeGet+0
      008E6A 24 0A            [ 1]  162 	jrnc	00105$
      008E6C CE 01 29         [ 2]  163 	ldw	x, _timeGet+0
      008E6F 72 F0 01         [ 2]  164 	subw	x, (0x01, sp)
      008E72 13 09            [ 2]  165 	cpw	x, (0x09, sp)
      008E74 24 14            [ 1]  166 	jrnc	00101$
      008E76                        167 00105$:
      008E76 1E 01            [ 2]  168 	ldw	x, (0x01, sp)
      008E78 C3 01 29         [ 2]  169 	cpw	x, _timeGet+0
      008E7B 23 17            [ 2]  170 	jrule	00102$
      008E7D CE 01 29         [ 2]  171 	ldw	x, _timeGet+0
      008E80 1C 00 C9         [ 2]  172 	addw	x, #0x00c9
      008E83 72 F0 01         [ 2]  173 	subw	x, (0x01, sp)
      008E86 13 09            [ 2]  174 	cpw	x, (0x09, sp)
      008E88 25 0A            [ 1]  175 	jrc	00102$
      008E8A                        176 00101$:
                                    177 ;	user/timerTick.c: 48: pTime->timeUS = timeGet;
      008E8A 1E 03            [ 2]  178 	ldw	x, (0x03, sp)
      008E8C 90 CE 01 29      [ 2]  179 	ldw	y, _timeGet+0
      008E90 FF               [ 2]  180 	ldw	(x), y
                                    181 ;	user/timerTick.c: 49: return 0;
      008E91 4F               [ 1]  182 	clr	a
      008E92 20 02            [ 2]  183 	jra	00106$
      008E94                        184 00102$:
                                    185 ;	user/timerTick.c: 51: return 1;
      008E94 A6 01            [ 1]  186 	ld	a, #0x01
      008E96                        187 00106$:
      008E96 5B 04            [ 2]  188 	addw	sp, #4
      008E98 81               [ 4]  189 	ret
                                    190 ;	user/timerTick.c: 54: uint8_t TIMER_CheckTimeMS(TIME *pTime, uint32_t time)
                                    191 ;	-----------------------------------------
                                    192 ;	 function TIMER_CheckTimeMS
                                    193 ;	-----------------------------------------
      008E99                        194 _TIMER_CheckTimeMS:
      008E99 52 0B            [ 2]  195 	sub	sp, #11
                                    196 ;	user/timerTick.c: 56: if(((timeTickMs > pTime->timeMS)&&((timeTickMs - pTime->timeMS) >= time))||((timeTickMs < pTime->timeMS)&&(((CYCLE_MS -  pTime->timeMS) + timeTickMs + 1) >= time))){
      008E9B 1E 0E            [ 2]  197 	ldw	x, (0x0e, sp)
      008E9D 5C               [ 2]  198 	incw	x
      008E9E 5C               [ 2]  199 	incw	x
      008E9F 1F 0A            [ 2]  200 	ldw	(0x0a, sp), x
      008EA1 1E 0A            [ 2]  201 	ldw	x, (0x0a, sp)
      008EA3 E6 03            [ 1]  202 	ld	a, (0x3, x)
      008EA5 6B 09            [ 1]  203 	ld	(0x09, sp), a
      008EA7 E6 02            [ 1]  204 	ld	a, (0x2, x)
      008EA9 6B 08            [ 1]  205 	ld	(0x08, sp), a
      008EAB FE               [ 2]  206 	ldw	x, (x)
      008EAC 1F 06            [ 2]  207 	ldw	(0x06, sp), x
      008EAE CE 01 2F         [ 2]  208 	ldw	x, _timeTickMs+2
      008EB1 72 F0 08         [ 2]  209 	subw	x, (0x08, sp)
      008EB4 C6 01 2E         [ 1]  210 	ld	a, _timeTickMs+1
      008EB7 12 07            [ 1]  211 	sbc	a, (0x07, sp)
      008EB9 88               [ 1]  212 	push	a
      008EBA C6 01 2D         [ 1]  213 	ld	a, _timeTickMs+0
      008EBD 12 07            [ 1]  214 	sbc	a, (0x07, sp)
      008EBF 6B 03            [ 1]  215 	ld	(0x03, sp), a
      008EC1 84               [ 1]  216 	pop	a
      008EC2 88               [ 1]  217 	push	a
      008EC3 13 13            [ 2]  218 	cpw	x, (0x13, sp)
      008EC5 84               [ 1]  219 	pop	a
      008EC6 12 11            [ 1]  220 	sbc	a, (0x11, sp)
      008EC8 7B 02            [ 1]  221 	ld	a, (0x02, sp)
      008ECA 12 10            [ 1]  222 	sbc	a, (0x10, sp)
      008ECC 4F               [ 1]  223 	clr	a
      008ECD 49               [ 1]  224 	rlc	a
      008ECE 6B 01            [ 1]  225 	ld	(0x01, sp), a
      008ED0 1E 08            [ 2]  226 	ldw	x, (0x08, sp)
      008ED2 C3 01 2F         [ 2]  227 	cpw	x, _timeTickMs+2
      008ED5 7B 07            [ 1]  228 	ld	a, (0x07, sp)
      008ED7 C2 01 2E         [ 1]  229 	sbc	a, _timeTickMs+1
      008EDA 7B 06            [ 1]  230 	ld	a, (0x06, sp)
      008EDC C2 01 2D         [ 1]  231 	sbc	a, _timeTickMs+0
      008EDF 24 04            [ 1]  232 	jrnc	00105$
      008EE1 0D 01            [ 1]  233 	tnz	(0x01, sp)
      008EE3 27 15            [ 1]  234 	jreq	00101$
      008EE5                        235 00105$:
      008EE5 CE 01 2F         [ 2]  236 	ldw	x, _timeTickMs+2
      008EE8 13 08            [ 2]  237 	cpw	x, (0x08, sp)
      008EEA C6 01 2E         [ 1]  238 	ld	a, _timeTickMs+1
      008EED 12 07            [ 1]  239 	sbc	a, (0x07, sp)
      008EEF C6 01 2D         [ 1]  240 	ld	a, _timeTickMs+0
      008EF2 12 06            [ 1]  241 	sbc	a, (0x06, sp)
      008EF4 24 14            [ 1]  242 	jrnc	00102$
      008EF6 0D 01            [ 1]  243 	tnz	(0x01, sp)
      008EF8 26 10            [ 1]  244 	jrne	00102$
      008EFA                        245 00101$:
                                    246 ;	user/timerTick.c: 57: pTime->timeMS = timeTickMs;
      008EFA 1E 0A            [ 2]  247 	ldw	x, (0x0a, sp)
      008EFC 90 CE 01 2F      [ 2]  248 	ldw	y, _timeTickMs+2
      008F00 EF 02            [ 2]  249 	ldw	(0x2, x), y
      008F02 90 CE 01 2D      [ 2]  250 	ldw	y, _timeTickMs+0
      008F06 FF               [ 2]  251 	ldw	(x), y
                                    252 ;	user/timerTick.c: 58: return 0;
      008F07 4F               [ 1]  253 	clr	a
      008F08 20 02            [ 2]  254 	jra	00106$
      008F0A                        255 00102$:
                                    256 ;	user/timerTick.c: 60: return 1;
      008F0A A6 01            [ 1]  257 	ld	a, #0x01
      008F0C                        258 00106$:
      008F0C 5B 0B            [ 2]  259 	addw	sp, #11
      008F0E 81               [ 4]  260 	ret
                                    261 	.area CODE
                                    262 	.area INITIALIZER
                                    263 	.area CABS (ABS)
