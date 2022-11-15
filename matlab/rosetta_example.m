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

% Define start/end Ephemeris Time (ET) also known as Barycentric Dynamical Time (TDB)
% https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/FORTRAN/req/time.html
et_start = cspice_str2et('2016 MAR 2 12:00:00');
et_end   = cspice_str2et('2016 MAR 4 12:00:00');

ets = linspace(et_start,et_end,100);

% Get the positions of the spacecraft relative to the comet:
positions = cspice_spkpos('ROSETTA',ets,'67P/C-G_CK','NONE','CHURYUMOV-GERASIMENKO');

plot3(positions(1,:),positions(2,:),positions(3,:),'k'); hold on

% Get the attitudes of spacecraft relative to the comet:
AXIS_SCALE = 3;
LINE_WIDTH = 2;
for ii = 1:length(ets)
    relative_attitude = cspice_pxform('67P/C-G_CK','ROS_SPACECRAFT',ets(ii));
    
    % Draw the relative attitude x-axis:
    plot3([0 AXIS_SCALE*relative_attitude(1,1)] + positions(1,ii),...
          [0 AXIS_SCALE*relative_attitude(1,2)] + positions(2,ii),...
          [0 AXIS_SCALE*relative_attitude(1,3)] + positions(3,ii),'r',...
          'LineWidth',LINE_WIDTH);
      
    % Draw the relative attitude y-axis:
    plot3([0 AXIS_SCALE*relative_attitude(2,1)] + positions(1,ii),...
          [0 AXIS_SCALE*relative_attitude(2,2)] + positions(2,ii),...
          [0 AXIS_SCALE*relative_attitude(2,3)] + positions(3,ii),'g',...
          'LineWidth',LINE_WIDTH);
      
    % Draw the relative attitude z-axis:
    plot3([0 AXIS_SCALE*relative_attitude(3,1)] + positions(1,ii),...
          [0 AXIS_SCALE*relative_attitude(3,2)] + positions(2,ii),...
          [0 AXIS_SCALE*relative_attitude(3,3)] + positions(3,ii),'b',...
          'LineWidth',LINE_WIDTH);
end

% Get the sun relative to the comet:
sun_pos = cspice_spkpos('SUN',ets,'67P/C-G_CK','NONE','CHURYUMOV-GERASIMENKO');
light("Style","local","Position",sun_pos(:,1)); % Add it as a light-source to the plot

% Get the shape model of the comet:
% https://naif.jpl.nasa.gov/pub/naif/toolkit_docs/MATLAB/mice/cspice_dskv02.html
handle  = cspice_dasopr('../kernels/rosetta_kernels/dsk/ROS_CG_K024_OMSDLAM_N_V1.BDS');
[dladsc, found] = cspice_dlabfs(handle);
[nv, np] = cspice_dskz02(handle, dladsc); % Get the number of vertices and plates (faces)
plates = cspice_dskp02( handle, dladsc, 1, np )'; % Get the plate definitions
vertices = cspice_dskv02( handle, dladsc, 1, nv )'; % Get the vertex data
cspice_dascls(handle) % Close the file

patch('Faces',double(plates),'Vertices',vertices,...
      'FaceColor',[.5 .5 .5],'EdgeColor','None',...
      'SpecularStrength',0)

axis equal
grid on
rotate3d on
title('ROSETTA Pose Relative to 67P Body Frame')
  
%% Now plot the trajectory in Inertial Coordinates:
figure(2)

% Get the positions of the spacecraft relative to the comet:
positions = cspice_spkpos('ROSETTA',ets,'J2000','NONE','CHURYUMOV-GERASIMENKO');

plot3(positions(1,:),positions(2,:),positions(3,:),'k'); hold on

% Get the attitudes of spacecraft relative to the comet:
AXIS_SCALE = 3;
LINE_WIDTH = 2;
for ii = 1:length(ets)
    relative_attitude = cspice_pxform('J2000','ROS_SPACECRAFT',ets(ii));
    
    % Draw the relative attitude x-axis:
    plot3([0 AXIS_SCALE*relative_attitude(1,1)] + positions(1,ii),...
          [0 AXIS_SCALE*relative_attitude(1,2)] + positions(2,ii),...
          [0 AXIS_SCALE*relative_attitude(1,3)] + positions(3,ii),'r',...
          'LineWidth',LINE_WIDTH);
      
    % Draw the relative attitude y-axis:
    plot3([0 AXIS_SCALE*relative_attitude(2,1)] + positions(1,ii),...
          [0 AXIS_SCALE*relative_attitude(2,2)] + positions(2,ii),...
          [0 AXIS_SCALE*relative_attitude(2,3)] + positions(3,ii),'g',...
          'LineWidth',LINE_WIDTH);
      
    % Draw the relative attitude z-axis:
    plot3([0 AXIS_SCALE*relative_attitude(3,1)] + positions(1,ii),...
          [0 AXIS_SCALE*relative_attitude(3,2)] + positions(2,ii),...
          [0 AXIS_SCALE*relative_attitude(3,3)] + positions(3,ii),'b',...
          'LineWidth',LINE_WIDTH);
end

axis equal
grid on
rotate3d on
title('ROSETTA Pose Relative to 67P in J2000')