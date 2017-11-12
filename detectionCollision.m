% Cette fonction sert a detecter si une collision a eu lieu. 
%
% ----parametres---------
% donnnesCollisionA
% donneesCollisionB
% coordADsRepereGlobal
% coordBDsRepereGlobal
%
%-------retour-----------
% boolCollision : 0 = collision, 1 = pas de collision
% matricePositionAutoA : matrice de 3x4 elements contenant la position detaillee de
% lauto A [coin1, coin2, coin3, coin4]

function [boolCollision, matriceCoinsAutoA, matriceCoinsAutoB] = detectionCollision(donneesCollisionA, donneesCollisionB, coordADsRepereGlobal, coordBDsRepereGlobal)

boolCollision = false; %normal que ca commence a true car cette methode la detecte sil ny a pas de collision
% on assume au debut quil y a collision

sommetsEnDessousSurfAPointsB = 0;
pointsPrLesquelsDsupZeroA = 0;
%Surfaces de la Voiture A, points de la voiture B
for i = 1:4 %Chaque surface de A    
    nk = [donneesCollisionA(16, i) donneesCollisionA(17, i) donneesCollisionA(18, i)] ;
    qk1 = [donneesCollisionA(1, i) donneesCollisionA(2, i) donneesCollisionA(3, i)];

    for j = 1:4 %Chaque sommet de B
        %rb va finir par contenir tous les points du solide b
        rb = transpose(coordBDsRepereGlobal(:,j)); %extraire la colonne j (donc le point)
        d = dot(nk, (rb-qk1));

        if(d>0)
            pointsPrLesquelsDsupZeroA = pointsPrLesquelsDsupZeroA + 1 ;
        end
    end

    if (pointsPrLesquelsDsupZeroA == 4) %si pour tous les sommets de B associe a une surface de A, d>0 => pas de collision
        boolCollision = true; %il ny a pas de collision
        break; %sortir du for pour ne pas ecraser la valeur de boolCollision
    else 
        boolCollision = false;
    end
end

if(boolCollision == false) % si tu na pas detecter quil ny avait pas de collision (donc tu es toujours a il y a une collision)
    pointsPrLesquelsDsupZeroB = 0;
    %Surfaces de la voiture B, points de la voiture A
    for i = 1:4 %Chaque surface de B
        nk = [donneesCollisionB(16, i) donneesCollisionB(17, i) donneesCollisionB(18, i)] ;
        qk1 = [donneesCollisionB(1, i) donneesCollisionB(2, i) donneesCollisionB(3, i)];

        sommetsEnDessousSurfBPointsA = 0;
        for j = 1:4 %Chaque sommet de A
            ra = coordADsRepereGlobal(:,j);
            d = dot(n, (r-q));

            if(d>0)
                pointsPrLesquelsDsupZeroB = pointsPrLesquelsDsupZeroB + 1 ;
            end
        end
        if (pointsPrLesquelsDsupZeroB == 4) %si pour tous les sommets de A associe a une surface de B, d>0 => pas de collision
            boolCollision = true; 
            break;
        else 
            boolCollision = false;
        end
    end

end
%ajouter le centre de masse comme cinquieme element

matriceCoinsAutoA = coordADsRepereGlobal;

matriceCoinsAutoB = coordBDsRepereGlobal;



