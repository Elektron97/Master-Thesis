%%%%%%%%%%%% Differential Kinematics %%%%%%%%%%%%%

function Jsoro = softJacobian(alpha, d, L, Ha0, Hb0)
% Compute useful terms
invHa0 = invSE3(Ha0);
invHb0 = invSE3(Hb0);

J1 = adjointSE3(expSE3(-alpha*(d/L))*invHa0)*invTSE3(-d)*adjointSE3(invHa0);
J2 = (invTSE3(-d)*adjointSE3(invHa0))^2 + (invTSE3(d)*adjointSE3(invHb0))^2;
J3 = (alpha/L)*TSE3((alpha/L)*d);

Jsoro = -J1*pinv(J2) + J3;
end