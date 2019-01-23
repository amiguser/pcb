/*
 * ds1302.c
 *
 *  Created on: 15 дек. 2016 г.
 *      Author: mih
 */


#ifndef DS1302_H_
#define DS1302_H_

#define DS1302_PORT PORTD
#define DS1302_PIN PIND
#define DS1302_DDR DDRD

#define rst  PD4	// to pd5		//definitions
#define clk  PD2 	//to pd7
#define io  PD3



#define mon 1
#define tue 2
#define wed 3
#define thu 4
#define fri 5
#define sat 6
#define sun 7

#define sec_w 0x80
#define sec_r 0x81
#define min_w 0x82
#define min_r 0x83
#define hour_w 0x84
#define hour_r 	0x85
#define date_w 0x86
#define date_r 0x87
#define month_w 0x88
#define month_r 0x89
#define day_w 0x8a
#define day_r 0x8b
#define year_w 0x8c
#define year_r 0x8d


typedef struct{
	uint8_t hour;
	uint8_t min;
	uint8_t sec;
	uint8_t day;
	uint8_t month;
	uint8_t year;
	uint8_t date;
} ds_time;


#define w_protect 0x8e
void ds1302_reset(void);		//define the functions
void ds1302_write(unsigned char);
unsigned char ds1302_read(void);
ds_time ds1302_get_time();
void ds1302_write_byte(unsigned char,unsigned char);
unsigned char ds1302_read_byte(unsigned char);
unsigned char get_hours(void);


#endif /* DS1302_H_ */


