%%%%%%% gammaHw: function for Rodriguez formula %%%%%%%

function cHw = gammaHw(hw)
assert(length(hw) == 3, 'hw is not a 3-D vector.');

%% For ||hw|| == 0, betaHw = 1
if(norm(hw) ~= 0)
    cHw = (norm(hw)/2)*cot(norm(hw)/2);
else
    cHw = 1;
end

end