function nbPlanSeparation = detectionCollision(donneesCollisionA, donneesCollisionB)
% Cette fonction trouve le nombre de plan de separation present.
% qCouranteA : prend la matrice q courante de la voiture A
% qCouranteA : prend la matrice q courante de la voiture B
 
planSeparationTrouve = 0;  

%Voiture A
for i = 1:4 %Chaque surface
    n = donneesCollisionA(5, i);
    q = donneesCollisionA(1, i);

    sommetsEnDessous = 0;
    for j = 1:4 %Chaque sommet

        r = donneesCollisionB(1, j);
        d = dot(n, (r-q));

        if (d <= 0)
            sommetsEnDessous = sommetsEnDessous + 1;
        end
    end
    if (sommetsEnDessous == 0)
        planSeparationTrouve =  planSeparationTrouve + 1;
    end
end

%Voiture B
for i = 1:4 %Chaque surface
    n = donneesCollisionB(5, i);
    q = donneesCollisionB(1, i);

    sommetsEnDessous = 0;
    for j = 1:4 %Chaque sommet

        r = donneesCollisionA(1, j);
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
