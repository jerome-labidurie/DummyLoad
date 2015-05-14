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

#define VERSION "v1.0"

// LCD library
#include <LiquidCrystal.h>

/* hardware constants */
#define BTN_PLUS 11
#define BTN_MOINS 12
#define LED 13
#define PWM 9
/** analog input pin for shunt resistor voltae read */
#define IN_VOLT 0
/** shunt resistor value R9 (ohm) */
#define SHUNT 10

// initialize the library with the numbers of the interface pins
// rs, enable, d4, d5, d6, d7
LiquidCrystal lcd(7, 6, 2, 3, 4, 5);

/* software constants */
// increment of pwm duty cycle
#define DC_INC 1
/* length of read amp value averaging */
#define AVER_LENGTH 10
// debounce delay (ms)
#define DEBOUNCE_DELAY 50
// repeat timer (wait b4 repeating press (number of DEBOUNCE_DELAY)
#define REPEAT_TIMER 20
// serial command line max length
#define LINE_LEN 20
// timer to get new internal temperature (ms)
#define TEMP_TIMER 5000

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

long lastTemp = 0;   /**< last time internal temp as been read */
double currTemperature = 0; /** current internal temperature */

char line[LINE_LEN]; /**< serial command line */

/****************************************************************************/

/** add new read value in circular average array
 * @param val the read value
 */
void addReadAmp(uint16_t val) {
   tReadAmp[itReadAmp] = val;
   itReadAmp = (itReadAmp + 1) % AVER_LENGTH;
} // addReadAmp

/** get average of last AVER_LENGTH values
 */
uint16_t getReadAmp(void) {
   uint16_t tmp = 0;
   uint8_t i;
   for (i=0; i< AVER_LENGTH;i++) {
      tmp += tReadAmp[i];
   }
   return tmp / AVER_LENGTH;
} // getReadAmp

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
   // line 0
   lcd.clear();
   lcd.setCursor (0, 0);
   lcd.print ("S: ");
   lcd.print (setAmp);
   lcd.print (" mA");
   lcd.setCursor (11, 0);
   lcd.print (currTemperature);
   // line 1
   lcd.setCursor (0, 1);
   lcd.print ("R: ");
   lcd.print (readAmp);
   lcd.print (" mA");
   lcd.setCursor (14, 1);
   lcd.print ((char)223); // °
   lcd.print ("C");
}//printScreen

/** increment dutyCycle
 */
void incDC (void) {
   if (dutyCycle >= (0xFF - DC_INC)) {
      dutyCycle = 0xFF;
   } else {
      dutyCycle += DC_INC;
   }
}//incDC

/** decrement dutyCycle
 */
void decDC (void) {
   if (dutyCycle <= (0 + DC_INC)) {
      dutyCycle = 0;
   } else {
      dutyCycle -= DC_INC;
   }
} // decDC

/** get atmega328 internal temperature
 * sauce: http://playground.arduino.cc/Main/InternalTemperatureSensor
 * @return temperature in °C
 */
double getTemp(void)
{
  unsigned int wADC;
  double t;

  // The internal temperature has to be used
  // with the internal reference of 1.1V.
  // Channel 8 can not be selected with
  // the analogRead function yet.

  // Set the internal reference and mux.
  ADMUX = (_BV(REFS1) | _BV(REFS0) | _BV(MUX3));
  ADCSRA |= _BV(ADEN);  // enable the ADC

  delay(20);            // wait for voltages to become stable.

  ADCSRA |= _BV(ADSC);  // Start the ADC

  // Detect end-of-conversion
  while (bit_is_set(ADCSRA,ADSC));

  // Reading register "ADCW" takes care of how to read ADCL and ADCH.
  wADC = ADCW;

  // The offset of 324.31 could be wrong. It is just an indication.
  t = (wADC - 324.31 ) / 1.22;

  // The returned temperature is in degrees Celcius.
  return (t);
}

/****************************************************************************/
/** Init the hardware
 */
void setup (void) {
   // initialize output pins
   pinMode (LED, OUTPUT);
   pinMode (PWM, OUTPUT);
   // initialize input pins
   pinMode (BTN_PLUS, INPUT);
   pinMode (BTN_MOINS, INPUT);
   // initialize serial
   Serial.begin (9600);
   Serial.println ("Dummy Load\ndinask.eu");
   Serial.println (VERSION);
   // initialize LCD
   lcd.begin (16, 2);
   lcd.print ("Dummy Load ");
   lcd.print (VERSION);
   lcd.setCursor (0, 1);
   lcd.print ("dinask.eu");
   delay (2000);
} // setup()


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
            incDC();
         } // if (currPlusState == HIGH) {
      } else {
         if ( (millis() - lastPlusTime) > (REPEAT_TIMER * DEBOUNCE_DELAY) ) {
            // btn in same state since (REPEAT_TIMER * DEBOUNCE_DELAY)
            if (currPlusState == HIGH) {
               // new btn press event !
               incDC();
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
            decDC();
         } // if (currMoinsState == HIGH) {
      } else {
         if ( (millis() - lastMoinsTime) > (REPEAT_TIMER * DEBOUNCE_DELAY) ) {
            // btn in same state since (REPEAT_TIMER * DEBOUNCE_DELAY)
            if (currMoinsState == HIGH) {
               // new btn press event !
               decDC();
            } // if (currMoinsState == HIGH) {
         }
      } // else
   }
   prevMoinsState = tmp;

   /* check serial interface commands */
   if (Serial.available() > 0) {
      memset(line, 0, sizeof(line)); // clear line
      Serial.readBytesUntil ('\n', line, LINE_LEN - 1);
      line[LINE_LEN-1] = 0; // make sure string is terminated
      // check command
      switch (line [0]) {
         case 'D': // display
         case 'd':
            Serial.print ("S: ");
            Serial.println (setAmp);
            Serial.print ("R: ");
            Serial.println (readAmp);
            Serial.print ("DC: 0x");
            Serial.println (dutyCycle, HEX);
            break;
         case 'S': // set current
         case 's':
            tmp = atol((char*) &line[2]);
            dutyCycle = map (tmp, 0, 10000 / SHUNT, 0, 0xFF);
            break;
         case '+': // push +
            incDC();
            break;
         case '-': // push -
            decDC();
            break;
         case 'T': // internal temperature
         case 't':
            Serial.print ("T: ");
            Serial.println (currTemperature);
            break;
         case 'H': // help
         case '?':
         case 'h':
            Serial.println ("help:");
            Serial.println (" D: display actual values (mA) & dutyCycle");
            Serial.println (" S xxxx: set current value (mA)");
            Serial.println (" +,-: push button");
            Serial.println (" T: display internal temperature");
            Serial.println (" H,?: show help");
            break;
         default:
            Serial.print ("E: unknown command: ");
            Serial.println ((char)line[0]);
      }//switch
   } // Serial.available()

   /* read internal temperature if needed */
   if (millis() > (lastTemp + TEMP_TIMER) ) {
      lastTemp = millis();
      currTemperature = getTemp();
   }

   /* set current value */
   analogWrite(PWM, dutyCycle);
   setAmp = map (dutyCycle, 0, 0xFF, 0, 10000 / SHUNT);
   /* read actual current value */
   tmp = analogRead (IN_VOLT);
   addReadAmp ( map (tmp, 0, 1023, 0, 10000 / SHUNT) );
   readAmp = getReadAmp();
   /* display */
   printScreen();

   delay(25);
} // loop()

