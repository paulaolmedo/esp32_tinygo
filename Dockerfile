FROM tinygo/tinygo

RUN apt-get install -y sudo

RUN useradd -d /home/gopher -m gopher && \
    usermod -a -G dialout,staff gopher && \
    mkdir -p /etc/sudoers.d && \
    echo "gopher ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/gopher && \
    chmod 0440 /etc/sudoers.d/gopher

USER gopher
WORKDIR /home/gopher

RUN sudo apt-get install -y git wget make libncurses-dev flex bison gperf python python-serial python3-venv python3-pip \
    && pip3 install esptool

RUN mkdir esp_config
RUN sudo wget https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz 
RUN sudo tar -xzf xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz -C $HOME/esp_config
ENV PATH="$PATH:/home/gopher/esp_config/xtensa-esp32-elf/bin"

RUN sudo rm -rf /var/lib/apt/lists/* \
    && sudo apt-get purge --auto-remove \
    && sudo apt-get clean
