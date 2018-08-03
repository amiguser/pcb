EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:maxim
LIBS:MyLibrary
LIBS:tiny_timer01-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ATTINY13-20SSU U2
U 1 1 5AAF593F
P 8300 1500
F 0 "U2" H 7500 1900 50  0000 C CNN
F 1 "ATTINY13-20SSU" H 8950 1100 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 8900 1500 50  0001 C CIN
F 3 "" H 7500 1850 50  0001 C CNN
	1    8300 1500
	1    0    0    -1  
$EndComp
$Comp
L +5VA #PWR01
U 1 1 5AAF59CE
P 9550 850
F 0 "#PWR01" H 9550 700 50  0001 C CNN
F 1 "+5VA" H 9550 990 50  0000 C CNN
F 2 "" H 9550 850 50  0001 C CNN
F 3 "" H 9550 850 50  0001 C CNN
	1    9550 850 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 5AAF5A0B
P 9650 2050
F 0 "#PWR02" H 9650 1800 50  0001 C CNN
F 1 "GND" H 9650 1900 50  0000 C CNN
F 2 "" H 9650 2050 50  0001 C CNN
F 3 "" H 9650 2050 50  0001 C CNN
	1    9650 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9300 1250 9550 1250
Wire Wire Line
	9550 1250 9550 850 
Wire Wire Line
	9300 1750 9650 1750
Wire Wire Line
	9650 1750 9650 2050
$Comp
L GND #PWR03
U 1 1 5AAF5B40
P 5400 2400
F 0 "#PWR03" H 5400 2150 50  0001 C CNN
F 1 "GND" H 5400 2250 50  0000 C CNN
F 2 "" H 5400 2400 50  0001 C CNN
F 3 "" H 5400 2400 50  0001 C CNN
	1    5400 2400
	1    0    0    -1  
$EndComp
$Comp
L +5VA #PWR04
U 1 1 5AAF5B51
P 5400 750
F 0 "#PWR04" H 5400 600 50  0001 C CNN
F 1 "+5VA" H 5400 890 50  0000 C CNN
F 2 "" H 5400 750 50  0001 C CNN
F 3 "" H 5400 750 50  0001 C CNN
	1    5400 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 750  5400 1050
Wire Wire Line
	5400 2250 5400 2400
$Comp
L Crystal_Small Y1
U 1 1 5AAF5BB3
P 4400 1950
F 0 "Y1" H 4400 2050 50  0000 C CNN
F 1 "Crystal_Small" H 4400 1850 50  0000 C CNN
F 2 "Crystals:Crystal_C38-LF_d3.0mm_l8.0mm_Horizontal_1EP_style2" H 4400 1950 50  0001 C CNN
F 3 "" H 4400 1950 50  0001 C CNN
	1    4400 1950
	0    1    1    0   
$EndComp
Text GLabel 4400 1350 0    60   Input ~ 0
rtc_SCL
Text GLabel 4400 1550 0    60   Input ~ 0
rtc_SDA
Text GLabel 7050 1350 0    60   Input ~ 0
rtc_SCL
Text GLabel 7000 1250 0    60   Input ~ 0
rtc_SDA
Wire Wire Line
	7300 1250 7000 1250
Wire Wire Line
	7050 1350 7300 1350
Wire Wire Line
	6100 1350 6000 1350
Wire Wire Line
	4400 1350 4800 1350
Wire Wire Line
	4800 1550 4400 1550
Wire Wire Line
	4400 1850 4800 1850
Wire Wire Line
	4800 2050 4400 2050
$Comp
L Battery_Cell BT1
U 1 1 5AAF5CD2
P 6250 2150
F 0 "BT1" H 6350 2250 50  0000 L CNN
F 1 "Battery_Cell" H 6350 2150 50  0000 L CNN
F 2 "Batteries:BATTCOM_20MM_PTH" V 6250 2210 50  0001 C CNN
F 3 "" V 6250 2210 50  0001 C CNN
	1    6250 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 1950 6250 1950
Wire Wire Line
	6250 2250 5400 2250
Connection ~ 5400 2250
$Comp
L DS1307+ U1
U 1 1 5AAF5D5F
P 5400 1650
F 0 "U1" H 5670 2200 50  0000 C CNN
F 1 "DS1307+" H 5700 1100 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 5400 1650 50  0001 C CNN
F 3 "" H 5400 1650 50  0001 C CNN
	1    5400 1650
	1    0    0    -1  
$EndComp
$Comp
L TM1637Module D1
U 1 1 5AAF5E4C
P 7900 2950
F 0 "D1" H 8050 3300 60  0000 C CNN
F 1 "TM1637Module" H 8250 2600 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 8250 2600 60  0001 C CNN
F 3 "" H 8250 2600 60  0001 C CNN
	1    7900 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 3450 9450 3450
Wire Wire Line
	9450 3450 9450 1750
Connection ~ 9450 1750
$Comp
L +5VA #PWR05
U 1 1 5AAF5F7D
P 7900 2350
F 0 "#PWR05" H 7900 2200 50  0001 C CNN
F 1 "+5VA" H 7900 2490 50  0000 C CNN
F 2 "" H 7900 2350 50  0001 C CNN
F 3 "" H 7900 2350 50  0001 C CNN
	1    7900 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 2350 7900 2450
Text GLabel 7150 2800 0    60   Input ~ 0
disp_clk
Text GLabel 7150 3100 0    60   Input ~ 0
disp_dio
Text GLabel 7050 1450 0    60   Input ~ 0
disp_clk
Text GLabel 7050 1550 0    60   Input ~ 0
disp_dio
Wire Wire Line
	7050 1450 7300 1450
Wire Wire Line
	7300 1550 7050 1550
Wire Wire Line
	7150 2800 7350 2800
Wire Wire Line
	7350 3100 7150 3100
Text GLabel 6900 1650 0    60   Input ~ 0
relay
Wire Wire Line
	6900 1650 7300 1650
$EndSCHEMATC
