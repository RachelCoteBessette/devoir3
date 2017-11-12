function donneesDetectionCollision = getDonneesDetectionCollision(qCourante, auto)
% auto : prend a ou b
% qCourante : prend la matrice q courante 

%calculer les nouveaux points de lauto
    pointsAutoA = get4PointsOrigineAuto(auto);
    point1OrigineA = pointsAutoA(1);
    rotA = getMatriceRotation(qAutoACourante(6)); % le sixieme element est langle     
    point1A = rotA*point1OrigineA + [qACourante(4), qACourante(5), 0];
    point2A = rotA*point2OrigineA + [qACourante(4), qACourante(5), 0];
    point3A = rotA*point3OrigineA + [qACourante(4), qACourante(5), 0];
    point4A = rotA*point4OrigineA + [qACourante(4), qACourante(5), 0];
    
    %   schema des points de lauto dans lespace
    %            surface 2
    %             4---1
    % surface 3   |   |  surface 1
    %             3---2
    %           surface 4
    
    % surface reliant les points 1-2
    qk1Asurf1 = point1A; 
    qk2Asurf1 = point2A;
    qk3Asurf1 = qk2Asurf1 + [0, 0, -1]; %sens antihoraire %TODO : valider que cest bon
    
    % surface reliant les points 2-3
    qk1Asurf2 = point2A;
    qk2Asurf2 = point3A;
    qk3Asurf2 = qk2Asurf2 + [0,0, -1];
    
    % surface reliant les points 3-4
    qk1surf3 = point3A;
    qk2surf3 = point4A;
    qk2surf4 = qk2surf3 + [0,0, -1];
    
    %surface reliant les points 4-1
    qk1surf4 = point4A;
    qk2surf4 = point1A;
    qk3surf4 = qk2surf4 + [0,0, -1];
    
    %sample data for now (so that audrey understands what the hell is going
    %on
    %surface 1
    qk11 = 2.1; % qk1 pour la surface 1
    qk21 = 2.1; % qk2 pour la surface 1
    qk31 = 2.1;
    pk11 = 2.1; %pk1 pour la surface 1
    pk21 = 2.1; %pk2 pour la surface 1
    nk1 = 2.1; % nk1 pour la surface 1
    %surface 2
    qk12 = 2.1;
    qk22 = 2.1;
    qk32 = 2.1;
    pk11 = 2.1;
    pk21 = 2.1;
    nk1 = 2.1;
    %surface 3
    qk13 = 2.1;
    qk23 = 2.1;
    qk33 = 2.1;
    pk11 = 2.1;
    pk21 = 2.1;
    nk1 = 2.1;
    %surface 4
    qk14 = 2.1;
    qk24 = 2.1;
    qk34 = 2.1;
    pk11 = 2.1;
    pk21 = 2.1;
    nk1 = 2.1;
    
    %   schema des points de lauto dans lespace
    %            surface 2
    %             4---1
    % surface 3   |   |  surface 1
    %             3---2
    %           surface 4
    
    donneesDetectionCollision = [...
        qk11 qk21 qk31 pk11 pk21 nk1; ... % surface1
        qk11 qk21 qk31 pk11 pk21 nk1; ... % surface2
        qk11 qk21 qk31 pk11 pk21 nk1; ... % surface 3
        qk11 qk21 qk31 pk11 pk21 nk1; ... % surface 4
   ]
        