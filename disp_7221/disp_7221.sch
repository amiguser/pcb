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
LIBS:Maxim_By_element14_Batch_1
LIBS:MyLibrary
LIBS:disp_7221-cache
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
L CA56-12EWA U2
U 1 1 5A8516ED
P 7100 1550
F 0 "U2" H 6150 2000 50  0000 C CNN
F 1 "CA56-12EWA" H 7930 2000 50  0000 C CNN
F 2 "Displays_7-Segment:Cx56-12" H 7100 950 50  0001 C CNN
F 3 "" H 6720 1580 50  0001 C CNN
	1    7100 1550
	1    0    0    -1  
$EndComp
$Comp
L MAX7221CWG+ U1
U 1 1 5A851F96
P 3100 2850
F 0 "U1" H 2897 3942 45  0000 L BNN
F 1 "MAX7221CWG+" H 2851 1513 45  0000 L BNN
F 2 "Housings_SOIC:SOIC-24_7.5x15.4mm_Pitch1.27mm" H 3130 3000 20  0001 C CNN
F 3 "" H 3100 2850 60  0001 C CNN
	1    3100 2850
	1    0    0    -1  
$EndComp
Text GLabel 4150 2250 2    60   Input ~ 0
seg_a
Text GLabel 4150 2350 2    60   Input ~ 0
seg_b
Text GLabel 4150 2450 2    60   Input ~ 0
seg_c
Text GLabel 4150 2550 2    60   Input ~ 0
seg_d
Text GLabel 4150 2650 2    60   Input ~ 0
seg_e
Text GLabel 4150 2750 2    60   Input ~ 0
seg_f
Text GLabel 4150 2850 2    60   Input ~ 0
seg_g
Text GLabel 4150 2950 2    60   Input ~ 0
seg_dp
Text GLabel 5850 1250 0    60   Input ~ 0
seg_a
Text GLabel 5850 1350 0    60   Input ~ 0
seg_b
Text GLabel 5850 1450 0    60   Input ~ 0
seg_c
Text GLabel 5850 1550 0    60   Input ~ 0
seg_d
Text GLabel 5850 1650 0    60   Input ~ 0
seg_e
Text GLabel 5850 1750 0    60   Input ~ 0
seg_f
Text GLabel 5850 1850 0    60   Input ~ 0
seg_g
Text GLabel 5850 1950 0    60   Input ~ 0
seg_dp
Wire Wire Line
	6000 1250 5850 1250
Wire Wire Line
	5850 1350 6000 1350
Wire Wire Line
	6000 1450 5850 1450
Wire Wire Line
	5850 1550 6000 1550
Wire Wire Line
	6000 1650 5850 1650
Wire Wire Line
	5850 1750 6000 1750
Wire Wire Line
	6000 1850 5850 1850
Wire Wire Line
	5850 1950 6000 1950
Wire Wire Line
	4150 2250 3800 2250
Wire Wire Line
	4150 2350 3800 2350
Wire Wire Line
	3800 2450 4150 2450
Wire Wire Line
	4150 2550 3800 2550
Wire Wire Line
	3800 2650 4150 2650
Wire Wire Line
	4150 2750 3800 2750
Wire Wire Line
	3800 2850 4150 2850
Wire Wire Line
	4150 2950 3800 2950
Text GLabel 8500 1650 2    60   Input ~ 0
dig_0
Text GLabel 8500 1750 2    60   Input ~ 0
dig_1
Text GLabel 8500 1850 2    60   Input ~ 0
dig_2
Text GLabel 8500 1950 2    60   Input ~ 0
dig_3
Wire Wire Line
	8500 1650 8300 1650
Wire Wire Line
	8300 1750 8500 1750
Wire Wire Line
	8500 1850 8300 1850
Wire Wire Line
	8300 1950 8500 1950
Text GLabel 4000 3150 2    60   Input ~ 0
dig_0
Text GLabel 4000 3850 2    60   Input ~ 0
dig_1
Text GLabel 4000 3450 2    60   Input ~ 0
dig_2
Text GLabel 4000 3550 2    60   Input ~ 0
dig_3
Wire Wire Line
	4000 3150 3800 3150
Wire Wire Line
	3800 3450 4000 3450
$Comp
L Conn_01x05 J1
U 1 1 5A85281B
P 1350 2250
F 0 "J1" H 1350 2550 50  0000 C CNN
F 1 "Conn_01x05" H 1350 1950 50  0000 C CNN
F 2 "Connectors_Molex:Molex_KK-6410-05_05x2.54mm_Straight" H 1350 2250 50  0001 C CNN
F 3 "" H 1350 2250 50  0001 C CNN
	1    1350 2250
	-1   0    0    1   
$EndComp
Wire Wire Line
	1550 2050 2400 2050
Wire Wire Line
	2400 2950 2400 2850
Wire Wire Line
	2400 2850 1550 2850
Wire Wire Line
	1550 2450 1550 3150
Wire Wire Line
	2400 2250 2200 2250
Wire Wire Line
	2200 2250 2200 2150
Wire Wire Line
	2200 2150 1550 2150
Wire Wire Line
	2050 2350 2400 2350
Wire Wire Line
	2050 2350 2050 2250
Wire Wire Line
	2050 2250 1550 2250
Wire Wire Line
	1550 2350 1950 2350
Wire Wire Line
	1950 2350 1950 2550
Wire Wire Line
	1950 2550 2400 2550
$Comp
L R R1
U 1 1 5A852B49
P 2150 2650
F 0 "R1" V 2230 2650 50  0000 C CNN
F 1 "22k" V 2150 2650 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2080 2650 50  0001 C CNN
F 3 "" H 2150 2650 50  0001 C CNN
	1    2150 2650
	0    1    1    0   
$EndComp
Wire Wire Line
	2300 2650 2400 2650
Connection ~ 2400 2850
NoConn ~ 3800 2050
$Comp
L GND #PWR01
U 1 1 5A8535A0
P 1550 3150
F 0 "#PWR01" H 1550 2900 50  0001 C CNN
F 1 "GND" H 1550 3000 50  0000 C CNN
F 2 "" H 1550 3150 50  0001 C CNN
F 3 "" H 1550 3150 50  0001 C CNN
	1    1550 3150
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR02
U 1 1 5A853624
P 1650 1500
F 0 "#PWR02" H 1650 1350 50  0001 C CNN
F 1 "VCC" H 1650 1650 50  0000 C CNN
F 2 "" H 1650 1500 50  0001 C CNN
F 3 "" H 1650 1500 50  0001 C CNN
	1    1650 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 1500 1650 2050
Connection ~ 1650 2050
Connection ~ 1550 2850
Wire Wire Line
	2000 2650 2000 2050
Connection ~ 2000 2050
Wire Wire Line
	4000 3550 3800 3550
Wire Wire Line
	4000 3850 3800 3850
NoConn ~ 3800 3250
NoConn ~ 3800 3350
NoConn ~ 3800 3650
NoConn ~ 3800 3750
$EndSCHEMATC
