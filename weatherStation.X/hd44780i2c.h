/* 
 * File:   hd44780i2c.с
 * Author: mih
 *
 * Created on 30 апреля 2019 г., 9:47
 */

#ifndef HD44780I2C_H
#define	HD44780I2C_H

#ifdef	__cplusplus
extern "C" {
#endif

    
// LCD HD44780
#define LCD_RS  PD0
#define LCD_RW  PD1
#define LCD_E   PD2
#define LCD_BL  PD3
#define LCD_D4  PD4
#define LCD_D5  PD5
#define LCD_D6  PD6
#define LCD_D7  PD7

#define LCD_CLEAR       0x01
#define LCD_OFF         0x08
#define LCD_ON          0x0C
#define LCD_RETURN      0x02

//General Master staus codes
#define START       0x08    //START has been transmitted
#define REP_START   0x10
#define MT_DATA_ACK 0x28
#define MT_SLA_ACK  0x18

#define CMD 0 // command
#define DTA 1 // data

//Master Transmitter staus codes
#define MT_ADR_ACK  0x18    //SLA+W has been tramsmitted and ACK received
#define MT_ADR_NACK 0x20    //SLA+W has been tramsmitted and NACK received

#define MT_DATA_ACK 0x28    //Data byte has been tramsmitted and ACK received
#define MT_DATA_NACK 0x30   //Data byte has been tramsmitted and NACK received
#define MT_ARB_LOST 0x38    //Arbitration lost in SLA+W or data bytes

#define WRITE       0x00
#define READ        0x01

#define READ_END    0x01
#define READ_NOEND  0x00

#define ERROR       0x01
#define SUCCESS     0x00

#define I2C_ADR_PCF8574 0x27


    

// I2C
static uint8_t send_i2c(uint8_t value);
static uint8_t start_i2c(uint8_t d_adr);
static inline void stop_i2c();
static uint8_t write_i2c(uint8_t ADR, uint8_t value);
/// LCD
static int  send_lcd(uint8_t value, uint8_t mode);
static int print_lcd(char* str);
static int init_lcd();
static int print_number(int number);


#ifdef	__cplusplus
}
#endif

#endif	/* HD44780I2C_H */

