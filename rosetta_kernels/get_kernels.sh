#!/bin/bash
mkdir -p kernels; cd kernels

mkdir -p ck
mkdir -p fk
mkdir -p lsk
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

# Download LSK kernels:
cd lsk
wget -nc https://naif.jpl.nasa.gov/pub/naif/ROSETTA/kernels/lsk/NAIF0011.TLS
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
