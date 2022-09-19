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
%         options = optimoptions('fsolve','Algorithm',' trust-region-dogleg','MaxFunctionEvaluations',2e10);%,'Jacobian','on'); 'trust-region-dogleg' (default), 'trust-region', and 'levenberg-marquardt'.
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

        %% Filter Equilibria
        for i = 1:length(equilibria)
           filtered_equilibria{i} = filterEquilibria(equilibria{i});
        end

        % wrap2pi for thetaR
        for i = 1:length(equilibria)
            filtered_equilibria{i}(1, :) = wrapToPi(filtered_equilibria{i}(1, :));
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
    
        plot(tau(i), filtered_equilibria{i}(1, :), 'x', 'Color', [0 0.4470 0.7410])
    end
    hold off
    grid on
    xlabel("\tau")
    ylabel("\theta_R")
    title("Equilibria of R-SIP: \theta_r")
    
    figure(f2)
    hold on
    for i = 1:length(tau)
    
        plot(tau(i), filtered_equilibria{i}(2, :), 'x', 'Color', [0.8500 0.3250 0.0980])
    end
    hold off
    grid on
    xlabel("\tau")
    ylabel("q_0")
    title("Equilibria of R-SIP: q_0")
    
    figure(f3)
    hold on
    for i = 1:length(tau)
    
        plot(tau(i), filtered_equilibria{i}(3, :), 'x', 'Color', [0.9290 0.6940 0.1250])
    end
    hold off
    grid on
    xlabel("\tau")
    ylabel("q_1")
    title("Equilibria of R-SIP: q_1")
end
%% Plot Unusual Equilibria
% f4 = figure;
% 
% figure(f4)
% T1.plotq(equilibria{10}(:, 1))

%% Stability of Equilibria
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% In order to check stability of equilibria,    %
% it's mandatory to compute numerical gradient  %
% of gravity vector.                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % Fun. Handle of Gravity
% grav_handle = @(q) myGravity(T1, q, 0, 1);
% 
% % To compute gradient of G, it's necessary
% % computing points of G
% scale = 1;
% theta_r_limit = pi;
% theta0_limit = 9.2546;
% theta1_limit = 11.1738;
% 
% THETAR = -theta_r_limit:scale:theta_r_limit;
% THETA0 = -theta0_limit:scale:theta0_limit;
% THETA1 = -theta1_limit:scale:theta1_limit;
% 
% for i = 1:length(THETAR)
%     for j = 1:length(THETA0)
%         for k = 1:length(THETA1)
%               GRAVITY(i, j, k, :) = grav_handle([THETAR(i); THETA0(j); THETA1(k)]);
%         end
%     end
% end
% 
% % Numerical Gradient with gradient function: Using for each element of G
% [G1x, G1y, G1z] = gradient(GRAVITY(:, :, :, 1));
% [G2x, G2y, G2z] = gradient(GRAVITY(:, :, :, 2));
% [G3x, G3y, G3z] = gradient(GRAVITY(:, :, :, 3));
% 
% % Gradiente dato un indice
% diffG = @(idxs) [G1x(idxs(1), idxs(2), idxs(3)), G1y(idxs(1), idxs(2), idxs(3)), G1z(idxs(1), idxs(2), idxs(3)); ...
%                  G2x(idxs(1), idxs(2), idxs(3)), G2y(idxs(1), idxs(2), idxs(3)), G2z(idxs(1), idxs(2), idxs(3)); ...
%                  G3x(idxs(1), idxs(2), idxs(3)), G3y(idxs(1), idxs(2), idxs(3)), G3z(idxs(1), idxs(2), idxs(3))];

%% Dynamics Solution
% soft_dynamics = @(t, qqd) T1.derivatives(t, qqd, cell(T1.nact, 1));
% save("dynamics_handle.mat", "soft_dynamics");

%% Kinematic Simulation
% T1.plotq(equilibria{51}(:, 2))
% T1.plotq(equilibria{51}(:, 4))

%% Filter Equilibria
function equil = filterEquilibria(equilibria)
    equil = zeros(3, 1);
    
    for i = 1:size(equilibria, 2)
        if(equilibria(:, i) ~= equil)
            equil = [equil, equilibria(:, i)];
        end
    end
    
    equil = equil(:, 2:end);
end
