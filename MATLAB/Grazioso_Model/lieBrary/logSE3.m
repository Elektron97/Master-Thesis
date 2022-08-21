%%%%%%%%% Logarithmic Map on SE(3) %%%%%%%%%

function log_se3 = logSE3(H)
%% Extract SO(3) elements
R = H(1:3, 1:3);
t = H(1:3, 4);

%% Compute logarithmic mapping
hw_tilde = logSO3(R);
hw = vex(hw_tilde);
hu = t;

log_se3 = [hw_tilde, (invTSO3(hw)')*hu; zeros(1, 3), 0];
end