%%%%%%%%%%%%%% Simulation of R-Soft Inverted Pendulum %%%%%%%%%%%%%%%%%
close all
clear all
clc

% My startup
cd ..
my_startup
cd RSIP_cp_like

%% Parameters
length = 1.0;                   % Length of SIP
radius = 0.05;                  % Radius of SIP
k_rev = 0;                      % Joint Stiffness
rho = 1/(pi*length*radius^2);    % Density
J_z = (pi/4)*(radius)^4;
E = 1.0/J_z;                    % Young Modulus
v = 0.5;                        % Poissons Ratio
damp = 0.1/(3*J_z);             % Damping
dampR = 0.5;                    % Damping of Rotoidal joint

%% Display the parameters
disp("Length: " + num2str(length));
disp("Radius: " + num2str(radius));
disp("rho: " + num2str(rho));
disp("Young Modulus: " + num2str(E));
disp("Damping: " + num2str(damp));

%% Links Definition
% L1 = SorosimLink;
% save("Link_Properties2.mat");
load("Link_Properties2.mat");

%% Open Chain Definition
T1 = SorosimLinkage(L1);
% load("R_sip2.mat")
%% Plot Initial Configuration
% T1.plotq0

%% Save R-SIP
save("R_sip2.mat", 'T1')
save("R_sip_cp.mat", 'T1')