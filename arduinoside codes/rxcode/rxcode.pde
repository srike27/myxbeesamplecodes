#include <XBee.h>

XBee xbee = XBee();
XBeeResponse response = XBeeResponse();

Rx16Response rx16 = Rx16Response();

uint8_t option = 0;
uint8_t data = 0;


void setup() {

  Serial.begin(115200);
  xbee.setSerial(Serial);

}

void loop() {

    xbee.readPacket();

    if (xbee.getResponse().isAvailable()) {

      if (xbee.getResponse().getApiId() == RX_16_RESPONSE ) {

        if (xbee.getResponse().getApiId() == RX_16_RESPONSE) {
                xbee.getResponse().getRx16Response(rx16);
        	option = rx16.getOption();
        	data = rx16.getData(0);
        } else {
                xbee.getResponse().getRx64Response(rx64);
        	option = rx64.getOption();
        	data = rx64.getData(0);
        }

        analogWrite(13, data);
      }
    }
}
