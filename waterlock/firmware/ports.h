/*
 * ports.h
 *
 *  Created on: Sep 6, 2018
 *      Author: mih
 */

#ifndef PORTS_H_
#define PORTS_H_

//PORTB
#define LED1 PB6 //Red
#define LED2 PB7 //Green
#define BTN1 PB0
#define BUZZ PB1

//PORTC
#define LINE1 PC0
#define LINE2 PC1
#define POWER1 PC2 //Control 12V battery power
#define POWER2 PC3 //Control 12V AC/DC power

//PORTD
#define M1A PD2
#define M2A PD3
#define EN12 PD4
#define M3A PD6
#define M4A PD5
#define EN34 PD7

#define TIME2TURN 30 //seconds
#define STATUS_LEAKAGE 1
#define STATUS_DUTY 2
#define STATUS_TEST 3
#define STATUS_AC_LOW 4
#define STATUS_BAT_LOW 5


#endif /* PORTS_H_ */
