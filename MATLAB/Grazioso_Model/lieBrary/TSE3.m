%%%%%%%%%%%%% Tangent Operator on SE(3) %%%%%%%%%%%%%

function tangentSE3 = TSE3(h)
assert(length(h) == 6, 'hw is not a 6-D vector.');

hu = h(1:3);
hw = h(4:end);

tangentSE3 = [TSO3(hw), Tuw_plus(hu, hw); zeros(3, 3), TSO3(hw)];
end