%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Multi-Layer Device
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Initialize MATLAB
close all; clc;
clear all; 

% UNITS
meters = 1;
decimeters = 1e-1 * meters;
centimeters = 1e-2 * meters;
millimeters = 1e-3 * meters;
micrometers = 1e-6 * meters;
nanometers = 1e-9 * meters;
picometers = 1e-12 * meters;
inches = 2.54 * centimeters;
feet = 12 * inches;
seconds = 1;
hertz = 1/seconds;
kilohertz = 1e3 * hertz;
megahertz = 1e6 * hertz;
gigahertz = 1e9 * hertz;

%Constants
c0 = 299792458; %m/s
e0 = 8.854187817*10^-12; %F/m
u0 = 1.256637061*10^-6; %H/m

lambda_0 = 10*micrometers;

%Dimensions
d = [0.55504 0.1 0.1 0.9 0.27293 0.67907 0.56973]*lambda_0/micrometers;
n = [1.3045 2.3640 3.2847 3.5 2.7029 1.8344 1.3];
er = n.^2;

% Set our critical dimension to SLAB2
dc = min(d);

% Create our Material Vectors

rNz = ceil(sum(d))+1; %This Nz represents real world size

%Material Vectors Initialized at Air
rER = ones([1 rNz]);
rUR = ones([1 rNz]);

zstart = 1;
zend = zstart;

for i = 1 : length(d)
  zend = zstart + round(d(i))-1;
  rER(zstart:zend) = er(i);
  zstart = zend + 1;
end



NLAM = 15/0.01;
LAMBDA = linspace(5, 15, NLAM)*micrometers; %WL List

Title = 'Exam #1 - Multi-Layer Device';
[REF TRN CON ssEy ER dz za] = FDTD1DWL( (dc*micrometers), (sum(d)*micrometers), rER, rUR, -1, 100, LAMBDA, NLAM, 50, lambda_0 , Title );

PlotMulti;
