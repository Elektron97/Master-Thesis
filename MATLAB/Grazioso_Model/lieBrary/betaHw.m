%%%%%%% betaHw: function for Rodriguez formula %%%%%%%

function bHw = betaHw(hw)
assert(length(hw) == 3, 'hw is not a 3-D vector.');
bHw = 2*(1 - cos(norm(hw)))/(norm(hw)^2);
end