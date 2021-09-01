# esp32_tinygo


Dockerfile to generate a development enviroment to compile binaries with [tiny-go](https://tinygo.org/) for a [ESP-32](https://en.wikipedia.org/wiki/ESP32).

## Instructions

### Building

    docker build -t [some-tag] .
    
### Running

    docker run --rm -it -v $(pwd):/home/gopher/src [some-tag] /bin/bash
    
    where $(pwd) is the folder of the tiny-go code.

#### Once inside, build the code with

     tinygo build -o [output-file] -size=short -target=esp32-mini32 [source-code]
    
