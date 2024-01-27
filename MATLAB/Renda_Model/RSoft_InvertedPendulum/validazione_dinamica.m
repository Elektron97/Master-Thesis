%%%%%%%%% Validazione Matrici Dinamiche %%%%%%%%%%%%%%
clear all
close all
clc

% My startup
cd ..
my_startup
cd RSoft_InvertedPendulum

%% Add Functions
load("R_sip.mat");

%% Computational cost of dynamics matrices
% tic 
% GeneralizedMassMatrix(T1, [pi/4; pi/4; -pi/4]);
% inertia_comp = toc;
% disp("Inertia Matrix Computational time:" + num2str(inertia_comp) + " seconds.");
% 
% tic 
% myGravity(T1, [pi/4; pi/4; -pi/4]);
% gravity_comp = toc;
% disp("Gravity Vector Computational time:" + num2str(gravity_comp) + " seconds.");

%% Validation of Dynamics Matrices
% [Q0, Q1] = meshgrid(-100:0.1:100, -100:0.1:100);
[Q0, Q1] = meshgrid(-10:0.1:10, -10:0.1:10);
THETAR = 0.*Q0;
%% Validation Gravity Vector
% [Q0, Q1] = meshgrid(-10:0.1:10, -10:0.1:10);
% THETAR = 0*Q0;
% 
% for i = 1:size(Q0, 1)
%     for j = 1:size(Q0, 2)
%         
%         % Not Singular Configurations
%         if(abs(Q1(i, j)) <= threshold)
%            Q1_sing = threshold;
%            
%            if(abs(Q0(i, j)) <= threshold)
%                 Q0_sing = threshold;
%            else
%                 Q0_sing = Q0(i, j);  
%            end   
%            
%         else
%             Q0_sing = Q0(i, j);
%             Q1_sing = Q1(i, j);
%         end
%         
%         testG = originGravityVector(Q0_sing, Q1_sing, m, g, L, D);
%         santinaG = G_fcn([Q0_sing; Q1_sing]);
%         testGr = gravityVector(THETAR(i, j), Q0_sing, Q1_sing, m, g, L, D);
%         
% %         testG = originGravityVector(Q0(i, j), Q1(i, j), m, g, L, D);
% %         santinaG = G_fcn([Q0(i, j); Q1(i, j)]);
% %         testGr = gravityVector(THETAR(i, j), Q0(i, j), Q1(i, j), m, g, L, D);
%         
%         G1(i, j) = testG(1);
%         G2(i, j) = testG(2);
%         
%         santina1(i, j) = santinaG(1);
%         santina2(i, j) = santinaG(2);
%         
%         Gr2(i, j) = testGr(2);
%         Gr3(i, j) = testGr(3);
%     end
% end
% 
% %G3
% figure
% s1 = surf(Q0, Q1, real(G1));
% s1.EdgeColor = 'none';
% xlabel("\theta_0");
% ylabel("\theta_1");
% zlabel("myG_1");
% 
% figure
% s2 = surf(Q0, Q1, real(santina1));
% s2.EdgeColor = 'none';
% xlabel("\theta_0");
% ylabel("\theta_1");
% zlabel("Santina G1");
% 
% figure
% s3 = surf(Q0, Q1, real(Gr2));
% s3.EdgeColor = 'none';
% xlabel("\theta_0");
% ylabel("\theta_1");
% zlabel("myGr_1");
% 
% %G2
% 
% figure
% s1 = surf(Q0, Q1, real(G2));
% s1.EdgeColor = 'none';
% xlabel("\theta_0");
% ylabel("\theta_1");
% zlabel("myG_2");
% 
% figure
% s2 = surf(Q0, Q1, real(santina2));
% s2.EdgeColor = 'none';
% xlabel("\theta_0");
% ylabel("\theta_1");
% zlabel("Santina G2");
% 
% figure
% s3 = surf(Q0, Q1, real(Gr3));
% s3.EdgeColor = 'none';
% xlabel("\theta_0");
% ylabel("\theta_1");
% zlabel("myGr_2");

%% Validation Inertia Matrix

for i = 1:size(Q0, 1)
    for j = 1:size(Q1, 2)     

        testBr = GeneralizedMassMatrix(T1, [THETAR(i, j); Q0(i, j); Q1(i, j)]);

        condBr(i, j) = cond(real(testBr));
        
        Br11(i, j) = testBr(2, 2);
        Br12(i, j) = testBr(2, 3);
        Br21(i, j) = testBr(3, 2);
        Br22(i, j) = testBr(3, 3);        
    end
end

%% Plot

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % my B
% figure
% subplot(2, 2, 1)
% s1 = surf(Q0, Q1, real(B11));
% s1.EdgeColor = 'none';
% xlabel("\theta_0");
% ylabel("\theta_1");
% zlabel("myB_{11}");
% view(23, 21);
% 
% subplot(2, 2, 2)
% s2 = surf(Q0, Q1, real(B12));
% s2.EdgeColor = 'none';
% xlabel("\theta_0");
% ylabel("\theta_1");
% zlabel("myB_{12}");
% view(23, 21);
% 
% subplot(2, 2, 3)
% s3 = surf(Q0, Q1, real(B21));
% s3.EdgeColor = 'none';
% xlabel("\theta_0");
% ylabel("\theta_1");
% zlabel("myB_{21}");
% view(23, 21);
% 
% subplot(2, 2, 4)
% s4 = surf(Q0, Q1, real(B22));
% s4.EdgeColor = 'none';
% xlabel("\theta_0");
% ylabel("\theta_1");
% zlabel("myB_{22}");
% view(23, 21);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % Santina B
% figure
% subplot(2, 2, 1)
% s1 = surf(Q0, Q1, real(santina11));
% s1.EdgeColor = 'none';
% xlabel("\theta_0");
% ylabel("\theta_1");
% zlabel("Santina B_{11}");
% view(23, 21);
% 
% subplot(2, 2, 2)
% s2 = surf(Q0, Q1, real(santina12));
% s2.EdgeColor = 'none';
% xlabel("\theta_0");
% ylabel("\theta_1");
% zlabel("Santina B_{12}");
% view(23, 21);
% 
% subplot(2, 2, 3)
% s3 = surf(Q0, Q1, real(santina21));
% s3.EdgeColor = 'none';
% xlabel("\theta_0");
% ylabel("\theta_1");
% zlabel("Santina B_{21}");
% view(23, 21);
% 
% subplot(2, 2, 4)
% s4 = surf(Q0, Q1, real(santina22));
% s4.EdgeColor = 'none';
% xlabel("\theta_0");
% ylabel("\theta_1");
% zlabel("Santina B_{22}");
% view(23, 21);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% % my Br
% figure
% subplot(2, 2, 1)
% s1 = surf(Q0, Q1, real(Br11));
% s1.EdgeColor = 'none';
% xlabel("q_0");
% ylabel("q_1");
% zlabel("Br_{22}");
% view(23, 21);
% 
% subplot(2, 2, 2)
% s2 = surf(Q0, Q1, real(Br12));
% s2.EdgeColor = 'none';
% xlabel("q_0");
% ylabel("q_1");
% zlabel("Br_{23}");
% view(23, 21);
% 
% subplot(2, 2, 3)
% s3 = surf(Q0, Q1, real(Br21));
% s3.EdgeColor = 'none';
% xlabel("q_0");
% ylabel("q_1");
% zlabel("Br_{32}");
% view(23, 21);
% 
% subplot(2, 2, 4)
% s4 = surf(Q0, Q1, real(Br22));
% s4.EdgeColor = 'none';
% xlabel("q_0");
% ylabel("q_1");
% zlabel("Br_{33}");
% view(23, 21);

%%%%%%%%%%%%%%% Condition Number of Inertia Matrix %%%%%%%%%%%%%%%%

% figure
% subplot(1, 3, 1)
% s5 = surf(Q0, Q1, condB);
% s5.EdgeColor = 'none';
% xlabel("\theta_0");
% ylabel("\theta_1");
% zlabel("Condition Number of myB");
% view(23, 21);
% 
% subplot(1, 3, 2)
% s5 = surf(Q0, Q1, condSantina);
% s5.EdgeColor = 'none';
% xlabel("\theta_0");
% ylabel("\theta_1");
% zlabel("Condition Number of Santina B");
% view(23, 21);
% 
% subplot(1, 3, 3)
% s5 = surf(Q0, Q1, condBr);
% s5.EdgeColor = 'none';
% xlabel("\theta_0");
% ylabel("\theta_1");
% zlabel("Condition Number of myBr");
% view(23, 21);

s5 = surf(Q0, Q1, condBr);
s5.EdgeColor = 'none';
xlabel("q_0");
ylabel("q_1");
zlabel("\chi(M)");
view(23, 21);
set(gca, 'ZScale', 'log')
%zlim([0, 1e+6]);
colorbar
set(gca, 'ColorScale', 'log')
title("Condition Number of Inertia Matrix (SP)")

%%%%%%%%%%%%%%%% Norm of Difference %%%%%%%%%%%%%%%
% figure
% % C = norm_diff;
% s5 = surf(Q0, Q1, norm_diff);
% s5.EdgeColor = 'none';
% xlabel("\theta_0");
% ylabel("\theta_1");
% zlabel("||myB - santinaB||_2");
% view(23, 21);