#include <avr/io.h>
#include <inttypes.h>

#include "hd44780i2c.h"


static int init_lcd()
{
    uint8_t LCD;
    // 4bit mode
    LCD=(1<<LCD_D5)|(1<<LCD_E); write_i2c((I2C_ADR_PCF8574<<1), LCD);
    LCD&=~(1<<LCD_E); write_i2c((I2C_ADR_PCF8574<<1), LCD);

    _delay_ms(50);

    send_lcd(0x28,CMD); // mode: 4bit, 2 lines
    send_lcd(LCD_OFF,CMD);
    send_lcd(LCD_CLEAR,CMD);
    send_lcd(0x06,CMD); // seek mode: right
    //send_lcd(0x0f,CMD); // display ON, Blink ON, Position ON
    send_lcd(0x0c,CMD); // display ON, Blink OFF, Position OFF
    return 0;
}

static int print_lcd(char* str)
{
    uint8_t i=0;
    while(str[i] !=0 && i<255)
        send_lcd(str[i++],DTA);

    return i;
};

// for 4bit mode
static int  send_lcd(uint8_t value, uint8_t mode)
{
    uint8_t LCD;

    LCD=(value & 0xF0)|(mode<<LCD_RS)|(1<<LCD_E)|(1<<LCD_BL); write_i2c((I2C_ADR_PCF8574<<1), LCD);
    LCD&=~(1<<LCD_E); write_i2c((I2C_ADR_PCF8574<<1), LCD);
    _delay_us(10);

    LCD=(value<<4)|(mode<<LCD_RS)|(1<<LCD_E)|(1<<LCD_BL); write_i2c((I2C_ADR_PCF8574<<1), LCD);
    LCD&=~(1<<LCD_E); write_i2c((I2C_ADR_PCF8574<<1), LCD);

    if (value == 0x01)
        _delay_ms(50);
    else
        _delay_us(50);

    return 0;
}
static int print_number(int number){  // display hex number on LCD followed by a space
    static const uint8_t symbol[16] ="0123456789ABCDEF";
    uint8_t n;
    char i;
    for(i=12;i>=0;i=i-4){
        n= (number>>i) & 0xf;
    if (n<16)
        send_lcd(symbol[n],DTA);
    };
    return 0;
}

// I2C /////////////////////////////////////////////////////////////////////////
static uint8_t write_i2c(uint8_t ADR, uint8_t value) {
   uint8_t ret;
    if (start_i2c(ADR) != ERROR)
    {
        ret=send_i2c(value);
        stop_i2c();
    } else {
       stop_i2c();
       ret=ERROR;
    }
    return ret;
}

uint8_t send_i2c(uint8_t value)
{
     TWDR = value;
     TWCR = (1<<TWINT) | (1<<TWEN);
     // wail until transmission completed and ACK/NACK has been received
     while(!(TWCR & (1<<TWINT)));
     // check value of TWI Status Register. Mask prescaler bits.

     value = TWSR & 0xF8;
     return (value == MT_SLA_ACK || value == MT_DATA_ACK) ? SUCCESS : ERROR;
}

static uint8_t start_i2c(uint8_t d_adr)
{
     TWCR=(1<<TWINT) | (1<<TWSTA) | (1<<TWEN); // START
     while (!(TWCR & (1<<TWINT)));

     uint8_t twst = (TWSR & 0xF8); // check value of TWI Status Register. Mask prescaler bits.

     return ((twst != START) && (twst != REP_START)) ? ERROR : send_i2c(d_adr);
};

static inline void stop_i2c()
{
     TWCR=(1<<TWINT) | (1<<TWEN) | (1<<TWSTO);
}

