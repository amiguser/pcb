/*
 * lib_eeprom.h
 *
 *  Created on: 29 сент. 2017 г.
 *      Author: mih
 */

#ifndef LIB_EEPROM_H_
#define LIB_EEPROM_H_

void EEPROM_write(unsigned int ucAddress, unsigned char ucData);
unsigned char EEPROM_read(unsigned char ucAddress);

#endif /* LIB_EEPROM_H_ */
