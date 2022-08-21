%%%%%%% alphaHw: function for Rodriguez formula %%%%%%%

function aHw = alphaHw(hw)
assert(length(hw) == 3, 'hw is not a 3-D vector.');
aHw = sin(norm(hw))/(norm(hw));
end