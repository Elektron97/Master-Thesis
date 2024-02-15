%%% Dynamics %%%
close all
clear
clc

%% Load SoRoSim object
load("R_sip2.mat")

%% Simulation
q0 = [0; pi/4; -pi/4];
q0d = zeros(3, 1);