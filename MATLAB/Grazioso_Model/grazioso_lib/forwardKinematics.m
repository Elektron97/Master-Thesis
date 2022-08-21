%%%%%%%%% Forward Kinematics %%%%%%%

function H_a = forwardKinematics(Ha, Ha0, alpha, L, d)

assert(length(d) == 6, 'd is not a 6-D vector');

H_a = Ha*Ha0*expSE3(alpha*(d/L));
end