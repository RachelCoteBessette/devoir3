function [vpAvantCollision] = vitessePointContactAvantCollision(v, rcp) 
% Cette fonction calcul vpAvantCollision, le vecteur vitesse du point de 
% collision pour 1 objet avant la collision.
% avec
%	v: (vx(0), vy(0), ?z(0))
%   rcp: le vecteur de la distance entre le point de collision et le centre
%   de masse de la voiture

vitesseLineaire =  [v(1) v(2) 0];
vitesseAngulaire = [0 0 v(3)];

vpAvantCollision = vitesseLineaire + (vitesseAngulaire .* rcp);