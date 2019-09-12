# esp32-ble2mqtt-docker

Docker image for the esp32-ble2mqtt project.
To run the container: 
```sh
$ docker run -v <your data folder>:/data diuf/esp32-ble2mqtt
```

For instance: 
```sh
$ docker run -v ~/Desktop/data:/data diuf/esp32-ble2mqtt
```
The directory (e.g. `~/Desktop/data`) mounted as a volume must contain a valid 
`config.json` file. Once the container has finished running, the image to be 
flashed on the esp32 should be present in this directory.