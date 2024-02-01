%%%%%%% Plot Script %%%%%%
clear all
close all
clc

%% Load Dynamics Solution
load("DynamicsSolution.mat");

%% Plot Trajectory
plot(t, qqd(:, 1:3));
grid on
title("Controlled R-SIP GE-approach: Step traj.")
xlabel("time [s]")
ylabel("q")

%% Desired Trajectory
start_time = 15;
for i = 1:length(t)
%     theta_rd(i) = atan(t(i) - start_time);

    if t(i) <= start_time
        theta_rd(i) = -pi/2;
    else
        theta_rd(i) = pi/2;
    end
end

hold on
plot(t, theta_rd)
hold off
legend("\theta_{r}", "q_0", "q_1", "\theta_{rd}")