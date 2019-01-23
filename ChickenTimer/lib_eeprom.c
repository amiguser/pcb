#include <avr/io.h>
#include "lib_eeprom.h"

void EEPROM_write(unsigned int ucAddress, unsigned char ucData)
{
	/* Wait for completion of previous write */
	while(EECR & (1<<EEWE));
	/* Set Programming mode */
	//EECR = (0<<EEPM1)|(0>>EEPM0);
	/* Set up address and data registers */
	EEAR = ucAddress;
	EEDR = ucData;
	/* Write logical one to EEMPE */
	EECR |= (1<<EEMWE);
	/* Start eeprom write by setting EEPE */
	EECR |= (1<<EEWE);
	EEAR = 0xFFFF;
}

unsigned char EEPROM_read(unsigned char ucAddress)
{
	/* Wait for completion of previous write */
	while(EECR & (1<<EEWE));
	/* Set up address register */
	EEAR = ucAddress;
	/* Start eeprom read by writing EERE */
	EECR |= (1<<EERE);
	/* Return data from data register */
	EEAR = 0xFFFF;
	return EEDR;
}
