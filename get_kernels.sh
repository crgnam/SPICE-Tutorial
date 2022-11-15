#!/bin/bash

# Get generic orientation data for celestial bodies:
wget -nc https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/pck00010.tpc

# Get generic gravity field data for planets:
wget -nc https://naif.jpl.nasa.gov/pub/naif/generic_kernels/pck/Gravity.tpc

# Get generic leap seconds kernel:
wget -nc https://naif.jpl.nasa.gov/pub/naif/generic_kernels/lsk/naif0012.tls

# Get the standard SPK kernel (REMOVE THIS):
wget -nc https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de430.bsp