matlabrc; clc; close all;

% Great overview documentation available at:
% https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/Tutorials/pdf/individual_docs/

% Adds MICE to the MATLAB search path
addpath(genpath('../../MATLAB/mice'))

% Clear the kernel pool (specific to MATLAB):
% https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/MATLAB/mice/cspice_kclear.html
cspice_kclear();

% Furnish the meta kernel (and thus all kernels specified by it):
% https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/FORTRAN/spicelib/furnsh.html
cspice_furnsh('../rosetta_kernel.tm')

