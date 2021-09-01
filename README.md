# esp32_tinygo


Dockerfile to generate a development enviroment to compile binaries with [tiny-go](https://tinygo.org/) for [ESP-32](https://en.wikipedia.org/wiki/ESP32). It works as well for the predecessor [ESP-8266](https://en.wikipedia.org/wiki/ESP8266)

## Instructions

### Building

    docker build -t [some-tag] .
    
### Running

    docker run --rm -it -v $(pwd):/home/gopher/src [some-tag] /bin/bash
    
    where $(pwd) is the folder of the tiny-go code.

#### Once inside, build the code with (careful to change the target according to the micro)

     tinygo build -o [output-file] -size=short -target=esp32 [source-code]