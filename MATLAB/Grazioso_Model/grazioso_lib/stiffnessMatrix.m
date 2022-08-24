%%%%%%%%%%%% Stiffness Matrix %%%%%%%%%%%%%%%%%%%
% Stiffness matrix K defined for an isotropic   %
% hyperelastic material.                        %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function K = stiffnessMatrix(E, v, A, I)
G = E/(2*(1 + v)); % Shear Modulus

Kuu = diag([E*A(1), G*A(2), G*A(3)]);
Kww = diag([G*I(1), E*I(2), E*I(3)]);

K = blkdiag(Kuu, Kww);
end