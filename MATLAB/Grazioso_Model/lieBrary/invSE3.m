%%%%%%%%% Inversion of SE(3) matrix %%%%%%%%%

function invH = invSE3(H)
%% Extract SO3 elements
R = H(1:3, 1:3);
t = H(1:3, 4);

%% Compute Inversion
invH = [R', -R'*t; zeros(1, 3), 1];
end