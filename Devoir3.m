function [Col1 tf raf vaf rbf vbf] = Devoir3(rai,vai,rbi, vbi, tb)

% gestion du temps 
tlimits = [0 1];
nbi = 10000;
DeltaT = (tlimits(2)-tlimits(1))/nbi;
t0 = tlimits(1);

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
    
    [boolCollision, matriceCoinsAutoA, matriceCoinsAutoB] = detectionCollision(donneesCollisionA, donneesCollisionB, coordADsRepereGlobal, coordBDsRepereGlobal);
    
    % si il y a une collision
    if (boolCollision == 0)
        % TODO : appeler la fonction qui sort le point de collision et la normale unitaire de b vers a
        % je crois que cest calculerPointOuSurfaceCollision
        pointCollision = [2,1,2];
        normale = [0.33,0.33,0.33];
        
        [vaf, vbf] = calculVitessesFinales(qACourante, qBCourante, pointCollision, normale);
    end
    
    if(t0 >= tb)
        matriceGAutoB = 'getMatriceGGlissement';
    else
        matriceGAutoB = 'getMatriceGRoulement';
    end
    
    % auto A
    qsolA(i+1,:) = SEDRK4t0(qACourante, DeltaT, matriceGAutoA);
    
    % auto B
    qsolB(i+1,:) = SEDRK4t0(qBCourante, DeltaT, matriceGAutoB);
    
    t0 = t0 + DeltaT;
end

%sample data for now 
Col1 = 1;
tf = 2.1;
raf = [3.2,2.2,3.2];
vaf = [3.2,3.2,2.2];
rbf = [3.2,3.2,3.2];
vbf = [3.2,3.2,3.2];

