%%%%%%%%%%%% Lie Bracket on se(3) %%%%%%%%%%%%%%%%
% [h1, h2], where h_i \in R^{6}.                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function lieB = lieBracketSE3(h1, h2)
% Hat (^) operator
h_hat = hatSE3(h1);

if nargin > 1
    lieB = h_hat*h2;
else
    lieB = h_hat;
end
end