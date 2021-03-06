/*
 * tm1637.c
 *
 *  Created on: 16 окт. 2017 г.
 *      Author: mih
 */

/*
 * GccApplication6.c
 *
 * Created: 02.04.2016 17:05:34
 *  Author: Chu
 */

#include "tm1637.h"

		uint8_t Cmd_SetData;
		uint8_t Cmd_SetAddr;
		uint8_t Cmd_DispCtrl;
		uint8_t _PointFlag; 	//_PointFlag=1:the clock point on
		uint8_t _DispType;
		//int8_t coding(int8_t DispData);
		uint8_t Clkpin;
		uint8_t Datapin;
		uint8_t DecPoint;
		uint8_t BlankingFlag;

static uint8_t TubeTab[] = {0x3f,0x06,0x5b,0x4f,// знакогенератор
                           0x66,0x6d,0x7d,0x07,
                           0x7f,0x6f,0x77,0x7c,
                           0x39,0x5e,0x79,0x71,
                           0x40,0x00,0x23,0x1C};//0~9,A,b,C,d,E,F,"-"," "



void TM1637_writeByte(int8_t wr_data)// служебная функция записи данных по протоколу I2C, с подтверждением (ACK)
{
  uint8_t i;
    for(i=0;i<8;i++)
  {
   TMPORT &= ~(1<<Clkpin);
    if(wr_data & 0x01)
	{ TMPORT |= 1<<Datapin;}
    else {TMPORT &= ~(1<<Datapin);}
	_delay_us(3);
    wr_data = wr_data>>1;
    TMPORT |= 1<<Clkpin;
	_delay_us(3);
  }

  TMPORT &= ~(1<<Clkpin);
  _delay_us(5);
  TMDDR &= ~(1<<Datapin);// если поменяете порт на какой-то другой кроме PORTC, то тут тоже все DDRC на другие DDRx менять надо будет
  while((TMPIN & (1<<Datapin)));
  TMDDR |= (1<<Datapin);
  TMPORT |= 1<<Clkpin;
  _delay_us(2);
  TMPORT &= ~(1<<Clkpin);
}

void TM1637_start(void) // просто функция "старт" для протокола I2C
{
   TMPORT |= 1<<Clkpin;
   TMPORT |= 1<<Datapin;
 _delay_us(2);
  TMPORT &= ~(1<<Datapin);
}

void TM1637_stop(void) // просто функция "стоп" для протокола I2C
{
  TMPORT &= ~(1<<Clkpin);
 _delay_us(2);
  TMPORT &= ~(1<<Datapin);
_delay_us(2);
  TMPORT |= 1<<Clkpin;;
_delay_us(2);
  TMPORT |= 1<<Datapin;
}

void TM1637_coding_all(uint8_t DispData[])//шифратор
{
	uint8_t PointData;
	//PointData = 0x80;
	if(_PointFlag == POINT_ON) PointData = 0x80;	else PointData = 0;
	for(uint8_t i = 0;i < 4;i ++)
	{
		if(DispData[i] == 0x7f)DispData[i] = 0x00;
		else DispData[i] = TubeTab[DispData[i]] + PointData; // закоментированно, так как у моего дисплея нет десятичных точек
        //DispData[i] |= 0x80;
	}
	if((_DispType == D4056A)&&(DecPoint != 3))
	{
	DispData[DecPoint] += 0x80;
	DecPoint = 3;
	}
}
int8_t TM1637_coding(uint8_t DispData)// шифратор всех знакомест
{
	uint8_t PointData;
	PointData = 0x00;
	if(_PointFlag == POINT_ON)PointData = 0x00;else PointData = 0x00;
	if(DispData == 0x7f) DispData = 0x00 + PointData;
	else DispData = TubeTab[DispData] + PointData;
    //DispData|=PointData;
	return DispData;
}

void TM1637_display_all(uint8_t DispData[]) // полезняшка! отображает содержимое массива прямо на экране.
											//не забываем, что можем отображать только числа от 0x00 до 0x0F или по-русски от 0 до 15
{
  uint8_t SegData[4];
  uint8_t i;
  for(i = 0;i < 4;i ++)
  {
    SegData[i] = DispData[i];
  }
  TM1637_coding_all(SegData);
  TM1637_start();
  TM1637_writeByte(ADDR_AUTO);
  TM1637_stop();
  TM1637_start();
  TM1637_writeByte(Cmd_SetAddr);
  for(i=0;i < 4;i ++)
  {
    TM1637_writeByte(SegData[i]);
  }
  TM1637_stop();
  TM1637_start();
  TM1637_writeByte(Cmd_DispCtrl);
  TM1637_stop();
}

void TM1637_display(uint8_t BitAddr,int8_t DispData)// отображает один символ (от 0 до 15)в определенном месте  (от 0 до 3)
{
  int8_t SegData;
  SegData = TM1637_coding(DispData);
  TM1637_start();
  TM1637_writeByte(ADDR_FIXED);
  TM1637_stop();
  TM1637_start();
  TM1637_writeByte(BitAddr|0xc0);
  TM1637_writeByte(SegData);
  TM1637_stop();
  TM1637_start();
  TM1637_writeByte(Cmd_DispCtrl);
  TM1637_stop();
}
void TM1637_display_int_decimal(int16_t Decimal)// функция с минимальными изменениями скопированная с ардуиновской библиотеки. выводит целые числа от -999 до 9999
{
	uint8_t temp[4];
	if((Decimal > 9999)||(Decimal < -999))return;
	if(Decimal < 0)
	{
		temp[0] = INDEX_NEGATIVE_SIGN;
		Decimal = (Decimal & 0x7fff);
		temp[1] = Decimal/100;
		Decimal %= 100;
		temp[2] = Decimal / 10;
		temp[3] = Decimal % 10;
		if(BlankingFlag)
		{
			if(temp[1] == 0)
			{
				temp[1] = INDEX_BLANK;
				if(temp[2] == 0) temp[2] = INDEX_BLANK;
			}
		}
	}
	else
	{
		temp[0] = Decimal/1000;
		Decimal %= 1000;
		temp[1] = Decimal/100;
		Decimal %= 100;
		temp[2] = Decimal / 10;
		temp[3] = Decimal % 10;
		if(BlankingFlag)
		{
			if(temp[0] == 0)
			{
				temp[0] = INDEX_BLANK;
				if(temp[1] == 0)
				{
					temp[1] = INDEX_BLANK;
					if(temp[2] == 0) temp[2] = INDEX_BLANK;
				}
			}
		}
	}
	BlankingFlag = 1;
	TM1637_display_all(temp);
}

void TM1637_display_float_decimal(double Decimal) // функция с минимальными изменениями скопированная с ардуиновской библиотеки.
{												// выводит числа с десятичной точкой от -999 до 9999
  int16_t temp;
  if(Decimal > 9999)return;
  else if(Decimal < -999)return;
  uint8_t i = 3;
  if(Decimal > 0)
  {
	for( ;i > 0; i --)
	{
	  if(Decimal < 1000)Decimal *= 10;
	  else break;
	}
	temp = (int)Decimal;
	if((Decimal - temp)>0.5)temp++;
  }
   else
  {
	for( ;i > 1; i --)
	{
	  if(Decimal > -100)Decimal *= 10;
	  else break;
	}
	temp = (int)Decimal;
	if((temp - Decimal)>0.5)temp--;
  }
  DecPoint = i;
  BlankingFlag = 0;
  TM1637_display_int_decimal(temp);
}

void TM1637_clearDisplay(void) // чистит дисплей
{
  TM1637_display(0x00,0x7f);
  TM1637_display(0x01,0x7f);
  TM1637_display(0x02,0x7f);
  TM1637_display(0x03,0x7f);
}
void TM1637_init(uint8_t DispType,uint8_t Clk, uint8_t Data)// инициализирует переменные, назначает порт и пины для связи с дисплеем, а потом чистит дисплей
{
	Clkpin = Clk;
	Datapin = Data;
	TMPORT |= (1<<Clkpin) | (1<<Datapin);
	_DispType = DispType;
	BlankingFlag = 1;
	DecPoint = 3;
	TM1637_clearDisplay();
}
void TM1637_set(uint8_t brightness,uint8_t SetData,uint8_t SetAddr)// по большому счету только для установки яркости нужна
{
  Cmd_SetData = SetData;
  Cmd_SetAddr = SetAddr;
  Cmd_DispCtrl = 0x88 + brightness;
}
void TM1637_point(uint8_t PointFlag)//не знаю зачем скопировал, пусть будет
{
  _PointFlag = PointFlag;
}

