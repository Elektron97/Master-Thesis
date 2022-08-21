%%%%%%% alphaHw: function for Rodriguez formula %%%%%%%

function aHw = alphaHw(hw)
assert(length(hw) == 3, 'hw is not a 3-D vector.');

%% sinc(||hw||)
if(norm(hw) ~= 0)
    aHw = sin(norm(hw))/(norm(hw));
else
    aHw = 1;
end

end