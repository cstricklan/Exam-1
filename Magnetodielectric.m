%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Magnetodielectric Device Model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initialize MATLAB
close all; clc;
clear all; 

% UNITS
meters = 1;
decimeters = 1e-1 * meters;
centimeters = 1e-2 * meters;
millimeters = 1e-3 * meters;
inches = 2.54 * centimeters;
feet = 12 * inches;
seconds = 1;
hertz = 1/seconds;
kilohertz = 1e3 * hertz;
megahertz = 1e6 * hertz;
gigahertz = 1e9 * hertz;


% Dimensions
% SLAB1
d1 = 1/decimeters; %cm thick
ur1 = 3;
er1 = 3;

% SLAB2
d2 = 0.5/decimeters; %cm thick
ur2 = 2;
er2 = 2;

% Set our critical dimension to SLAB2
dc = d2; 

% Create our Material Vectors

rNz = ceil(d1+d2); %This Nz represents real world size

%Material Vectors Initialized at Air
rER = ones([1 rNz]);
rUR = ones([1 rNz]);

% Add our Slab materials to the model
rER(1:d1) = er1;
rUR(1:d1) = ur1;

rER(d1+1:d1+1+d2-1)= er2;
rUR(d1+1:d1+1+d2-1)= ur2;

% Frequency

freq_start = 0; %DC
freq_end = 1*gigahertz; %1Ghz

NFREQ = freq_end / (1*megahertz); %Frequencies every 100Mhz upto 10Ghz
FREQ = linspace(freq_start, freq_end, NFREQ); %FREQ List

Title = 'Exam #1 - Magnetodielectric Device';
[REF TRN CON] = FDTD1D( (dc)*decimeters, (d1+d2)*decimeters, rER, rUR, 15000, 100, FREQ, NFREQ, 50, -1, Title );

PlotMag;














