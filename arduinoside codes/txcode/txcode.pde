
#include <XBee.h>

XBee xbee = XBee();

unsigned long start = millis();

uint8_t payload[] = { 'R','M','I'};

Tx16Request tx = Tx16Request(0xFFFF, payload, sizeof(payload));//use 16bit receiver xbee address instead of 0xFF
Tx16Request pingback = Tx16Request(0xFFFF, payload2, sizeof(payload));//0xFF is broadcast to all nearby xbees

TxStatusResponse txStatus = TxStatusResponse();


void setup() {

  Serial.begin(115200);
  xbee.setSerial(Serial);
}

void loop() {

    if (millis() - start > 15) {

      payload[0] = 'A';

      xbee.send(tx);

    }
    delay(1000);//can be removed just for debugging
}
