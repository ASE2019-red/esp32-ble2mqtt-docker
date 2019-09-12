#!/bin/bash

cp /data/config.json data/

make
make "$PWD"/build/spiffs.bin

mkdir -p /data/build
rm /data/build/*.bin

cp build/ota_data_initial.bin build/bootloader/bootloader.bin build/ble2mqtt.bin build/partitions.bin build/spiffs.bin /data/build

echo ''
echo 'to flash your esp32 (from your data directory):'
echo 'esptool.py write_flash 0xd000 build/ota_data_initial.bin 0x1000 build/bootloader.bin 0x10000 build/ble2mqtt.bin 0x8000 build/partitions.bin 0x310000 build/spiffs.bin 0x350000 build/spiffs.bin'