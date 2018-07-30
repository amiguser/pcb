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
LIBS:v01-cache
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
L NE555 U1
U 1 1 5AD32F3B
P 3050 2100
F 0 "U1" H 2650 2450 50  0000 L CNN
F 1 "NE555" H 3150 2450 50  0000 L CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 3050 2100 50  0001 C CNN
F 3 "" H 3050 2100 50  0001 C CNN
	1    3050 2100
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5AD33170
P 3950 2100
F 0 "R2" V 4030 2100 50  0000 C CNN
F 1 "100k" V 3950 2100 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 3880 2100 50  0001 C CNN
F 3 "" H 3950 2100 50  0001 C CNN
	1    3950 2100
	0    1    1    0   
$EndComp
$Comp
L +BATT #PWR1
U 1 1 5AD331AD
P 3000 1200
F 0 "#PWR1" H 3000 1050 50  0001 C CNN
F 1 "+BATT" H 3000 1340 50  0000 C CNN
F 2 "" H 3000 1200 50  0001 C CNN
F 3 "" H 3000 1200 50  0001 C CNN
	1    3000 1200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR2
U 1 1 5AD331CD
P 3100 3000
F 0 "#PWR2" H 3100 2750 50  0001 C CNN
F 1 "GND" H 3100 2850 50  0000 C CNN
F 2 "" H 3100 3000 50  0001 C CNN
F 3 "" H 3100 3000 50  0001 C CNN
	1    3100 3000
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5AD3327C
P 4250 1450
F 0 "R3" V 4330 1450 50  0000 C CNN
F 1 "1k" V 4250 1450 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 4180 1450 50  0001 C CNN
F 3 "" H 4250 1450 50  0001 C CNN
	1    4250 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	3000 1200 3000 1700
Wire Wire Line
	3000 1700 3050 1700
Wire Wire Line
	2150 2300 2550 2300
Wire Wire Line
	2150 1800 2150 2300
Wire Wire Line
	2150 1800 2550 1800
Wire Wire Line
	2550 1800 2550 1450
Wire Wire Line
	2550 1450 3000 1450
Connection ~ 3000 1450
Wire Wire Line
	3050 2500 3050 3000
Wire Wire Line
	3050 3000 3100 3000
Wire Wire Line
	3550 2100 3800 2100
Wire Wire Line
	4100 2300 3550 2300
Wire Wire Line
	4100 2000 4100 2300
Wire Wire Line
	2550 1900 2550 2000
Wire Wire Line
	2550 2000 4100 2000
Connection ~ 4100 2100
$Comp
L Buzzer BZ1
U 1 1 5AD33404
P 3850 1450
F 0 "BZ1" H 4000 1500 50  0000 L CNN
F 1 "Buzzer" H 4000 1400 50  0000 L CNN
F 2 "Buzzers_Beepers:Buzzer_12x9.5RM7.6" V 3825 1550 50  0001 C CNN
F 3 "" V 3825 1550 50  0001 C CNN
	1    3850 1450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3950 1550 3950 1900
Wire Wire Line
	3950 1900 3550 1900
Wire Wire Line
	3000 1550 3750 1550
Connection ~ 3000 1550
$Comp
L CP C1
U 1 1 5AD334B7
P 3750 2600
F 0 "C1" H 3775 2700 50  0000 L CNN
F 1 "2.2mkF" H 3775 2500 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D5.0mm_P2.50mm" H 3788 2450 50  0001 C CNN
F 3 "" H 3750 2600 50  0001 C CNN
	1    3750 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 2450 3750 2300
Connection ~ 3750 2300
Wire Wire Line
	1550 2750 3750 2750
Connection ~ 3050 2750
$Comp
L Conn_01x02 J1
U 1 1 5AD33522
P 4600 1800
F 0 "J1" H 4600 1900 50  0000 C CNN
F 1 "Conn_01x02" H 4600 1600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 4600 1800 50  0001 C CNN
F 3 "" H 4600 1800 50  0001 C CNN
	1    4600 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 1450 4400 1800
Wire Wire Line
	4100 1250 4100 1450
Connection ~ 3000 1250
Wire Wire Line
	4400 1900 4100 1900
Wire Wire Line
	4100 1900 4100 1950
Wire Wire Line
	4100 1950 3700 1950
Wire Wire Line
	3700 1950 3700 2100
Connection ~ 3700 2100
$Comp
L Battery BT1
U 1 1 5AD35C68
P 1550 1850
F 0 "BT1" H 1650 1950 50  0000 L CNN
F 1 "Battery" H 1650 1850 50  0000 L CNN
F 2 "Battery_Holders:Keystone_2479_3xAAA" V 1550 1910 50  0001 C CNN
F 3 "" V 1550 1910 50  0001 C CNN
	1    1550 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 2050 1550 2750
$Comp
L Jack-DC J2
U 1 1 5AD3609B
P 400 1850
F 0 "J2" H 400 2060 50  0000 C CNN
F 1 "Jack-DC" H 400 1675 50  0000 C CNN
F 2 "Connectors:JACK_ALIM" H 450 1810 50  0001 C CNN
F 3 "" H 450 1810 50  0001 C CNN
	1    400  1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  1950 700  2200
Wire Wire Line
	700  2200 1550 2200
Connection ~ 1550 2200
$Comp
L D_Schottky D2
U 1 1 5AD36B33
P 1550 1500
F 0 "D2" H 1550 1600 50  0000 C CNN
F 1 "D_Schottky" H 1550 1400 50  0000 C CNN
F 2 "Diodes_SMD:D_SMB_Handsoldering" H 1550 1500 50  0001 C CNN
F 3 "" H 1550 1500 50  0001 C CNN
	1    1550 1500
	0    1    1    0   
$EndComp
$Comp
L D_Schottky D1
U 1 1 5AD3764E
P 1400 1050
F 0 "D1" H 1400 1150 50  0000 C CNN
F 1 "D_Schottky" H 1400 950 50  0000 C CNN
F 2 "Diodes_SMD:D_SMB_Handsoldering" H 1400 1050 50  0001 C CNN
F 3 "" H 1400 1050 50  0001 C CNN
	1    1400 1050
	-1   0    0    1   
$EndComp
Wire Wire Line
	1550 1050 1550 1350
Wire Wire Line
	1550 1250 4100 1250
Connection ~ 1550 1250
Connection ~ 1550 1650
$Comp
L LM1117-5.0 U2
U 1 1 5AD87594
P 850 1050
F 0 "U2" H 700 1175 50  0000 C CNN
F 1 "LM1117-5.0" H 850 1175 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-223" H 850 1050 50  0001 C CNN
F 3 "" H 850 1050 50  0001 C CNN
	1    850  1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 1050 1250 1050
Wire Wire Line
	850  1350 850  2200
Connection ~ 850  2200
Wire Wire Line
	700  1750 700  1450
Wire Wire Line
	700  1450 550  1450
Wire Wire Line
	550  1450 550  1050
$Comp
L Conn_01x02 J3
U 1 1 5AD87E20
P 1000 1900
F 0 "J3" H 1000 2000 50  0000 C CNN
F 1 "Conn_01x02" H 1000 1700 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 1000 1900 50  0001 C CNN
F 3 "" H 1000 1900 50  0001 C CNN
	1    1000 1900
	-1   0    0    1   
$EndComp
Wire Wire Line
	1200 1800 1200 1650
Wire Wire Line
	1200 1650 1550 1650
Wire Wire Line
	1200 1900 1200 2200
Connection ~ 1200 2200
$EndSCHEMATC
