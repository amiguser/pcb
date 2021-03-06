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
Sheet 3 3
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
L PC817 U4
U 1 1 5C1B52B4
P 2650 1300
F 0 "U4" H 2450 1500 50  0000 L CNN
F 1 "PC817" H 2650 1500 50  0000 L CNN
F 2 "Housings_DIP:DIP-4_W7.62mm" H 2450 1100 50  0001 L CIN
F 3 "" H 2650 1300 50  0001 L CNN
	1    2650 1300
	-1   0    0    1   
$EndComp
$Comp
L R_Small R7
U 1 1 5C1B53F5
P 2150 1500
F 0 "R7" H 2180 1520 50  0000 L CNN
F 1 "10k" H 2180 1460 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 2150 1500 50  0001 C CNN
F 3 "" H 2150 1500 50  0001 C CNN
	1    2150 1500
	1    0    0    -1  
$EndComp
$Comp
L R_Small R9
U 1 1 5C1B5492
P 3150 1400
F 0 "R9" H 3180 1420 50  0000 L CNN
F 1 "1k" H 3180 1360 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 3150 1400 50  0001 C CNN
F 3 "" H 3150 1400 50  0001 C CNN
	1    3150 1400
	0    1    1    0   
$EndComp
$Comp
L D_Schottky D7
U 1 1 5C1B54EB
P 3200 1200
F 0 "D7" H 3200 1300 50  0000 C CNN
F 1 "D_Schottky" H 3200 1100 50  0000 C CNN
F 2 "Diodes_THT:D_DO-15_P10.16mm_Horizontal" H 3200 1200 50  0001 C CNN
F 3 "" H 3200 1200 50  0001 C CNN
	1    3200 1200
	-1   0    0    1   
$EndComp
Wire Wire Line
	3050 1200 2950 1200
Wire Wire Line
	2950 1400 3050 1400
Wire Wire Line
	2350 1400 2150 1400
Text HLabel 1450 1100 0    60   Input ~ 0
GND
Text HLabel 1450 1250 0    60   Input ~ 0
d1sensor
Text HLabel 3700 1200 2    60   Input ~ 0
m1black
Text HLabel 3700 1350 2    60   Input ~ 0
m1sensor
Wire Wire Line
	1450 1100 2350 1100
Wire Wire Line
	2350 1100 2350 1200
Wire Wire Line
	1450 1250 2250 1250
Wire Wire Line
	2250 1250 2250 1400
Connection ~ 2250 1400
Wire Wire Line
	3350 1200 3700 1200
Wire Wire Line
	3250 1400 3550 1400
Wire Wire Line
	3550 1400 3550 1350
Wire Wire Line
	3550 1350 3700 1350
$Comp
L PC817 U5
U 1 1 5C1B9293
P 2700 2600
F 0 "U5" H 2500 2800 50  0000 L CNN
F 1 "PC817" H 2700 2800 50  0000 L CNN
F 2 "Housings_DIP:DIP-4_W7.62mm" H 2500 2400 50  0001 L CIN
F 3 "" H 2700 2600 50  0001 L CNN
	1    2700 2600
	-1   0    0    1   
$EndComp
$Comp
L R_Small R8
U 1 1 5C1B929A
P 2200 2800
F 0 "R8" H 2230 2820 50  0000 L CNN
F 1 "10k" H 2230 2760 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 2200 2800 50  0001 C CNN
F 3 "" H 2200 2800 50  0001 C CNN
	1    2200 2800
	1    0    0    -1  
$EndComp
$Comp
L R_Small R10
U 1 1 5C1B92A1
P 3200 2700
F 0 "R10" H 3230 2720 50  0000 L CNN
F 1 "1k" H 3230 2660 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 3200 2700 50  0001 C CNN
F 3 "" H 3200 2700 50  0001 C CNN
	1    3200 2700
	0    1    1    0   
$EndComp
$Comp
L D_Schottky D8
U 1 1 5C1B92A8
P 3250 2500
F 0 "D8" H 3250 2600 50  0000 C CNN
F 1 "D_Schottky" H 3250 2400 50  0000 C CNN
F 2 "Diodes_THT:D_DO-15_P10.16mm_Horizontal" H 3250 2500 50  0001 C CNN
F 3 "" H 3250 2500 50  0001 C CNN
	1    3250 2500
	-1   0    0    1   
$EndComp
Wire Wire Line
	3100 2500 3000 2500
Wire Wire Line
	3000 2700 3100 2700
Wire Wire Line
	2400 2700 2200 2700
Text HLabel 1500 2400 0    60   Input ~ 0
GND
Text HLabel 1500 2550 0    60   Input ~ 0
d2sensor
Text HLabel 3750 2500 2    60   Input ~ 0
m2black
Text HLabel 3750 2650 2    60   Input ~ 0
m2sensor
Wire Wire Line
	1500 2400 2400 2400
Wire Wire Line
	2400 2400 2400 2500
Wire Wire Line
	1500 2550 2300 2550
Wire Wire Line
	2300 2550 2300 2700
Connection ~ 2300 2700
Wire Wire Line
	3400 2500 3750 2500
Wire Wire Line
	3300 2700 3600 2700
Wire Wire Line
	3600 2700 3600 2650
Wire Wire Line
	3600 2650 3750 2650
Wire Wire Line
	2150 1600 1400 1600
Wire Wire Line
	1400 1600 1400 1550
Wire Wire Line
	1450 2900 2200 2900
Text HLabel 1250 1550 0    60   Input ~ 0
vcc-in
Wire Wire Line
	1400 1550 1250 1550
Wire Wire Line
	1700 2900 1700 1600
Connection ~ 1700 1600
Connection ~ 1700 2900
$EndSCHEMATC
