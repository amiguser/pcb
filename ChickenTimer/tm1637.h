/*
 * tm1637.h
 *
 *  Created on: 16 окт. 2017 г.
 *      Author: mih
 */

#ifndef TM1637_H_
#define TM1637_H_

#include <util/delay.h>
#include <avr/io.h>

#define CLK PC5 //обзываем пины
#define DIO PC4

#define TMPORT PORTC // обзываем порт
#define TMDDR DDRC
#define TMPIN PINC


//кусок других определений украденый из ардуиновской библиотеки

	//************definitions for TM1637*********************
#define ADDR_AUTO  0x40
#define ADDR_FIXED 0x44

#define STARTADDR  0xc0
	/**** definitions for the clock point of the 4-Digit Display *******/
#define POINT_ON   1
#define POINT_OFF  0
	/**************definitions for brightness***********************/
#define  BRIGHT_DARKEST 0
#define  BRIGHT_TYPICAL 2
#define  BRIGHTEST      7
//--------------------------------------------------------//
//Special characters index of tube table
#define INDEX_NEGATIVE_SIGN	16
#define INDEX_BLANK			17
/************definitions for type of the 4-Digit Display*********************/
#define D4036B 0
#define D4056A 1

void TM1637_writeByte(int8_t wr_data);
void TM1637_start(void);
void TM1637_start(void);
void TM1637_coding_all(uint8_t DispData[]);
int8_t TM1637_coding(uint8_t DispData);
void TM1637_display_all(uint8_t DispData[]);
void TM1637_display(uint8_t BitAddr,int8_t DispData);
void TM1637_display_int_decimal(int16_t Decimal);
void TM1637_display_float_decimal(double Decimal);
void TM1637_clearDisplay(void);
void TM1637_init(uint8_t DispType,uint8_t Clk, uint8_t Data);
void TM1637_set(uint8_t brightness,uint8_t SetData,uint8_t SetAddr);
void TM1637_point(uint8_t PointFlag);


#endif /* TM1637_H_ */
