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
ho = h(2:3);

Mrr = M(1, 1);
Mro = M(1, 2:3);
Moo = M(2:3, 2:3);
invMoo = pinv(Moo);

Gr = G(1);
Go = G(2:3);

% Desired Trajectory
% start_time = 15;
% thetaRdes_2dot = -(2*t - 2*start_time)/((t - start_time)^2 + 1)^2;
% thetaRdes_dot = 1/((t - start_time)^2 + 1);
% thetaRdes = atan(t - start_time);

start_time = 15;
thetaRdes_2dot = 0;
thetaRdes_dot = pi/4;
thetaRdes = pi/4*t;

Kd = 5;
Kp = 20;

v = thetaRdes_2dot + Kd*(thetaRdes_dot - qd(1)) + Kp*(thetaRdes - q(1));
u = (Mrr - Mro*invMoo*Mro')*v + hr + Gr - Mro*invMoo*(ho + Go);

%% Saturation
% MAX_TAU = 5.5; % Nm
% 
% if(abs(u) > MAX_TAU)
%     u = sign(u)*MAX_TAU;
% end


end