%%% Animation (for Windows) %%%
clear variables
close all
clc

%% Load Robot
load("R_sipWindows.mat");
load("atan_result.mat");

%% Record Video
T1.plotqqd(result.simout.time, result.simout.data)