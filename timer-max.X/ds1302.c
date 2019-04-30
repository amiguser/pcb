

#include <util/delay.h>

#include <stdio.h>
#include <stdlib.h>
#include <avr/io.h>
#include <avr/interrupt.h>

#include "ds1302.h"
#ifdef DS1302_H_

//void reset(void);		//define the functions
//void ds1302_write(unsigned char);
//unsigned char read(void);
//void ds1302_write_byte(unsigned char,unsigned char);
//unsigned char read_byte(unsigned char);
//unsigned char get_hours(void);

unsigned char b10;
unsigned char bpm;

#define cbi(port,pin) port &= ~(1<<pin)
#define sbi(port,pin) port |= (1<<pin)

unsigned char ds1302_read()		//reads the ds1302 reply
{
	unsigned char i;
	unsigned char R_Byte, R_Byte2, TmpByte;

	sbi(DS1302_DDR,io);

	R_Byte = 0x00;
	R_Byte2 = 0x00;
	cbi(DS1302_PORT,io);

	cbi(DS1302_DDR,io);

	for(i = 0; i < 4; i++) //get the first 4 bits
	{
                TmpByte = 0;
		if(bit_is_set(DS1302_PIN,io))
                        TmpByte = 1;
		TmpByte <<= 7;
		R_Byte >>= 1;
		R_Byte |= TmpByte;

		sbi(DS1302_PORT,clk);
		_delay_us(2);
		cbi(DS1302_PORT,clk);
		_delay_us(2);
	}
	for(i = 0; i < 4; i++) //get the next 3 bits
	{
                TmpByte = 0;
		if(bit_is_set(DS1302_PIN,io))
                        TmpByte = 1;
		TmpByte <<= 7;
		R_Byte2 >>= 1;
		R_Byte2 |= TmpByte;

		sbi(DS1302_PORT,clk);
		_delay_us(2);
		cbi(DS1302_PORT,clk);
		_delay_us(2);
	}
	R_Byte >>= 4;
	R_Byte2 >>= 4;
	R_Byte = (R_Byte2 * 10) + R_Byte;
	return R_Byte;
}

unsigned char get_hours(){
	cli();
	unsigned char hour,temp;
	temp = ds1302_read_byte(hour_r);

			if(temp & 0x80 == 1)		// 12 format
			{
				if(temp & 0x20 == 1){}	// PM
					//time->hour_format = PM;
				else					// AM
//					time->hour_format = AM;

				hour = ((temp & 0x0F) + ((temp & 0x10)>>4)*10);
			}
			else						// 24 format
			{
				//time->hour_format = H24;
				hour = ((temp & 0x0F) + ((temp & 0x30)>>4)*10);
			}
			sei();
			return hour;
}

unsigned char get_hours2()
{

	unsigned char i;
	unsigned char R_Byte;
	unsigned char TmpByte;
	cli();
	ds1302_reset();
	ds1302_write(0x85);

	sbi(DS1302_DDR,io);

	R_Byte = 0x00;
	cbi(DS1302_PORT,io);

	cbi(DS1302_DDR,io);

	for(i = 0; i < 4; i++) //get the first 4 bits
	{
                TmpByte = 0;
                if(bit_is_set(DS1302_PIN,io))
                        TmpByte = 1;
		TmpByte <<= 7;
		R_Byte >>= 1;
		R_Byte |= TmpByte;

		sbi(DS1302_PORT,clk);
		_delay_us(4);
		cbi(DS1302_PORT,clk);
		_delay_us(4);
	}

        b10 = 0;
	if(bit_is_set(DS1302_PIN,io))
                b10 = 1;

	sbi(DS1302_PORT,clk);
	_delay_us(4);
	cbi(DS1302_PORT,clk);
	_delay_us(4);

        bpm = 0;
	if(bit_is_set(DS1302_PIN,io))
                bpm = 1;

	sbi(DS1302_PORT,clk) ;
	_delay_us(4);
	cbi(DS1302_PORT,clk);
	_delay_us(4);

	cbi(DS1302_PORT,rst);
	cbi(DS1302_PORT,clk);

	R_Byte	>>= 4;
	sei();
	return R_Byte;
}

unsigned char ds1302_read_byte(unsigned char w_byte)	//read the byte with register w_byte
{

	unsigned char temp;
	cli();
	ds1302_reset();
	ds1302_write(w_byte);
	temp = ds1302_read();
	cbi(DS1302_PORT,rst);
	cbi(DS1302_PORT,clk);
	sei();
	return temp;
}

void ds1302_write_byte(unsigned char w_byte, unsigned char w_2_byte)	//read the byte with register w_byte
{
	cli();
	ds1302_reset();
	ds1302_write(w_byte);
	ds1302_write(w_2_byte);
	cbi(DS1302_PORT,rst);
	cbi(DS1302_PORT,clk);
	sei();
}

void ds1302_reset()		//sets the pins to begin and end the ds1302 communication
{
	cli();
	sbi(DS1302_DDR,rst);
	cbi(DS1302_PORT,clk);
	cbi(DS1302_PORT,rst);
	sbi(DS1302_PORT,rst);
	sei();
}

void ds1302_write(unsigned char W_Byte)	//writes the W_Byte to the DS1302
{
	unsigned char i;
	cli();
	DS1302_DDR |= 0xF0;

	for(i = 0; i < 8; i++)
	{
		cbi(DS1302_PORT,io);
		if(W_Byte &0x01)
		{
			sbi(DS1302_PORT,io);
		}
		sbi(DS1302_PORT,clk);
		_delay_us(2);
		cbi(DS1302_PORT,clk);
		_delay_us(2);
		W_Byte >>=1;
	}
	sei();
}


#endif

