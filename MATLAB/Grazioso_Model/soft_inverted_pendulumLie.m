%%%%%%%%%%%%%%%%% Soft Inverted Pendulum modelized with Grazioso Model %%%%%%%%%%%%%%%
close all
clear all
clc

%% Add Functions
addpath("lieBrary")
addpath("grazioso_lib")

%% Variables and Parameters

% Declaration
% Variables
syms alpha d1 d2 d3 d4 d5 d6 real

% Parameters
syms L real

%% Useful Vectors
% Relative Deformation d
d = [d1 d2 d3 d4 d5 d6]';

% Deformation Vector f
f = d/L;

%% Forward Kinematics 
H = forwardKinematics(eye(4), eye(4), alpha, L, d);
% H = forwardKinematics(eye(4), eye(4), 0, L, d)
