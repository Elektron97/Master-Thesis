%%%%%%%%%%% Exponential Map on SO3 %%%%%%%%%

function eSO3 = expSO3(hw)

assert(length(hw) == 3, 'hw is not a 3-D vector.');

hw_tilde = skew(hw);
eSO3 = eye(3) + alphaHw(hw)*hw_tilde + (betaHw(hw)/2)*(hw_tilde^2);
end