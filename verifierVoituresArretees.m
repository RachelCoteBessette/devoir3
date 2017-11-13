function [bool2VoituresArretees] = verifierVoituresArretees(qACourante, qBCourante)
%
% Fonction qui détermine si les deux voitures sont arretees
% vitesse des deux voitures sont inférieures à 1cm/s
% ----parametres---------
% boolCollision : 0 = collision, 1 = pas de collision
% qACourante
% qBCourante
%
%-------retour-----------
% boolFinSimulation : 0 = simulation non-terminée, 1 = simulation terminée
va = [qACourante(1) qACourante(2)];
vb = [qBCourante(1) qBCourante(2)];
    
bool2VoituresArretees = (norm(va) <= 0.01 && norm(vb) <= 0.01 );
