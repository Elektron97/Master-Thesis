%%%%%%%%% Inverse of Tangent Operator on SE(3) %%%%%%%%

function invTse3 = invTSE3(h)
assert(length(h) == 6, 'hw is not a 6-D vector.');

hu = h(1:3);
hw = h(4:end);

hu_tilde = skew(hu);
hw_tilde = skew(hw);

if norm(hw) ~= 0
    term1 = ((1-gammaHw(hw))/norm(hw)^2)*(-hu_tilde*hw_tilde + hw_tilde*hu_tilde);
    term2 = (hw' * hu)/(norm(hw)^4)* (((1/betaHw(hw)) + gammaHw(hw) -2) * (hu_tilde^2));
else
    term1 = (1/12)*(-hu_tilde*hw_tilde + hw_tilde*hu_tilde);
    term2 = zeros(3, 3);
end

Tuw_minus = (1/2)*hw_tilde + term1 + term2;

invTse3 = [invTSO3(hw), Tuw_minus; zeros(3, 3), invTSO3(hw)];
    
end