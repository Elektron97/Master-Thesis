%%%%%%% Plot Script %%%%%%
clear all
close all
clc

%% Load Dynamics Solution
% load("step_result.mat");
load("atan_result.mat");

%% Desired Trajectory
start_time = 15;

for i = 1:length(result.simout.time)
    desired_traj(i) = atan(result.simout.time(i) - start_time);

    % if result.simout.time(i) <= start_time
    %     desired_traj(i) = -pi/2;
    % else
    %     desired_traj(i) = pi/2;
    % end
end

%% Plot Trajectory
figure
plot(result.simout.time, result.simout.data, 'LineWidth', 2.0);
grid on
xlabel("Time [s]");
ylabel("q");
hold on
plot(result.simout.time, desired_traj, '--', 'LineWidth', 2.0);
hold off
legend("\theta_r", "q_0", "q_1", "\theta_{rd}")