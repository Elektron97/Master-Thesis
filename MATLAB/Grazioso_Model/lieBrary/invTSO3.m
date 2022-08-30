%%%%%%%%% Inverse of Tangent Operator on SO(3) %%%%%%%%

function invTso3 = invTSO3(hw)

assert(length(hw) == 3, 'hw is not a 3-D vector.');
hw_tilde = skew(hw);

if(norm(hw) ~= 0)
    invTso3 = eye(3) + 0.5*hw_tilde + ((1 - gammaHw(hw))/(norm(hw)^2))*(hw_tilde^2);
else
    invTso3 = eye(3) + 0.5*hw_tilde + (1/12)*(hw_tilde^2);
end
    
end