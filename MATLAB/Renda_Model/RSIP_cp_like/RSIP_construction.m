%%%%%%%%%%%%%% Simulation of R-Soft Inverted Pendulum %%%%%%%%%%%%%%%%%
% close all
% clear all
% clc

% My startup
% cd ..
% my_startup
% cd RSIP_cp_like

%% Parameters
L = 1.0;                   % Length of SIP
radius = 0.05;                  % Radius of SIP
k_rev = 0;                      % Joint Stiffness
% rho = 1.0/(pi*radius^2);    % Density
rho = 1141.5728;    % Density
J_z = (pi/4)*(radius)^4;
E = 1.0/J_z;                    % Young Modulus
v = 0.5;                        % Poissons Ratio
damp = 0.1/(3*J_z);             % Damping
dampR = 0.5;                    % Damping of Rotoidal joint

%% Display the parameters
disp("Length: " + num2str(L));
disp("Radius: " + num2str(radius));
disp("rho: " + num2str(rho));
disp("Young Modulus: " + num2str(E));
disp("Damping: " + num2str(damp));

%% Links Definition
L1 = SorosimLink;
% save("Link_Properties2.mat");
% load("Link_Properties2.mat");
% load("Link_Properties3.mat");

% L1.Ms{1}(1:end-6*2, :) = zeros(L1.nGauss{1}*6-6*2, 6);

%% Open Chain Definition
T1 = SorosimLinkage(L1);
T1.D(1, 1) = dampR;
T1.CAS = 1;

% load("R_sip2.mat")
%% Plot Initial Configuration
T1.plotq0

%% Save R-SIP
% save("R_sip2.mat", 'T1')

%% Save function handle
soft_dynamics = @(t, qqd) T1.derivatives(t, qqd, cell(T1.nact, 1));
% save("dynamics_handle2.mat")

%% Simulation
q0 = [0; pi/4; -pi/4];
q0d = zeros(3, 1);

% Load slx file
slx_filename = 'R_SIPsim2022b.slx';
load_system(slx_filename);
result = sim(slx_filename, 'ReturnWorkspaceOutputs','on'); %simulate and extract results

%% Generate Useful Signals for Plot
n_data = length(result.simout.time);

for i = 1:n_data
    desired_traj(i) = step_traj(result.simout.time(i));
%     desired_traj(i) = atan_traj(result.simout.time(i));
end

%% Plot Results
figure
plot(result.simout.time, result.simout.data, 'LineWidth', 2.0);
grid on
xlabel("Time [s]");
ylabel("q");
hold on
plot(result.simout.time, desired_traj, '--', 'LineWidth', 2.0);
hold off
legend("\theta_r", "q_0", "q_1", "\theta_{rd}")

%% Functions
function thetaRdes = step_traj(t)
    start_time = 15;

    if(t <= start_time)
        thetaRdes = -pi/2;
    else
        thetaRdes = pi/2;
    end
end

function thetaRdes = atan_traj(t)
    % atan(t - 15)
    start_time = 15;
    thetaRdes = atan(t - start_time);
end