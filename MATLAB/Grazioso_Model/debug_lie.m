close all
clear all
clc

%% Add Functions
addpath("lieBrary")
addpath("grazioso_lib")

%% Debug lieBrary
test = [1 0 0 1 0 0]';
test_rand = randn(6, 1);
syms a b c d e f real
test_sym = [a b c d e f]';

%% Debug TSO3
% tso3 = TSO3(test_rand(4:6));
% invtso3 = invTSO3(test_rand(4:6));
% tso3*invtso3

% tso3 = TSO3(test_sym(4:6));
% invtso3 = invTSO3(test_sym(4:6));
% tso3*invtso3

%% Debug TSE3
T = TSE3(test);
invT = invTSE3(test);
T*invT