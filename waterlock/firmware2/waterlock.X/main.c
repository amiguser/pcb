/*
 * main.c
 *
 *  Created on: Sep 6, 2018
 *      Author: mih
 */

#include "ports.h"
#include <avr/io.h>
#include <util/delay.h>
#include "lib_eeprom.h"
#include <avr/interrupt.h>


void blinkOff(uint8_t);
void blinkOn(uint8_t);
//void blink(uint8_t);
//void blink(uint8_t, uint8_t);
void blink(uint8_t, uint8_t, uint8_t);

void beep(uint16_t dur, uint8_t t);
void delay(uint16_t ms);


uint8_t status = STATUS_DUTY;
uint8_t valve = VALVES_ON;
uint8_t key_state = KEYS_NOKEY;
uint8_t btn_pressed = 0; // is button pressed or ...
uint8_t btn_score = 0; //...how long button pressed
uint8_t btn_times = 0; //...times button was pressed
uint8_t dur0=0; uint8_t dur1=0;
uint8_t led1=0, led1_dur=0,led1_times=0,led1_count,led1_status;



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
/*
	blinkOn(LED1);
	_delay_ms(250);
	blinkOff(LED1);
	_delay_ms(1050);
 */
	ADMUX=(1<<REFS0);                         // For Aref=AVcc;
	ADCSRA=(1<<ADEN)|(1<<ADPS2)|(1<<ADPS1)|(1<<ADPS0); //Rrescalar div factor =128
	//ADCSRA |= (1 << ADEN) | (1 << ADIE);
	status = EEPROM_read(0);
    if (status>0xDD) {
        status = STATUS_DUTY;
        EEPROM_write(0, STATUS_DUTY);
    }
	valve = EEPROM_read(10);
    if (valve>0xDD) {
        valve = VALVES_ON;
        EEPROM_write(10, VALVES_ON);
    }
	TCCR1B = (0 << CS12) | (1 << CS11) | (1 << CS10); // настраиваем делитель 64
	TCNT1 = 0xFD8E;//25 times every second
	TIMSK |= (1 << TOIE1); //разрешить прерывание по переполнению таймера1 счетчика
	//TIMSK &=~(1<<TOIE0);
	/*
    blinkOn(LED1);
	_delay_ms(250);
	blinkOff(LED2);
	_delay_ms(1000);
     */
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

	if (m==0) {//button down
		if (btn_pressed == 1){//button still pressed
			dur1++;
		} else {//button just pressed
			dur1=1;
            if (dur0<10) {
               //btn_times++;
            }
		}
		btn_pressed = 1;
        //dur0=0;

	} else { //button up
        if (1 == btn_pressed) { //just released
            if ((dur1>2)  ) {
                btn_times++;
            } 
            //dur1= 0;
            dur0=0;
        } else { //button still released
            dur0++;
            if (dur0>20) {
                if (dur1>19) {
                    key_state = KEYS_LONGPRESS;
                    dur1=0;
                } else {

                    if (btn_times == 1) {
                        key_state = KEYS_1PRESS;
                    }
                    if (btn_times >= 3) {
                        key_state = KEYS_5PRESS;
                    }
                    //btn_times = 0;
                }
                dur0=21;
            }
        }
        btn_pressed = 0;
        
	}
    //LEDs control
    if (1==led1){
        //blinking
        if (led1_times>0){
            led1_count--;
            if (0==led1_count){
                led1_status=!led1_status;
                if (led1_status) {
                    blinkOn(LED1);
                } else {
                    blinkOff(LED1);
                }
                led1_times--;
                led1_count=led1_dur;
            }
        }
        led1=0;
    }
    if (2==led1){
        //blinking
        led1_count--;
        if (0==led1_count){
            led1_status=!led1_status;
            if (led1_status) {
                blinkOn(LED1);
                PORTB |= (1 << BUZZ);
            } else {
                blinkOff(LED1);
                PORTB &= ~(1 << BUZZ);
            }
            led1_count=led1_dur;
        }
        
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
	DDRC |= (1 << LINE1) ;
	PORTC |= (1 << LINE1);
	_delay_ms(200);
	/*
	 _delay_ms(250);
	 blinkOff(LED1);
	 _delay_ms(250);
	 blinkOn(LED1);
	 */
	PORTC &= ~(1 << LINE1);
    //PORTC &= ~(1 << LINE2);
	//check voltage
	DDRC &= ~(1 << LINE1);
	//DDRC &=~(1<<LINE2);
	_delay_ms(2000);
	r = ReadADC(LINE1);
	uint8_t v = LEAK_OK;
	//blink(LED2, 2, r/100);
    if (r < 500)
		v = LEAK_ALARM;
	//r=ReadADC(LINE2);
	if (r < 500)
		v = LEAK_ALARM;
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
	if (r < 300)
		v = 0;
	return v;
}

void turnValveOff() {
	uint16_t timer = 1000 * TIME2TURN;
	uint16_t tick=0;
    DDRC &=~(1<<LINE2);
    
    PORTD &= ~(1 << EN12);
	PORTD &= ~(1 << EN34); //set motors off
	PORTD |= (1 << M1A) | (1 << M3A);
	PORTD &= ~(1 << M2A);
	PORTD &= ~(1 << M4A);
	PORTD |= (1 << EN12) | (1 << EN34); //start motors
	while (tick < TIME2TURN){
        _delay_ms(1000);
        tick++;
        if ((PINC & (1<<LINE2))==0) {
            break;
        }
    }
	if (tick<TIME2TURN) {
        PORTD &= ~(1 << EN12);
        PORTD &= ~(1 << EN34); //set motors off
        valve = VALVES_OFF;
        EEPROM_write(10, 0x0F);  //mark as closed
    } else {
        
    }
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
    valve = VALVES_ON;
    EEPROM_write(10, 0x00);  //mark as opened
}

void blinkOn(uint8_t pin) {
	PORTB |= (1 << pin);
	//PORTB &=(~1<<LED1);
}
void blinkOff(uint8_t pin) {
	PORTB &= (~1 << pin);
	//PORTB |=(1<<LED1);
}

void blink(uint8_t led, uint8_t dur, uint8_t t){
    for (uint8_t i =0 ; i<t; i++){
        blinkOn(led);
        delay(dur);
        blinkOff(led);
        delay(dur);
    }
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

void maintenance() {
    //do not detect anything and wait for longpress
    uint8_t exit = 0;
    blinkOn(LED1);
    blinkOn(LED2);
    //beep(2,5);
    while (!exit) {

        if (key_state == KEYS_LONGPRESS) {
            exit = 1;
            status = STATUS_DUTY;
            
            btn_times = 0;
        }
        key_state = KEYS_NOKEY;
    }
}

/*
 * Detected leakage or broken wire. In both cases we must close valves and trigger alarm.
 */

void leakage(){
	status = STATUS_LEAKAGE;
	EEPROM_write(0, status);
    led1=0;
    led1_dur=12;
    led1_status=0;
    led1_times=0;
    led1_count=12;
    led1=2;//start timer blinking
	//blinkOn(LED1);
	//beep(5,3);
	turnValveOff();
    if (VALVES_OFF==valve) {
        blinkOn(LED2);
    } else {
        blinkOff(LED2);
    }

    blinkOff(LED1);
    uint8_t exit=0, d=1;
    while(!exit){
        //Exit in two cases: there is no leakage; pressed button long
        d = detectLeakage();
        if (key_state == KEYS_LONGPRESS){
            status = STATUS_DUTY;
            exit=1;
        }
        if (LEAK_OK==d){
            status = STATUS_DUTY;
            exit=1;
        }
        //beep(5,3);
        key_state = KEYS_NOKEY;
        
        //blink(LED1,2,2);
    }
    EEPROM_write(0, status);
    led1=0;
    blinkOff(LED1);
}


int main() {
	setup();
	//DDRB = 0xFF;
//	uint8_t status=STATUS_DUTY;
	uint8_t d,u1,u2;
    //uint16_t u1,u2;
    //beep(2,3);
	while (1) {
		
		//d=10;
        /*
        u1 = detectACPower();
        if (!u1) {
            status = STATUS_AC_LOW;
        }
        u2= detectBATPower();
        if (!u2) {
            status= STATUS_BAT_LOW;
        }
        */
        d = detectLeakage();
        if (LEAK_ALARM==d) {
            status = STATUS_LEAKAGE;
        }
        switch (status) {
		//default:

		case STATUS_DUTY:
            led1=0;
			if (VALVES_OFF==valve) {
                blinkOn(LED2);
            } else {
                blinkOff(LED2);
            }
			if (key_state == KEYS_1PRESS) {
                //blink(LED1, 3,3);
                //beep(2,3);
                
                if (VALVES_OFF == valve) {
                    turnValveOn();
                } else {
                    turnValveOff();
                }
                key_state = KEYS_NOKEY;
                btn_times=0;
                
			}
			if (key_state == KEYS_LONGPRESS) {
                blink(LED2,5,2);
                key_state = KEYS_NOKEY;
               
                btn_times=0;
			}
			if (key_state == KEYS_5PRESS) {
                status=STATUS_MAINTENANCE;
                key_state = KEYS_NOKEY;
                btn_times=0;
			}
	
			break;

		case STATUS_LEAKAGE:
//			d = detectLeakage();
			//beep(2, 4);
            blinkOn(LED1);
            leakage();
			break;

		case STATUS_MAINTENANCE:
            maintenance();
			
            //beep(10,3);
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
