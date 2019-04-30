/*
 * max7221drv.h
 *
 *  Created on: 1 июн. 2017 г.
 *      Author: mih
 */

#ifndef MAX7221DRV_H_
#define MAX7221DRV_H_

#include <avr/io.h>
#include <util/delay.h>

#define MAX7221_PORT PORTC
#define MAX7221_PIN PINC
#define MAX7221_DDR DDRC


#define DISPLAY_DIN PC5 // Concurrent with RTC
#define DISPLAY_CLK PC4 // Concurrent with RTC
#define DISPLAY_CS PC0

void MAX7221_display_int(int v);
void MAX7221_init_simple();
void MAX7221_init(uint8_t bcd_mode, uint8_t digits_mask);
void MAX7221_send(int data);



#endif /* MAX7221DRV_H_ */
