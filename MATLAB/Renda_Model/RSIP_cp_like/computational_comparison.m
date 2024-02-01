clear all
clc
close all

%% Computational Times of the two Models
inertia_renda = 0.19104;
gravity_renda = 0.034344;

inertia_santina = 0.10244;
gravity_santina = 0.014415;

%% Plot
% Define categories
x = categorical({'Inertia', 'Gravity'});
y = [inertia_santina, inertia_renda; gravity_santina gravity_renda];

figure
bar(x, y)
title("Computational Time of Dynamics Matrices");
ylabel("Comp. Time [s]");
legend("Curv. Param.", "Strain Param.");
grid on