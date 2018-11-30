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
LIBS:controllerTFQP-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Connection ~ 1950 1600
Wire Wire Line
	2250 1000 2250 900 
Wire Wire Line
	2250 1400 2250 1300
Connection ~ 2250 2000
Wire Wire Line
	1950 2000 2250 2000
Wire Wire Line
	2250 1800 2250 2050
Wire Wire Line
	1950 1600 1800 1600
Wire Wire Line
	1950 1700 1950 1600
$Comp
L GND #PWR011
U 1 1 5BFF4FC7
P 2250 2050
F 0 "#PWR011" H 2250 1800 50  0001 C CNN
F 1 "GND" H 2250 1900 50  0000 C CNN
F 2 "" H 2250 2050 50  0001 C CNN
F 3 "" H 2250 2050 50  0001 C CNN
	1    2250 2050
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR012
U 1 1 5BFF4FCD
P 2250 900
F 0 "#PWR012" H 2250 750 50  0001 C CNN
F 1 "+5V" H 2250 1040 50  0000 C CNN
F 2 "" H 2250 900 50  0001 C CNN
F 3 "" H 2250 900 50  0001 C CNN
	1    2250 900 
	1    0    0    -1  
$EndComp
$Comp
L R R9
U 1 1 5BFF4FD3
P 2250 1150
F 0 "R9" V 2330 1150 50  0000 C CNN
F 1 "1k" V 2250 1150 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 2180 1150 50  0001 C CNN
F 3 "" H 2250 1150 50  0001 C CNN
	1    2250 1150
	-1   0    0    1   
$EndComp
$Comp
L R R7
U 1 1 5BFF4FDA
P 1950 1850
F 0 "R7" V 2030 1850 50  0000 C CNN
F 1 "10k" V 1950 1850 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 1880 1850 50  0001 C CNN
F 3 "" H 1950 1850 50  0001 C CNN
	1    1950 1850
	-1   0    0    1   
$EndComp
$Comp
L R R2
U 1 1 5BFF4FE1
P 1650 1600
F 0 "R2" V 1730 1600 50  0000 C CNN
F 1 "10k" V 1650 1600 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 1580 1600 50  0001 C CNN
F 3 "" H 1650 1600 50  0001 C CNN
	1    1650 1600
	0    1    1    0   
$EndComp
$Comp
L 2SC1945 Q1
U 1 1 5BFF4FE8
P 2150 1600
F 0 "Q1" H 2350 1675 50  0000 L CNN
F 1 "2SC1945" H 2350 1600 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:TSOT-23" H 2350 1525 50  0001 L CIN
F 3 "" H 2150 1600 50  0001 L CNN
	1    2150 1600
	1    0    0    -1  
$EndComp
Connection ~ 1950 3450
Wire Wire Line
	2250 2850 2250 2750
Wire Wire Line
	2250 3250 2250 3150
Connection ~ 2250 3850
Wire Wire Line
	1950 3850 2250 3850
Wire Wire Line
	2250 3650 2250 3900
Wire Wire Line
	1950 3450 1800 3450
Wire Wire Line
	1950 3550 1950 3450
$Comp
L GND #PWR013
U 1 1 5BFF520B
P 2250 3900
F 0 "#PWR013" H 2250 3650 50  0001 C CNN
F 1 "GND" H 2250 3750 50  0000 C CNN
F 2 "" H 2250 3900 50  0001 C CNN
F 3 "" H 2250 3900 50  0001 C CNN
	1    2250 3900
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR014
U 1 1 5BFF5211
P 2250 2750
F 0 "#PWR014" H 2250 2600 50  0001 C CNN
F 1 "+5V" H 2250 2890 50  0000 C CNN
F 2 "" H 2250 2750 50  0001 C CNN
F 3 "" H 2250 2750 50  0001 C CNN
	1    2250 2750
	1    0    0    -1  
$EndComp
$Comp
L R R10
U 1 1 5BFF5217
P 2250 3000
F 0 "R10" V 2330 3000 50  0000 C CNN
F 1 "1k" V 2250 3000 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 2180 3000 50  0001 C CNN
F 3 "" H 2250 3000 50  0001 C CNN
	1    2250 3000
	-1   0    0    1   
$EndComp
$Comp
L R R8
U 1 1 5BFF521E
P 1950 3700
F 0 "R8" V 2030 3700 50  0000 C CNN
F 1 "10k" V 1950 3700 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 1880 3700 50  0001 C CNN
F 3 "" H 1950 3700 50  0001 C CNN
	1    1950 3700
	-1   0    0    1   
$EndComp
$Comp
L R R3
U 1 1 5BFF5225
P 1650 3450
F 0 "R3" V 1730 3450 50  0000 C CNN
F 1 "10k" V 1650 3450 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 1580 3450 50  0001 C CNN
F 3 "" H 1650 3450 50  0001 C CNN
	1    1650 3450
	0    1    1    0   
$EndComp
$Comp
L 2SC1945 Q2
U 1 1 5BFF522C
P 2150 3450
F 0 "Q2" H 2350 3525 50  0000 L CNN
F 1 "2SC1945" H 2350 3450 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:TSOT-23" H 2350 3375 50  0001 L CIN
F 3 "" H 2150 3450 50  0001 L CNN
	1    2150 3450
	1    0    0    -1  
$EndComp
Connection ~ 4500 1650
Wire Wire Line
	4800 1050 4800 950 
Wire Wire Line
	4800 1450 4800 1350
Connection ~ 4800 2050
Wire Wire Line
	4500 2050 4800 2050
Wire Wire Line
	4800 1850 4800 2100
Wire Wire Line
	4500 1650 4350 1650
Wire Wire Line
	4500 1750 4500 1650
$Comp
L GND #PWR015
U 1 1 5BFF5413
P 4800 2100
F 0 "#PWR015" H 4800 1850 50  0001 C CNN
F 1 "GND" H 4800 1950 50  0000 C CNN
F 2 "" H 4800 2100 50  0001 C CNN
F 3 "" H 4800 2100 50  0001 C CNN
	1    4800 2100
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR016
U 1 1 5BFF5419
P 4800 950
F 0 "#PWR016" H 4800 800 50  0001 C CNN
F 1 "+5V" H 4800 1090 50  0000 C CNN
F 2 "" H 4800 950 50  0001 C CNN
F 3 "" H 4800 950 50  0001 C CNN
	1    4800 950 
	1    0    0    -1  
$EndComp
$Comp
L R R15
U 1 1 5BFF541F
P 4800 1200
F 0 "R15" V 4880 1200 50  0000 C CNN
F 1 "1k" V 4800 1200 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 4730 1200 50  0001 C CNN
F 3 "" H 4800 1200 50  0001 C CNN
	1    4800 1200
	-1   0    0    1   
$EndComp
$Comp
L R R13
U 1 1 5BFF5426
P 4500 1900
F 0 "R13" V 4580 1900 50  0000 C CNN
F 1 "10k" V 4500 1900 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 4430 1900 50  0001 C CNN
F 3 "" H 4500 1900 50  0001 C CNN
	1    4500 1900
	-1   0    0    1   
$EndComp
$Comp
L R R11
U 1 1 5BFF542D
P 4200 1650
F 0 "R11" V 4280 1650 50  0000 C CNN
F 1 "10k" V 4200 1650 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 4130 1650 50  0001 C CNN
F 3 "" H 4200 1650 50  0001 C CNN
	1    4200 1650
	0    1    1    0   
$EndComp
$Comp
L 2SC1945 Q3
U 1 1 5BFF5434
P 4700 1650
F 0 "Q3" H 4900 1725 50  0000 L CNN
F 1 "2SC1945" H 4900 1650 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:TSOT-23" H 4900 1575 50  0001 L CIN
F 3 "" H 4700 1650 50  0001 L CNN
	1    4700 1650
	1    0    0    -1  
$EndComp
Connection ~ 4500 3550
Wire Wire Line
	4800 2950 4800 2850
Wire Wire Line
	4800 3350 4800 3250
Connection ~ 4800 3950
Wire Wire Line
	4500 3950 4800 3950
Wire Wire Line
	4800 3750 4800 4000
Wire Wire Line
	4500 3550 4350 3550
Wire Wire Line
	4500 3650 4500 3550
$Comp
L GND #PWR017
U 1 1 5BFF562F
P 4800 4000
F 0 "#PWR017" H 4800 3750 50  0001 C CNN
F 1 "GND" H 4800 3850 50  0000 C CNN
F 2 "" H 4800 4000 50  0001 C CNN
F 3 "" H 4800 4000 50  0001 C CNN
	1    4800 4000
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR018
U 1 1 5BFF5635
P 4800 2850
F 0 "#PWR018" H 4800 2700 50  0001 C CNN
F 1 "+5V" H 4800 2990 50  0000 C CNN
F 2 "" H 4800 2850 50  0001 C CNN
F 3 "" H 4800 2850 50  0001 C CNN
	1    4800 2850
	1    0    0    -1  
$EndComp
$Comp
L R R16
U 1 1 5BFF563B
P 4800 3100
F 0 "R16" V 4880 3100 50  0000 C CNN
F 1 "1k" V 4800 3100 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 4730 3100 50  0001 C CNN
F 3 "" H 4800 3100 50  0001 C CNN
	1    4800 3100
	-1   0    0    1   
$EndComp
$Comp
L R R14
U 1 1 5BFF5642
P 4500 3800
F 0 "R14" V 4580 3800 50  0000 C CNN
F 1 "10k" V 4500 3800 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 4430 3800 50  0001 C CNN
F 3 "" H 4500 3800 50  0001 C CNN
	1    4500 3800
	-1   0    0    1   
$EndComp
$Comp
L R R12
U 1 1 5BFF5649
P 4200 3550
F 0 "R12" V 4280 3550 50  0000 C CNN
F 1 "10k" V 4200 3550 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 4130 3550 50  0001 C CNN
F 3 "" H 4200 3550 50  0001 C CNN
	1    4200 3550
	0    1    1    0   
$EndComp
$Comp
L 2SC1945 Q4
U 1 1 5BFF5650
P 4700 3550
F 0 "Q4" H 4900 3625 50  0000 L CNN
F 1 "2SC1945" H 4900 3550 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:TSOT-23" H 4900 3475 50  0001 L CIN
F 3 "" H 4700 3550 50  0001 L CNN
	1    4700 3550
	1    0    0    -1  
$EndComp
Text HLabel 1350 1600 0    60   Input ~ 0
Left_pos_sens_1
Text HLabel 1350 3450 0    60   Input ~ 0
Left_pos_sens_2
Text HLabel 3900 3550 0    60   Input ~ 0
Right_pos_sens_2
Text HLabel 3900 1650 0    60   Input ~ 0
Right_pos_sens_1
Wire Wire Line
	1350 1600 1500 1600
Wire Wire Line
	3900 1650 4050 1650
Wire Wire Line
	3900 3550 4050 3550
Wire Wire Line
	1500 3450 1350 3450
Text HLabel 1350 1300 0    60   Input ~ 0
Left_pos_read_1
Text HLabel 1350 3150 0    60   Input ~ 0
Left_pos_read_2
Text HLabel 3850 3250 0    60   Input ~ 0
Right_pos_read_2
Text HLabel 3900 1350 0    60   Input ~ 0
Right_pos_read_1
Wire Wire Line
	4800 1350 3900 1350
Wire Wire Line
	4800 3250 3850 3250
Wire Wire Line
	2250 3150 1350 3150
Wire Wire Line
	2250 1300 1350 1300
Connection ~ 4800 1350
Connection ~ 4800 3250
Connection ~ 2250 3150
Connection ~ 2250 1300
$EndSCHEMATC
