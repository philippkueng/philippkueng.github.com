Date: 2024-10-13
Title: Building a temperature sensor for Home Assistant with a DHT22 sensor, an ESP8266 and ESPHome
Tags: Home Assistant, ESPHome, DHT22, ESP8266, Microcontroller, Smart Home

In order to better understand our temperature needs and to humour my interest to tinker with electronics I've decided to build some temperature and humidity sensors and have them installed both in- and outdoors. I'll be using [ESPHome](https://esphome.io/) which talks to [Home Assistant](https://www.home-assistant.io/) for this build.

I'm started off with a board from [AliExpress](https://www.aliexpress.com/item/4001135318230.html?spm=a2g0o.order_list.order_list_main.55.70b01802ntJ0vy) containing a [DHT22](https://www.elektronik-kompendium.de/sites/praxis/bauteil_dht22.htm) temperature and humidity sensor with an attachable [ESP8266](https://de.wikipedia.org/wiki/ESP8266) microcontroller.

## Programming the ESP8266 microcontroller

To program the ESP8266 one needs an adapter ([ESP-01 Adapter Board](https://www.aliexpress.com/item/32799975353.html?spm=a2g0o.order_list.order_list_main.49.70b01802ntJ0vy#nav-description)) which needs to be slightly modified with a button so that we can enable its programming mode ([instructions](https://www.edgemicrotech.com/preparing-the-usb-esp-01-programming-adapter-a-step-by-step-guide/)).

![ESP-01 Adapter Board used to program the ESP8266](/assets/images/2024/10/IMG_0089.jpeg)
![Underside of the ESP-01 Adapter Board used to program the ESP8266 showing the pins used for wiring the button to](/assets/images/2024/10/IMG_0090.jpeg)

## Assembly

![All the parts required to assemble the temperature and humidity sensor](/assets/images/2024/10/IMG_0095.jpeg)

Having the parts ready I'm logging in to my Home Assistant and heading to the ESPHome view to add a new device. I create a new configuration and choose the ESP8266 as the device, then once it offers the "Install" option I insert the controller to be programmed into the adapter board, keep the button pressed and plug it into one of the USB ports of my [Raspberry Pi](https://www.raspberrypi.com/) running Home Assistant. Once plugged in I release the button again. At this stage I can then click the option to install the first version of ESPHome onto the controller via "Plug into the computer running ESPHome Dashboard" (be aware that this might take a while as it has to fetch dependencies and compile the custom build). This step will flash enough for the controller to be able to connect to the Wi-Fi and be updatable via ESPHome running on Home Assistant. It's important to note that the Raspberry Pi likely won't have enough juice to start the controller and hence it won't be doing anything after being programmed.

At this point I disconnect the programmer, take the controller out of the adapter, connect it with the board containing the DHT22 sensor and feed it with 5V from a power supply. One should see 2-3 LEDs light up. Shortly after the new device should appear as connected in ESPHome at which point the configuration of the device can be extended with options to tell the controller what kind of sensors are connected and with what kind of name it should be reporting the values to Home Assistant.

```yaml
sensor:
  - platform: dht
    pin: GPIO2
    model: DHT22_TYPE2
    temperature:
      name: "Balcony Temperature"
    humidity:
      name: "Balcony Humidity"
    update_interval: 60s
```

Once added, save the configuration and click the "Install" button to remotely update the configuration on the device via the wireless connection. If you look at the logs of the ESPHome component for about 60s it should eventually log the temperature and humidity it just collected via the DHT22 sensor.

```txt
[13:13:26][D][dht:048]: Got Temperature=15.5°C Humidity=80.3%
[13:13:26][D][sensor:093]: 'Balcony Temperature': Sending state 15.50000 °C with 1 decimals of accuracy
[13:13:26][D][sensor:093]: 'Balcony Humidity': Sending state 80.30000 % with 0 decimals of accuracy
```

![Assembled board & controller without the case](/assets/images/2024/10/IMG_0091.jpeg)

At this point I knew that the components and network connection worked as intended and that I can continue with the integration of it into the case. For the case I've used [a modified version](https://www.printables.com/model/1039908-temperature-humdity-sensor-box-based-on-an-esp8266) of [Andreas Spiess](https://youtu.be/lBK0UBjVrYM?si=cYmw93UKSG7zp7iz)'s configurable 3d printable box with an arm that ensures the DHT22 sensor is far enough away from the controller and power supply to not be affected by it.

The case requires the DHT22 to be de-soldered and extended which is a bit finicky.

![De-solder the DHT22 sensor from the board](/assets/images/2024/10/IMG_0094.jpeg)

After a bit of fiddling this is the end result just prior to clicking the box shut.

![Finished integration of the DHT22 sensor board with ESP8266 and power supply into the 3D printed case](/assets/images/2024/10/IMG_0096.jpeg)

I've used some double-sided tape to fix the boards to the case, used a cable tie to ensure the power cord isn't pulling too much on the power supply and finally used some heat shrink tubing for the sensor connections just to be on the safe side. Worth noting, while I did write that this sensor goes onto the balcony, it's not intended to be operated in a wet environment as both the sensor is exposed and the 3d printed case isn't waterproof.
