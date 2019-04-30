/* 
 * File:   ds18b20.h
 * Author: mih
 *
 * Created on 30 апреля 2019 г., 10:52
 */

#ifndef DS18B20_H
#define	DS18B20_H

#ifdef	__cplusplus
extern "C" {
#endif

#include <avr/io.h>
#include <util/delay.h>

#define DS18B20_PORT PORTB
#define DS18B20_PIN PINB
#define DS18B20_DDR DDRB
#define DS18B20_DATA PB7


#ifdef	__cplusplus
}
#endif

#endif	/* DS18B20_H */

