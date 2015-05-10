EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
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
LIBS:arduino
LIBS:DummyLoad-cache
EELAYER 24 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Dummy Load"
Date "10 mai 2015"
Rev "v1.0"
Comp "dinask.eu"
Comment1 "Based on D. Jones design https://youtu.be/8xX2SVcItOA"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L LM358 U2
U 1 1 554E13A7
P 6700 1650
F 0 "U2" H 6650 1850 60  0000 L CNN
F 1 "LM358" H 6650 1400 60  0000 L CNN
F 2 "" H 6700 1650 60  0000 C CNN
F 3 "" H 6700 1650 60  0000 C CNN
	1    6700 1650
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 554E1409
P 5600 1550
F 0 "R3" V 5680 1550 40  0000 C CNN
F 1 "10K" V 5607 1551 40  0000 C CNN
F 2 "" V 5530 1550 30  0000 C CNN
F 3 "" H 5600 1550 30  0000 C CNN
	1    5600 1550
	0    1    1    0   
$EndComp
$Comp
L C C1
U 1 1 554E143E
P 5850 1750
F 0 "C1" H 5850 1850 40  0000 L CNN
F 1 "10u" H 5856 1665 40  0000 L CNN
F 2 "" H 5888 1600 30  0000 C CNN
F 3 "" H 5850 1750 60  0000 C CNN
	1    5850 1750
	1    0    0    -1  
$EndComp
$Comp
L R R8
U 1 1 554E14AF
P 6500 2200
F 0 "R8" V 6580 2200 40  0000 C CNN
F 1 "10K" V 6507 2201 40  0000 C CNN
F 2 "" V 6430 2200 30  0000 C CNN
F 3 "" H 6500 2200 30  0000 C CNN
	1    6500 2200
	0    1    1    0   
$EndComp
$Comp
L R R6
U 1 1 554E152F
P 6250 2450
F 0 "R6" V 6330 2450 40  0000 C CNN
F 1 "10K" V 6257 2451 40  0000 C CNN
F 2 "" V 6180 2450 30  0000 C CNN
F 3 "" H 6250 2450 30  0000 C CNN
	1    6250 2450
	-1   0    0    1   
$EndComp
Wire Wire Line
	5850 1550 6200 1550
Wire Wire Line
	6200 1750 6200 2200
Wire Wire Line
	6200 2200 6250 2200
Wire Wire Line
	6750 2200 7200 2200
Wire Wire Line
	7200 2200 7200 1650
$Comp
L SW_PUSH SW1
U 1 1 554E15C0
P 1800 5850
F 0 "SW1" H 1950 5960 50  0000 C CNN
F 1 "SW_PUSH" H 1800 5770 50  0000 C CNN
F 2 "" H 1800 5850 60  0000 C CNN
F 3 "" H 1800 5850 60  0000 C CNN
	1    1800 5850
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 554E1635
P 1500 5600
F 0 "R1" V 1580 5600 40  0000 C CNN
F 1 "10K" V 1507 5601 40  0000 C CNN
F 2 "" V 1430 5600 30  0000 C CNN
F 3 "" H 1500 5600 30  0000 C CNN
	1    1500 5600
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR01
U 1 1 554E16BF
P 2100 6050
F 0 "#PWR01" H 2100 6050 30  0001 C CNN
F 1 "GND" H 2100 5980 30  0001 C CNN
F 2 "" H 2100 6050 60  0000 C CNN
F 3 "" H 2100 6050 60  0000 C CNN
	1    2100 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 5850 2100 6050
Wire Wire Line
	2100 5850 2300 5850
$Comp
L SW_PUSH SW2
U 1 1 554E17EC
P 1800 6800
F 0 "SW2" H 1950 6910 50  0000 C CNN
F 1 "SW_PUSH" H 1800 6720 50  0000 C CNN
F 2 "" H 1800 6800 60  0000 C CNN
F 3 "" H 1800 6800 60  0000 C CNN
	1    1800 6800
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 554E17F2
P 1500 6550
F 0 "R2" V 1580 6550 40  0000 C CNN
F 1 "10K" V 1507 6551 40  0000 C CNN
F 2 "" V 1430 6550 30  0000 C CNN
F 3 "" H 1500 6550 30  0000 C CNN
	1    1500 6550
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR02
U 1 1 554E17F8
P 2100 7000
F 0 "#PWR02" H 2100 7000 30  0001 C CNN
F 1 "GND" H 2100 6930 30  0001 C CNN
F 2 "" H 2100 7000 60  0000 C CNN
F 3 "" H 2100 7000 60  0000 C CNN
	1    2100 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 6800 2100 7000
Wire Wire Line
	2100 6800 2300 6800
$Comp
L +5V #PWR03
U 1 1 554E184A
P 1500 5350
F 0 "#PWR03" H 1500 5440 20  0001 C CNN
F 1 "+5V" H 1500 5440 30  0000 C CNN
F 2 "" H 1500 5350 60  0000 C CNN
F 3 "" H 1500 5350 60  0000 C CNN
	1    1500 5350
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR04
U 1 1 554E189B
P 1500 6300
F 0 "#PWR04" H 1500 6390 20  0001 C CNN
F 1 "+5V" H 1500 6390 30  0000 C CNN
F 2 "" H 1500 6300 60  0000 C CNN
F 3 "" H 1500 6300 60  0000 C CNN
	1    1500 6300
	1    0    0    -1  
$EndComp
Text Notes 1750 5650 0    60   ~ 0
UP
Text Notes 1700 6600 0    60   ~ 0
DOWN
$Comp
L LCD16X2 DS1
U 1 1 554E19AF
P 4600 5650
F 0 "DS1" H 3800 6050 40  0000 C CNN
F 1 "LCD16X2" H 5300 6050 40  0000 C CNN
F 2 "WC1602A" H 4600 5600 35  0000 C CIN
F 3 "" H 4600 5650 60  0000 C CNN
	1    4600 5650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 554E1BBE
P 3850 6550
F 0 "#PWR05" H 3850 6550 30  0001 C CNN
F 1 "GND" H 3850 6480 30  0001 C CNN
F 2 "" H 3850 6550 60  0000 C CNN
F 3 "" H 3850 6550 60  0000 C CNN
	1    3850 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 6150 3950 6300
Wire Wire Line
	3950 6300 3550 6300
Wire Wire Line
	3550 6050 3550 7000
$Comp
L +5V #PWR06
U 1 1 554E1C3C
P 3550 6050
F 0 "#PWR06" H 3550 6140 20  0001 C CNN
F 1 "+5V" H 3550 6140 30  0000 C CNN
F 2 "" H 3550 6050 60  0000 C CNN
F 3 "" H 3550 6050 60  0000 C CNN
	1    3550 6050
	1    0    0    -1  
$EndComp
NoConn ~ 4750 6150
NoConn ~ 4650 6150
NoConn ~ 4550 6150
NoConn ~ 4450 6150
Wire Wire Line
	5350 6150 5350 6500
Wire Wire Line
	5350 6500 3850 6500
$Comp
L R R4
U 1 1 554E1D1D
P 5650 5950
F 0 "R4" V 5730 5950 40  0000 C CNN
F 1 "220" V 5657 5951 40  0000 C CNN
F 2 "" V 5580 5950 30  0000 C CNN
F 3 "" H 5650 5950 30  0000 C CNN
	1    5650 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 6150 5250 6200
Wire Wire Line
	5250 6200 5650 6200
$Comp
L +5V #PWR07
U 1 1 554E1E1C
P 5650 5700
F 0 "#PWR07" H 5650 5790 20  0001 C CNN
F 1 "+5V" H 5650 5790 30  0000 C CNN
F 2 "" H 5650 5700 60  0000 C CNN
F 3 "" H 5650 5700 60  0000 C CNN
	1    5650 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 6150 4250 6500
Connection ~ 4250 6500
$Comp
L POT RV1
U 1 1 554E1E54
P 4200 6750
F 0 "RV1" H 4200 6650 50  0000 C CNN
F 1 "10K" H 4200 6750 50  0000 C CNN
F 2 "" H 4200 6750 60  0000 C CNN
F 3 "" H 4200 6750 60  0000 C CNN
	1    4200 6750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4050 6150 4050 6750
Wire Wire Line
	3550 7000 4200 7000
Connection ~ 3550 6300
$Comp
L GND #PWR08
U 1 1 554E2029
P 6000 2750
F 0 "#PWR08" H 6000 2750 30  0001 C CNN
F 1 "GND" H 6000 2680 30  0001 C CNN
F 2 "" H 6000 2750 60  0000 C CNN
F 3 "" H 6000 2750 60  0000 C CNN
	1    6000 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 1950 5850 2700
Wire Wire Line
	5850 2700 6250 2700
Wire Wire Line
	6000 2750 6000 2700
Connection ~ 6000 2700
$Comp
L GND #PWR09
U 1 1 554E20B1
P 6600 2050
F 0 "#PWR09" H 6600 2050 30  0001 C CNN
F 1 "GND" H 6600 1980 30  0001 C CNN
F 2 "" H 6600 2050 60  0000 C CNN
F 3 "" H 6600 2050 60  0000 C CNN
	1    6600 2050
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR010
U 1 1 554E2181
P 6600 1250
F 0 "#PWR010" H 6600 1200 20  0001 C CNN
F 1 "+12V" H 6600 1350 30  0000 C CNN
F 2 "" H 6600 1250 60  0000 C CNN
F 3 "" H 6600 1250 60  0000 C CNN
	1    6600 1250
	1    0    0    -1  
$EndComp
Text Notes 5950 1500 0    60   ~ 0
0-5V
Text Notes 7400 1600 0    60   ~ 0
0-10V
$Comp
L LM358 U3
U 1 1 554E9667
P 7150 3750
F 0 "U3" H 7100 3950 60  0000 L CNN
F 1 "LM358" H 7100 3500 60  0000 L CNN
F 2 "" H 7150 3750 60  0000 C CNN
F 3 "" H 7150 3750 60  0000 C CNN
	1    7150 3750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7200 1650 8000 1650
$Comp
L MOS_N Q1
U 1 1 554E9780
P 9600 1750
F 0 "Q1" H 9610 1920 60  0000 R CNN
F 1 "MOS_N" H 9610 1600 60  0000 R CNN
F 2 "" H 9600 1750 60  0000 C CNN
F 3 "" H 9600 1750 60  0000 C CNN
	1    9600 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 1750 9400 1750
$Comp
L R R9
U 1 1 554E9801
P 9700 2750
F 0 "R9" V 9780 2750 40  0000 C CNN
F 1 "1" V 9707 2751 40  0000 C CNN
F 2 "" V 9630 2750 30  0000 C CNN
F 3 "" H 9700 2750 30  0000 C CNN
	1    9700 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 1850 8000 2350
$Comp
L GND #PWR011
U 1 1 554E992B
P 8400 2150
F 0 "#PWR011" H 8400 2150 30  0001 C CNN
F 1 "GND" H 8400 2080 30  0001 C CNN
F 2 "" H 8400 2150 60  0000 C CNN
F 3 "" H 8400 2150 60  0000 C CNN
	1    8400 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 2350 9700 2350
Wire Wire Line
	9700 1950 9700 2500
Connection ~ 9700 2350
$Comp
L GND #PWR012
U 1 1 554E99A7
P 9700 3100
F 0 "#PWR012" H 9700 3100 30  0001 C CNN
F 1 "GND" H 9700 3030 30  0001 C CNN
F 2 "" H 9700 3100 60  0000 C CNN
F 3 "" H 9700 3100 60  0000 C CNN
	1    9700 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 3000 9700 3100
$Comp
L +12V #PWR013
U 1 1 554E99F3
P 8400 1350
F 0 "#PWR013" H 8400 1300 20  0001 C CNN
F 1 "+12V" H 8400 1450 30  0000 C CNN
F 2 "" H 8400 1350 60  0000 C CNN
F 3 "" H 8400 1350 60  0000 C CNN
	1    8400 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 1550 9700 1400
Wire Wire Line
	9700 1400 10000 1400
$Comp
L CONNECTOR P1
U 1 1 554E9A7F
P 10000 1400
F 0 "P1" H 10350 1500 70  0000 C CNN
F 1 "CONNECTOR" H 10350 1300 70  0000 C CNN
F 2 "" H 10000 1400 60  0000 C CNN
F 3 "" H 10000 1400 60  0000 C CNN
	1    10000 1400
	1    0    0    -1  
$EndComp
$Comp
L CONNECTOR P2
U 1 1 554E9ACE
P 10000 3050
F 0 "P2" H 10350 3150 70  0000 C CNN
F 1 "CONNECTOR" H 10350 2950 70  0000 C CNN
F 2 "" H 10000 3050 60  0000 C CNN
F 3 "" H 10000 3050 60  0000 C CNN
	1    10000 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 3050 10000 3050
Connection ~ 9700 3050
$Comp
L arduino_mini U1
U 1 1 554E9DD3
P 2150 2400
F 0 "U1" H 2650 1450 70  0000 C CNN
F 1 "arduino_mini" H 2900 1350 70  0000 C CNN
F 2 "DIL20" H 2150 2350 60  0000 C CNN
F 3 "" H 2150 2400 60  0000 C CNN
	1    2150 2400
	1    0    0    -1  
$EndComp
Text Label 2300 5850 0    60   ~ 0
BTN_PLUS
Text Label 2850 2450 0    60   ~ 0
BTN_PLUS
Text Label 2300 6800 0    60   ~ 0
BTN_MOINS
Text Label 2850 2350 0    60   ~ 0
BTN_MOINS
Text Label 5150 6150 3    60   ~ 0
LCD_0
Text Label 5050 6150 3    60   ~ 0
LCD_1
Text Label 4950 6150 3    60   ~ 0
LCD_2
Text Label 4850 6150 3    60   ~ 0
LCD_3
Text Label 2850 3000 0    60   ~ 0
LCD_0
Text Label 2850 2900 0    60   ~ 0
LCD_1
Text Label 2850 2800 0    60   ~ 0
LCD_2
Text Label 2850 2700 0    60   ~ 0
LCD_3
Text Label 4350 6150 3    60   ~ 0
LCD_E
Text Label 4150 6150 3    60   ~ 0
LCD_RS
Text Label 2850 1950 0    60   ~ 0
LCD_E
Text Label 2850 1850 0    60   ~ 0
LCD_RS
$Comp
L +12V #PWR014
U 1 1 554EB65A
P 2000 1250
F 0 "#PWR014" H 2000 1200 20  0001 C CNN
F 1 "+12V" H 2000 1350 30  0000 C CNN
F 2 "" H 2000 1250 60  0000 C CNN
F 3 "" H 2000 1250 60  0000 C CNN
	1    2000 1250
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR015
U 1 1 554EB797
P 2150 1250
F 0 "#PWR015" H 2150 1340 20  0001 C CNN
F 1 "+5V" H 2150 1340 30  0000 C CNN
F 2 "" H 2150 1250 60  0000 C CNN
F 3 "" H 2150 1250 60  0000 C CNN
	1    2150 1250
	1    0    0    -1  
$EndComp
NoConn ~ 2850 3100
NoConn ~ 2850 3200
NoConn ~ 2850 2050
NoConn ~ 2850 1750
NoConn ~ 1450 2000
NoConn ~ 1450 2300
NoConn ~ 1450 2400
NoConn ~ 1450 2500
NoConn ~ 1450 2600
NoConn ~ 1450 2700
NoConn ~ 1450 2800
NoConn ~ 1450 2900
NoConn ~ 1450 3700
$Comp
L GND #PWR016
U 1 1 554EB8BC
P 2150 3950
F 0 "#PWR016" H 2150 3950 30  0001 C CNN
F 1 "GND" H 2150 3880 30  0001 C CNN
F 2 "" H 2150 3950 60  0000 C CNN
F 3 "" H 2150 3950 60  0000 C CNN
	1    2150 3950
	1    0    0    -1  
$EndComp
$Comp
L CONNECTOR P3
U 1 1 554EC124
P 9250 5500
F 0 "P3" H 9600 5600 70  0000 C CNN
F 1 "CONNECTOR" H 9600 5400 70  0000 C CNN
F 2 "" H 9250 5500 60  0000 C CNN
F 3 "" H 9250 5500 60  0000 C CNN
	1    9250 5500
	-1   0    0    1   
$EndComp
$Comp
L CONNECTOR P4
U 1 1 554EC39E
P 9250 5900
F 0 "P4" H 9600 6000 70  0000 C CNN
F 1 "CONNECTOR" H 9600 5800 70  0000 C CNN
F 2 "" H 9250 5900 60  0000 C CNN
F 3 "" H 9250 5900 60  0000 C CNN
	1    9250 5900
	-1   0    0    1   
$EndComp
$Comp
L +12V #PWR017
U 1 1 554EC418
P 9450 5450
F 0 "#PWR017" H 9450 5400 20  0001 C CNN
F 1 "+12V" H 9450 5550 30  0000 C CNN
F 2 "" H 9450 5450 60  0000 C CNN
F 3 "" H 9450 5450 60  0000 C CNN
	1    9450 5450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR018
U 1 1 554EC45F
P 9450 5950
F 0 "#PWR018" H 9450 5950 30  0001 C CNN
F 1 "GND" H 9450 5880 30  0001 C CNN
F 2 "" H 9450 5950 60  0000 C CNN
F 3 "" H 9450 5950 60  0000 C CNN
	1    9450 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 5500 9450 5500
Wire Wire Line
	9450 5500 9450 5450
Wire Wire Line
	9250 5900 9450 5900
Wire Wire Line
	9450 5900 9450 5950
Text Notes 8500 5750 2    60   ~ 0
12V\nPower Input
Text Notes 10250 2300 0    60   ~ 0
Device Under Test\nLoad
NoConn ~ 2300 1250
$Comp
L LM358 U2
U 2 1 554EC832
P 8500 1750
F 0 "U2" H 8450 1950 60  0000 L CNN
F 1 "LM358" H 8450 1500 60  0000 L CNN
F 2 "" H 8500 1750 60  0000 C CNN
F 3 "" H 8500 1750 60  0000 C CNN
	2    8500 1750
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 554EC991
P 6400 3750
F 0 "R7" V 6480 3750 40  0000 C CNN
F 1 "10K" V 6407 3751 40  0000 C CNN
F 2 "" V 6330 3750 30  0000 C CNN
F 3 "" H 6400 3750 30  0000 C CNN
	1    6400 3750
	0    1    1    0   
$EndComp
$Comp
L R R5
U 1 1 554ECA25
P 6150 4000
F 0 "R5" V 6230 4000 40  0000 C CNN
F 1 "10K" V 6157 4001 40  0000 C CNN
F 2 "" V 6080 4000 30  0000 C CNN
F 3 "" H 6150 4000 30  0000 C CNN
	1    6150 4000
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR019
U 1 1 554ECA86
P 6150 4250
F 0 "#PWR019" H 6150 4250 30  0001 C CNN
F 1 "GND" H 6150 4180 30  0001 C CNN
F 2 "" H 6150 4250 60  0000 C CNN
F 3 "" H 6150 4250 60  0000 C CNN
	1    6150 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 3750 6150 3750
Wire Wire Line
	6650 3750 6650 4350
Wire Wire Line
	6650 4350 7650 4350
Wire Wire Line
	7650 4350 7650 3850
$Comp
L GND #PWR020
U 1 1 554ECC7C
P 7250 4150
F 0 "#PWR020" H 7250 4150 30  0001 C CNN
F 1 "GND" H 7250 4080 30  0001 C CNN
F 2 "" H 7250 4150 60  0000 C CNN
F 3 "" H 7250 4150 60  0000 C CNN
	1    7250 4150
	1    0    0    -1  
$EndComp
$Comp
L +12V #PWR021
U 1 1 554ECCB5
P 7250 3350
F 0 "#PWR021" H 7250 3300 20  0001 C CNN
F 1 "+12V" H 7250 3450 30  0000 C CNN
F 2 "" H 7250 3350 60  0000 C CNN
F 3 "" H 7250 3350 60  0000 C CNN
	1    7250 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 3650 8400 3650
Wire Wire Line
	8400 3650 8400 2350
Connection ~ 8400 2350
Text Notes 7950 3600 0    60   ~ 0
0-10V
Text Notes 5950 3700 0    60   ~ 0
0-5V
Text Label 5350 3750 2    60   ~ 0
V_SENSE
Text Label 1450 2200 2    60   ~ 0
V_SENSE
Text Label 2850 2150 0    60   ~ 0
V_SET
Text Label 5350 1550 2    60   ~ 0
V_SET
NoConn ~ 2850 2250
$Comp
L PWR_FLAG #FLG022
U 1 1 554EEB25
P 9450 5500
F 0 "#FLG022" H 9450 5595 30  0001 C CNN
F 1 "PWR_FLAG" H 9450 5680 30  0000 C CNN
F 2 "" H 9450 5500 60  0000 C CNN
F 3 "" H 9450 5500 60  0000 C CNN
	1    9450 5500
	0    1    1    0   
$EndComp
Wire Wire Line
	4250 6500 4200 6500
Connection ~ 4200 6500
Wire Wire Line
	3850 6150 3850 6550
Connection ~ 3850 6500
Wire Notes Line
	500  5000 11200 5000
Wire Notes Line
	7000 5000 7000 6500
Wire Notes Line
	3700 500  3700 5000
Text Notes 7100 6450 0    60   Italic 0
Power connection
Text Notes 550  7700 0    60   Italic 0
User Interface
Text Notes 600  4900 0    60   Italic 0
Arduino\n(yes, overkill)
Text Notes 6600 4550 0    60   Italic 0
Voltage sensor
Text Notes 6050 2900 0    60   Italic 0
PWM conversion
Text Notes 9450 2800 0    60   ~ 0
25W
Text Notes 8600 2500 0    60   Italic 0
Comparator
Text Notes 3800 4850 0    60   Italic 0
Constant Current Load
$Comp
L LM358 U3
U 2 1 554F8726
P 10200 4300
F 0 "U3" H 10150 4500 60  0000 L CNN
F 1 "LM358" H 10150 4050 60  0000 L CNN
F 2 "" H 10200 4300 60  0000 C CNN
F 3 "" H 10200 4300 60  0000 C CNN
	2    10200 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 4200 9700 4400
NoConn ~ 10100 3900
NoConn ~ 10700 4300
NoConn ~ 10100 4700
$EndSCHEMATC
