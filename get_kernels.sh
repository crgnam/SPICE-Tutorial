#!/bin/bash

#############################################
### Download the required generic kernels ###
#############################################
cd kernels/generic_kernels
mkdir -p lsk
mkdir -p pck
mkdir -p spk

# Get generic leap seconds kernel:
cd lsk
wget -nc https://naif.jpl.nasa.gov/pub/naif/generic_kernels/lsk/naif0012.tls
cd ..

# Get orientation and gravity data for celestial bodies:
cd pck
wget -nc https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/pck00010.tpc
wget -nc https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/Gravity.tpc
cd ..

# Get the standard SPK kernel (REMOVE THIS):
cd spk
wget -nc https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de430.bsp
wget -nc https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/satellites/sat441.bsp
cd ..

cd ..

#############################################
### Download the required ROSETTA kernels ###
#############################################
cd rosetta_kernels
mkdir -p ck
mkdir -p fk
mkdir -p sclk
mkdir -p spk
mkdir -p dsk

# Download CK kernels:
cd ck
wget -nc https://naif.jpl.nasa.gov/pub/naif/ROSETTA/kernels/ck/CATT_DV_257_03_______00344.BC
wget -nc https://naif.jpl.nasa.gov/pub/naif/ROSETTA/kernels/ck/ROS_SC_REC_160101_160601_V01.BC
cd ..

# Download FK kernels:
cd fk
wget -nc https://naif.jpl.nasa.gov/pub/naif/ROSETTA/kernels/fk/ROS_CHURYUMOV_V01.TF
wget -nc https://naif.jpl.nasa.gov/pub/naif/ROSETTA/kernels/fk/ROS_V37.TF
cd ..

# Download SCLK kernels:
cd sclk
wget -nc https://naif.jpl.nasa.gov/pub/naif/ROSETTA/kernels/sclk/ROS_160929_STEP.TSC
cd ..

# Download SPK kernels:
cd spk
wget -nc https://naif.jpl.nasa.gov/pub/naif/ROSETTA/kernels/spk/RORB_DV_257_02_______00344.BSP
wget -nc https://naif.jpl.nasa.gov/pub/naif/ROSETTA/kernels/spk/CORB_DV_257_02_______00344.BSP
cd ..

# Download the DSK kernels:
cd dsk
wget -nc https://naif.jpl.nasa.gov/pub/naif/ROSETTA/kernels/dsk/ROS_CG_M004_OSPGDLR_U_V1.BDS
cd ..
