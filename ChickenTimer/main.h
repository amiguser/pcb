/*
 * main.h
 *
 *  Created on: 29 сент. 2017 г.
 *      Author: mih
 */

#ifndef MAIN_H_
#define MAIN_H_
/**
 * MK FUSES:
 * avrdude -pm8 -cusbasp -U lfuse:w:0xa1:m -U hfuse:w:0xd1:m
 * 1MHz, BODEN, EEPROM save
 */


/**
 * Keyboard:
 * PC3, PC2, PC1, (PD2(INT0) - pin4)* =>rewire
 */

/**
 * 
 *  RELAY1: PD7 (switch)
 *  RELAY2: PD6 (out12V)
 * RTC (DS1302):
 * 	CLK = PD2 (pin32)
 * 	IO  = PD3 (pin1)
 * 	CE  = PD4 (pin2)
 *
 * BT HC-05
 *  RX  = TX (PD1 - pin3)
 *  TX  = RX (PD0 - pin2)
 *  EN  = PC4(pin27)
 *
 * TM1637 Display
 *  DIO = PC5 (SCL)
 *  CLK = PC4 (SDA)
 *
 * NRF24L01
 *  MISO= MISO(PB4 - pin18)
 *  MOSI= MOSI(PB3 - pin17)
 *  SCK = SCK (PB5 - pin19)
 *  IRQ =     (PB2 - pin16)
 *  CE  =     (PB0 - pin14)******=>confirmed
 *  CSN =     (PB1 - pin15)
 */


#define RELAY_PORT PORTD
#define RELAY_1 PD7

//#define LED PC4

/*
 * definitions for keyboard
 */
#define KEY_1 PB1 //button
#define KEY_2 PB2 //right
#define KEY_3 PB3 //left
//#define KEY_0 PD2 //Menu key (INT0)
#define KEY_DDR DDRB
#define KEY_PORT PORTB
#define KEY_PIN PINB
#define MENU_TUNE_HOUR 1
#define MENU_TUNE_MIN 2
#define MENU_TUNE_ON 3
#define MENU_TUNE_OFF 4
#define MENU_TUNE_ON2 5
#define MENU_TUNE_OFF2 6


#define MENU_MODE_EXIT 0
#define MENU_MODE_TIME 0

#define MODE_MENU 11
#define MODE_DUTY 12

#define MODE_FADE_IN 7
#define MODE_FADE_OUT 8
#define MODE_LIGHT_ON 9
#define MODE_LIGHT_OFF 10


#define cbi(port,pin) port &= ~(1<<pin)
#define sbi(port,pin) port |= (1<<pin)

#define RTC_READ_MN 0x83
#define RTC_READ_HR 0x85
#define RTC_PORT PORTD


#define BT_TIME_SET 1
#define BT_TIMER_SET 2
#define BT_EN PC4
#define MODE_BT 1
#define MODE_KEYS 2


// структура отправляемых данных.Изменяемые данные.Размер структуры должен быть не больше 32 байт !
typedef struct{
  uint8_t identifier;// номер передатчика.МЕНЯТЬ НЕЛЬЗЯ

  int Analog;
  uint8_t test_data;
  int Error_Message; // счетчик ошибок
  long count;// счетчик передач для контроля качества канала
#if nofloat
int temperature_Sensor; //передаём температуру.
int Humidity_Sensor;// передаём влажность
#else
 float temperature_Sensor;// передаём температуру.
 float Humidity_Sensor;// передаём влажность
#endif
} nrf_send;

void menu();
uint8_t dec2bcd(uint8_t d);
void save_eeprom();
void keyScan();
void menuKeyScan();

#endif /* MAIN_H_ */
