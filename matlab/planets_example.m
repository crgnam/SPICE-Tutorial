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
cspice_furnsh('../planets_kernel.tm')

% Start and end dates:
start_date = datetime;
end_date = start_date + 10*365; %(10 years later)

% Convert to Ephemeris Time (ET) also known as Barycentric Dynamical Time (TDB)
% https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/FORTRAN/req/time.html
et_start = cspice_str2et(datestr(start_date));
et_end = cspice_str2et(datestr(end_date));
et_span = linspace(et_start, et_end, 10000);

% Reference Frame Definition:
% https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/req/frames.html
% Also: https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/Tutorials/pdf/individual_docs/17_frames_and_coordinate_systems.pdf

FRAME = 'J2000';
% FRAME = 'ECLIPJ2000';

ORIGIN = 'SSB';
% ORIGIN = 'SUN';

% Get the positions for all the planets:
planets = {'MERCURY','VENUS','EARTH','MARS_BARYCENTER','JUPITER_BARYCENTER','SATURN_BARYCENTER','URANUS_BARYCENTER','NEPTUNE_BARYCENTER'};
for ii = 1:length(planets)
    % Get the positions for the given planet at all ephemeris times:
    % https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/FORTRAN/spicelib/spkpos.html
    positions = cspice_spkpos(planets{ii},et_span, FRAME, 'NONE', ORIGIN);
    plot3(positions(1,:),positions(2,:),positions(3,:)); hold on
end
legend(planets,'Interpreter','None','location','northeast')
axis equal
grid on
rotate3d on