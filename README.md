# esp32-ble2mqtt-docker

Docker image for the esp32-ble2mqtt project.
To run a container: 
```sh
$ docker run --device=<serial device port> -v <your config.json file>:/data/config.json diuf/esp32-ble2mqtt
```

For instance: 
```sh
$ docker run --device=/dev/ttyUSB0 -v ~/Desktop/config.json:/data/config.json diuf/esp32-ble2mqtt
```