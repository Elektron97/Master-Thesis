%%%%%%% betaHw: function for Rodriguez formula %%%%%%%

function bHw = betaHw(hw)
assert(length(hw) == 3, 'hw is not a 3-D vector.');

%% For ||hw|| == 0, betaHw = 1
if(norm(hw) ~= 0)
    bHw = 2*(1 - cos(norm(hw)))/(norm(hw)^2);
else
    bHw = 1;
end

end