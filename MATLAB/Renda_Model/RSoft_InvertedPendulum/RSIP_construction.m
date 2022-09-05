%%%%%%%%%%%%%% Simulation of R-Soft Inverted Pendulum %%%%%%%%%%%%%%%%%
close all
clear all
clc

%% Parameters
% length = 0.5;   % Length of SIP
% radius = 0.05;  % Radius of SIP
% k_rev = 0.01;   % Joint Stiffness
% rho = 1000;     % Density
% E = 1e6;        % Young Modulus
% v = 0.5;        % Poissons Ratio
% damp = 0.112e5; % Damping

%% Links Definition
% L1 = SorosimLink;
load("Link_Properties.mat")

%% Open Chain Definition
T1 = SorosimLinkage(L1);

%% Plot Initial Configuration
% T1.plotq0

%% Save R-SIP
save("R_sip.mat", 'T1')