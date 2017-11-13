function [pointCollision, n] = calculPointCollisionCoinFace(matricePositionAutoA, matricePositionAutoB)
%
% Pour deux vehicules non-parallele, on cherche le point de contact.
%
% En terme mathematique, nous allons calculer les droites des deux autos
% pour chaque face et verifier quelles coins touche quelles faces.
% Pour ce faire, on prend un point, verifie s il est compris dans une
% droite entre les deux extremite de la surface correspondante.
% Alors, il s agira du point de collision.
%

%                   long     surface 1
%                  1--------------2   
%          larg    |              |   
%      surface 4   |              |    surface 2
%                  |              |
%                  4--------------3
%                      surface 3

pointCollision = [-1 -1 -1];
n = [-1 -1 -1];

nbSurfaces = 4;
nbCoins = 4;
epsilon = 0.1;

for i=1:nbSurfaces %Pour tous les surfaces de A
    % equation d une droite y = mx + b
    p1A = matricePositionAutoA(:,i);
    if((i+1)<=4)
        p2A = matricePositionAutoA(:,i+1);
    else
        p2A = matricePositionAutoA(:,1);
    end
    
    mA = (p1A(2) - p2A(2)) ... 
        / (p1A(1) - p2A(1));
    bA = p1A(2) - mA*(p1A(1));
    
    for j=1:nbCoins %Pour tous les coins de B
        pB = matricePositionAutoB(:,j);
        if(abs(pB(2)-(mA*pB(1)+bA))<epsilon)
            % Le point est sur le plan, il s agit donc de la surface de
            % collision
            pointCollision = pB;
            % Calcul d un pts milieu sur la face de collision
            pc12A = (p1A+p2A)/2;
            
            % Calcul de la normale a partir du vecteur reliant pc12A et le
            % centre de masse de A
            n = (matricePositionAutoA(:,5) - pc12A)/norm(matricePositionAutoA(:,5) - pc12A);
            
        end
    end
end


for i=1:nbSurfaces %Pour tous les surfaces de B
    % equation d une droite y = mx + b
    p1B = matricePositionAutoB(:,i);
    if((i+1)<=4)
        p2B = matricePositionAutoB(:,i+1);
    else
        p2B = matricePositionAutoB(:,1);
    end
    
    mB = (p1B(2) - p2B(2)) ... 
        / (p1B(1) - p2B(1));
    bB = p1B(2) - mB*(p1B(1));
    
    for j=1:nbCoins %Pour tous les coins de A
        pA = matricePositionAutoA(:,j);
        if(abs(pA(2)-(mB*pA(1)+bB))<epsilon)
            % Le point est sur le plan, il s agit donc de la surface de
            % collision
            pointCollision = pA;
            % Calcul d un pts milieu sur la face de collision
            pc12B = (p1B+p2B)/2;
            
            % Calcul de la normale a partir du vecteur reliant pc12A et le
            % centre de masse de A
            n = (matricePositionAutoB(:,5) - pc12B)/norm(matricePositionAutoB(:,5) - pc12B);
            
        end
    end
end


