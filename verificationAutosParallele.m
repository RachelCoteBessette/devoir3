function parallele = verificationAutosParallele(matricePositionAutoA, matricePositionAutoB)

%
% Verifier si les autos sont parallele, donc qu un cote long de  A soit 
% parrallele avec un cote long B ou un cote court. 
%

parallele = 0;

droiteA = matricePositionAutoA(1)-matricePositionAutoA(2);

droiteB = matricePositionAutoB(1)-matricePositionAutoB(2);

% Si l<angle entre droiteA et droiteB est de 90(ou -90) ou 0(ou 180) alors 
% les deux autos sont paralleles.
% v1•v2 = |v1||v2| cos(angle)
angle = acos(dot(droiteA,droiteB)/(norm(droiteA)*norm(droiteB)));
epsilon = 0.0001; % TO DO confirmer que ce epsilon fait du sens
if((angle<=epsilon) || ((deg2rad(90)-angle)<=epsilon))
    parallele = 1;
end