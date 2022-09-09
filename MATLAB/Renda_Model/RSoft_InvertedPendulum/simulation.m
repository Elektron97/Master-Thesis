%%%%%%%%%%%% Simulation and Analysis %%%%%%%%%
close all
clear all
clc

%% Select MATLAB or SIMULINK
is_sim = false;
eqstatics = false;

if is_sim
    load("dynamics_handle.mat");
    q0 = zeros(3, 1);
    q0d = zeros(3, 1);
else
    load("R_sip.mat");
    if eqstatics
%         equilibria_handle = @(q) Equilibrium(T1,q,0, 1);

        n_try = 10;
        tau = -5:0.1:5;
        options = optimoptions('fsolve','Algorithm',' trust-region-dogleg','MaxFunctionEvaluations',2e10);%,'Jacobian','on'); 'trust-region-dogleg' (default), 'trust-region', and 'levenberg-marquardt'.
        for i = 1:length(tau)
            equilibria_handle = @(q) Equilibrium(T1, q, tau(i), 1);

            for j = 1:n_try
                equilibria{i}(:, j) = fsolve(equilibria_handle, randn(3, 1), options);
            end
            disp("End of " + num2str(tau(i)) + " Nm torque Equilibria");
        end
%         save("equilibria_tau.mat", "equilibria");
    else
        load("equilibria_tau.mat");

        % wrap2pi for thetaR
        for i = 1:101
            equilibria{i}(1, :) = wrapToPi(equilibria{i}(1, :));
        end

%         T1.dynamics;
    end
    
end

%% Statics 
if ~is_sim
    % Plot Equilibria
    f1 = figure;
    f2 = figure;
    f3 = figure;
    tau = -5:0.1:5;
    
    figure(f1)
    hold on
    for i = 1:length(tau)
    
        plot(tau(i), equilibria{i}(1, :), 'rx')
    end
    hold off
    grid on
    xlabel("\tau")
    ylabel("\theta_R")
    
    figure(f2)
    hold on
    for i = 1:length(tau)
    
        plot(tau(i), equilibria{i}(2, :), 'bx')
    end
    hold off
    grid on
    xlabel("\tau")
    ylabel("q_0")
    
    figure(f3)
    hold on
    for i = 1:length(tau)
    
        plot(tau(i), equilibria{i}(3, :), 'gx')
    end
    hold off
    grid on
    xlabel("\tau")
    ylabel("q_1")
end
%% Plot Unusual Equilibria
% f4 = figure;
% 
% figure(f4)
% T1.plotq(equilibria{10}(:, 1))
%% Dynamics Solution
% soft_dynamics = @(t, qqd) T1.derivatives(t, qqd, cell(T1.nact, 1));
% save("dynamics_handle.mat", "soft_dynamics");