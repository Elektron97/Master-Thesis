%%%%%%%%%% MATERIAL ANALYSIS %%%%%%%%%%%%
%        Ecoflex 00-30 / 00-50          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
clear all
clc

%% Load Data from Soft Robotics Database
% Ecoflex 00 30
ecoflex30Table = readtable("Ecoflex 00-30.csv");
ecoflex30Data.Time = ecoflex30Table{17:end, 1};
ecoflex30Data.TrueStrain = ecoflex30Table{17:end, 2};
ecoflex30Data.TrueStress = ecoflex30Table{17:end, 3};
ecoflex30Data.EngStrain = ecoflex30Table{17:end, 4};
ecoflex30Data.EngStress = ecoflex30Table{17:end, 5};
clear ecoflex30Table

% Ecoflex 00 50
ecoflex50Table = readtable("Ecoflex 00-50.csv");
ecoflex50Data.Time = ecoflex50Table{17:end, 1};
ecoflex50Data.TrueStrain = ecoflex50Table{17:end, 2};
ecoflex50Data.TrueStress = ecoflex50Table{17:end, 3};
ecoflex50Data.EngStrain = ecoflex50Table{17:end, 4};
ecoflex50Data.EngStress = ecoflex50Table{17:end, 5};
clear ecoflex50Table

n_data30 = length(ecoflex30Data.Time);
n_data50 = length(ecoflex50Data.Time);

%% Linear Regression
% Linear Range: Strain: 0-0.3
linear_range =0.3;

idx30 = find(ecoflex30Data.TrueStrain <= linear_range);
idx30 = idx30(end);

idx50 = find(ecoflex50Data.TrueStrain <= linear_range);
idx50 = idx50(end);

coefficients30 = [ones(length(ecoflex30Data.TrueStrain(1:idx30)), 1), ecoflex30Data.TrueStrain(1:idx30)]\ecoflex30Data.TrueStress(1:idx30);
coefficients50 = [ones(length(ecoflex50Data.TrueStrain(1:idx50)), 1), ecoflex50Data.TrueStrain(1:idx50)]\ecoflex50Data.TrueStress(1:idx50);

%Generate Data 
Y30 = coefficients30(1)*ones(length(ecoflex30Data.TrueStrain(1:idx30)), 1) + coefficients30(2)*ecoflex30Data.TrueStrain(1:idx30);
Y50 = coefficients50(1)*ones(length(ecoflex50Data.TrueStrain(1:idx50)), 1) + coefficients50(2)*ecoflex50Data.TrueStrain(1:idx50);

disp("Young Modulus of Ecoflex 00-30 in range 0 - 0.3 Strain is " + coefficients30(2) + " [MPa]")
disp("Young Modulus of Ecoflex 00-50 in range 0 - 0.3 Strain is " + coefficients50(2) + " [MPa]")

%% Plot Data
% % Comparison without axis limits
% figure
% plot(ecoflex30Data.TrueStrain, ecoflex30Data.TrueStress, '.')
% grid on
% title("Experimental Data Ecoflex 00-30/00-50")
% xlabel("True Strain \epsilon")
% ylabel("True Stress \sigma [MPa]")
% hold on
% plot(ecoflex50Data.TrueStrain, ecoflex50Data.TrueStress, '.')
% hold off
% legend("00-30", "00-50")
% 
% Comparison in a linear range (True)
figure
plot(ecoflex30Data.TrueStrain, ecoflex30Data.TrueStress, '.')
grid on
title("Experimental Data Ecoflex 00-30/00-50")
xlabel("True Strain \epsilon")
ylabel("True Stress \sigma [MPa]")
hold on
plot(ecoflex50Data.TrueStrain, ecoflex50Data.TrueStress, '.')
plot(ecoflex30Data.TrueStrain(1:idx30), Y30)
plot(ecoflex50Data.TrueStrain(1:idx50), Y50)
hold off
xlim([0, 0.3])
ylim([[0, 0.05]])
legend("00-30", "00-50", "Linear Regression 00-30", "Linear Regression 00-50")

