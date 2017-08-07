#!/bin/bash

echo Compiling: release
g++ -std=gnu++0x -m32 -Wall -O1 -s -g -fvisibility=hidden -mtune=core2 -c *.cpp

echo Linking
g++ -std=gnu++0x -m32 -s -g -shared -o trueskillplugin.so *.o
echo Cleaning up
rm *.o