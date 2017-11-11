function [coup, tf, rbf, vbf] = Devoir2(option,rbi,vbi,wbi)

% Initialisation des valeurs de retour
coup = 1;
tf = 0;
rbf = [0 0 0];
vbf = [0 0 0];

global positionsBalleOpt1;
global positionsBalleOpt2;
global positionsBalleOpt3;

% Selection du bon systeme d'equations differentielles (g)
if option == 1
    g = 'g1';
elseif option == 2
    g = 'g2';
elseif option == 3
    g = 'g3';
else
    disp ('La valeur entree n est pas valide. (valeur valide sont 1, 2 et 3). fin du programme');
    return;
end

% Une partie du code suivant est reprise du document de 
% reference du cours (PHS4700Rev3.pdf) page 61.
nbi=10000;
qsol=zeros(nbi+1,6);
tlimits=[0 1];
qsol(1,:)=[vbi(1) vbi(2) vbi(3) rbi(1) rbi(2) rbi(3)];
DeltaT=(tlimits(2)-tlimits(1))/nbi;
t0=tlimits(1);

results = [];

for i=1:nbi
    qsol(i+1,:)=SEDRK4t0(qsol(i,:),wbi,DeltaT,g);
    t0=t0+DeltaT;
    
    tmpMatrix = qsol(i+1, :);
    tmpMatrix = tmpMatrix([4 5 6]);
    
    if (option ==1)
        positionsBalleOpt1 = vertcat(positionsBalleOpt1, tmpMatrix);
    elseif (option ==2)
        positionsBalleOpt2 = vertcat(positionsBalleOpt2, tmpMatrix);
    elseif(option ==3) 
        positionsBalleOpt3 = vertcat(positionsBalleOpt3, tmpMatrix);
    end
    
    %Procede a la verification
    infoFin = verificationFinSimulation(qsol(i+1,:));
    if(infoFin~=0)
        tf = t0;
        rbf = [qsol(i+1,4) qsol(i+1,5) qsol(i+1,6)];
        vbf = [qsol(i+1,1) qsol(i+1,2) qsol(i+1,3)];
        coup = calculerCoup(infoFin,rbi,rbf);
        return;
    end
end


