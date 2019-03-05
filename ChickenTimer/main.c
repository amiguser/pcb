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
uint8_t lampMode=MODE_LIGHT_OFF;
register unsigned char IT asm("r16");
uint8_t mode = MODE_KEYS;
uint8_t mmode = MODE_DUTY;
uint8_t menu_on=0;
uint8_t enc_old=0;
uint8_t EncData=128;
uint8_t keys_status=0;
uint8_t keys[4];
uint8_t keys_clear=0;
uint8_t gHour, gMin;
uint16_t counter=0;
uint8_t timerMode=0;//0-show time: duty, 1-management: keys.
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
    TCNT1 = 0xFFFF-0xF800;//init counter for 1s
	if (mmode==MODE_DUTY){
    //TCNT1 = 0xFFFF-0x7800;//init counter for 1s
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

}
/**
 * encoder read
 */
void keyScan(){
	uint8_t enc_new = KEY_PIN & 0x0C;
    enc_new=enc_new>>2;
    switch(enc_old)
	{
	case 2:
		{
		if(enc_new == 3) EncData++;
		if(enc_new == 0) EncData--; 
		break;
		}
 
	case 0:
		{
		if(enc_new == 2) EncData++;
		if(enc_new == 1) EncData--; 
		break;
		}
	case 1:
		{
		if(enc_new == 0) EncData++;
		if(enc_new == 3) EncData--; 
		break;
		}
	case 3:
		{
		if(enc_new == 1) EncData++;
		if(enc_new == 2) EncData--; 
		break;
		}
	}
    enc_old = enc_new;
}

void menuKeyScan(){
	if(!(KEY_PIN & (1<<KEY_1))) {
        _delay_ms(50);
        if(!(KEY_PIN & (1<<KEY_1))) {
            keys_status=1;
        }
    }
    //TM1637_clearDisplay();
	//return keys_status;
}

void menu() {
	uint8_t key = 0, mode, timerPos = 0, sym = 0;
	uint8_t disp[4];
	uint16_t tt;
	uint8_t h, m10, m1, exp = 0, time_modified = 0,timed_mod=0;
	cli();
    TM1637_clearDisplay();
    mmode=MODE_MENU;
	h = gHour;
	//h = (h & 0x3F);
	//h = (h & 0xF0)*10 + (h & 0x0F);
	m10 = gMin;
    //m10 = ds1302_read_byte(min_r);
	//m1 = m10 % 10;
	//m10 = m10 / 10;
	mode = MENU_TUNE_HOUR;
	uint8_t flash = 0;
	_delay_ms(500);
	while (MENU_MODE_EXIT != mode) {
//TM1637_display_int_decimal(keys_status);
		
        menuKeyScan();
		_delay_ms(1);
		flash++;
		if (keys_status) {
			//_delay_ms(100);
            //go to the next mode
            mode++;
            if (mode>6) {
                mode=MENU_MODE_EXIT;
            }
            switch (mode){
                case MENU_TUNE_HOUR: 
                    TM1637_display_int_decimal(h);
                    break;
                case MENU_TUNE_MIN:
                    TM1637_display_int_decimal(m10);
                    break;
            }

            keys_status=0;
        }
        keyScan();
        if (EncData!=0){
            // encoder has rotated
            time_modified=1;
            switch (mode){
                case MENU_TUNE_HOUR: 
                    h+=EncData; 
                    if (h>23) h=0;
                    
                    TM1637_display_int_decimal(h);
                    break;
                case MENU_TUNE_MIN:
                    m10+=EncData;
                    if (m10>59) m10=0;
                    TM1637_display_int_decimal(m10);
                    break;
            }
            EncData=0;
        }
    }
            
    //Exit from time tuning
    if (time_modified) {
        ds1302_write_byte(hour_w, dec2bcd(h));
        ds1302_write_byte(min_w, dec2bcd(m10));
        ds1302_write_byte(sec_w, 0);
    }
	//if (!(flash & 0x08)) TM1637_clearDisplay();
				//_delay_ms(100);
	exp++;
    mmode=MODE_DUTY;
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
    TCCR1B = (0 << CS12) | (0 << CS11) | (1 << CS10); // настраиваем делитель 1
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

            menuKeyScan();
            //keys_status=0;
			if (keys_status){
				TM1637_display_int_decimal(keys_status);
				_delay_ms(500);

				if (1==keys_status){
					keys_status=0;
					menu();
				}
				keys_status=0;
			}

		if ((gHour==timerOn[0])&&(gMin<6)){
			lampMode=MODE_FADE_OUT;//режим зажигания лампы
            relay=0;//основной свет потушен
		}
		if (gHour>=timerOn[0]){
			relay=0;
		}
		if (gHour>=timerOn[2]){
			relay=1;
		}
		if (gHour>=timerOn[3]){
			relay=0;
		}
/*
		if (1==relay) {
			PORTD |= (1 << RELAY_PORT);
		} else {
			PORTD &= ~(1 << RELAY_PORT);
		}
*/
			_delay_ms(50);
	}
}


