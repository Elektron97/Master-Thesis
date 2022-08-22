%%%%%%%%% Plot Soft Robot using Grazioso formulation %%%%%%%%%

function plotSoRo(d, L, length_arrow)
%% Inertial Frame and Initial Position
% Inertial Frame
Ti = eye(4);
trplot(Ti, 'frame', 'I', 'color', 'k', 'length', length_arrow);
hold on

% Initial Position
Ha = eye(4);
Ha0 = eye(4);

%S0 Frame
trplot(Ha*Ha0, 'frame', 'S0', 'length', length_arrow, 'color', 'r');

%% Plot Body
%Ss Frames
s_step = 0.01;
% d_step = 0.01;

s = 0:s_step:1;
alpha = s*L;

% Compute Point
for i=1:length(s)
   H = forwardKinematics(Ha, Ha0, alpha(i), L, d);
   body_points(:, i) = H(1:3, 4); % Extract position
   
   % Plot Tip
   if(s(i)==1)
        trplot(H, 'frame', 'S1', 'length', length_arrow, 'color', 'r');
    end
end

% 1D Soft Segment
plot3(body_points(1, :), body_points(2, :), body_points(3, :), 'linewidth', 2, 'color', [0, 0.4470, 0.7410])

hold off
view(-45, 12);
end