%%%%%%%%% Inverse Kinematics %%%%%%%

function d = inverseKinematics(Ha, Ha0, Hb, Hb0)

%% Logarithmic Mapping
d = logSE3(invSE3(Ha0)*invSE3(Ha)*Hb*Hb0);
end