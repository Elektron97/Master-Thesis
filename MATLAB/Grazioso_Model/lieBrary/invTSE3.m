%%%%%%%%% Inverse of Tangent Operator on SE(3) %%%%%%%%

function invTse3 = invTSE3(h)
assert(length(h) == 6, 'hw is not a 6-D vector.');

hu = h(1:3);
hw = h(4:end);

invTse3 = [invTSO3(hw), Tuw_minus(hu, hw); zeros(3, 3), invTSO3(hw)];
    
end