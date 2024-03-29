# esp32-ble2mqtt-docker

Docker image for the esp32-ble2mqtt project.
To run the container: 
```sh
$ docker run -v <your data folder>:/data diuf/esp32-ble2mqtt
```

For instance: 
```sh
$ docker run -v $PWD/data:/data diuf/esp32-ble2mqtt
```
The directory (e.g. `~/Desktop/data`) mounted as a volume must contain a valid 
`config.json` file. Once the container has finished running, the image to be 
flashed on the esp32 should be present in this directory.

## Flash
Go to `data` directory and run the command

```
esptool.py write_flash 0xd000 build/ota_data_initial.bin 0x1000 build/bootloader.bin 0x10000 build/ble2mqtt.bin 0x8000 build/partitions.bin 0x310000 build/spiffs.bin 0x350000 build/spiffs.bin
```

## Mosquitto
To test the MQTT broker you may use Mosquitto. Place the provided config file [mosquitto_pub](./mosquitto/mosquitto_sub) under `$HOME/.config/mosquitto_pub`.


Here some example subscriptions for the Thingy with mac address `e8:e0:72:6b:92:a3`:

```
mosquitto_sub -t 'e8:e0:72:6b:92:a3/Thingy Motion Service/Thingy Gravity Characteristic'
```

```
mosquitto_sub -t 'e8:e0:72:6b:92:a3/Thingy Sound Service/Thingy Microphone Characteristic'
```



## Links
You can find detailed service and characteristic definitions here: 
https://nordicsemiconductor.github.io/Nordic-Thingy52-FW/documentation/firmware_architecture.html

esptool.py documentation can be found here:
https://github.com/espressif/esptool

BLE2MQTT documentation:
https://github.com/DurandA/esp32-ble2mqtt

Project description:
https://duranda.github.io/ase2019-docs/project-2019

Thingy Nodejs library:
https://github.com/NordicPlayground/Nordic-Thingy52-Nodejs/blob/master/lib/thingy.js
