/*
 * main.c
 *
 *  Created on: Sep 6, 2018
 *      Author: mih
 */

#include "ports.h"
#include <avr/io.h>
#include <util/delay.h>

void setup(){
	DDRB= (1<<LED1)|(1<<LED2)|(1<<BUZZ);
	DDRB &=~(1<<BTN1);
	PORTB |=(1<<BTN1);//pull up BTN1
	PORTB &=~(1<<LED1);
	PORTB &=~(1<<LED2); //LEDs off

	DDRD = 0b11111100;

	DDRC = 0b11110000;

}

uint16_t ReadADC(uint8_t ch)
{
   //Select ADC Channel ch must be 0-7
   ch=ch&0b00000111;
   ADMUX|=ch;

   //Start Single conversion
   ADCSRA|=(1<<ADSC);

   //Wait for conversion to complete
   while(!(ADCSRA & (1<<ADIF)));

   //Clear ADIF by writing one to it
   //Note you may be wondering why we have write one to clear it
   //This is standard way of clearing bits in io as said in datasheets.
   //The code writes '1' but it result in setting bit to '0' !!!

   ADCSRA|=(1<<ADIF);

   return(ADC);
}

uint8_t detectLeakage(){
	uint16_t r=0;
	//charge remote capacitor
	DDRC |= (1<<LINE1)|(1<<LINE2);
	PORTC |=(1<<LINE1)|(1<<LINE2);
	_delay_ms(250);
	//check voltage
	DDRC &=~(1<<LINE1);
	DDRC &=~(1<<LINE2);
	_delay_ms(1000);
	r=ReadADC(LINE1);
	uint8_t v=1;
	if (r>500) v=0;
	r=ReadADC(LINE2);
	if (r>500) v=0;
	return v;
}

uint8_t detectACPower(){
	uint8_t v=1;
	uint16_t r=0;
	r = ReadADC(POWER2);
	if (r<500) v=0;
	return v;
}

uint8_t detectBATPower(){
	uint8_t v=1;
	uint16_t r=0;
	r = ReadADC(POWER1);
	if (r<500) v=0;
	return v;
}

void turnMotorOff(){

}

int main() {
	setup();
	while(1){
		if (detectLeakage()) {
			PORTB |=(1<<LED1);
		} else {
			PORTB &=~(1<<LED1);
		}
		_delay_ms(1000);
	}

	return 0;
}
