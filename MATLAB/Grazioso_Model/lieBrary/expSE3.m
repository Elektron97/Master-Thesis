%%%%%%%% Exponential map on SE(3) %%%%%%%

function eSE3 = expSE3(h)
assert(length(h) == 6, 'h is not a 6-D vector.');

hu = h(1:3);
hw = h(4:6);

eSE3 = [expSO3(hw), (TSO3(hw)')*hu; zeros(1, 3), 1];
end