%%%%%%%%% Validazione Matrici Dinamiche %%%%%%%%%%%%%%
clear all
close all
clc

%% Add Functions
load("R_sip.mat");

%% Computational cost of dynamics matrices
% tic 
% GeneralizedMassMatrix(T1, [pi/4; pi/4; -pi/4]);
% inertia_comp = toc;
% disp("Inertia Matrix Computational time:" + num2str(inertia_comp) + " seconds.");
% 
% tic 
% myGravity(T1, [pi/4; pi/4; -pi/4]);
% gravity_comp = toc;
% disp("Gravity Vector Computational time:" + num2str(gravity_comp) + " seconds.");

%% Computational Cost Analysis 3D
% Define of Range of Values
abs_range = 10;
n_try = 1;
[Q0, Q1] = meshgrid(-abs_range:0.1:abs_range, -abs_range:0.1:abs_range);
THETAR = 0*Q0;
% Q0 = 0*Q1;

for i = 1:size(Q0, 1)
    for j = 1:size(Q1, 2)
        % Several Tries to have a relevant statistic
        for k=1:n_try
            tic
            GeneralizedMassMatrix(T1, [THETAR(i, j); Q0(i, j); Q1(i, j)]);
            realizations(k) = toc;
        end
        inertia_comp(i, j) = mean(realizations); %[s]
    end
end

%% Plotting
figure
s = surf(Q0, Q1, inertia_comp);
s.EdgeColor = 'none';
xlabel("q_0");
ylabel("q_1");
zlabel("Avg. Comp. Time [s]");
grid on
title("Average Computational Time of Inertia Matrix")