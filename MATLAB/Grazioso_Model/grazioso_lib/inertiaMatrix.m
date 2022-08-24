%%%%%%%%%%%%% Inertia Matrix %%%%%%%%%%%

function M = inertiaMatrix(rho, A, Ixx, Iyy, Izz)
M = blkdiag(rho*A*eye(3), diag([Ixx, Iyy, Izz]));
end