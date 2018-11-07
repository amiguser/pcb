/*
 * main.c
 *
 *  Created on: Sep 6, 2018
 *      Author: mih
 */

#include "ports.h"
#include <avr/io.h>
#include <util/delay.h>
#include <lib_eeprom.h>
#include <avr/interrupt.h>

void blinkOff(uint8_t);
void blinkOn(uint8_t);
void beep(uint16_t dur, uint8_t t);



uint8_t status = STATUS_DUTY;
uint8_t key_state = KEYS_NOKEY;
uint8_t btn_pressed = 0; // is button pressed or ...
uint8_t btn_score = 0; //...how long button pressed
uint8_t btn_times = 0; //...times button was pressed
uint8_t dur0=0; uint8_t dur1=0;
void setup() {
	DDRB = (1 << LED1) | (1 << LED2) | (1 << BUZZ);
	DDRB &= ~(1 << BTN1);
	PORTB |= (1 << BTN1); //pull up BTN1
	PORTB &= ~(1 << LED1);
	PORTB &= ~(1 << LED2); //LEDs off
	//PORTB |= (1 << LED1);
	//PORTB |= (1 << LED2);
	DDRD = 0b11111100;
	DDRC = 0b11110000;
	blinkOn(LED1);
	_delay_ms(250);
	blinkOff(LED1);
	_delay_ms(1050);
	ADMUX=(1<<REFS0);                         // For Aref=AVcc;
	ADCSRA=(1<<ADEN)|(1<<ADPS2)|(1<<ADPS1)|(1<<ADPS0); //Rrescalar div factor =128
	//ADCSRA |= (1 << ADEN) | (1 << ADIE);
	//status = EEPROM_read(0);
	status = STATUS_DUTY;
	TCCR1B = (0 << CS12) | (1 << CS11) | (1 << CS10); // настраиваем делитель 64
	TCNT1 = 0xFD8E;//25 times every second
	TIMSK |= (1 << TOIE1); //разрешить прерывание по переполнению таймера1 счетчика
	//TIMSK &=~(1<<TOIE0);
	blinkOn(LED1);
	_delay_ms(250);
	blinkOff(LED1);
	_delay_ms(1000);
	sei();
}
ISR(TIMER1_OVF_vect){
	/* timer overflow */
	uint8_t sreg;
	sreg = SREG;
	cli();
	uint8_t m;
	//uint16_t k;
	TCNT1 = 0xFD8E;//init counter for 0.02s
	m = PINB & (1<<BTN1);
	
    /*
	if (m==0) {
		blinkOn(LED1);
	} else {
		blinkOff(LED1);
	}
	*/

	if (m==0) {//button down
		if (btn_pressed == 1){
			dur1++;
		} else {
			dur1=1;
		}
		btn_pressed = 1;

	} else { //button up
		if (btn_pressed == 1){//button released
			if ((dur1>2) && (dur1<5)) {//short click
				btn_times++;
			}

			dur1=0;
		} else { //button's previous state is up btn_pressed=0
			btn_pressed=0;
			dur0++;
			if (dur0>20) {
				dur0=10;
				btn_times=0;
				key_state = KEYS_NOKEY;
			}
			if (dur0<6) {//pause between clicks
				// yet another click
				if (dur1>100) {
					dur1=0;
					key_state = KEYS_LONGPRESS;
				}

			} else {
				// pause too long, so button was released
				// dur0>5
				if (3==btn_times){
					key_state = KEYS_5PRESS;
				}
				if (1 == btn_times) {
					key_state= KEYS_1PRESS;
				}
				dur1=0;
				btn_times=0;
			}
		}

		btn_pressed = 0;
	}
	SREG = sreg;
	//sei();

}




uint16_t ReadADC(uint8_t ch) {
	//Select ADC Channel ch must be 0-7
	ch = ch & 0b00000111;
	ADMUX |= ch;

	//Start Single conversion
	ADCSRA |= (1 << ADSC);

	//Wait for conversion to complete
	while (!(ADCSRA & (1 << ADIF)))
		;

	//Clear ADIF by writing one to it
	//Note you may be wondering why we have write one to clear it
	//This is standard way of clearing bits in io as said in datasheets.
	//The code writes '1' but it result in setting bit to '0' !!!

	ADCSRA |= (1 << ADIF);

	return (ADC);
}

uint8_t detectLeakage() {
	uint16_t r = 0;
	//charge remote capacitor
//	blinkOn(LED1);
	DDRC |= (1 << LINE1) | (1 << LINE2);
	PORTC |= (1 << LINE1) | (1 << LINE2);
	_delay_ms(500);
	/*
	 _delay_ms(250);
	 blinkOff(LED1);
	 _delay_ms(250);
	 blinkOn(LED1);
	 */
	PORTC &= ~(1 << LINE1);
	//check voltage
	DDRC &= ~(1 << LINE1);
	//DDRC &=~(1<<LINE2);
	_delay_ms(1000);
	r = ReadADC(LINE1);
	uint8_t v = 1;
	if (r > 500)
		v = 0;
	//r=ReadADC(LINE2);
	if (r > 500)
		v = 0;
//	blinkOff(LED1);
	return v;
}

uint8_t detectACPower() {
	uint8_t v = 1;
	uint16_t r = 0;
	r = ReadADC(POWER2);
	if (r < 500)
		v = 0;
	return v;
}

uint8_t detectBATPower() {
	uint8_t v = 1;
	uint16_t r = 0;
	r = ReadADC(POWER1);
	if (r < 500)
		v = 0;
	return v;
}

void turnValveOff() {
	uint16_t timer = 1000 * TIME2TURN;
	PORTD &= ~(1 << EN12);
	PORTD &= ~(1 << EN34); //set motors off
	PORTD |= (1 << M1A) | (1 << M3A);
	PORTD &= ~(1 << M2A);
	PORTD &= ~(1 << M4A);
	PORTD |= (1 << EN12) | (1 << EN34); //start motors
	_delay_ms(timer);
	PORTD &= ~(1 << EN12);
	PORTD &= ~(1 << EN34); //set motors off
}

void turnValveOn() {
	uint16_t timer = 1000 * TIME2TURN;
	PORTD &= ~(1 << EN12);
	PORTD &= ~(1 << EN34); //set motors off
	PORTD |= (1 << M2A) | (1 << M4A);
	PORTD &= ~(1 << M1A);
	PORTD &= ~(1 << M3A);
	PORTD |= (1 << EN12) | (1 << EN34); //start motors
	_delay_ms(timer);
	PORTD &= ~(1 << EN12);
	PORTD &= ~(1 << EN34); //set motors off

}

void blinkOn(uint8_t pin) {
	PORTB |= (1 << pin);
	//PORTB &=(~1<<LED1);
}
void blinkOff(uint8_t pin) {
	PORTB &= (~1 << pin);
	//PORTB |=(1<<LED1);
}

void delay(uint16_t ms){
	uint16_t i=ms;
	while (i>0){
		_delay_ms(100);
		i--;
	}
}
/**
 * dur - 1/10 of second
 */
void beep(uint16_t dur, uint8_t t) {
	for (uint8_t i = 0; i < t; i++) {
		PORTB |= (1 << BUZZ);
		delay(dur);
		PORTB &= ~(1 << BUZZ);
		delay(dur);
	}
}

/**
 * Detected leakage or broken wire. In both cases we must close valves and trigger alarm.
 */

void leakage(){
	status = STATUS_LEAKAGE;
	EEPROM_write(0, status);
	blinkOn(LED1);
	beep(5,3);
	turnValveOff();


}


int main() {
	setup();
	//DDRB = 0xFF;
//	uint8_t status=STATUS_DUTY;
	uint8_t d;
    beep(2,3);
	while (1) {
		//d = detectLeakage();
		d=10;
		switch (status) {
		//default:

		case STATUS_DUTY:
			
			if (key_state == KEYS_1PRESS) {
				blinkOn(LED1);
				delay(5);
				blinkOff(LED1);
			}
			if (key_state == KEYS_LONGPRESS) {
				blinkOn(LED1);
				delay(20);
				blinkOff(LED1);
			}
			if (key_state == KEYS_5PRESS) {
				for(uint8_t l=0; l<3; l++){
				blinkOn(LED1);
				delay(5);
				blinkOff(LED1);
				}
			}

			if (d == 1) {
				blinkOn(LED1);
				status = STATUS_LEAKAGE;
				turnValveOff();
			}
			break;

		case STATUS_LEAKAGE:
//			d = detectLeakage();
			beep(2, 4);
			if (d == 1) {
				blinkOn(LED1);
				status = STATUS_LEAKAGE;
				turnValveOff();
			} else {
				status = STATUS_DUTY;
				blinkOff(LED1);
			}

			break;

		case STATUS_TEST:
			beep(10,3);
			break;

		}

		//blinkOff(LED2);
		//blinkOn(LED2);
		//_delay_ms(250);
		//blinkOff(LED2);
		//_delay_ms(250);
		//blinkOn(LED2);

		//_delay_ms(1000);

	}

	return 0;
}
