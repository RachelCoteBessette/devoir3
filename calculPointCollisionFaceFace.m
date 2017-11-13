function [pointCollision, n] = calculPointCollisionFaceFace(matricePositionAutoA, matricePositionAutoB)
%
% Pour deux vehicules parallele, on cherche le plan en commun.
%
% En terme mathematique, nous allons calculer les droites des deux autos
% pour chaque face et verifier quelles deux droites sont confondues.
% De plus cette droite confondu doit avoir un point d<intersection avec
% la droite reliant les deux centre de masse qui soit compris entre 
% ces deux centre.
% Alors, il s agira du plan de collision.
%

%                   long     surface 1
%                  1--------------2   
%          larg    |              |   
%      surface 4   |              |    surface 2
%                  |              |
%                  4--------------3
%                      surface 3

nbSurfaces = 4;
epsilon = 0.0001;

for i=1:nbSurfaces %Pour tous les coins de A
    % equation d une droite y = mx + b
    p1A = matricePositionAutoA(i,:);
    p2A = matricePositionAutoA(mod(i+1,4),:);
    mA = (p1A(2) - p2A(2)) ... 
        / (p1A(1) - p2A(1));
    bA = p1A(2) - mA*(p1A(1));
    
    for j=1:nbSurfaces %Pour tous les coins de B

            
        end
    end

end



