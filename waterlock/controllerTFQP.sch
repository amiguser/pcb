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
Sheet 1 2
Title "Water leak protection"
Date ""
Rev ""
Comp "Amiguser Ltd"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ATMEGA8-16PU U1
U 1 1 5B7A7279
P 3150 2350
F 0 "U1" H 2400 3650 50  0000 L BNN
F 1 "ATMEGA8-16PU" H 3650 900 50  0000 L BNN
F 2 "Housings_QFP:TQFP-32_7x7mm_Pitch0.8mm" H 3150 2350 50  0001 C CIN
F 3 "" H 3150 2350 50  0001 C CNN
	1    3150 2350
	1    0    0    -1  
$EndComp
$Comp
L L293D U3
U 1 1 5B7A7312
P 6800 2000
F 0 "U3" H 6600 3025 50  0000 R CNN
F 1 "L293D" H 6600 2950 50  0000 R CNN
F 2 "Housings_DIP:DIP-16_W7.62mm" H 7050 1250 50  0001 L CNN
F 3 "" H 6500 2700 50  0001 C CNN
	1    6800 2000
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x02 J3
U 1 1 5B7A7357
P 8600 1300
F 0 "J3" H 8600 1400 50  0000 C CNN
F 1 "m1" H 8600 1100 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Philmore_TB132_02x5mm_Straight" H 8600 1300 50  0001 C CNN
F 3 "" H 8600 1300 50  0001 C CNN
	1    8600 1300
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x02 J4
U 1 1 5B7A7664
P 8600 2050
F 0 "J4" H 8600 2150 50  0000 C CNN
F 1 "m2" H 8600 1850 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Philmore_TB132_02x5mm_Straight" H 8600 2050 50  0001 C CNN
F 3 "" H 8600 2050 50  0001 C CNN
	1    8600 2050
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x02 J2
U 1 1 5B7A7726
P 9050 700
F 0 "J2" H 9050 800 50  0000 C CNN
F 1 "v12" H 9050 500 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Philmore_TB132_02x5mm_Straight" H 9050 700 50  0001 C CNN
F 3 "" H 9050 700 50  0001 C CNN
	1    9050 700 
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x02 J1
U 1 1 5B7A7765
P 6600 4750
F 0 "J1" H 6600 4850 50  0000 C CNN
F 1 "v5" H 6600 4550 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Philmore_TB132_02x5mm_Straight" H 6600 4750 50  0001 C CNN
F 3 "" H 6600 4750 50  0001 C CNN
	1    6600 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 1400 8000 1400
Wire Wire Line
	8000 1400 8000 1300
Wire Wire Line
	8000 1300 8400 1300
Wire Wire Line
	8400 1400 8150 1400
Wire Wire Line
	8150 1400 8150 1600
Wire Wire Line
	8150 1600 7300 1600
Wire Wire Line
	7300 2000 8400 2000
Wire Wire Line
	8400 2000 8400 2050
Wire Wire Line
	8400 2150 7300 2150
Wire Wire Line
	7300 2150 7300 2200
$Comp
L GND #PWR01
U 1 1 5B7A7AAC
P 6600 3050
F 0 "#PWR01" H 6600 2800 50  0001 C CNN
F 1 "GND" H 6600 2900 50  0000 C CNN
F 2 "" H 6600 3050 50  0001 C CNN
F 3 "" H 6600 3050 50  0001 C CNN
	1    6600 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 2800 6700 2800
Wire Wire Line
	6900 2800 7000 2800
Wire Wire Line
	6600 3000 7950 3000
Wire Wire Line
	6950 3500 6950 2800
Connection ~ 6950 2800
Connection ~ 6600 3000
Wire Wire Line
	6600 2900 6600 3050
Wire Wire Line
	6600 2900 6650 2900
Wire Wire Line
	6650 2900 6650 2800
Connection ~ 6650 2800
$Comp
L +5V #PWR02
U 1 1 5B7A7CE0
P 4550 650
F 0 "#PWR02" H 4550 500 50  0001 C CNN
F 1 "+5V" H 4550 790 50  0000 C CNN
F 2 "" H 4550 650 50  0001 C CNN
F 3 "" H 4550 650 50  0001 C CNN
	1    4550 650 
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 1000 6900 700 
Wire Wire Line
	4550 1000 6700 1000
Wire Wire Line
	4550 650  4550 1000
$Comp
L GND #PWR03
U 1 1 5B7A7EFE
P 8150 800
F 0 "#PWR03" H 8150 550 50  0001 C CNN
F 1 "GND" H 8150 650 50  0000 C CNN
F 2 "" H 8150 800 50  0001 C CNN
F 3 "" H 8150 800 50  0001 C CNN
	1    8150 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 800  8150 800 
Wire Wire Line
	3150 950  4550 950 
Connection ~ 4550 950 
Wire Wire Line
	4150 1250 4600 1250
Wire Wire Line
	4800 1400 6300 1400
Wire Wire Line
	4800 1600 6300 1600
Wire Wire Line
	4150 1350 4600 1350
Wire Wire Line
	4150 1450 4600 1450
Wire Wire Line
	4800 1800 6300 1800
Wire Wire Line
	4800 2000 6300 2000
Wire Wire Line
	4150 1550 4600 1550
Wire Wire Line
	4150 1650 4600 1650
Wire Wire Line
	4800 2200 6300 2200
Wire Wire Line
	4800 2400 6300 2400
Wire Wire Line
	4150 1750 4600 1750
$Comp
L Conn_01x02 J5
U 1 1 5B7C0A46
P 9050 4950
F 0 "J5" H 9050 5050 50  0000 C CNN
F 1 "Battery" H 9050 4750 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Philmore_TB132_02x5mm_Straight" H 9050 4950 50  0001 C CNN
F 3 "" H 9050 4950 50  0001 C CNN
	1    9050 4950
	1    0    0    -1  
$EndComp
$Comp
L D_Small_ALT D2
U 1 1 5B7C139B
P 8500 4950
F 0 "D2" H 8450 5030 50  0000 L CNN
F 1 "1N" H 8350 4870 50  0000 L CNN
F 2 "Diodes_SMD:D_SMA_Handsoldering" V 8500 4950 50  0001 C CNN
F 3 "" V 8500 4950 50  0001 C CNN
	1    8500 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6900 700  8850 700 
Wire Wire Line
	8050 4650 8050 4950
Wire Wire Line
	8050 4950 8400 4950
Wire Wire Line
	8600 4950 8850 4950
$Comp
L GND #PWR04
U 1 1 5B7C1985
P 8600 5050
F 0 "#PWR04" H 8600 4800 50  0001 C CNN
F 1 "GND" H 8600 4900 50  0000 C CNN
F 2 "" H 8600 5050 50  0001 C CNN
F 3 "" H 8600 5050 50  0001 C CNN
	1    8600 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 5050 8850 5050
Connection ~ 4550 650 
$Comp
L GND #PWR05
U 1 1 5B7E4EA7
P 3150 4300
F 0 "#PWR05" H 3150 4050 50  0001 C CNN
F 1 "GND" H 3150 4150 50  0000 C CNN
F 2 "" H 3150 4300 50  0001 C CNN
F 3 "" H 3150 4300 50  0001 C CNN
	1    3150 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 3850 3150 4300
$Comp
L R R1
U 1 1 5B7E5F9C
P 1850 1000
F 0 "R1" V 1930 1000 50  0000 C CNN
F 1 "10k" V 1850 1000 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 1780 1000 50  0001 C CNN
F 3 "" H 1850 1000 50  0001 C CNN
	1    1850 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 1250 1850 1250
Wire Wire Line
	1850 1250 1850 1150
Wire Wire Line
	1850 850  4550 850 
Connection ~ 4550 850 
Text Label 4200 1750 0    60   ~ 0
SCK
Text Label 4200 1650 0    60   ~ 0
MISO
Text Label 4200 1550 0    60   ~ 0
MOSI
Text Label 1950 1250 0    60   ~ 0
RESET
Wire Wire Line
	600  1700 1300 1700
Text Label 750  1700 0    60   ~ 0
MOSI
Wire Wire Line
	550  1800 1300 1800
Wire Wire Line
	550  1900 1300 1900
Wire Wire Line
	550  2000 1300 2000
Wire Wire Line
	1750 1650 1750 2450
$Comp
L GND #PWR06
U 1 1 5B7E721D
P 1750 2450
F 0 "#PWR06" H 1750 2200 50  0001 C CNN
F 1 "GND" H 1750 2300 50  0000 C CNN
F 2 "" H 1750 2450 50  0001 C CNN
F 3 "" H 1750 2450 50  0001 C CNN
	1    1750 2450
	1    0    0    -1  
$EndComp
Connection ~ 1750 1800
Connection ~ 1750 1900
Connection ~ 1750 2000
Text Label 600  1800 0    60   ~ 0
RESET
Text Label 600  1900 0    60   ~ 0
SCK
Text Label 650  2000 0    60   ~ 0
MISO
Wire Wire Line
	1650 650  1650 1600
Wire Wire Line
	1650 1450 2250 1450
Connection ~ 1650 1450
Wire Wire Line
	1750 1650 2250 1650
Connection ~ 1750 1700
Wire Bus Line
	4700 1100 4700 3950
Wire Bus Line
	4700 3950 9350 3950
Entry Wire Line
	4600 1950 4700 1850
Entry Wire Line
	4600 2050 4700 1950
Entry Wire Line
	4600 2150 4700 2050
Entry Wire Line
	4600 2250 4700 2150
Wire Wire Line
	4150 1950 4600 1950
Text Label 4250 1950 0    60   ~ 0
Line1
Wire Wire Line
	4150 2050 4600 2050
Wire Wire Line
	4600 2150 4150 2150
Wire Wire Line
	4150 2250 4600 2250
Text Label 4250 2050 0    60   ~ 0
Line2
Text Label 4250 2150 0    60   ~ 0
pwr_c1
Text Label 4250 2250 0    60   ~ 0
pwr_c2
Connection ~ 8750 4950
Wire Wire Line
	8750 5300 8750 5050
Connection ~ 8750 5050
Wire Wire Line
	8550 4600 8550 4800
Wire Wire Line
	8550 4800 8750 4800
Wire Wire Line
	8750 4800 8750 4950
Entry Wire Line
	8900 4050 9000 3950
Wire Wire Line
	8900 4050 8900 4600
Text Label 8900 4250 0    60   ~ 0
pwr_c1
Connection ~ 8750 5300
$Comp
L Conn_01x02 J6
U 1 1 5B842E64
P 5500 2800
F 0 "J6" H 5500 2900 50  0000 C CNN
F 1 "L1" H 5500 2600 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Philmore_TB132_02x5mm_Straight" H 5500 2800 50  0001 C CNN
F 3 "" H 5500 2800 50  0001 C CNN
	1    5500 2800
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x02 J7
U 1 1 5B842F5F
P 5500 3250
F 0 "J7" H 5500 3350 50  0000 C CNN
F 1 "L2" H 5500 3050 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Philmore_TB132_02x5mm_Straight" H 5500 3250 50  0001 C CNN
F 3 "" H 5500 3250 50  0001 C CNN
	1    5500 3250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 5B84307B
P 5750 3550
F 0 "#PWR07" H 5750 3300 50  0001 C CNN
F 1 "GND" H 5750 3400 50  0000 C CNN
F 2 "" H 5750 3550 50  0001 C CNN
F 3 "" H 5750 3550 50  0001 C CNN
	1    5750 3550
	1    0    0    -1  
$EndComp
Entry Wire Line
	4700 2900 4800 2800
Entry Wire Line
	4700 3350 4800 3250
Wire Wire Line
	4800 2800 5300 2800
Wire Wire Line
	4800 3250 5300 3250
Wire Wire Line
	5300 2900 5300 3100
Wire Wire Line
	5300 3100 5750 3100
Wire Wire Line
	5750 3100 5750 3550
Wire Wire Line
	5300 3350 5300 3500
Wire Wire Line
	5300 3500 5750 3500
Connection ~ 5750 3500
Text Label 4800 2800 0    60   ~ 0
Line1
Text Label 4800 3250 0    60   ~ 0
Line2
Entry Wire Line
	4600 2650 4700 2550
Entry Wire Line
	4600 2750 4700 2650
Entry Wire Line
	4600 2850 4700 2750
Entry Wire Line
	4600 2950 4700 2850
Entry Wire Line
	4600 3050 4700 2950
Entry Wire Line
	4600 3150 4700 3050
Entry Wire Line
	4600 3250 4700 3150
Entry Wire Line
	4600 3350 4700 3250
Entry Wire Line
	4600 1250 4700 1150
Entry Wire Line
	4600 1350 4700 1250
Entry Wire Line
	4600 1450 4700 1350
Entry Wire Line
	4600 1550 4700 1450
Entry Wire Line
	4600 1650 4700 1550
Entry Wire Line
	4600 1750 4700 1650
Entry Wire Line
	4700 2500 4800 2400
Entry Wire Line
	4700 2300 4800 2200
Entry Wire Line
	4700 2100 4800 2000
Entry Wire Line
	4700 1900 4800 1800
Entry Wire Line
	4700 1700 4800 1600
Entry Wire Line
	4700 1500 4800 1400
Text Label 4850 1400 0    60   ~ 0
m1a
Text Label 4850 1600 0    60   ~ 0
m2a
Text Label 4850 1800 0    60   ~ 0
en12
Text Label 4850 2000 0    60   ~ 0
m3a
Text Label 4850 2200 0    60   ~ 0
m4a
Text Label 4850 2400 0    60   ~ 0
en34
Wire Wire Line
	4150 2850 4600 2850
Wire Wire Line
	4150 2950 4600 2950
Wire Wire Line
	4150 3050 4600 3050
Wire Wire Line
	4150 3150 4600 3150
Wire Wire Line
	4600 3250 4150 3250
Wire Wire Line
	4150 3350 4600 3350
Text Label 4250 3050 0    60   ~ 0
en12
Text Label 4250 3350 0    60   ~ 0
en34
$Comp
L SW_Push SW1
U 1 1 5B8477B2
P 6550 3500
F 0 "SW1" H 6600 3600 50  0000 L CNN
F 1 "Turn" H 6550 3440 50  0000 C CNN
F 2 "Buttons_Switches_THT:SW_Tactile_SPST_Angled_PTS645Vx39-2LFS" H 6550 3700 50  0001 C CNN
F 3 "" H 6550 3700 50  0001 C CNN
	1    6550 3500
	1    0    0    -1  
$EndComp
$Comp
L LED_Small_ALT D4
U 1 1 5B847959
P 7800 4350
F 0 "D4" H 7750 4475 50  0000 L CNN
F 1 "Flooding" H 7625 4250 50  0000 L CNN
F 2 "LEDs:LED_D3.0mm" V 7800 4350 50  0001 C CNN
F 3 "" V 7800 4350 50  0001 C CNN
	1    7800 4350
	0    -1   -1   0   
$EndComp
$Comp
L LED_Small_ALT D3
U 1 1 5B847A2C
P 7450 4350
F 0 "D3" H 7400 4475 50  0000 L CNN
F 1 "LowBatt" H 7275 4250 50  0000 L CNN
F 2 "LEDs:LED_D3.0mm" V 7450 4350 50  0001 C CNN
F 3 "" V 7450 4350 50  0001 C CNN
	1    7450 4350
	0    -1   -1   0   
$EndComp
$Comp
L R R5
U 1 1 5B847EAD
P 7450 4700
F 0 "R5" V 7530 4700 50  0000 C CNN
F 1 "10k" V 7450 4700 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7380 4700 50  0001 C CNN
F 3 "" H 7450 4700 50  0001 C CNN
	1    7450 4700
	1    0    0    -1  
$EndComp
$Comp
L R R6
U 1 1 5B848129
P 7800 4700
F 0 "R6" V 7880 4700 50  0000 C CNN
F 1 "10k" V 7800 4700 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 7730 4700 50  0001 C CNN
F 3 "" H 7800 4700 50  0001 C CNN
	1    7800 4700
	1    0    0    -1  
$EndComp
Entry Wire Line
	7450 4050 7550 3950
Entry Wire Line
	7800 4050 7900 3950
$Comp
L Buzzer BZ1
U 1 1 5B848332
P 7650 3450
F 0 "BZ1" H 7800 3500 50  0000 L CNN
F 1 "Buzzer" H 7800 3400 50  0000 L CNN
F 2 "Buzzers_Beepers:Buzzer_12x9.5RM7.6" V 7625 3550 50  0001 C CNN
F 3 "" V 7625 3550 50  0001 C CNN
	1    7650 3450
	0    -1   -1   0   
$EndComp
Entry Wire Line
	7450 3950 7550 3850
Wire Wire Line
	7550 3550 7550 3850
Wire Wire Line
	7750 3550 7950 3550
Wire Wire Line
	7950 3550 7950 3000
Connection ~ 6950 3000
Wire Wire Line
	7800 4050 7800 4250
Wire Wire Line
	7450 4050 7450 4250
Wire Wire Line
	7450 4450 7450 4550
Wire Wire Line
	7800 4450 7800 4550
Wire Wire Line
	7450 4850 7450 5300
Connection ~ 7450 5300
Wire Wire Line
	7800 5300 7800 4850
Connection ~ 7800 5300
Wire Wire Line
	6750 3500 6950 3500
$Comp
L +5V #PWR08
U 1 1 5B84FD26
P 6200 3050
F 0 "#PWR08" H 6200 2900 50  0001 C CNN
F 1 "+5V" H 6200 3190 50  0000 C CNN
F 2 "" H 6200 3050 50  0001 C CNN
F 3 "" H 6200 3050 50  0001 C CNN
	1    6200 3050
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 5B84FD7F
P 6200 3300
F 0 "R4" V 6280 3300 50  0000 C CNN
F 1 "10k" V 6200 3300 50  0000 C CNN
F 2 "Resistors_SMD:R_1206_HandSoldering" V 6130 3300 50  0001 C CNN
F 3 "" H 6200 3300 50  0001 C CNN
	1    6200 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 3050 6200 3150
Wire Wire Line
	6200 3450 6200 3850
Wire Wire Line
	6200 3500 6350 3500
Text Label 4200 1250 0    60   ~ 0
btn_1
Text Label 4200 1350 0    60   ~ 0
buzz
Wire Bus Line
	2050 1900 2050 3900
Wire Bus Line
	2050 3900 4700 3900
Entry Wire Line
	2050 2050 2150 1950
Entry Wire Line
	2050 2250 2150 2150
Wire Wire Line
	2250 1950 2150 1950
Wire Wire Line
	2150 2150 2250 2150
Entry Wire Line
	6000 3950 6100 3850
Wire Wire Line
	6200 3850 6100 3850
Connection ~ 6200 3500
Text Label 6200 3750 0    60   ~ 0
btn_1
Text Label 7550 3750 0    60   ~ 0
buzz
Text Label 7450 4150 0    60   ~ 0
led1
Text Label 7800 4150 0    60   ~ 0
led2
Text Label 2150 1950 0    60   ~ 0
led1
Text Label 2150 2150 0    60   ~ 0
led2
$Comp
L C_Small C3
U 1 1 5B853C25
P 1800 1450
F 0 "C3" H 1810 1520 50  0000 L CNN
F 1 "10m" H 1810 1370 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 1800 1450 50  0001 C CNN
F 3 "" H 1800 1450 50  0001 C CNN
	1    1800 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 1550 1800 1650
Connection ~ 1800 1650
Wire Wire Line
	1800 1350 1650 1350
Connection ~ 1650 1350
Text Label 4250 3150 0    60   ~ 0
m4a
Text Label 4250 3250 0    60   ~ 0
m3a
Text Label 4250 2850 0    60   ~ 0
m1a
Text Label 4250 2950 0    60   ~ 0
m2a
$Comp
L C_Small C1
U 1 1 5B9F9468
P 6700 3700
F 0 "C1" H 6710 3770 50  0000 L CNN
F 1 "10m" H 6710 3620 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 6700 3700 50  0001 C CNN
F 3 "" H 6700 3700 50  0001 C CNN
	1    6700 3700
	0    1    1    0   
$EndComp
Wire Wire Line
	6800 3700 6800 3500
Connection ~ 6800 3500
Wire Wire Line
	6600 3700 6200 3700
Connection ~ 6200 3700
Wire Wire Line
	2250 1550 2100 1550
Wire Wire Line
	2100 1550 2100 1450
Connection ~ 2100 1450
$Comp
L Conn_01x06 J8
U 1 1 5BF4071F
P 1500 1900
F 0 "J8" H 1500 2200 50  0000 C CNN
F 1 "Conn_01x06" H 1500 1500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 1500 1900 50  0001 C CNN
F 3 "" H 1500 1900 50  0001 C CNN
	1    1500 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 1600 1200 1600
Wire Wire Line
	1200 1600 1200 2100
Wire Wire Line
	1200 2100 1300 2100
Wire Wire Line
	1300 2200 1300 2400
Wire Wire Line
	1300 2400 1750 2400
Connection ~ 1750 2400
$Comp
L Conn_01x02 J10
U 1 1 5BFE94F1
P 8900 2800
F 0 "J10" H 8900 2900 50  0000 C CNN
F 1 "m1-sensor" H 8900 2600 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Philmore_TB132_02x5mm_Straight" H 8900 2800 50  0001 C CNN
F 3 "" H 8900 2800 50  0001 C CNN
	1    8900 2800
	-1   0    0    1   
$EndComp
$Comp
L Conn_01x02 J9
U 1 1 5BFE95A9
P 8900 2500
F 0 "J9" H 8900 2600 50  0000 C CNN
F 1 "m2-sensor" H 8900 2300 50  0000 C CNN
F 2 "Connectors_Terminal_Blocks:TerminalBlock_Philmore_TB132_02x5mm_Straight" H 8900 2500 50  0001 C CNN
F 3 "" H 8900 2500 50  0001 C CNN
	1    8900 2500
	-1   0    0    1   
$EndComp
$Sheet
S 9850 2250 1200 1400
U 5BFF3A10
F0 "Postion_control" 60
F1 "file5BFF3A0F.sch" 60
F2 "Left_pos_sens_1" I L 9850 2400 60 
F3 "Left_pos_sens_2" I L 9850 2700 60 
F4 "Right_pos_sens_2" I L 9850 2850 60 
F5 "Right_pos_sens_1" I L 9850 2550 60 
F6 "Left_pos_read_1" I L 9850 3050 60 
F7 "Left_pos_read_2" I L 9850 3350 60 
F8 "Right_pos_read_2" I L 9850 3500 60 
F9 "Right_pos_read_1" I L 9850 3200 60 
$EndSheet
Wire Wire Line
	9100 2400 9850 2400
Wire Wire Line
	9100 2500 9700 2500
Wire Wire Line
	9700 2500 9700 2550
Wire Wire Line
	9700 2550 9850 2550
Wire Wire Line
	9100 2700 9850 2700
Wire Wire Line
	9100 2800 9500 2800
Wire Wire Line
	9500 2800 9500 2850
Wire Wire Line
	9500 2850 9850 2850
Wire Bus Line
	9000 3950 8900 3950
Wire Bus Line
	9350 3950 9350 2900
Text Label 4200 1450 0    60   ~ 0
SS
Entry Wire Line
	9350 2950 9450 3050
Entry Wire Line
	9350 3100 9450 3200
Entry Wire Line
	9350 3250 9450 3350
Entry Wire Line
	9350 3400 9450 3500
Wire Wire Line
	9450 3050 9850 3050
Wire Wire Line
	9450 3200 9850 3200
Wire Wire Line
	9450 3350 9850 3350
Wire Wire Line
	9450 3500 9850 3500
Text Label 9550 3050 0    60   ~ 0
SS
Text Label 9550 3200 0    60   ~ 0
MOSI
Text Label 9550 3350 0    60   ~ 0
MISO
Text Label 9550 3500 0    60   ~ 0
SCK
Wire Wire Line
	8900 4600 8550 4600
$Comp
L +5V #PWR09
U 1 1 5C00CCE2
P 8050 4650
F 0 "#PWR09" H 8050 4500 50  0001 C CNN
F 1 "+5V" H 8050 4790 50  0000 C CNN
F 2 "" H 8050 4650 50  0001 C CNN
F 3 "" H 8050 4650 50  0001 C CNN
	1    8050 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 5300 9250 5300
Wire Wire Line
	1650 650  5200 650 
$Comp
L +5V #PWR010
U 1 1 5C01C902
P 5750 4550
F 0 "#PWR010" H 5750 4400 50  0001 C CNN
F 1 "+5V" H 5750 4690 50  0000 C CNN
F 2 "" H 5750 4550 50  0001 C CNN
F 3 "" H 5750 4550 50  0001 C CNN
	1    5750 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 4850 6400 5300
Connection ~ 6400 5300
$Comp
L D_Small_ALT D1
U 1 1 5C01E897
P 5900 4750
F 0 "D1" H 5850 4830 50  0000 L CNN
F 1 "1N" H 5750 4670 50  0000 L CNN
F 2 "Diodes_SMD:D_SMA_Handsoldering" V 5900 4750 50  0001 C CNN
F 3 "" V 5900 4750 50  0001 C CNN
	1    5900 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 4550 5750 4750
Wire Wire Line
	5750 4750 5800 4750
Wire Wire Line
	6000 4750 6400 4750
Entry Wire Line
	6100 3950 6200 4050
Wire Wire Line
	6200 4050 6200 4750
Connection ~ 6200 4750
Text Label 6200 4200 0    60   ~ 0
pwr_c2
$EndSCHEMATC
