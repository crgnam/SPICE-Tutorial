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
cspice_furnsh('../basics_kernel.tm')

% Obtain the radii of some bodies:
earth_radii = cspice_bodvrd('EARTH','RADII',3);
enceladus_radii = cspice_bodvrd('ENCELADUS','RADII',3);
vesta_radii = cspice_bodvrd('VESTA','RADII',3);

% Obtain the GM of some bodies:
earth_gm = cspice_bodvrd('EARTH','GM',1);
sun_gm = cspice_bodvrd('SUN','GM',1);
jupiter_gm = cspice_bodvrd('JUPITER','GM',1);

% Convert todays datetime to Ephemeris Time (ET) also known as Barycentric Dynamical Time (TDB)
% https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/FORTRAN/req/time.html
et = cspice_str2et(datestr(datetime));

% Obtain orientation information for several bodies:
% https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/FORTRAN/spicelib/pxform.html
earth_rotation = cspice_pxform('J2000','IAU_EARTH',et);
mars_rotation = cspice_pxform('J2000','IAU_MARS',et);
ceres_rotation = cspice_pxform('J2000','IAU_CERES',et);

% Calculate rotation of saturn's moon Enceladus relative to the Earth:
enceladus_rotation_earth = cspice_pxform('IAU_EARTH','IAU_ENCELADUS',et);