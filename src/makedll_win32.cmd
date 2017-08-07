@echo off

echo Compiling: release
g++ -std=gnu++0x -m32 -Wall -O1 -s -g -mtune=core2 -c *.cpp

echo Linking
g++ -std=gnu++0x -m32 -s -g -shared -static-libgcc -static-libstdc++ -o trueskillplugin.dll *.o -L../ -lcom_plugin
echo Cleaning up
del *.o

pause