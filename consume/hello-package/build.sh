#!/bin/bash

GREEN="\e[32;1m"
RESET="\e[0m"

set -e

if [ -d build ]; then
    rm -rf build
fi
mkdir build && cd build

echo -e "${GREEN}=== Installing hello/0.1 package${RESET}"
# install the hello/0.1 package
conan install .. --build

echo -e "${GREEN}=== Running CMake${RESET}"
cmake ..
cmake --build .

echo -e "${GREEN}=== Running test${RESET}"
bin/app
# 
