/*
 * main.c
 *
 *  Created on: 26 сент. 2017 г.
 *      Author: mih
 */
#define TM1637_DISPLAY
#define F_CPU 8000000

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include "lib_eeprom.h"

#define SPI_PORT PORTB
#define SPI_DDR  DDRB
#define SPI_CS   PB2

//#include "ds1302.h"
#include "main.h"

#ifdef TM1637_DISPLAY
#include "tm1637.h"
#endif

#include "ds1302.h"


#define BAUD 9600
#define UBRRL_value F_CPU/(16*BAUD)-1
#define LEN 16
ds_time ctime; //current time
/**
 * EEPROM map
 * 0-timer1 ON, hour
 * 1-timer1 OFF, hour
 * 2-timer2 ON
 * 3-timer2 OFF
 */
uint8_t timerOn[4];
//uint8_t timerOff[2];



/**
 * Usart variables
 */
char bt_buffer[LEN];
uint8_t IDX=0;
uint8_t done=0;
uint8_t point=1;
register unsigned char IT asm("r16");
uint8_t mode = MODE_KEYS;
uint8_t menu_on=0;
uint8_t keys_status=0;
uint8_t keys[4];
uint8_t keys_clear=0;
uint8_t gHour, gMin;
uint16_t counter=0;
inline void clearStr(char* str)
{
	for(IT=0;IT<LEN;IT++)
		str[IT]=0;
}

void usart_init(){
/*
	UBRRL=UBRRL_value & 0xFF;
    UBRRH = (UBRRL_value >> 8);
*/
	/**
	 * 9600/8N1
	 */
	UBRRL=0x33;//8MHz, 9600
    UBRRH = 0x00;

    UCSRB=(1<<RXEN)|(1<<RXCIE);//(1<<TXEN)|
    UCSRC=(1<<URSEL)|(1<<UCSZ0)|(1<<UCSZ1);//8bit,
    UCSRC&=~(1<<USBS);// 1 stop bit, no Parity
}

ISR(USART_RXC_vect)
{
	char bf= UDR;
	bt_buffer[IDX]=bf;
	IDX++;

	if (bf == '.' || IDX >= LEN)
	{
		IDX=0;
		done=1;
	}

}
/**
 * On timer:
 * Show current time
 */
ISR(TIMER1_OVF_vect){
	/* timer overflow */
	//cli();
	uint8_t h,m;
	uint16_t k;
	TCNT1 = 0xFFFF-0xC800;//init counter for 1s
	//keyScan();

	gHour = ds1302_read_byte(hour_r);
	gHour = (gHour & 0x3F);
	//h = (h & 0xF0)*10 + (h & 0x0F);
	gMin = ds1302_read_byte(min_r);
	//m = (m & 0xF0)*10 + (m & 0x0F);
	k= gHour*100+gMin;
    
    //counter++;
    //if (counter>2) {
        point++;
        TM1637_point(point&0x01);
        
      //  counter=0;
    //}
	TM1637_display_int_decimal(k);
	//sei();

}

void keyScan(){
	uint8_t i = 0;
	for (i=0; i<4; i++){
		keys[i]=0;
	}
	for (uint8_t j = 0; j < 2; j++) {
		if (!(bit_is_set(PIND, KEY_1))) {
			keys[0]++;
		}

		if (!(bit_is_set(KEY_PIN, KEY_1))) {
			keys[1]++;
		}
		if (!(bit_is_set(KEY_PIN, KEY_2))) {
			keys[2]++;
		}
		if (!(bit_is_set(KEY_PIN, KEY_3))) {
			keys[3]++;
		}
		_delay_ms(20);
	}
	keys_status=0;

	for (i=0; i<4; i++){
		if (keys[i]>1){
			sbi(keys_status, i);
			//keys_status|=(1<<(i));
		}
	}
/*
	keys_clear++;
	//Clear keys status after ~3s
	if (keys_clear>150) {
		for (i=0; i<4; i++){
			keys[i]=0;
		}
		keys_status=0;
		keys_clear=0;
	}
*/
}

void menuKeyScan(){
	if(!(PIND & (1<<KEY_1))) {

	}
}

void menu() {
	uint8_t key = 0, mode, timerPos = 0, sym = 0;
	uint8_t disp[4];
	uint16_t tt;
	uint8_t h, m10, m1, exp = 0, time_modified = 0,timed_mod=0;
	cli();
	h = ds1302_read_byte(hour_r);
	h = (h & 0x3F);
	//h = (h & 0xF0)*10 + (h & 0x0F);
	m10 = ds1302_read_byte(min_r);
	m1 = m10 % 10;
	m10 = m10 / 10;
	mode = MENU_MODE_TIME;
	uint8_t flash = 0;
	_delay_ms(500);
	while (MENU_MODE_EXIT != mode) {
//TM1637_display_int_decimal(keys_status);
		//keyScan();
		_delay_ms(20);
		flash++;
		if (keys_status) {
			_delay_ms(100);
			if (keys_status & 0x01) {
				key = 4;
			}
			if (keys_status & 0x04) {
				key = 1;
			}
			if (keys_status & 0x02) {
				key = 2;
			}
			if (keys_status & 0x08) {
				key = 3;
			}
			/*
			 if (!(PIND & (1<<KEY_0))) {
			 key=4;
			 }
			 */
			if (1 == key) {
				if (MENU_MODE_TIME == mode) {
					h++;
					h = h > 24 ? 1 : h;
					time_modified = 1;
					timed_mod=1;
				}
				if ((mode > MENU_MODE_TIME) && (mode != MENU_MODE_EXIT)) {
					timerOn[timerPos]++;
					if (timerOn[timerPos] > 24) {
						timerOn[timerPos] = 0;
					}
				}
			}
			if (2 == key) {
				if (MENU_MODE_TIME == mode) {
					m10++;
					m10 = m10 > 5 ? 0 : m10;
					time_modified = 1;
					timed_mod=1;
				}
				if ((mode > MENU_MODE_TIME) && (mode != MENU_MODE_EXIT)) {
					if (timerOn[timerPos] == 0) {
						timerOn[timerPos] = 23;
					} else {
						timerOn[timerPos]--;
					}
				}

			}
			if (3 == key) {
				if (MENU_MODE_TIME == mode) {
					m1++;
					m1 = m1 > 9 ? 0 : m1;
					time_modified = 1;
					timed_mod=1;
				}
			}
			if (4 == key) {
				if (MENU_MODE_TIME == mode) {
					//Exit from time tuning
					if (time_modified) {
						ds1302_write_byte(hour_w, dec2bcd(h));
						ds1302_write_byte(min_w, dec2bcd(m10 * 10 + m1));
						ds1302_write_byte(sec_w, 0);
					}
					mode++;
				} else {
					mode++;
					if (mode > MENU_MODE_TIME) {
						timerPos++;
					}
				}
			}
			key = 0;
			keys_status=0;
		}
			if (MENU_MODE_EXIT != mode) {
				if ((MENU_MODE_TIME == mode)&&(flash & 0x08)) {
					tt = h * 100 + m10 * 10 + m1;
					TM1637_display_int_decimal(tt);
					//_delay_ms(300);
				}

				if ((mode > MENU_MODE_TIME)&&(flash & 0x08)) {
					sym = 18 + timerPos % 2;
					disp[0] = sym;
					disp[1] = timerPos / 2 + 1;
					sym = timerOn[timerPos];
					disp[2] = sym / 10;
					disp[3] = sym % 10;
					TM1637_display_all(disp);
					//_delay_ms(100);

				}
				if (!(flash & 0x08)) TM1637_clearDisplay();
				//_delay_ms(100);

			} else {
				//Exit from menu

				save_eeprom();
			}



		exp++;
	}
	menu_on = 4;
	_delay_ms(500);
	sei();
	return;
}

void save_eeprom(){
	cli();
	for(uint8_t i=0;i<4;i++)
		EEPROM_write(i, timerOn[i]);
	sei();
}

void setup() {
	DDRD |= (1<<RELAY_PORT);

	if (MODE_BT == mode) {
		usart_init();
		DDRC|=(1<<BT_EN);
		PORTC&=~(1<<BT_EN);
	}
	if (MODE_KEYS == mode){
		//set interrupt from INT0 (KEY_0)
		KEY_DDR&=~(1<<KEY_1);
		KEY_DDR&=~(1<<KEY_2);
		KEY_DDR&=~(1<<KEY_3);
		KEY_PORT|=(1<<KEY_1)|(1<<KEY_2)|(1<<KEY_3);
		//DDRD &=~(1<<KEY_0);
		//PORTD|=(1<<KEY_0);
		/*
		// INT0 Interrupt
		GICR = 1<<INT0;					// Enable INT0
		MCUCR = 1<<ISC01 | 1<<ISC00;	// Trigger INT0 on rising edge
		*/

		//TIMSK = 0x00;

		//TCCR0 &=0xF8;
		//TCCR0 = (1 << CS02); // настраиваем делитель 256


	}
cli();

	//PORTC |= (1 << LED);
	TMDDR |= (1 << CLK) | (1 << DIO);
	TM1637_init(0, CLK, DIO); //устанавливаем пины SCL и SDA
	TM1637_set(2, 0, 0xC0); // ставим яркость 2

	
	timerOn[0]=EEPROM_read(0);
	timerOn[1]=EEPROM_read(1);
	timerOn[2]=EEPROM_read(2);
	timerOn[3]=EEPROM_read(3);
	
	/*
	for(uint8_t i=0;i<4;i++) {
		if(timerOn[i]>23) timerOn[i]=0;
	}
	*/
	for(uint8_t i=0; i<4;i++){
		TM1637_display_int_decimal(timerOn[i]);
		TM1637_display(0, i);
		_delay_ms(1000);
	}
   
	//DS1302_DDR|=(1<<clk)|(1<<rst);
	//DS1302_PORT|=(1<<io);
	ds1302_reset();
/*
	ds1302_write_byte(hour_w,dec2bcd(23));
	ds1302_write_byte(min_w, dec2bcd(12));
	ds1302_write_byte(sec_w, dec2bcd(1));
*/
    TCCR1B = (0 << CS12) | (1 << CS11) | (1 << CS10); // настраиваем делитель 64
		//TCNT1 = 0xFFFF-0x0138;//25 times every second
	TIMSK |= (1 << TOIE1); //разрешить прерывание по переполнению таймера1 счетчика
    sei();

}
void m_delay_ms(int m) {
	m = m / 10;
	for (uint8_t i = 0; i < m; i++) {
		_delay_ms(10);
	}
}

uint8_t *digit_code(uint8_t h) {
	//uint8_t t=0;
	static uint8_t r[2];
	r[0] = h / 10;
	r[1] = h % 10;
	return r;
}

uint8_t dec2bcd(uint8_t d){
	uint8_t b = ((d/10)<<4)|(d % 10);
	return b;
}

int main(void) {
	//_delay_ms(300);


	setup();

	//_delay_ms(1000);
	//uint8_t h,m;
	uint8_t relay=0;
	//uint16_t k;
	//ds_time tt;
	//uint8_t *d;
	while (1 == 1) {

		if (MODE_BT == mode) {
			if (1 == done) {
				//Received bytes from usart
				done = 0;
				if (BT_TIME_SET == bt_buffer[0]) {
					//set time
					ds1302_write_byte(year_w, dec2bcd(bt_buffer[1]));
					ds1302_write_byte(month_w, dec2bcd(bt_buffer[2]));
					ds1302_write_byte(day_w, dec2bcd(bt_buffer[3]));
					ds1302_write_byte(hour_w, dec2bcd(bt_buffer[4]));
					ds1302_write_byte(min_w, dec2bcd(bt_buffer[5]));
					ds1302_write_byte(sec_w, dec2bcd(bt_buffer[6]));
				}
				if (BT_TIMER_SET == bt_buffer[0]) {

					//set timer
					timerOn[0] = bt_buffer[1];
					timerOn[1] = bt_buffer[2];
					timerOn[2] = bt_buffer[3];
					timerOn[3] = bt_buffer[4];
					save_eeprom();
				}
				for (uint8_t i = 0; i < 8; i++) {
					TM1637_display_int_decimal(bt_buffer[i]);
					TM1637_display(0, i);
					//TM1637_display_int_decimal(timerOn[i-1]);
					_delay_ms(1000);
				}
				clearStr(bt_buffer);

				//_delay_ms(1500);

			}
		}
		if (MODE_KEYS == mode) {
			//keyScan();
            keys_status=0;
			if (keys_status){
				TM1637_display_int_decimal(keys_status);
//				_delay_ms(50);

				if (1==keys_status){
					keys_status=0;
					menu();
				}
				keys_status=0;
			}
		}

		//uint8_t timeout = 0;
		//uint8_t t = 0;




		//h = ds1302_read_byte(hour_r);
		//gHour = (h & 0x3F);
		//gMin = ds1302_read_byte(min_r);
		//k= gHour*100+gMin;
		//TM1637_display_int_decimal(k);

		if (gHour>=timerOn[0]){
			relay=1;
		}
		if (gHour>=timerOn[1]){
			relay=0;
		}
		if (gHour>=timerOn[2]){
			relay=1;
		}
		if (gHour>=timerOn[3]){
			relay=0;
		}

		if (1==relay) {
			PORTD |= (1 << RELAY_PORT);
		} else {
			PORTD &= ~(1 << RELAY_PORT);
		}

			_delay_ms(500);
	}
}


