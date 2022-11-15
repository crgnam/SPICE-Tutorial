# SPICE Tutorial

A simple demonstration of some of the capabilities of SPICE is provided in `MATLAB`.  An even briefer example is shown in `python` and `C++` simply for the purposes of demonstrating how the SPICE toolkit can be used in other languages.  

The `MATLAB` and `python` demos should work natively on any machine, while the `C++` demo only provides instructions for building on Linux.  It should be relatively straight forward to build on MacOS, but building on Windows without WSL will require some experience in compiling C++ on windows.

# Getting the Kernels
Before running any of the example code, you'll need to download the correct kernels.  If you are able to execute a bash script (e.g. you are using Linux or WSL) you can simply run the `get_kernels.sh` script.  If not, you will need to manually obtain the following files:
If you cannot run a bash script on your system (for example, if you are on Windows without WSL), you must manually download the following SPICE kernels:

## Included in the Repository:
| Link to File | Description | Location to put it | Size |
| ------------ | ----------- | ------------------ | ---- |
| [naif0012.tls](https://naif.jpl.nasa.gov/pub/naif/generic_kernels/lsk/naif0012.tls) | Leap Second kernel (LSK) | `kernels/generic_kernels/lsk/` | 5.2Kb |
| [pck00010.tpc](https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/pck00010.tpc) | Planetary Constants kernel (PCK) | `kernels/generic_kernels/pck/` | 124Kb |
| [Gravity.tpc](https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/Gravity.tpc) | Planetary Gravity kernel (PCK) | `kernels/generic_kernels/pck/` | 15Kb |

## Required for planets_example.m
| Link to File | Description | Location to put it | Size |
| ------------ | ----------- | ------------------ | ---- |
| [de430.bsp](https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de430.bsp) | Planetary Ephemerides | `kernels/generic_kernels/spk/` | 115MB |

## Required for saturn_example.m
| Link to File | Description | Location to put it | Size |
| ------------ | ----------- | ------------------ | ---- |
| [sat441.bsp](https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/satellites/sat441.bsp) | Saturn Moons Ephemerides | `kernels/generic_kernels/spk/` | 631Mb |

## Required for rosetta_example.m
| Link to File | Description | Location to put it | Size |
| ------------ | ----------- | ------------------ | ---- |
| [CATT_DV_257_03_______00344.BC](https://naif.jpl.nasa.gov/pub/naif/ROSETTA/kernels/ck/CATT_DV_257_03_______00344.BC) | Attitude kernel (CK) for Comet 67P | `kernels/rosetta_kernels/ck/` | 2.1Mb |
| [ROS_SC_REC_160101_160601_V01.BC](https://naif.jpl.nasa.gov/pub/naif/ROSETTA/kernels/ck/ROS_SC_REC_160101_160601_V01.BC) | Attitude kernel (CK) for ROSETTA | `kernels/rosetta_kernels/ck/`| 17Mb |
| [ROS_CHURYUMOV_V01.TF](https://naif.jpl.nasa.gov/pub/naif/ROSETTA/kernels/fk/ROS_CHURYUMOV_V01.TF) | Frames kernel (FK) for Comet 67P | `kernels/rosetta_kernels/fk/` | 2Kb |
| [ROS_V37.TF](https://naif.jpl.nasa.gov/pub/naif/ROSETTA/kernels/fk/ROS_V37.TF) | Frames kernel (FK) for ROSETTA | `kernels/rosetta_kernels/fk/` | 237 Kb |
| [ROS_160929_STEP.TSC](https://naif.jpl.nasa.gov/pub/naif/ROSETTA/kernels/sclk/ROS_160929_STEP.TSC) | Spacecraft Clock kernel (SCLK) | `kernels/rosetta_kernels/sclk/` | 17Kb |
| [RORB_DV_257_02_______00344.BSP](https://naif.jpl.nasa.gov/pub/naif/ROSETTA/kernels/spk/RORB_DV_257_02_______00344.BSP)  | Ephemeris kernel (SPK) for ROSETTA | `kernels/rosetta_kernels/spk/` | 92Mb |
| [CORB_DV_257_02_______00344.BSP](https://naif.jpl.nasa.gov/pub/naif/ROSETTA/kernels/spk/CORB_DV_257_02_______00344.BSP) | Ephemeris kernel (SPK) for Comet 67P | `kernels/rosetta_kernels/spk/` | 213Kb | 
| [ROS_CG_K024_OMSDLAM_N_V1.BDS](https://naif.jpl.nasa.gov/pub/naif/ROSETTA/kernels/dsk/ROS_CG_K024_OMSDLAM_N_V1.BDS) | Digital Shape kernel (DSK) for Comet 67P | `kernels/rosetta_kernels/dsk/` | 2Mb |


# Example Code
## MATLAB
First, make sure that you have the `MICE` (the `MATLAB` version of SPICE) downloaded and added to your `MATLAB` path.  Download the correct version for your operating system here:  https://naif.jpl.nasa.gov/naif/toolkit_MATLAB.html

Once it is downloaded and added to your `MATLAB` path, you can simply run the `matlab/example.m` script.

## Python
You'll need to install the `spiceypy` and `numpy` modules.  These can be installed with either the `pip` or `conda` package managers (though, I personally always recommend `conda` or its opensource reimplementation, [mambaforge](https://github.com/conda-forge/miniforge)).

Once those are installed, you can simply run `python example.py` from within the `python/` subdirectory of this project.

## C++ (Specific instructions for Linux provided)
If you wish to build the C++ project on your own, you'll need to know how to link and compile C++ code on your machine.  This will include downloading the correct binaries (which can be found here: https://naif.jpl.nasa.gov/naif/toolkit_C.html), and then linking the cspice binaries and including the `SpiceUsr.h` file into your project.  

Instructions for doing this on a 64-bit linux machine are now provided:

*NOTE: If you can run a bash script, you can skip steps 2-5 by running `setup.sh` from within the `cpp/` directory*

1. `cd cpp` (move into the `cpp/` example directory)
2. `wget https://naif.jpl.nasa.gov/pub/naif/toolkit//C/PC_Linux_GCC_64bit/packages/cspice.tar.Z` (Download the [cspice.tar.Z](https://naif.jpl.nasa.gov/pub/naif/toolkit//C/PC_Linux_GCC_64bit/packages/cspice.tar.Z))
3. `tar -xvf cspice.tar.Z` (untar the cspice files)
4. `mkdir build; cd build; cmake ..; make` (Build the project)
5. `mv example ../; cd ../` (Move the compiled `example` executable back to the `cpp/` directory)
6. `./example` (run the project.  If it cannot be run, try first changing permissions using `chmod +x example`)

# Questions:
If you have any follow-up questions related to SPICE, or any questions/issues related to any of these tutorials, please don't hesitate to reach out to Chris Gnam:  crgnam@buffalo.edu 