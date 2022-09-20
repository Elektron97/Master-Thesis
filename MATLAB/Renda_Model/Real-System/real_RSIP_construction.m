%%%%%%%%%%%%%% Real R-Soft Inverted Pendulum %%%%%%%%%%%%%%%%%
close all
clear all
clc

%% Parameters
% % Rigid
% mass = 65e-3;
% rho_rigid = 1050;
% volume = mass/rho_rigid;
% length_rigid = 0.061;
% % syms D_rig real
% % diameter = solve(volume == pi*((D_rig^2)/4)*length_rigid)
% D_rigid = 0.0359;
% 
% % Soft
% length = 0.3;       % Length of SIP
% radius = 0.05;      % Radius of SIP
% k_rev = 0.01;       % Joint Stiffness
% rho = 1070;         % Density
% E = 0.061424e6;     % Young Modulus
% v = 0.5;            % Poissons Ratio
% damp = 0.112e5;     % Damping
dampR = 0.02;       % Damping of Rotoidal joint
%% Links Definition
% L1 = SorosimLink;
% L2 = SorosimLink;
% save("links_definition.mat", "L1", "L2")
load("links_definition.mat")

%% Open Chain Definition
T1 = SorosimLinkage(L1, L2);

%% CAS and Damping on revolute Joint
T1.CAS = 1;
T1.D = T1.D + blkdiag(dampR, zeros(2, 2));
%% Plot Initial Configuration
% T1.plotq0

%% Save R-SIP
% save("R_sip.mat", "T1");