%%%%%%%%%%%% Simulation and Analysis %%%%%%%%%
close all
clear all
clc

%% Select MATLAB or SIMULINK
is_sim = true;

if is_sim
    load("dynamics_handle.mat");
    q0 = zeros(3, 1);
    q0d = zeros(3, 1);
else
    load("R_sip.mat");
    T1.dynamics;
end

%% Statics Solution
% T1.statics;

%% Dynamics Solution
% soft_dynamics = @(t, qqd) T1.derivatives(t, qqd, cell(T1.nact, 1));
% save("dynamics_handle.mat", "soft_dynamics");