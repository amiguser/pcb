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
LIBS:controllerTFQP-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
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
L DS1307+ U2
U 1 1 5C063A62
P 3350 1900
F 0 "U2" H 3620 2450 50  0000 C CNN
F 1 "DS1307+" H 3650 1350 50  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 3350 1900 50  0001 C CNN
F 3 "" H 3350 1900 50  0001 C CNN
	1    3350 1900
	1    0    0    -1  
$EndComp
Text HLabel 1400 1600 0    60   Input ~ 0
rtc_scl
Text HLabel 1400 1800 0    60   Input ~ 0
rtc_sda
$Comp
L Crystal_Small Y1
U 1 1 5C063B90
P 2400 2200
F 0 "Y1" H 2400 2300 50  0000 C CNN
F 1 "Crystal_Small" H 2400 2100 50  0000 C CNN
F 2 "Crystals:Crystal_C38-LF_d3.0mm_l8.0mm_Horizontal_1EP_style2" H 2400 2200 50  0001 C CNN
F 3 "" H 2400 2200 50  0001 C CNN
	1    2400 2200
	0    1    1    0   
$EndComp
Wire Wire Line
	2400 2100 2750 2100
Wire Wire Line
	2750 2300 2400 2300
Wire Wire Line
	1400 1600 2750 1600
Wire Wire Line
	2750 1800 1400 1800
Text HLabel 4700 2200 2    60   Input ~ 0
rtc_bat
$Comp
L +5V #PWR15
U 1 1 5C063BFA
P 3350 850
F 0 "#PWR15" H 3350 700 50  0001 C CNN
F 1 "+5V" H 3350 990 50  0000 C CNN
F 2 "" H 3350 850 50  0001 C CNN
F 3 "" H 3350 850 50  0001 C CNN
	1    3350 850 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR14
U 1 1 5C063C12
P 3050 2950
F 0 "#PWR14" H 3050 2700 50  0001 C CNN
F 1 "GND" H 3050 2800 50  0000 C CNN
F 2 "" H 3050 2950 50  0001 C CNN
F 3 "" H 3050 2950 50  0001 C CNN
	1    3050 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 2950 3350 2950
Wire Wire Line
	3350 2950 3350 2500
Wire Wire Line
	3350 850  3350 1300
$Comp
L D_ALT D5
U 1 1 5C0696C4
P 4150 2200
F 0 "D5" H 4150 2300 50  0000 C CNN
F 1 "D_ALT" H 4150 2100 50  0000 C CNN
F 2 "Diodes_SMD:D_SMA" H 4150 2200 50  0001 C CNN
F 3 "" H 4150 2200 50  0001 C CNN
	1    4150 2200
	1    0    0    -1  
$EndComp
$Comp
L D_ALT D6
U 1 1 5C06971E
P 4500 2200
F 0 "D6" H 4500 2300 50  0000 C CNN
F 1 "D_ALT" H 4500 2100 50  0000 C CNN
F 2 "Diodes_SMD:D_SMA" H 4500 2200 50  0001 C CNN
F 3 "" H 4500 2200 50  0001 C CNN
	1    4500 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 2200 4650 2200
Wire Wire Line
	4350 2200 4300 2200
Wire Wire Line
	4000 2200 3950 2200
$EndSCHEMATC
