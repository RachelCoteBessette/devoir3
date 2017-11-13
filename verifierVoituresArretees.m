function [bool2VoituresArretees] = verifierVoituresArretees(qACourante, qBCourante)
%
% Fonction qui d�termine si les deux voitures sont arretees
% vitesse des deux voitures sont inf�rieures � 1cm/s
% ----parametres---------
% boolCollision : 0 = collision, 1 = pas de collision
% qACourante
% qBCourante
%
%-------retour-----------
% boolFinSimulation : 0 = simulation non-termin�e, 1 = simulation termin�e
va = [qACourante(1) qACourante(2)];
vb = [qBCourante(1) qBCourante(2)];
    
bool2VoituresArretees = (norm(va) <= 0.01 && norm(vb) <= 0.01 );
