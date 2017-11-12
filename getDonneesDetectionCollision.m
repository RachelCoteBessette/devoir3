function donneesDetectionCollision = getDonneesDetectionCollision(qCourante, auto)
% auto : prend a ou b
% qCourante : prend la matrice q courante 
 
    pointsOrigineAuto = get4PointsOrigineAuto(auto);
    rot = getMatriceRotation(qCourante(6)); % le sixieme element est langle
    pointsRotates = rot* pointsOrigineAuto; % me donne une 4 colonne, 3 rows
    % pointsRotates(1,:) : extrait la premiere rangee de la matrice pointsRotates
    % qui represente les x pour tous les points
    nouveauxX = pointsRotates(1,:) + qCourante(4);
    nouveauxY = pointsRotates(2,:) + qCourante(5);
    nouveauxZ = pointsRotates(3,:) + 0;
    
    pointAutoDansRepereGlobal = vertcat(nouveauxX, nouveauxY, nouveauxZ);
    
% auto dans le repere lorsquelle est ramenee a lorigine du plan 
%                          
%                   long     surface 1
%                  1--------------2   
%          larg    |              |   
%      surface 4   |              |    surface 2
%                  |              |
%                  4--------------3
%                      surface 3

% on suppose que tous les solides ont une extension infinie dans la direction z 
% etant donne quon regarde sils ont eu des collisions dans le plan xy

    % surface 1, reliant les points 1-2
    qk1Surf1 = pointAutoDansRepereGlobal(:,1); 
    qk2Surf1 = pointAutoDansRepereGlobal(:,2);
    qk3Surf1 = qk2Surf1 + transpose([0, 0, -1]); 
    pk1Surf1 = qk1Surf1 - qk2Surf1;
    pk2Surf1 = qk1Surf1 - qk3Surf1;
    % cross sert a faire un produit vectoriel
    produitVectSurf1 = cross(pk1Surf1,pk2Surf1);
    nkSurf1 = produitVectSurf1/ norm(produitVectSurf1); 
    
    % surface 2, reliant les points 2-3
    qk1Surf2 = pointAutoDansRepereGlobal(:,3);
    qk2Surf2 = pointAutoDansRepereGlobal(:,2);
    qk3Surf2 = qk2Surf2 + transpose([0, 0, -1]);
    pk1Surf2 = qk1Surf2 - qk2Surf2;
    pk2Surf2 = qk1Surf2 - qk3Surf2;
    produitVectSurf2 = cross(pk1Surf2,pk2Surf2);
    nkSurf2 = produitVectSurf2/ norm(produitVectSurf2);  
    
    % surface 3, reliant les points 3-4
    qk1Surf3 = pointAutoDansRepereGlobal(:,4);
    qk2Surf3 = pointAutoDansRepereGlobal(:,3);
    qk3Surf3 = qk2Surf3 + transpose([0, 0, -1]);
    pk1Surf3 = qk1Surf3 - qk2Surf3;
    pk2Surf3 = qk1Surf3 - qk3Surf3;
    produitVectSurf3 = cross(pk1Surf3,pk2Surf3);
    nkSurf3 = produitVectSurf3/ norm(produitVectSurf3);  
    
    %surface 4, reliant les points 1,4
    qk1Surf4 = pointAutoDansRepereGlobal(:,1);
    qk2Surf4 = pointAutoDansRepereGlobal(:,4);
    qk3Surf4 = qk2Surf4 + transpose([0, 0, -1]);
    pk1Surf4 = qk1Surf4 - qk2Surf4;
    pk2Surf4 = qk1Surf4 - qk3Surf4;
    produitVectSurf4 = cross(pk1Surf4,pk2Surf4);
    nkSurf4 = produitVectSurf4/ norm(produitVectSurf4);  
    
    donneesDetectionCollision = [...
        qk1Surf1 qk1Surf2 qk1Surf3 qk1Surf4; ...
        qk2Surf1 qk2Surf2 qk2Surf3 qk2Surf4; ...
        qk3Surf1 qk3Surf2 qk3Surf3 qk3Surf4; ...
        pk1Surf1 pk1Surf2 pk1Surf3 pk1Surf4; ...
        pk2Surf1 pk2Surf2 pk2Surf3 pk2Surf4; ... 
        nkSurf1 nkSurf2 nkSurf3 nkSurf4; ...
    ]