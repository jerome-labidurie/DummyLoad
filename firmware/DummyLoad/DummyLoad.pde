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
/** analog input pin for shunt resistor voltae read */
#define IN_VOLT 0
/** shunt resistor value R9 (ohm) */
#define SHUNT 10

// initialize the library with the numbers of the interface pins
LiquidCrystal lcd(12, 11, 5, 4, 3, 2);

/* software constants */
// increment of pwm duty cycle
#define DC_INC 1
/* length of read amp value averaging */
#define AVER_LENGTH 10
// debounce delay (ms)
#define DEBOUNCE_DELAY 50
// repeat timer (wait b4 repeating press (number of DEBOUNCE_DELAY)
#define REPEAT_TIMER 20

/* global variables */
uint8_t  dutyCycle = 0; /**< PWM duty cycle 0->0xFF */
uint16_t setAmp = 0;    /**< current set value (mA) */
uint16_t readAmp = 0;   /**< current read value (mA) */
uint16_t tReadAmp[AVER_LENGTH]; /**< averaging array of currebnt read values */
uint8_t itReadAmp = 0;          /**< actual index in previous array */

long lastPlusTime = 0;        /**< last time plus btn was pressed */
uint8_t prevPlusState = LOW;  /**< previous button state */
uint8_t currPlusState = LOW;  /**< current button state */
long lastMoinsTime = 0;       /**< last time minus btn was pressed */
uint8_t prevMoinsState = LOW; /**< previous button state */
uint8_t currMoinsState = LOW; /**< current button state */


void addReadAmp(uint16_t val) {
   tReadAmp[itReadAmp] = val;
   itReadAmp = (itReadAmp + 1) % AVER_LENGTH;
} // addReadAmp

uint16_t getReadAmp(void) {
   uint16_t tmp = 0;
   uint8_t i;
   for (i=0; i< AVER_LENGTH;i++) {
      tmp += tReadAmp[i];
   }
   return tmp / AVER_LENGTH;
} // getReadAmp

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
   lcd.print("dinask.eu");
   delay (2000);
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

/** display the current screen
 */
void printScreen (void) {
      lcd.clear();
      lcd.setCursor (0, 0);
      lcd.print ("SET:  ");
      lcd.print (setAmp);
      lcd.print (" mA");
      lcd.setCursor (0, 1);
      lcd.print ("READ: ");
      lcd.print (readAmp);
      lcd.print (" mA");
}//printScreen

/** main()
 */
void loop (void) {
   uint16_t tmp = 0;

   /* check plus btn press */
   tmp = digitalRead(BTN_PLUS);
   if (tmp != prevPlusState) {
      lastPlusTime = millis();
   }
   if ( (millis() - lastPlusTime) > DEBOUNCE_DELAY ) {
      // last state change for btn is > DEBOUNCE_DELAY
      if (tmp != currPlusState) {
         // btn state just changed
         currPlusState = tmp;
         if (currPlusState == HIGH) {
            Serial.println("plus");
            if (dutyCycle >= (0xFF - DC_INC)) {
               dutyCycle = 0xFF;
            } else {
               dutyCycle += DC_INC;
            }
         } // if (currPlusState == HIGH) {
      } else {
         if ( (millis() - lastPlusTime) > (REPEAT_TIMER * DEBOUNCE_DELAY) ) {
            // btn in same state since (REPEAT_TIMER * DEBOUNCE_DELAY)
            if (currPlusState == HIGH) {
               // new btn press event !
               Serial.println("plus");
               if (dutyCycle >= (0xFF - DC_INC)) {
                  dutyCycle = 0xFF;
               } else {
                  dutyCycle += DC_INC;
               }
            } // if (currPlusState == HIGH) {
         }
      }
   }
   prevPlusState = tmp;

   /* check minus btn press */
   tmp = digitalRead(BTN_MOINS);
   if (tmp != prevMoinsState) {
      lastMoinsTime = millis();
   }
   if ( (millis() - lastMoinsTime) > DEBOUNCE_DELAY ) {
      // last state change for btn is > DEBOUNCE_DELAY
      if (tmp != currMoinsState) {
         // btn state just changed
         currMoinsState = tmp;
         if (currMoinsState == HIGH) {
            Serial.println("moins");
            if (dutyCycle <= (0 + DC_INC)) {
               dutyCycle = 0;
            } else {
               dutyCycle -= DC_INC;
            }
         } // if (currMoinsState == HIGH) {
      } else {
         if ( (millis() - lastMoinsTime) > (REPEAT_TIMER * DEBOUNCE_DELAY) ) {
            // btn in same state since (REPEAT_TIMER * DEBOUNCE_DELAY)
            if (currMoinsState == HIGH) {
               // new btn press event !
               Serial.println("moins");
               if (dutyCycle <= (0 + DC_INC)) {
                  dutyCycle = 0;
               } else {
                  dutyCycle -= DC_INC;
               }
            } // if (currMoinsState == HIGH) {
         }
      } // else
   }
   prevMoinsState = tmp;

   /* set current value */
   analogWrite(PWM, dutyCycle);
   setAmp = map (dutyCycle, 0, 0xFF, 0, 10000 / SHUNT);
   /* read actual current value */
   tmp = analogRead (IN_VOLT);
   addReadAmp ( map (tmp, 0, 1023, 0, 10000 / SHUNT) );
   readAmp = getReadAmp();
   /* display */
   printScreen();

   delay(10);
} // loop()

