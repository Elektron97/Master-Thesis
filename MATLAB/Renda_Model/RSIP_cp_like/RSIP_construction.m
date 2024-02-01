%%%%%%%%%%%%%% Simulation of R-Soft Inverted Pendulum %%%%%%%%%%%%%%%%%
close all
clear all
clc

% My startup
cd ..
my_startup
cd RSIP_cp_like

%% Parameters
% length = 1.0;       % Length of SIP
% radius = 0.1;      % Radius of SIP
% k_rev = 0;       % Joint Stiffness
% rho = 1070;         % Density
% E = 0.061424e6;     % Young Modulus
% v = 0.5;            % Poissons Ratio
% damp = 0.112e5;     % Damping
% dampR = 0.02;       % Damping of Rotoidal joint
%% Links Definition
% L1 = SorosimLink;
% save("Link_Properties2.mat");
load("Link_Properties2.mat");

%% Open Chain Definition
T1 = SorosimLinkage(L1);
save("R_sip2.mat");
% load("R_sip2.mat")
%% Plot Initial Configuration
T1.plotq0

%% Save R-SIP
% save("R_sip2.mat", 'T1')