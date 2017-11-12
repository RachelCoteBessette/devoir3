function [tabIdxPlanCollision] = trouverPlanCollision(tabResPlanAvantCollision)
%
% tabResPlanAvantCollision : tableau de 8 colonnes contenant des 0 et 1
% 1 signifie que tous les points sont de l autre auto ont un d positif
%
tabIdxPlanCollision = [-1 -1 -1 -1]; %Il ne peut pas y avoir plus que 4 plans de collision
[m n] = size(tabResPlanAvantCollision);
idx = 1;
for i = 1:m % ou n a verifier
    if(tabResPlanAvantCollision(i)==1)
        tabIdxPlanCollision(idx) = i;
        idx = idx+1;
    end
end
