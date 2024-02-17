%Function to calculate actuator strength as a function of system dynamics
%Last modified by Anup Teejo Mathew 02.03.2022

function u = my_CustomActuatorStrength(Tr,q,g,J,t,qd,eta,Jd,M,C,F,Bq)

%Tr: Linkage element,
%q and qd: joint coordinates and their time derivatives,
%g, J, Jd, and eta: transformation matrix, Jacobian, time derivative of jacobian, and screw velocity at every significant point of the linkage
%t:  time
%M,C,F,Bq: generalized mass, coriolis, force, and actuation matrices.
%u should be (nactx1) column vector where nact is the total number of actuators.

% N DoF
ndof = Tr.ndof;
% Actuation
nact = Tr.nact;
u = zeros(nact,1);

%% %%%%%%%%%%%%%%%%% Design Custom Actuator %%%%%%%%%%%%%%%%%%%%%

%% 1) First Controller: Collocated Feedback Linearization
% This controller is the simplest controller can be implemented
% in a Under-Actuated System, like Soft Inverted Pendulum.
% The collocated Feedback Linearization control the rotoidal joint
% at the base of R-Soft Inverted Pendulum.

%% Decompose Dynamic Equations
% Useful Matrix
K = Tr.K;
D = Tr.D;
G = -F;
h = C*qd + K*q + D*qd; 

hr = h(1);
ho = h(2:end);

Mrr = M(1, 1);
Mro = M(1, 2:end);
Moo = M(2:end, 2:end);
invMoo = pinv(Moo);

Gr = G(1);
Go = G(2:end);

%% Regenerate Dynamics without elongation and shear
% neglect elongation and shear
% q_cp = [q(1:3); 0; 0];
% qd_cp = [qd(1:3); 0; 0];
% 
% % Inertial Terms
% M_cp = Tr.GeneralizedMassMatrix(q_cp);
% C_cp = Tr.GeneralizedCoriolisMatrix(q_cp, qd_cp);
% 
% % Gravity
% G = -F;
% % set to zero the elongation and shear part
% K = Tr.K;
% D = Tr.D;
% h = C_cp*qd_cp + K*q_cp + D*qd_cp;
% 
% hr = h(1);
% ho = h(2:end);
% 
% Mrr = M_cp(1, 1);
% Mro = M_cp(1, 2:end);
% Moo = M_cp(2:end, 2:end);
% invMoo = pinv(Moo);
% 
% Gr = G(1);
% Go = G(2:end);

%% Desired Trajectory
% atan(t - 15)
start_time = 15;
thetaRdes_2dot = -(2*t - 2*start_time)/((t - start_time)^2 + 1)^2;
thetaRdes_dot = 1/((t - start_time)^2 + 1);
thetaRdes = atan(t - start_time);

% % step(t - 15)
% start_time = 15;
% if(t <= start_time)
%     thetaRdes = -pi/2;
% else
%     thetaRdes = pi/2;
% end
% 
% thetaRdes_2dot = 0;
% thetaRdes_dot = 0;

% magnitude = pi + pi/6;
% freq = 0.1;
% phase = 0.0;
% % mean_value = pi/2;
% mean_value = 0.0;
% 
% % theta_des
% thetaRdes = mean_value + magnitude*sin((2*pi*freq)*t + phase);
% thetaRdes_dot = magnitude*(2*pi*freq)*cos((2*pi*freq)*t + phase);
% thetaRdes_2dot = -magnitude*((2*pi*freq)^2)*sin((2*pi*freq)*t + phase);

% % linear theta_rdes
% thetaRdes_2dot = 0;
% thetaRdes_dot = pi/4;
% thetaRdes = pi/4*t;

% % constant
% thetaRdes_2dot = 0;
% thetaRdes_dot = 0;
% thetaRdes = 0;

%% LQR: optimal gains PD
A_lin = [0 1; 0 0];
B_lin = [0; -1];
Q = 100*eye(2);
R = 10;

% lqr() gives K | A - BK
[K, ~, ~] = lqr(A_lin, B_lin, Q, R);
Kp = -K(1);
Kd = -K(2);

v = thetaRdes_2dot + Kd*(thetaRdes_dot - qd(1)) + Kp*(thetaRdes - q(1));
u = (Mrr - Mro*invMoo*Mro')*v + hr + Gr - Mro*invMoo*(ho + Go);
% u = 0;

%% Saturation
% MAX_TAU = 5.5; % Nm
% 
% if(abs(u) > MAX_TAU)
%     u = sign(u)*MAX_TAU;
% end


end