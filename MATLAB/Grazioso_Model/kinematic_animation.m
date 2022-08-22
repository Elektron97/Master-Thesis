%%%%%%%%%%% Grazioso Soft Robot Animation %%%%%%%%%
clear all
close all
clc

%% Trajectory
freq = 10;
time_step = (100*freq)^(-1);
end_time = 1;
omega = 2*pi*freq;

L = 1;

t = 0:time_step:0.1;
d = (L/sqrt(3))*[sin(omega*t); cos(omega*t); sin(omega*t); cos(omega*t); sin(omega*t); cos(omega*t)];
d_dot = (L/sqrt(3))*omega*[cos(omega*t); -sin(omega*t); cos(omega*t); -sin(omega*t); cos(omega*t); -sin(omega*t)];


for i = 1:length(t)
    subplot(1, 2, 1)
    plotSoRo(d(:, i), L, 0.01);
    
    subplot(1, 2, 2)
    plot(t(1:i), d(:, 1:i))
    grid on
    title("Relative Deformation")
    xlabel("time [s]")
    
    drawnow
end