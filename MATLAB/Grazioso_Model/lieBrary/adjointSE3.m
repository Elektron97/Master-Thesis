%%%%%%%%%%%%%% Adjoint Operator on SE(3) %%%%%%%%%%%%
% This function is an implementation of:            %
% Ad_{H} (h), where H is SE3 and h is se3.          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function AdH = adjointSE3(H, h)
%% Extract R and t from H
R = H(1:3, 1:3);
t = H(1:3, 4);
% Skew sym
t_tilde = skew(t);

if nargin > 1
    if length(h) == 6
        % vee form
        AdH = [R, t_tilde*R; zeros(3, 3), R]*h;
    else
        % hat form
        AdH = H*skew(h)*inv(H)
    end

else
    % Default: 6x6 matrix
    AdH = [R, t_tilde*R; zeros(3, 3), R];
end

end