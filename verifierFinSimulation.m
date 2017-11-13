function [boolFinSimulation] = verifierFinSimulation(boolCollision, qACourante, qBCourante)
%
% Fonction qui d�termine si la simulaition est termin�e.
% La simulation s'arr�te lorsqu'une collision est d�tect�e ou que les
% vitesse des deux voitures sont inf�rieures � 1cm/s
% ----parametres---------
% boolCollision : 0 = collision, 1 = pas de collision
% qACourante
% qBCourante
%
%-------retour-----------
% boolFinSimulation : 0 = simulation non-termin�e, 1 = simulation termin�e

fin = 0;

if(boolCollision == 0) %V�rifie si une collision est d�tect�e
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
