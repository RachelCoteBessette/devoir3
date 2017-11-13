function [pointCollision, surfaceCollision, n] = calculerPointOuSurfaceCollision(matricePositionAutoA, matricePositionAutoB)
%
% Fonction, une fois la collision detectee, qui permet de calculer le coin 
% ou la surface de collision et renvoie une normale en consequent
%
%

% Initialisation 
surfaceCollision = -1;
pointCollision = [-1 -1];

[trouveCoinCoin, posCoinCoin, nCoinCoin] = verifierCoinCoin(matricePositionAutoA,matricePositionAutoB);

if(trouveCoinCoin==1)
    pointCollision = posCoinCoin;
    n = nCoinCoin;
    return;
end

autosParallele = verificationAutosParallele(matricePositionAutoA, matricePositionAutoB);

if(autosParallele==1)
    [surfaceCollision, n] = calculPlanCollision(matricePositionAutoA, matricePositionAutoB);
    return;
else
    [pointCollision, n] = calculPointCollision(matricePositionAutoA, matricePositionAutoB);
    return;
end