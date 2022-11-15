# SPICE Tutorial

A simple demonstration of some of the capabilities of SPICE is provided in `MATLAB`.  An even briefer example is shown in `python` and `C++` simply for the purposes of demonstrating how the SPICE toolkit can be used in other languages.  

The `MATLAB` and `python` demos should work natively on any machine, while the `C++` demo only provides instructions for building on Linux.  It should be relatively straight forward to build on MacOS, but building on Windows without WSL will require some experience in compiling C++ on windows.

## MATLAB
First, make sure that you have the `MICE` (the `MATLAB` version of SPICE) downloaded and added to your `MATLAB` path.  Download the correct version for your operating system here:  https://naif.jpl.nasa.gov/naif/toolkit_MATLAB.html

Once it is downloaded and added to your `MATLAB` path, you can simply run the `matlab/example.m` script.

## Python
You'll need to install the `spiceypy`,`numpy`,`matplotlib` modules.  These can be installed with either the `pip` or `conda` package managers (though, I personally always recommend `conda` or its opensource reimplementation, [mambaforge](https://github.com/conda-forge/miniforge)).

Once those are installed, you can simply run `python example.py` from within the `python/` subdirectory of this project.

## C++ (Specific instructions for Linux provided)
If you wish to build the C++ project on your own, you'll need to know how to link and compile C++ code on your machine.  This will include downloading the correct binaries (which can be found here: https://naif.jpl.nasa.gov/naif/toolkit_C.html), and then linking the cspice binaries and including the `SpiceUsr.h` file into your project.  

Instructions for doing this on a 64-bit linux machine are now provided:

1. `cd cpp` (move into the `cpp/` example directory)
2. `wget https://naif.jpl.nasa.gov/pub/naif/toolkit//C/PC_Linux_GCC_64bit/packages/cspice.tar.Z` (Download the [cspice.tar.Z](https://naif.jpl.nasa.gov/pub/naif/toolkit//C/PC_Linux_GCC_64bit/packages/cspice.tar.Z))
3. `tar -xvf cspice.tar.Z` (untar the cspice files)
4. `g++ -o example example.cpp -I cspice/include/ -L cspice/include/cspice.a` (Build the project)
5. `./example` (run the project.  If it cannot be run, try first changing permissions using `chmod +x example`)

# Questions:
If you have any follow-up questions related to SPICE, or any questions/issues related to any of these tutorials, please don't hesitate to reach out to Chris Gnam:  crgnam@buffalo.edu 