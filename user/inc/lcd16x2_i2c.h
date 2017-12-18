#ifndef _LCD16X2_I2C_
#define _LCD16X2_I2C_

#include "stm8s.h"

#define	MODE_4_BIT		0x28
#define	CLR_SCR			0x01
#define	DISP_ON			0x0C
#define	CURSOR_ON		0x0E
#define	CURSOR_HOME		0x80

void I2C_LCD_Init(void);
void I2C_LCD_WriteCmd(uint8_t cmd);
void I2C_LCD_Puts(char *char);
void I2C_LCD_Clear(void);
void I2C_LCD_NewLine(void);
void I2C_LCD_Ligh(uint8_t light);

#endif