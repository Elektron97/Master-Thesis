%%%%%%%%% Tuw_plus %%%%%%%

function T_plus = Tuw_plus(hu, hw)

hu_tilde = skew(hu);
hw_tilde = skew(hw);

if norm(hw) ~= 0
    term1 = ((1-alphaHw(hw))/norm(hw)^2)*(hu_tilde*hw_tilde + hw_tilde*hu_tilde);
    term2 = ((hw' * hu)/(norm(hw)^2)) * ( (betaHw(hw) - alphaHw(hw))*hw_tilde  +  ( (betaHw(hw)/2) - (3*(1-alphaHw(hw))/(norm(hw)^2))  )*(hw_tilde^2) );
else
    term1 = zeros(3, 3);
    term2 = zeros(3, 3);
end

T_plus = (-betaHw(hw)/2)*hu_tilde + term1 + term2;


end