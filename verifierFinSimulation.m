function [boolFinSimulation] = verifierFinSimulation(boolCollision, qACourante, qBCourante)
%
% Fonction qui détermine si la simulaition est terminée.
% La simulation s'arrête lorsqu'une collision est détectée ou que les
% vitesse des deux voitures sont inférieures à 1cm/s
% ----parametres---------
% boolCollision : 0 = collision, 1 = pas de collision
% qACourante
% qBCourante
%
%-------retour-----------
% boolFinSimulation : 0 = simulation non-terminée, 1 = simulation terminée

fin = 0;

if(boolCollision == 0) %Vérifie si une collision est détectée
    fin = 1;
end

if(fin == 0)
    va = [qACourante(1) qACourante(2)];
    vb = [qBCourante(1) qBCourante(2)];
    
    if(norm(va) <= 0.01)
        fin = 1;
    elseif(norm(vb) <= 0.01)
        fin = 1;
    end
end

boolFinSimulation = fin;
