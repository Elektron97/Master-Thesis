%%%%%%%%%%%%%%%% Find Equilibria of R-Soft Inverted Pendulum %%%%%%%%%%%
clear all
close all
clc

%% Load Model
% load("R_sip.mat");
load("R_sip2.mat");
%% Solve Equilibria Equation
% Create function handle
equilibria_handle = @(q) Equilibrium(T1,q,0, 1);

% Options
% options = optimoptions('fsolve','Algorithm','levenberg-marquardt','MaxFunctionEvaluations',2e10);
% Finding Equilibria
% fsolve(equilibria_handle, randn(3, 1), options);


% Multiple tries
n_try = 100;

for i = 1:n_try
    equilibria(:, i) = fsolve(equilibria_handle, randn(3, 1));
end

%% Check Configuration
% T1.plotq(equilibria(:, 5))