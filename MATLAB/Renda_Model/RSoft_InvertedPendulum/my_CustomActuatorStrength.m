%Function to calculate actuator strength as a function of system dynamics
%Last modified by Anup Teejo Mathew 02.03.2022

function u = my_CustomActuatorStrength(Tr,q,g,J,t,qd,eta,Jd,M,C,F,Bq)

%Tr: Linkage element,
%q and qd: joint coordinates and their time derivatives,
%g, J, Jd, and eta: transformation matrix, Jacobian, time derivative of jacobian, and screw velocity at every significant point of the linkage
%t:  time
%M,C,F,Bq: generalized mass, coriolis, force, and actuation matrices.
%u should be (nactx1) column vector where nact is the total number of actuators.

nact = Tr.nact;
u = zeros(nact,1);

%% Design Custom Actuator

end