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
cspice_furnsh('../saturn_kernel.tm')

% Start and end dates:
start_date = datetime;
end_date = start_date + 30; %(30 days later)

% Convert to Ephemeris Time (ET) also known as Barycentric Dynamical Time (TDB)
% https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/FORTRAN/req/time.html
et_start = cspice_str2et(datestr(start_date));
et_end = cspice_str2et(datestr(end_date));
et_span = linspace(et_start, et_end, 1000);

% Reference Frame Definition:
% https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/C/req/frames.html
% Also: https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/Tutorials/pdf/individual_docs/17_frames_and_coordinate_systems.pdf

FRAME = 'J2000';
% FRAME = 'ECLIPJ2000';

ORIGIN = 'SATURN';
% ORIGIN = 'SUN';

% Get the positions for some of saturn's moons:
figure(1)
moons = {'TITAN','ENCELADUS','MIMAS','DIONE','TETHYS'};
for ii = 1:length(moons)
    % Get the states for the given moon at all ephemeris times:
    % https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/FORTRAN/spicelib/spkezr.html
    states = cspice_spkezr(moons{ii},et_span, FRAME, 'NONE', ORIGIN);
    subplot(1,2,1)
        plot3(states(1,:),states(2,:),states(3,:)); hold on
        
    subplot(1,2,2)
        velocity_norm = sqrt(sum(states(4:6,:).*states(4:6,:),1));
        plot(velocity_norm); hold on
        
end
subplot(1,2,1)
    legend(moons,'Interpreter','None','location','northeast')
    axis equal
    grid on
    rotate3d on
    title('Positions')

subplot(1,2,2)
    title('Velocities')
    ylabel('km/s')

%% Get the positions of the moons relative to Enceladus:
figure(2)
moons = {'ENCELADUS','MIMAS','DIONE','TETHYS'};
for ii = 1:length(moons)
    % Get the states for the given moon at all ephemeris times:
    % https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/FORTRAN/spicelib/spkezr.html
    states = cspice_spkezr(moons{ii},et_span, 'IAU_TITAN', 'NONE', 'TITAN');
    plot3(states(1,:),states(2,:),states(3,:)); hold on
end
legend(moons,'Interpreter','None','location','northeast')
axis equal
grid on
rotate3d on
title('Positions Relative to Titan')