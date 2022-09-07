%%%%%%%%%%%% Simulation and Analysis %%%%%%%%%
close all
clear all
clc

%% Load R-SIP Structure
% load("R_sip.mat");

%% Plot Initial Configuration
% T1.plotq0

%% Statics Solution
% T1.statics;

%% Dynamics Solution
% T1.dynamics;
% soft_dynamics = @(t, qqd) T1.derivatives(t, qqd, cell(T1.nact, 1));
% save("dynamics_handle.mat", "soft_dynamics");
% load("dynamics_handle.mat");