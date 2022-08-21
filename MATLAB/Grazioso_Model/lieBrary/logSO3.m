%%%%%%%%% Logarithmic Map on SO(3) %%%%%%%%%

function log_so3 = logSO3(H)

% Extract Rotation Matrix (SO(3) from SE(3))
R = H(1:3, 1:3);

theta = acos(0.5*(trace(R) - 1));

if(theta ~= 0)
    log_so3 = (theta/(2*sin(theta)))*(R - R');
else
    log_so3 = 0.5*(R - R');
end

end