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
L AVR-ISP-10 CON1
U 1 1 5C459AD1
P 2500 1550
F 0 "CON1" H 2330 1880 50  0000 C CNN
F 1 "AVR-ISP-10" H 2160 1220 50  0000 L BNN
F 2 "Connectors:IDC_Header_Straight_10pins" V 1750 1600 50  0001 C CNN
F 3 "" H 2500 1550 50  0001 C CNN
	1    2500 1550
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x06_Female J1
U 1 1 5C459B43
P 1050 1450
F 0 "J1" H 1050 1750 50  0000 C CNN
F 1 "Conn_01x06_Female" H 1050 1050 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 1050 1450 50  0001 C CNN
F 3 "" H 1050 1450 50  0001 C CNN
	1    1050 1450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1250 1250 1950 1250
Wire Wire Line
	1950 1250 1950 1350
Wire Wire Line
	1950 1350 2300 1350
Wire Wire Line
	1250 1350 1750 1350
Wire Wire Line
	1750 1350 1750 1550
Wire Wire Line
	1750 1550 2300 1550
Wire Wire Line
	1250 1450 1700 1450
Wire Wire Line
	1700 1450 1700 1650
Wire Wire Line
	1700 1650 2300 1650
Wire Wire Line
	1250 1550 1650 1550
Wire Wire Line
	1650 1550 1650 1750
Wire Wire Line
	1650 1750 2300 1750
Wire Wire Line
	1250 1750 1250 2000
Wire Wire Line
	1250 2000 2850 2000
Wire Wire Line
	2850 2000 2850 1750
Wire Wire Line
	2850 1750 2550 1750
Wire Wire Line
	2550 1350 2550 1050
Wire Wire Line
	2550 1050 1500 1050
Wire Wire Line
	1500 1050 1500 1650
Wire Wire Line
	1500 1650 1250 1650
$EndSCHEMATC
