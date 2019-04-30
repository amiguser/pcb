/*
 * main.h
 *
 *  Created on: 1 июн. 2017 г.
 *      Author: mih
 */

#ifndef MAIN_H_
#define MAIN_H_

uint8_t adc_read (uint8_t channel);
void EEPROM_write(unsigned char ucAddress, unsigned char ucData);
unsigned char EEPROM_read(unsigned char ucAddress);
void MAX7221_send(int data);
void adc_setup (void);
int digitalRead(unsigned int pin);
uint8_t DS1302_read(uint8_t reg);
void MAX7221_display_int(int v);
void MAX7221_display_int8 (uint8_t v);

#endif /* MAIN_H_ */
