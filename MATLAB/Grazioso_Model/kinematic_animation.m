%%%%%%%%%%% Grazioso Soft Robot Animation %%%%%%%%%
clear all
close all
clc

%% Add Functions
addpath("lieBrary")
addpath("grazioso_lib")

%% Trajectory
freq = 10;
time_step = (100*freq)^(-1);
end_time = 1;
omega = 2*pi*freq;

L = 1;

t = 0:time_step:0.1;
d = (L/sqrt(3))*[sin(omega*t); cos(omega*t); sin(omega*t); cos(omega*t); sin(omega*t); cos(omega*t)];
d_dot = (L/sqrt(3))*omega*[cos(omega*t); -sin(omega*t); cos(omega*t); -sin(omega*t); cos(omega*t); -sin(omega*t)];

Ha0 = eye(4);
Ha = eye(4);
Hb0 = forwardKinematics(Ha, Ha0, L, L, d(:, 1));
alpha = L;

for i = 1:length(t)
    eta(:, i) = softJacobian(alpha, d(:, i), L, Ha0, Hb0)*d_dot(:, i);
end
%% Animation
for i = 1:length(t)
%     subplot(2, 2, [1 3])
%     plotSoRo(d(:, i), L, 0.01);
%     
%     subplot(2, 2, 2)
%     plot(t(1:i), d(:, 1:i))
%     grid on
%     title("Relative Deformation")
%     xlabel("time [s]")
%     
%     subplot(2, 2, 4)
%     plot(t(1:i), eta(:, 1:i))
%     grid on
%     title("Derivative of Deformation")
%     xlabel("time [s]")
% %     ylim([-500, 500])
    
    plotSoRo(d(:, i), L, 0.1);
    drawnow
end