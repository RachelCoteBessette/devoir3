function nbPlanSeparation = detectionCollision(donneesCollisionA, donneesCollisionB)
% Cette fonction trouve le nombre de plan de separation present.
% qCouranteA : prend la matrice q courante de la voiture A
% qCouranteA : prend la matrice q courante de la voiture B
 
planSeparationTrouve = 0;  

%Voiture A
for i = 1:4 %Chaque surface
    n = [donneesCollisionA(16, i) donneesCollisionA(17, i) donneesCollisionA(18, i)] ;
    q = [donneesCollisionA(1, i) donneesCollisionA(2, i) donneesCollisionA(3, i)];

    sommetsEnDessous = 0;
    for j = 1:3:7 %Chaque sommet

        r = [donneesCollisionB(j, i) donneesCollisionB(j+1, i) donneesCollisionB(j+2, i)];
        d = dot(n, (r-q));

        if (d <= 0)
            sommetsEnDessous = sommetsEnDessous + 1;
        end
    end
    if (sommetsEnDessous == 0)
        planSeparationTrouve =  planSeparationTrouve + 1;
    end
end

%Voiture A
for i = 1:4 %Chaque surface
    n = [donneesCollisionB(16, i) donneesCollisionB(17, i) donneesCollisionB(18, i)] ;
    q = [donneesCollisionB(1, i) donneesCollisionB(2, i) donneesCollisionB(3, i)];

    sommetsEnDessous = 0;
    for j = 1:3:7 %Chaque sommet

        r = [donneesCollisionA(j, i) donneesCollisionA(j+1, i) donneesCollisionA(j+2, i)];
        d = dot(n, (r-q));

        if (d <= 0)
            sommetsEnDessous = sommetsEnDessous + 1;
        end
    end
    if (sommetsEnDessous == 0)
        planSeparationTrouve =  planSeparationTrouve + 1;
    end
end

disp(planSeparationTrouve);
nbPlanSeparation = planSeparationTrouve;
