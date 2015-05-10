/** Dummy Load
 *
 * Firmware for an electronic constant current dummy load
 *
 * Copyright (C) 2015 Jérôme Labidurie
 * This file is part of DummyLoad.
 * DummyLoad is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 * DummyLoad is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 * You should have received a copy of the GNU General Public License
 * along with DummyLoad. If not, see <http://www.gnu.org/licenses/>.
 */

// LCD library
#include <LiquidCrystal.h>

/* hardware constants */
#define BTN_PLUS 6
#define BTN_MOINS 7
#define LED 13
#define PWM 9
// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);

/* software constants */
// increment of pwm duty cycle
#define DC_INC 1

/* global variables */
uint8_t dutyCycle = 0; /**< PWM duty cycle 0->0xFF */


/** Init the hardware
 */
void setup (void) {
   // initialize output pins
   pinMode(LED, OUTPUT);
   pinMode(PWM, OUTPUT);
   // initialize input pins
   pinMode(BTN_PLUS, INPUT);
   pinMode(BTN_MOINS, INPUT);
   // initialize serial
   Serial.begin(9600);
   Serial.println("Dummy Load");
   // initialize LCD
   lcd.begin(16, 2);
   lcd.print("Dummy Load");
   lcd.setCursor(0, 1);
   lcd.print("DC: 0x00");
} // setup()

/** Display the current duty cycle
 * print to serial and on lcd
 * @param dc the duty cycle to print
 */
void printDC (uint8_t dc) {
   Serial.print("DC: 0x");
   Serial.println(dutyCycle, HEX);
   lcd.setCursor(6, 1);
   if (dc < 0xF) {
      lcd.print(0);
   }
   lcd.print(dc, HEX);
} // printDC

/** main()
 */
void loop (void) {
  analogWrite(PWM, dutyCycle);

  if (digitalRead(BTN_PLUS) == HIGH) {
   dutyCycle += DC_INC;
   printDC (dutyCycle);
  }
  if (digitalRead(BTN_MOINS) == HIGH) {
   dutyCycle -= DC_INC;
   printDC (dutyCycle);
  }
  delay(50);
} // loop()

