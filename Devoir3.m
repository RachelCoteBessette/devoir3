function [Col1 tf raf vaf rbf vbf] = Devoir3(rai,vai,rbi, vbi, tb)

global positionsAutoA;
global positionsAutoB;
global pointsAutoAInit;
global pointsAutoBInit;
global pointsAutoAFin;
global pointsAutoBFin;

% gestion du temps 
tlimits = [0 20];
nbi = 10000;
DeltaT = (tlimits(2)-tlimits(1))/nbi;
t0 = tlimits(1);
tf = 0;

% ----------------------setup matrices q et g------------------%
% --- auto a---%
qsolA = zeros(nbi+1, 6);
%info utile sur atan2: https://en.wikipedia.org/wiki/Atan2
angleAutoA = atan2(vai(2),vai(1));
%matrice initiale q auto a
qsolA(1,:) = vertcat(transpose(vai), transpose(rai), angleAutoA);
matriceGAutoA = 'getMatriceGGlissement';

% --- auto b---%
qsolB = zeros(nbi+1, 6);
angleAutoB = atan2(vbi(2),vbi(1));
qsolB(1,:) = vertcat(transpose(vbi), transpose(rbi), angleAutoB);

for i = 1:nbi
    qACourante = qsolA(i,:);
    qBCourante = qsolB(i,:);
        
    [coordADsRepereGlobal, donneesCollisionA] = getDonneesDetectionCollision(qACourante, 'a');
    [coordBDsRepereGlobal, donneesCollisionB] = getDonneesDetectionCollision(qBCourante, 'b');
    
    if(i ==1)
        pointsAutoAInit = transpose(coordADsRepereGlobal);
        pointsAutoBInit = transpose(coordBDsRepereGlobal);
    end
    
    [boolCollision, matriceCoinsAutoA, matriceCoinsAutoB] = detectionCollision(donneesCollisionA, donneesCollisionB, coordADsRepereGlobal, coordBDsRepereGlobal);
    [bool2VoituresArretees] = verifierVoituresArretees(qACourante, qBCourante);
        % si il y a une collision
    if (boolCollision == 0)
        Col1 = 0;
        tf = t0; 
        % TODO : appeler la fonction qui sort le point de collision et la normale unitaire de b vers a
        % je crois que cest calculerPointOuSurfaceCollision
        [pointCollision, n] = calculPointCollisionEtNormale(horzcat(matriceCoinsAutoA,[qACourante(4);qACourante(5);0]),horzcat(matriceCoinsAutoB,[qBCourante(4);qBCourante(5);0]));
        pointCollision = transpose(pointCollision);
        normale = transpose(n);
%         pointCollision = [2,1,2];
%         normale = [0.33,0.33,0.33];
        
        [vaf, vbf] = calculVitessesFinales(qACourante, qBCourante, pointCollision, normale);
        
        raf = [qACourante(4), qACourante(5)];  
        rbf = [qBCourante(4), qBCourante(5)];    
        % au lieu denvoyer les matrices finales dans le range kutta, on a pas besoin puisque on les a calculer 
        qsolA(i+1,:) = [vaf(1), vaf(2), vaf(3), qACourante(4), qACourante(5), qACourante(6)];
        qsolB(i+1,:) = [vbf(1), vbf(2), vbf(3), qBCourante(4), qBCourante(5), qBCourante(6)];
        
        
        positionCouranteA = [qACourante(4), qACourante(5), qACourante(6)];
        positionCouranteB = [qBCourante(4), qBCourante(5), qBCourante(6)];
        positionsAutoA = vertcat(positionsAutoA, positionCouranteA);
        positionsAutoB = vertcat(positionsAutoB, positionCouranteB);
        pointsAutoAFin = transpose(coordADsRepereGlobal);
        pointsAutoBFin = transpose(coordBDsRepereGlobal);
        return; %quit Devoir3.m if simulation is over
    elseif (bool2VoituresArretees == 1)
        %prendre les dernieres donnnees
        Col1 = 1;
        tf = t0;
        raf = [qACourante(4), qACourante(5)]; 
        rbf = [qBCourante(4), qBCourante(5)];
        vaf = [qACourante(1), qACourante(2)];
        vbf = [qBCourante(1), qBCourante(2)];
        
        positionCouranteA = [qACourante(4), qACourante(5), qACourante(6)];
        positionCouranteB = [qBCourante(4), qBCourante(5), qBCourante(6)];
        positionsAutoA = vertcat(positionsAutoA, positionCouranteA);
        positionsAutoB = vertcat(positionsAutoB, positionCouranteB);
        pointsAutoAFin = transpose(coordADsRepereGlobal);
        pointsAutoBFin = transpose(coordBDsRepereGlobal);
        return;
    else % si ya pas de collision
        if(t0 >= tb)
            matriceGAutoB = 'getMatriceGGlissement';
        else
            matriceGAutoB = 'getMatriceGRoulement';
        end
    
        qsolA(i+1,:) = SEDRK4t0(qACourante, DeltaT, matriceGAutoA);
        qsolB(i+1,:) = SEDRK4t0(qBCourante, DeltaT, matriceGAutoB);
    
        t0 = t0 + DeltaT;
        
        positionCouranteA = [qACourante(4), qACourante(5), qACourante(6)];
        positionCouranteB = [qBCourante(4), qBCourante(5), qBCourante(6)];
        positionsAutoA = vertcat(positionsAutoA, positionCouranteA);
        positionsAutoB = vertcat(positionsAutoB, positionCouranteB);
    end

end






