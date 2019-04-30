#include "ds18b20.h"

// Инициализация DS18B20
unsigned char DS18B20_init(void)
{
unsigned char OK_Flag;
DS18B20_DDR |= (1 << DS18B20_DATA); // DS18B20_DATA - выход
DS18B20_PORT &= ~(1 << DS18B20_DATA); // Устанавливаем низкий уровень
_delay_us(490);
DS18B20_DDR &= ~(1 << DS18B20_DATA); // DS18B20_DATA - вход
_delay_us(68);
OK_Flag = (DS18B20_PIN & (1 << DS18B20_DATA)); // Ловим импульс присутствия датчика
// если OK_Flag = 0 датчик подключен, OK_Flag = 1 датчик не подключен
_delay_us(422);
return OK_Flag;
}
 
// Функция чтения байта из DS18B20
unsigned char read_18b20(void)
{
unsigned char i, data = 0;
for(i = 0; i < 8; i++)
{     
DS18B20_DDR |= (1 << DS18B20_DATA); // DS18B20_DATA - выход
_delay_us(2);      
DS18B20_DDR &= ~(1 << DS18B20_DATA); // DS18B20_DATA - вход
_delay_us(4);      
data = data >> 1; // Следующий бит     
if(DS18B20_PIN & (1 << DS18B20_DATA)) data |= 0x80;
_delay_us(62);
} 
return data;
}
 
// Функция записи байта в DS18B20
void write_18b20(unsigned char data)
{
unsigned char i;  
for(i = 0; i < 8; i++)
{
DS18B20_DDR |= (1 << DS18B20_DATA); // DS18B20_DATA - выход
_delay_us(2);         
if(data & 0x01) DS18B20_DDR &= ~(1 << DS18B20_DATA);
else DS18B20_DDR |= (1 << DS18B20_DATA);
data = data >> 1; // Следующий бит
_delay_us(62);
DS18B20_DDR &= ~(1 << DS18B20_DATA); // DS18B20_DATA - вход
_delay_us(2);
} 
}

