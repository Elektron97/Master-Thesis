%%%%%%%%% Tuw_minus %%%%%%%

function T_minus = Tuw_minus(hu, hw)

hu_tilde = skew(hu);
hw_tilde = skew(hw);

if norm(hw) ~= 0
%     term1 = ((1-gammaHw(hw))/norm(hw)^2)*(-hu_tilde*hw_tilde + hw_tilde*hu_tilde);
%     term2 = (hu' * hw)/(norm(hw)^4)* ( ((1/betaHw(hw)) + gammaHw(hw) -2) * (hu_tilde^2));

    term1 = ((betaHw(hw) - alphaHw(hw))/(betaHw(hw) * (norm(hw)^2) )) * (hu_tilde*hw_tilde + hw_tilde*hu_tilde);
    term2 = ((hw' * hu)/(norm(hw)^4)) * ((1 + alphaHw(hw) - 2*betaHw(hw))/(betaHw(hw))) * (hw_tilde^2); 

else
    term1 = zeros(3, 3);
    term2 = zeros(3, 3);
end

T_minus = (1/2)*hu_tilde + term1 + term2;


end