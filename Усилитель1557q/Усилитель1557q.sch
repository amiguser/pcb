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
LIBS:interface
LIBS:digital-audio
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:Amplifier_Audio
LIBS:Audio
LIBS:MyLibrary
LIBS:Усилитель1557q-cache
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
L TDA1557Q U1
U 1 1 5B5ECE19
P 5600 2700
F 0 "U1" H 5100 3800 60  0000 C CNN
F 1 "TDA1557Q" H 5250 2200 60  0000 C CNN
F 2 "TO_SOT_Packages_THT:Multiwatt_15_Vertical" H 5250 2200 60  0001 C CNN
F 3 "" H 5250 2200 60  0001 C CNN
	1    5600 2700
	1    0    0    -1  
$EndComp
$Comp
L C_Small C1
U 1 1 5B5ECEA2
P 4550 1950
F 0 "C1" H 4560 2020 50  0000 L CNN
F 1 "0.22" H 4560 1870 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D11.0mm_W5.0mm_P7.50mm" H 4550 1950 50  0001 C CNN
F 3 "" H 4550 1950 50  0001 C CNN
	1    4550 1950
	0    1    1    0   
$EndComp
$Comp
L C_Small C3
U 1 1 5B5ECF20
P 5600 1050
F 0 "C3" H 5610 1120 50  0000 L CNN
F 1 "100nF" H 5610 970 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D11.0mm_W5.0mm_P7.50mm" H 5600 1050 50  0001 C CNN
F 3 "" H 5600 1050 50  0001 C CNN
	1    5600 1050
	0    -1   -1   0   
$EndComp
$Comp
L POT_Dual RV1
U 1 1 5B5ECFA4
P 3800 2100
F 0 "RV1" H 3800 2250 50  0000 C CNN
F 1 "POT_Dual" H 3800 2175 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Alps_RK163_Double_Vertical" H 4050 2025 50  0001 C CNN
F 3 "" H 4050 2025 50  0001 C CNN
	1    3800 2100
	0    1    1    0   
$EndComp
$Comp
L Conn_01x02_Female J3
U 1 1 5B5ED0D6
P 7100 1800
F 0 "J3" H 7100 1900 50  0000 C CNN
F 1 "OUT1" H 7100 1600 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-2pol" H 7100 1800 50  0001 C CNN
F 3 "" H 7100 1800 50  0001 C CNN
	1    7100 1800
	1    0    0    -1  
$EndComp
$Comp
L GNDPWR #PWR01
U 1 1 5B5ED18A
P 5650 3750
F 0 "#PWR01" H 5650 3550 50  0001 C CNN
F 1 "GNDPWR" H 5650 3620 50  0000 C CNN
F 2 "" H 5650 3700 50  0001 C CNN
F 3 "" H 5650 3700 50  0001 C CNN
	1    5650 3750
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x03_Female J1
U 1 1 5B5ED1F4
P 3000 2050
F 0 "J1" H 3000 2250 50  0000 C CNN
F 1 "INPUT" H 3000 1850 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-3pol" H 3000 2050 50  0001 C CNN
F 3 "" H 3000 2050 50  0001 C CNN
	1    3000 2050
	-1   0    0    1   
$EndComp
$Comp
L +12VA #PWR02
U 1 1 5B5ED31F
P 6250 1050
F 0 "#PWR02" H 6250 900 50  0001 C CNN
F 1 "+12VA" H 6250 1190 50  0000 C CNN
F 2 "" H 6250 1050 50  0001 C CNN
F 3 "" H 6250 1050 50  0001 C CNN
	1    6250 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 1050 6250 1050
Wire Wire Line
	6000 1300 6000 1050
Connection ~ 6000 1050
Wire Wire Line
	5750 1300 5750 1050
Connection ~ 5750 1050
Wire Wire Line
	6400 1800 6900 1800
Wire Wire Line
	6900 1900 6400 1900
Wire Wire Line
	6400 1900 6400 2000
Wire Wire Line
	6900 2950 6400 2950
Wire Wire Line
	6400 3150 6400 3050
Wire Wire Line
	6400 3050 6900 3050
Wire Wire Line
	5650 3500 5800 3500
Wire Wire Line
	5650 3750 5650 3500
Wire Wire Line
	4650 1950 4800 1950
Wire Wire Line
	4800 2200 4650 2200
$Comp
L C_Small C2
U 1 1 5B5ED76A
P 4550 2200
F 0 "C2" H 4560 2270 50  0000 L CNN
F 1 "0.22" H 4560 2120 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D11.0mm_W5.0mm_P7.50mm" H 4550 2200 50  0001 C CNN
F 3 "" H 4550 2200 50  0001 C CNN
	1    4550 2200
	0    1    1    0   
$EndComp
$Comp
L Conn_01x02_Female J4
U 1 1 5B5EDA0B
P 7100 2950
F 0 "J4" H 7100 3050 50  0000 C CNN
F 1 "OUT2" H 7100 2750 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-2pol" H 7100 2950 50  0001 C CNN
F 3 "" H 7100 2950 50  0001 C CNN
	1    7100 2950
	1    0    0    -1  
$EndComp
$Comp
L +12VA #PWR03
U 1 1 5B5EDCB5
P 6850 1050
F 0 "#PWR03" H 6850 900 50  0001 C CNN
F 1 "+12VA" H 6850 1190 50  0000 C CNN
F 2 "" H 6850 1050 50  0001 C CNN
F 3 "" H 6850 1050 50  0001 C CNN
	1    6850 1050
	1    0    0    -1  
$EndComp
$Comp
L GNDPWR #PWR04
U 1 1 5B5EDCE0
P 5150 1100
F 0 "#PWR04" H 5150 900 50  0001 C CNN
F 1 "GNDPWR" H 5150 970 50  0000 C CNN
F 2 "" H 5150 1050 50  0001 C CNN
F 3 "" H 5150 1050 50  0001 C CNN
	1    5150 1100
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x02_Female J2
U 1 1 5B5EDD46
P 6700 650
F 0 "J2" H 6700 750 50  0000 C CNN
F 1 "Power" H 6700 450 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Pheonix_MKDS1.5-2pol" H 6700 650 50  0001 C CNN
F 3 "" H 6700 650 50  0001 C CNN
	1    6700 650 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 1050 5500 1050
Wire Wire Line
	5150 650  5150 1100
Wire Wire Line
	6500 1050 6850 1050
Wire Wire Line
	6500 750  6500 1050
Wire Wire Line
	6500 650  5150 650 
Connection ~ 5150 1050
Wire Wire Line
	3200 1950 3350 1950
Wire Wire Line
	3350 1950 3350 1700
Wire Wire Line
	3350 1700 3700 1700
Wire Wire Line
	3200 2150 3700 2150
Wire Wire Line
	3700 2150 3700 2200
Wire Wire Line
	3200 2050 3700 2050
Wire Wire Line
	3700 2050 3700 2000
Wire Wire Line
	3450 2500 3900 2500
Wire Wire Line
	3450 2500 3450 2050
Connection ~ 3450 2050
Wire Wire Line
	4250 2350 4250 2200
Wire Wire Line
	4250 2200 4450 2200
Wire Wire Line
	4450 1850 4450 1950
Wire Wire Line
	4800 2450 3900 2450
Wire Wire Line
	3900 2450 3900 2500
Connection ~ 3700 2500
$Comp
L C_Small C4
U 1 1 5B5EEAC1
P 5600 800
F 0 "C4" H 5610 870 50  0000 L CNN
F 1 "4200mF" H 5610 720 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D13.0mm_P5.00mm" H 5600 800 50  0001 C CNN
F 3 "" H 5600 800 50  0001 C CNN
	1    5600 800 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5500 800  5300 800 
Wire Wire Line
	5300 800  5300 1050
Connection ~ 5300 1050
Wire Wire Line
	5700 800  6500 800 
Connection ~ 6500 800 
$Comp
L R_Small R2
U 1 1 5B74120C
P 4150 1850
F 0 "R2" H 4180 1870 50  0000 L CNN
F 1 "220k" H 4180 1810 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" H 4150 1850 50  0001 C CNN
F 3 "" H 4150 1850 50  0001 C CNN
	1    4150 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	4250 1850 4450 1850
Wire Wire Line
	4050 1850 3900 1850
$Comp
L R_Small R1
U 1 1 5B741358
P 4050 2350
F 0 "R1" H 4080 2370 50  0000 L CNN
F 1 "220k" H 4080 2310 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" H 4050 2350 50  0001 C CNN
F 3 "" H 4050 2350 50  0001 C CNN
	1    4050 2350
	0    1    1    0   
$EndComp
Wire Wire Line
	3900 2350 3950 2350
Wire Wire Line
	4150 2350 4250 2350
$EndSCHEMATC
