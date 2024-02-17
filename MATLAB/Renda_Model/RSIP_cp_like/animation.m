%%% Animation %%%
close all
clear all
clc

% My startup
cd ..
my_startup
cd RSIP_cp_like

load("Link_Properties3.mat");

L1.Ms{1}(1:end-6*2, :) = zeros(L1.nGauss{1}*6-6*2, 6);

%% Open Chain Definition
dampR = 0.5;
T1 = SorosimLinkage(L1);
T1.D(1, 1) = dampR;
T1.CAS = 1;

%% Load Dataset
% load("atan_result.mat");
% load("step_result.mat");
load("sin_result.mat");

%% Plot Single Frame
T1.plotqqd(result.simout.time, result.simout.data)