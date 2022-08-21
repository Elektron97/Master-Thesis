%%%%%%%%% Forward Kinematics %%%%%%%

function H_a = forwardKinematics(Ha, Ha0, alpha, L, d)

%% Asserts' Block
assert(length(d) == 6, 'd is not a 6-D vector');
%assert((alpha >= 0) & (alpha <= L), 'alpha is not a curvilin. abscissa.');

%% Exponential Mapping
H_a = Ha*Ha0*expSE3(alpha*(d/L));
end