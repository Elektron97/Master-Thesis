clear all
clc
close all

%% Load Simulation Result from SoRoSim
load("DynamicsSolution.mat");

%% Plot Simulation
n = size(qqd, 2);

plot(t, qqd(:, 1:n/2));
grid
title("Generalized Coordinates of SoRoSim Examples");
xlabel("time [s]")
ylabel("q")