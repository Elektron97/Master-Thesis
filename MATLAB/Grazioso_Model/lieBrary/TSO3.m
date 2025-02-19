%%%%%%%%%%%%% Tangent Operator on SO(3) %%%%%%%%%%%%%

function tangentSO3 = TSO3(hw)
assert(length(hw) == 3, 'hw is not a 3-D vector.');

hw_tilde = skew(hw);

if(norm(hw) ~= 0)
    tangentSO3 = eye(3) - (betaHw(hw)/2)*hw_tilde + ((1 - alphaHw(hw))/(norm(hw)^2))*(hw_tilde^2);
else
    tangentSO3 = eye(3) - (betaHw(hw)/2)*hw_tilde + (1/6)*(hw_tilde^2);
end

end