%%%%%%%%%%%%% Tangent Operator on SE(3) %%%%%%%%%%%%%

function tangentSE3 = TSE3(h)
assert(length(h) == 6, 'hw is not a 6-D vector.');

hu = h(1:3);
hw = h(4:end);

hu_tilde = skew(hu);
hw_tilde = skew(hw);

if norm(hw) ~= 0
    term1 = ((1-alphaHw(hw))/norm(hw)^2)*(hu_tilde*hw_tilde - hw_tilde*hu_tilde);
    term2 = (hw' * hu)/(norm(hw)^2)*( (betaHw(hw) - alphaHw(hw))*hw_tilde + ( (betaHw(hw)/2) - 3*((1-alphaHw(hw))/norm(hw)^2)*hw_tilde^2));
else
    term1 = (1/6)*(hu_tilde*hw_tilde - hw_tilde*hu_tilde);
    term2 = ( (betaHw(hw) - alphaHw(hw))*hw_tilde + ( (betaHw(hw)/2) - 3*(1/6)*hw_tilde^2));
end

Tuw_plus = (-betaHw(hw)/2) + term1 + term2;

tangentSE3 = [TSO3(hw), Tuw_plus; zeros(3, 3), TSO3(hw)];
end