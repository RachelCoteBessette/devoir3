function [Col1 tf raf vaf rbf vbf] = Devoir3(rai,vai,rbi, vbi, tb)

% gestion du temps 
tlimits = [0 1]
nbi = 10000;
DeltaT = (tlimits(2)-tlimits(1))/nbi
t0 = tlimits(1);

% matrices q
% matrice pour auto A
qsolA = zeros(nbi+1, 6);
angleAutoA = atan(vai(2)/vai(1));
qsolA(1,:) = vertcat(transpose(vai), transpose(rai), angleAutoA);
matriceGAutoA = 'getMatriceGGlissement';

% matrice pour auto B
qsolB = zeros(nbi+1, 6);
angleAutoB = atan(vbi(2)/vbi(1));
qsolB(1,:) = vertcat(transpose(vbi), transpose(rbi), angleAutoB);



for i = 1:nbi
    qACourante = qsolA(i,:);
    qBCourante = qsolB(i,:);
    donneesCollisionA = getDonneesDetectionCollision(qACourante, 'a');
    
    
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

