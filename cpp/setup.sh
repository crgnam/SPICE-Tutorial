#!/bin/bash

# Get the cspice library:
wget -nc https://naif.jpl.nasa.gov/pub/naif/toolkit//C/PC_Linux_GCC_64bit/packages/cspice.tar.Z

# Untar the cspice library:
if [ -d "./cspice/" ]
then
    echo "cspice library has already been unpacked"
else
    tar -xvf cspice.tar.Z
fi

# Build the project:
mkdir build
cd build
cmake ..
make
mv example ../