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

%% Initial Configuration
Ha = eye(4);
Ha0 = eye(4);

%% Forward Kinematics 
H = forwardKinematics(Ha, Ha0, alpha, L, d);

%% Inverse Kinematics
% d_inv = inverseKinematics(eye(4), eye(4), H, eye(4)); 

%% Plot Robot
% plotSoRo(rand(6, 1), 1, 0.1)

%% Differential Kinematics