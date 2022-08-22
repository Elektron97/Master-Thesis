%%%%%%%%%%%% Differential Kinematics %%%%%%%%%%%%%

function Jsoro = softJacobian(alpha, d, L, Ha0, Hb0)
% Compute useful terms
J1 = adjointSE3(expSE3(alpha*(d/L))*inv(Ha0))*invTSE3(-d)*adjointSE3(inv(Ha0));
J2 = (invTSE3(-d)*adjointSE3(inv(Ha0)))^2 + (invTSE3(d)*adjointSE3(inv(Hb0)))^2;
J3 = (alpha/L)*TSE3((alpha/L)*d);

Jsoro = J1 + inv(J2) + J3;
end