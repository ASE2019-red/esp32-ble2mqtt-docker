FROM debian

RUN apt-get update && \
    apt-get install -y gcc git wget make libncurses-dev flex bison gperf python python-pip python-setuptools python-serial python-cryptography python-future

RUN mkdir -p /esp
WORKDIR /esp
RUN wget https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
RUN tar -xzf xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
ENV PATH="/esp/xtensa-esp32-elf/bin:$PATH"

RUN git clone -b v3.2.2 --recursive https://github.com/espressif/esp-idf.git
ENV IDF_PATH=/esp/esp-idf

RUN git clone --branch gps --recursive https://github.com/DurandA/esp32-ble2mqtt.git
WORKDIR /esp/esp32-ble2mqtt

RUN ln -s $(pwd)/data /data
RUN rm data/config.json

ENV BATCH_BUILD=1
RUN make; exit 0

CMD ["make", "flash"]
