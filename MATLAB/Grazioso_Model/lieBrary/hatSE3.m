%%%%%%%%%%%% Hat operator on se(3) %%%%%%%%%%%%%%%%

function h_hat = hatSE3(h)
hu = h(1:3);
hw = h(4:end);

% Hat (^) operator
h_hat = [skew(hw), skew(hu); zeros(3, 3), skew(hw)];
end