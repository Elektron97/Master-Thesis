%%%%%%%%% Inverse Kinematics %%%%%%%

function d = inverseKinematics(Ha, Ha0, Hb, Hb0)

%% Logarithmic Mapping
d = logSE3(inv(Ha0)*inv(Ha)*Hb*Hb0);
end