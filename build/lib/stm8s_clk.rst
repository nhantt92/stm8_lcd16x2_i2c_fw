                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.6.0 #9615 (Mac OS X x86_64)
                                      4 ;--------------------------------------------------------
                                      5 	.module stm8s_clk
                                      6 	.optsdcc -mstm8
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _HSIDivFactor
                                     12 	.globl _CLK_Config
                                     13 	.globl _CLK_PeripheralClockConfig
                                     14 	.globl _CLK_SYSCLKConfig
                                     15 	.globl _CLK_GetClockFreq
                                     16 ;--------------------------------------------------------
                                     17 ; ram data
                                     18 ;--------------------------------------------------------
                                     19 	.area DATA
                                     20 ;--------------------------------------------------------
                                     21 ; ram data
                                     22 ;--------------------------------------------------------
                                     23 	.area INITIALIZED
                                     24 ;--------------------------------------------------------
                                     25 ; absolute external ram data
                                     26 ;--------------------------------------------------------
                                     27 	.area DABS (ABS)
                                     28 ;--------------------------------------------------------
                                     29 ; global & static initialisations
                                     30 ;--------------------------------------------------------
                                     31 	.area HOME
                                     32 	.area GSINIT
                                     33 	.area GSFINAL
                                     34 	.area GSINIT
                                     35 ;--------------------------------------------------------
                                     36 ; Home
                                     37 ;--------------------------------------------------------
                                     38 	.area HOME
                                     39 	.area HOME
                                     40 ;--------------------------------------------------------
                                     41 ; code
                                     42 ;--------------------------------------------------------
                                     43 	.area CODE
                                     44 ;	lib/stm8s_clk.c: 15: void CLK_Config(void)
                                     45 ;	-----------------------------------------
                                     46 ;	 function CLK_Config
                                     47 ;	-----------------------------------------
      008F0F                         48 _CLK_Config:
                                     49 ;	lib/stm8s_clk.c: 18: CLK->ICKR = CLK_ICKR_RESET_VALUE;
      008F0F 35 01 50 C0      [ 1]   50 	mov	0x50c0+0, #0x01
                                     51 ;	lib/stm8s_clk.c: 19: CLK->ECKR = CLK_ECKR_RESET_VALUE;
      008F13 35 00 50 C1      [ 1]   52 	mov	0x50c1+0, #0x00
                                     53 ;	lib/stm8s_clk.c: 20: CLK->SWR  = CLK_SWR_RESET_VALUE;
      008F17 35 E1 50 C4      [ 1]   54 	mov	0x50c4+0, #0xe1
                                     55 ;	lib/stm8s_clk.c: 21: CLK->SWCR = CLK_SWCR_RESET_VALUE;
      008F1B 35 00 50 C5      [ 1]   56 	mov	0x50c5+0, #0x00
                                     57 ;	lib/stm8s_clk.c: 22: CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
      008F1F 35 18 50 C6      [ 1]   58 	mov	0x50c6+0, #0x18
                                     59 ;	lib/stm8s_clk.c: 23: CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
      008F23 35 FF 50 C7      [ 1]   60 	mov	0x50c7+0, #0xff
                                     61 ;	lib/stm8s_clk.c: 24: CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
      008F27 35 FF 50 CA      [ 1]   62 	mov	0x50ca+0, #0xff
                                     63 ;	lib/stm8s_clk.c: 25: CLK->CSSR = CLK_CSSR_RESET_VALUE;
      008F2B 35 00 50 C8      [ 1]   64 	mov	0x50c8+0, #0x00
                                     65 ;	lib/stm8s_clk.c: 26: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008F2F 35 00 50 C9      [ 1]   66 	mov	0x50c9+0, #0x00
                                     67 ;	lib/stm8s_clk.c: 27: while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
      008F33                         68 00101$:
      008F33 AE 50 C9         [ 2]   69 	ldw	x, #0x50c9
      008F36 F6               [ 1]   70 	ld	a, (x)
      008F37 44               [ 1]   71 	srl	a
      008F38 25 F9            [ 1]   72 	jrc	00101$
                                     73 ;	lib/stm8s_clk.c: 29: CLK->CCOR = CLK_CCOR_RESET_VALUE;
      008F3A 35 00 50 C9      [ 1]   74 	mov	0x50c9+0, #0x00
                                     75 ;	lib/stm8s_clk.c: 30: CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
      008F3E 35 00 50 CC      [ 1]   76 	mov	0x50cc+0, #0x00
                                     77 ;	lib/stm8s_clk.c: 31: CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
      008F42 35 00 50 CD      [ 1]   78 	mov	0x50cd+0, #0x00
                                     79 ;	lib/stm8s_clk.c: 35: CLK->ICKR |= CLK_ICKR_HSIEN; /* Set HSIEN bit */
      008F46 72 10 50 C0      [ 1]   80 	bset	0x50c0, #0
                                     81 ;	lib/stm8s_clk.c: 42: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV); /* Clear High speed internal clock prescaler */
      008F4A AE 50 C6         [ 2]   82 	ldw	x, #0x50c6
      008F4D F6               [ 1]   83 	ld	a, (x)
      008F4E A4 E7            [ 1]   84 	and	a, #0xe7
      008F50 F7               [ 1]   85 	ld	(x), a
                                     86 ;	lib/stm8s_clk.c: 43: CLK->CKDIVR |= (uint8_t)CLK_PRESCALER_HSIDIV1; /* Set High speed internal clock prescaler */
      008F51 AE 50 C6         [ 2]   87 	ldw	x, #0x50c6
      008F54 F6               [ 1]   88 	ld	a, (x)
      008F55 AE 50 C6         [ 2]   89 	ldw	x, #0x50c6
      008F58 F7               [ 1]   90 	ld	(x), a
                                     91 ;	lib/stm8s_clk.c: 45: CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
      008F59 4B 00            [ 1]   92 	push	#0x00
      008F5B CD 8F B6         [ 4]   93 	call	_CLK_SYSCLKConfig
      008F5E 84               [ 1]   94 	pop	a
      008F5F 81               [ 4]   95 	ret
                                     96 ;	lib/stm8s_clk.c: 48: void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
                                     97 ;	-----------------------------------------
                                     98 ;	 function CLK_PeripheralClockConfig
                                     99 ;	-----------------------------------------
      008F60                        100 _CLK_PeripheralClockConfig:
      008F60 89               [ 2]  101 	pushw	x
                                    102 ;	lib/stm8s_clk.c: 55: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008F61 7B 05            [ 1]  103 	ld	a, (0x05, sp)
      008F63 A4 0F            [ 1]  104 	and	a, #0x0f
      008F65 88               [ 1]  105 	push	a
      008F66 A6 01            [ 1]  106 	ld	a, #0x01
      008F68 6B 03            [ 1]  107 	ld	(0x03, sp), a
      008F6A 84               [ 1]  108 	pop	a
      008F6B 4D               [ 1]  109 	tnz	a
      008F6C 27 05            [ 1]  110 	jreq	00125$
      008F6E                        111 00124$:
      008F6E 08 02            [ 1]  112 	sll	(0x02, sp)
      008F70 4A               [ 1]  113 	dec	a
      008F71 26 FB            [ 1]  114 	jrne	00124$
      008F73                        115 00125$:
                                    116 ;	lib/stm8s_clk.c: 60: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008F73 7B 02            [ 1]  117 	ld	a, (0x02, sp)
      008F75 43               [ 1]  118 	cpl	a
      008F76 6B 01            [ 1]  119 	ld	(0x01, sp), a
                                    120 ;	lib/stm8s_clk.c: 50: if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
      008F78 7B 05            [ 1]  121 	ld	a, (0x05, sp)
      008F7A A5 10            [ 1]  122 	bcp	a, #0x10
      008F7C 26 1C            [ 1]  123 	jrne	00108$
                                    124 ;	lib/stm8s_clk.c: 52: if (NewState != DISABLE)
      008F7E 0D 06            [ 1]  125 	tnz	(0x06, sp)
      008F80 27 0C            [ 1]  126 	jreq	00102$
                                    127 ;	lib/stm8s_clk.c: 55: CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008F82 AE 50 C7         [ 2]  128 	ldw	x, #0x50c7
      008F85 F6               [ 1]  129 	ld	a, (x)
      008F86 1A 02            [ 1]  130 	or	a, (0x02, sp)
      008F88 AE 50 C7         [ 2]  131 	ldw	x, #0x50c7
      008F8B F7               [ 1]  132 	ld	(x), a
      008F8C 20 26            [ 2]  133 	jra	00110$
      008F8E                        134 00102$:
                                    135 ;	lib/stm8s_clk.c: 60: CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008F8E AE 50 C7         [ 2]  136 	ldw	x, #0x50c7
      008F91 F6               [ 1]  137 	ld	a, (x)
      008F92 14 01            [ 1]  138 	and	a, (0x01, sp)
      008F94 AE 50 C7         [ 2]  139 	ldw	x, #0x50c7
      008F97 F7               [ 1]  140 	ld	(x), a
      008F98 20 1A            [ 2]  141 	jra	00110$
      008F9A                        142 00108$:
                                    143 ;	lib/stm8s_clk.c: 65: if (NewState != DISABLE)
      008F9A 0D 06            [ 1]  144 	tnz	(0x06, sp)
      008F9C 27 0C            [ 1]  145 	jreq	00105$
                                    146 ;	lib/stm8s_clk.c: 68: CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
      008F9E AE 50 CA         [ 2]  147 	ldw	x, #0x50ca
      008FA1 F6               [ 1]  148 	ld	a, (x)
      008FA2 1A 02            [ 1]  149 	or	a, (0x02, sp)
      008FA4 AE 50 CA         [ 2]  150 	ldw	x, #0x50ca
      008FA7 F7               [ 1]  151 	ld	(x), a
      008FA8 20 0A            [ 2]  152 	jra	00110$
      008FAA                        153 00105$:
                                    154 ;	lib/stm8s_clk.c: 73: CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
      008FAA AE 50 CA         [ 2]  155 	ldw	x, #0x50ca
      008FAD F6               [ 1]  156 	ld	a, (x)
      008FAE 14 01            [ 1]  157 	and	a, (0x01, sp)
      008FB0 AE 50 CA         [ 2]  158 	ldw	x, #0x50ca
      008FB3 F7               [ 1]  159 	ld	(x), a
      008FB4                        160 00110$:
      008FB4 85               [ 2]  161 	popw	x
      008FB5 81               [ 4]  162 	ret
                                    163 ;	lib/stm8s_clk.c: 78: void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
                                    164 ;	-----------------------------------------
                                    165 ;	 function CLK_SYSCLKConfig
                                    166 ;	-----------------------------------------
      008FB6                        167 _CLK_SYSCLKConfig:
      008FB6 89               [ 2]  168 	pushw	x
                                    169 ;	lib/stm8s_clk.c: 80: if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
      008FB7 0D 05            [ 1]  170 	tnz	(0x05, sp)
      008FB9 2B 19            [ 1]  171 	jrmi	00102$
                                    172 ;	lib/stm8s_clk.c: 82: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
      008FBB AE 50 C6         [ 2]  173 	ldw	x, #0x50c6
      008FBE F6               [ 1]  174 	ld	a, (x)
      008FBF A4 E7            [ 1]  175 	and	a, #0xe7
      008FC1 F7               [ 1]  176 	ld	(x), a
                                    177 ;	lib/stm8s_clk.c: 83: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
      008FC2 AE 50 C6         [ 2]  178 	ldw	x, #0x50c6
      008FC5 F6               [ 1]  179 	ld	a, (x)
      008FC6 6B 02            [ 1]  180 	ld	(0x02, sp), a
      008FC8 7B 05            [ 1]  181 	ld	a, (0x05, sp)
      008FCA A4 18            [ 1]  182 	and	a, #0x18
      008FCC 1A 02            [ 1]  183 	or	a, (0x02, sp)
      008FCE AE 50 C6         [ 2]  184 	ldw	x, #0x50c6
      008FD1 F7               [ 1]  185 	ld	(x), a
      008FD2 20 17            [ 2]  186 	jra	00104$
      008FD4                        187 00102$:
                                    188 ;	lib/stm8s_clk.c: 87: CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
      008FD4 AE 50 C6         [ 2]  189 	ldw	x, #0x50c6
      008FD7 F6               [ 1]  190 	ld	a, (x)
      008FD8 A4 F8            [ 1]  191 	and	a, #0xf8
      008FDA F7               [ 1]  192 	ld	(x), a
                                    193 ;	lib/stm8s_clk.c: 88: CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
      008FDB AE 50 C6         [ 2]  194 	ldw	x, #0x50c6
      008FDE F6               [ 1]  195 	ld	a, (x)
      008FDF 6B 01            [ 1]  196 	ld	(0x01, sp), a
      008FE1 7B 05            [ 1]  197 	ld	a, (0x05, sp)
      008FE3 A4 07            [ 1]  198 	and	a, #0x07
      008FE5 1A 01            [ 1]  199 	or	a, (0x01, sp)
      008FE7 AE 50 C6         [ 2]  200 	ldw	x, #0x50c6
      008FEA F7               [ 1]  201 	ld	(x), a
      008FEB                        202 00104$:
      008FEB 85               [ 2]  203 	popw	x
      008FEC 81               [ 4]  204 	ret
                                    205 ;	lib/stm8s_clk.c: 92: uint32_t CLK_GetClockFreq(void)
                                    206 ;	-----------------------------------------
                                    207 ;	 function CLK_GetClockFreq
                                    208 ;	-----------------------------------------
      008FED                        209 _CLK_GetClockFreq:
      008FED 52 07            [ 2]  210 	sub	sp, #7
                                    211 ;	lib/stm8s_clk.c: 99: clocksource = (CLK_Source_TypeDef)CLK->CMSR;
      008FEF AE 50 C3         [ 2]  212 	ldw	x, #0x50c3
      008FF2 F6               [ 1]  213 	ld	a, (x)
      008FF3 6B 01            [ 1]  214 	ld	(0x01, sp), a
                                    215 ;	lib/stm8s_clk.c: 100: if (clocksource == CLK_SOURCE_HSI)
      008FF5 7B 01            [ 1]  216 	ld	a, (0x01, sp)
      008FF7 A1 E1            [ 1]  217 	cp	a, #0xe1
      008FF9 26 2C            [ 1]  218 	jrne	00105$
                                    219 ;	lib/stm8s_clk.c: 102: tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
      008FFB AE 50 C6         [ 2]  220 	ldw	x, #0x50c6
      008FFE F6               [ 1]  221 	ld	a, (x)
      008FFF A4 18            [ 1]  222 	and	a, #0x18
                                    223 ;	lib/stm8s_clk.c: 103: tmp = (uint8_t)(tmp >> 3);
      009001 44               [ 1]  224 	srl	a
      009002 44               [ 1]  225 	srl	a
      009003 44               [ 1]  226 	srl	a
                                    227 ;	lib/stm8s_clk.c: 104: presc = HSIDivFactor[tmp];
      009004 AE 90 46         [ 2]  228 	ldw	x, #_HSIDivFactor+0
      009007 1F 06            [ 2]  229 	ldw	(0x06, sp), x
      009009 5F               [ 1]  230 	clrw	x
      00900A 97               [ 1]  231 	ld	xl, a
      00900B 72 FB 06         [ 2]  232 	addw	x, (0x06, sp)
      00900E F6               [ 1]  233 	ld	a, (x)
                                    234 ;	lib/stm8s_clk.c: 105: clockfrequency = HSI_VALUE / presc;
      00900F 5F               [ 1]  235 	clrw	x
      009010 97               [ 1]  236 	ld	xl, a
      009011 90 5F            [ 1]  237 	clrw	y
      009013 89               [ 2]  238 	pushw	x
      009014 90 89            [ 2]  239 	pushw	y
      009016 4B 00            [ 1]  240 	push	#0x00
      009018 4B 24            [ 1]  241 	push	#0x24
      00901A 4B F4            [ 1]  242 	push	#0xf4
      00901C 4B 00            [ 1]  243 	push	#0x00
      00901E CD 93 19         [ 4]  244 	call	__divulong
      009021 5B 08            [ 2]  245 	addw	sp, #8
      009023 1F 04            [ 2]  246 	ldw	(0x04, sp), x
      009025 20 1A            [ 2]  247 	jra	00106$
      009027                        248 00105$:
                                    249 ;	lib/stm8s_clk.c: 107: else if ( clocksource == CLK_SOURCE_LSI)
      009027 7B 01            [ 1]  250 	ld	a, (0x01, sp)
      009029 A1 D2            [ 1]  251 	cp	a, #0xd2
      00902B 26 0B            [ 1]  252 	jrne	00102$
                                    253 ;	lib/stm8s_clk.c: 109: clockfrequency = LSI_VALUE;
      00902D AE F4 00         [ 2]  254 	ldw	x, #0xf400
      009030 1F 04            [ 2]  255 	ldw	(0x04, sp), x
      009032 90 AE 00 01      [ 2]  256 	ldw	y, #0x0001
      009036 20 09            [ 2]  257 	jra	00106$
      009038                        258 00102$:
                                    259 ;	lib/stm8s_clk.c: 113: clockfrequency = HSE_VALUE;
      009038 AE 24 00         [ 2]  260 	ldw	x, #0x2400
      00903B 1F 04            [ 2]  261 	ldw	(0x04, sp), x
      00903D 90 AE 00 F4      [ 2]  262 	ldw	y, #0x00f4
      009041                        263 00106$:
                                    264 ;	lib/stm8s_clk.c: 115: return((uint32_t)clockfrequency);
      009041 1E 04            [ 2]  265 	ldw	x, (0x04, sp)
      009043 5B 07            [ 2]  266 	addw	sp, #7
      009045 81               [ 4]  267 	ret
                                    268 	.area CODE
      009046                        269 _HSIDivFactor:
      009046 01                     270 	.db #0x01	; 1
      009047 02                     271 	.db #0x02	; 2
      009048 04                     272 	.db #0x04	; 4
      009049 08                     273 	.db #0x08	; 8
                                    274 	.area INITIALIZER
                                    275 	.area CABS (ABS)
