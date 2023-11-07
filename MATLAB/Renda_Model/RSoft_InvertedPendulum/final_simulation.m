%%%%%%%%%%%% Simulation and Analysis %%%%%%%%%
close all
clear all
clc

% My startup
cd ..
my_startup
cd RSoft_InvertedPendulum

%% Simulate
load("dynamics_handle.mat");

% % Master Thesis Simulation
% q0 = zeros(3, 1);
% q0d = zeros(3, 1);

% Paper Simulation
q0 = [0; pi/4; -pi/8];
q0d = zeros(3, 1);

% Load slx file
slx_filename = 'R_SIPsim.slx';
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