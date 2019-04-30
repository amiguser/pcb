/*
 * max7221drv.c
 *
 *  Created on: 1 июн. 2017 г.
 *      Author: mih
 */
#include "max7221drv.h"

void MAX7221_send(int data){
	int word;
	MAX7221_DDR|=(1<<DISPLAY_CS); //CS=output
	MAX7221_DDR|=(1<<DISPLAY_DIN);

	MAX7221_DDR|=(1<<DISPLAY_CLK);
	MAX7221_PORT|=(1<<DISPLAY_CS); // CS = High
	MAX7221_PORT &=~(1<<DISPLAY_CLK);// clk = low
	MAX7221_PORT &=~(1<<DISPLAY_DIN);// din = low
	MAX7221_PORT &=~(1<<DISPLAY_CS);// CS = low
	for(uint8_t i =0; i<16; i++)
	{
		_delay_us(20);
		word = data & 0x8000; //mask 0-14 bits
		if (word!=0) {
			MAX7221_PORT|=(1<<DISPLAY_DIN);
		} else
		{
			MAX7221_PORT &=~(1<<DISPLAY_DIN);
		}
		_delay_us(20);
		MAX7221_PORT |=(1<<DISPLAY_CLK);// clk = high
		_delay_us(20);
		data=(data<<1);
		MAX7221_PORT &=~(1<<DISPLAY_CS);// CS = low
		MAX7221_PORT &=~(1<<DISPLAY_CLK);// clk = low


	}
	_delay_us(50);
	MAX7221_PORT|=(1<<DISPLAY_CS); // CS = High
}
/*
void MAX7221_send(int data){
	int word;
	MAX7221_DDR|=(1<<DISPLAY_CS); //CS=output
	MAX7221_DDR|=(1<<DISPLAY_DIN);

	MAX7221_DDR|=(1<<DISPLAY_CLK);
	MAX7221_PORT|=(1<<DISPLAY_CS); // CS = High
	MAX7221_PORT &=~(1<<DISPLAY_CLK);// clk = low
	MAX7221_PORT &=~(1<<DISPLAY_DIN);// din = low
	MAX7221_PORT &=~(1<<DISPLAY_CS);// CS = low
	for(uint8_t i =0; i<16; i++){
		_delay_us(1000);
		word = data & 0x8000; //mask 0-14 bits
		if (word!=0) {
			MAX7221_PORT|=(1<<DISPLAY_DIN);
		} else
		{
			MAX7221_PORT &=~(1<<DISPLAY_DIN);
		}
		_delay_us(500);
		MAX7221_PORT |=(1<<DISPLAY_CLK);// clk = high
		_delay_us(1000);
		data=(data<<1);
		MAX7221_PORT &=~(1<<DISPLAY_CS);// CS = low
		MAX7221_PORT &=~(1<<DISPLAY_CLK);// clk = low


	}
	_delay_us(500);
	MAX7221_PORT|=(1<<DISPLAY_CS); // CS = High
}
*/
void MAX7221_display_int(int v){
	uint8_t hh=v/1000;
	int d=0x0100 | hh;
	MAX7221_send(d);
	v=v-hh*1000;
	hh=(v)/100;

	d=0x0200|hh;
	MAX7221_send(d|hh);
	d=0x0300;
	v=v-hh*100;
	hh=(v)/10;
	MAX7221_send(d|hh);
	d=0x0400;
	v=v-hh*10;
	hh=(v);
	MAX7221_send(d|hh);
}

/*
 * Default init: 4 digits, all digits in BCD-mode.
 */
void MAX7221_init_simple(){
	MAX7221_DDR |=(1<<DISPLAY_CLK)|(1<<DISPLAY_DIN)|(1<<DISPLAY_CS);
    MAX7221_send(0x0c01);// Sleep off
	MAX7221_send(0x0B03);// Scan limit = 4 digits
	MAX7221_send(0x090F);//BCD\Normal
	MAX7221_send(0x0A0D);//Bright Level
}

void MAX7221_init(uint8_t bcd_mode, uint8_t digits_mask){
	MAX7221_send(0x0c01);// Sleep off
	MAX7221_send(0x0B00 | digits_mask);// Scan limit = 4 digits
	MAX7221_send(0x0900 | bcd_mode);//BCD\Normal
	MAX7221_send(0x0A0D);//Bright Level
}
