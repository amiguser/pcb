/*
 * main.c
 *
 *  Created on: Sep 6, 2018
 *      Author: mih
 */

#include "ports.h"
#include <avr/io.h>
#include <util/delay.h>

int main(){
	DDRB=0xFF;
	while (1==1){
		PORTB = 0xFF;
		_delay_ms(1400);
		PORTB = 0x00;
		_delay_ms(1400);
	}

	return 0;
}
