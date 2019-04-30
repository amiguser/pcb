/*
 * main.c
 *
 *  Created on: 29 мая 2017 г.
 *      Author: mih
 */

#include <avr/interrupt.h>
#include <avr/io.h>
//#include <avr/sfr_defs.h>
//#include <stdint.h>
#include <util/delay.h>
#include "main.h"
#include "max7221drv.h"

#define F_CPU 1000000
#define KEYB PINB5 //ADC0
#define KEYB_A 0 //ADC0
#define RTC_CE PORTB1 // Chip Enable for DS1302. High - DS1302, Low - MAX7221
#define RTC_IO PORTB0 // Concurrent with display controller
#define RTC_CLK PORTB2 // Concurrent with display controller

#define RELAY PORTB4 // Action device
#define LUX_RES 3 // ADC3

#define RTC_READ_MN 0x83
#define RTC_READ_HR 0x85


uint8_t lux_on=80;
uint8_t hour_on=5, hour_off=20;
uint8_t hour,min;

void menu(){

	uint8_t cmd;
	_delay_ms(1000);
	MAX7221_send(0x010A);
	MAX7221_send(0x027f);
	MAX7221_send(0x037f);
	MAX7221_send(0x047f);
	//while(cmd>20){
l1:

		cmd=adc_read(KEYB_A);
		if (cmd<20) goto l2;
		if(cmd>=115 && cmd<=130)
		{// ON relay time

			hour_on--;
			if (hour_on<=0) hour_on=hour_off;
			MAX7221_send(0x010D);
			MAX7221_send(0x027f);
			MAX7221_display_int8(hour_on);
		}
		if(cmd>=140 && cmd<=165)
		{// OFF relay time
			hour_off++;
			if (hour_off==23) hour_off=hour_on;
			MAX7221_send(0x011C);
			MAX7221_send(0x027f);
			MAX7221_display_int8(hour_off);
		}
		if(cmd>=172 && cmd<=192)
		{// light sensor tune
			lux_on=adc_read(LUX_RES);
			MAX7221_send(0x010E);
			MAX7221_send(0x027f);
			MAX7221_display_int8(lux_on/10);
			//sei();
			//MAX7221_send(0x090F);
			//goto l1;
		}
		_delay_ms(400);
		goto l1;

		//MAX7221_display_int8(cmd);
		//red=0;
		_delay_ms(100);
	//}
l2:
	//MAX7221_send(0x090F);
	EEPROM_write(0x00,hour_on);
	EEPROM_write(0x01,hour_off);
	EEPROM_write(0x03,lux_on);
	EEPROM_write(0x05,0x00);
	//_delay_ms(2000);
	//PCMSK = 0x30;
	sei();
}


void setup()
{
	cli();
	//adc_setup();
	MAX7221_init_simple();

	MAX7221_send(0x0c01);// Sleep off
	MAX7221_send(0x0B03);// Scan limit = 4 digits
	MAX7221_send(0x090F);//BCD\Normal
	MAX7221_send(0x0A0D);//Bright Level
	//Show stored settings



	sei();

	//MAX7221_send(0x090F);//BCD\Normal
}



int main() {
	setup();

	// Your main code start here
	uint8_t lux, key;
	uint8_t hh,hl,mh,ml,now_h,relay,i=0;
	int d=0;
	while(1){
        MAX7221_display_int(d);
        d++;
        if (d>9999) d=0;
		_delay_ms(500);
	}
}




void MAX7221_display_int8 (uint8_t v){
	uint16_t d;
	d=0x0300 | (v/10);
	MAX7221_send(d);
	d=0x0400 | (v % 10);
	MAX7221_send(d);
}

/*
void MAX7221_display_int(int v){

	uint8_t hh=v/1000;
	int d=0x0100 | hh;
	MAX7221_send(d);
	v=v-hh*1000;
	hh=v/100;

	d=0x0200|hh;
	MAX7221_send(d);
	d=0x0300;
	v=v-hh*100;
	hh=v/10;
	MAX7221_send(d|hh);
	d=0x0400;
	v=v-hh*10;
	hh=v;
	MAX7221_send(d|hh);

}
*/
uint8_t DS1302_read(uint8_t reg){
	PORTB|=(1<<RTC_CE); //set CE high
	uint8_t btest;
	//Send command byte
	for (uint8_t i=0; i<8; i++){
		btest=(reg & 0x01); //mask all bits except 0th
		PORTB &=~(1<<RTC_CLK); //Clear clk bit
		//PORTB &=~(1<<RTC_IO);
		//btest=btest<<RTC_IO;
		//PORTB|=btest;

		if (btest!=0x00) {
			PORTB|=(1<<RTC_IO);
		} else
		{
			PORTB &=~(1<<RTC_IO);
		}

		_delay_us(150);
		PORTB |=(1<<RTC_CLK);
		_delay_us(150);
		reg=reg>>1;
	} // clk bit high

	//Receiving byte from DS1302
	DDRB &=~(1<<RTC_IO);
	reg=0;
	for(uint8_t i=0; i<8;i++){
		reg=reg>>1;
		PORTB &= ~(1<<RTC_CLK);
		_delay_us(150);
		//btest= digitalRead(RTC_IO);
		//reg=reg | (btest<<7);
		reg=reg| ((PINB & (1<<RTC_IO))<<7);
		PORTB |= (1<<RTC_CLK);
		_delay_us(150);
	}
	return reg;
	PORTB&=~(1<<RTC_CE); //set CE low
}

/*
int digitalRead(unsigned int pin){
//	if(pin > 5 || pin < 0){return 0;}
//	if(pin < 2) turnOffPWM(pin); //If its PWM pin, makes sure the PWM is off
	return !!(PINB & _BV(pin));
}
*/


/*
 * Display time stored in 'now' structure.
 */
/*
void adc_setup (void)
{
    // Set the ADC input to PB2/ADC1
	//ADMUX |= (1<<MUX0 )|(1<<MUX1);
    //ADMUX |= (1 << ADLAR);


    // Set the prescaler to clock/128 & enable ADC
    ADCSRA |= (1 << ADPS1) | (1 << ADPS0) | (1 << ADEN);
}*/
uint8_t adc_read (uint8_t channel)
{
	ADMUX &=0b11111100;
	ADMUX |= (channel & 3);
	ADCSRA |= (1 << ADPS1) | (1 << ADPS0) | (1 << ADEN);

	// Start the conversion
    ADCSRA |= (1 << ADSC);

    // Wait for it to finish
    while (ADCSRA & (1 << ADSC));
    uint8_t l,h;
	l = ADCL>>2;  //Read and return 10 bit result
	h = ADCH;
	return (h << 6)|l;
//    return ADCH;
}
/*
void display(uint8_t b[4]){
//	uint16_t d;
//	d=0x0100|0x7E;// O
	MAX7221_send(0x0100|b[0]);
	MAX7221_send(0x0200|b[1]);
	MAX7221_send(0x0300|b[2]);
	MAX7221_send(0x0400|b[3]);
	_delay_ms(1000);

}
*/
