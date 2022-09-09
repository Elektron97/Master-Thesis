%%%%%%%%%%%% Simulation and Analysis %%%%%%%%%
close all
clear all
clc

%% Select MATLAB or SIMULINK
is_sim = true;
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
        options = optimoptions('fsolve','Algorithm','trust-region-dogleg','Display','iter','MaxFunctionEvaluations',2e10);%,'Jacobian','on'); 'trust-region-dogleg' (default), 'trust-region', and 'levenberg-marquardt'.
        for i = 1:length(tau)
            equilibria_handle = @(q) Equilibrium(T1, q, tau(i), 1);

            for j = 1:n_try
                equilibria{i}(:, j) = fsolve(equilibria_handle, randn(3, 1), options);
            end
            disp("End of " + num2str(tau(i)) + " Nm torque Equilibria");
        end
    else
        T1.dynamics;
    end
    
end

%% Statics Solution
% T1.statics;

%% Dynamics Solution
% soft_dynamics = @(t, qqd) T1.derivatives(t, qqd, cell(T1.nact, 1));
% save("dynamics_handle.mat", "soft_dynamics");