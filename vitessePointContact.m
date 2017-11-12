function [vp] = vitessePointContact(v, w, rcp) 
% Cette fonction calcul vp, le vecteur vitesse du point de 
% collision pour 1 objet.
% avec
%	v: (vx, vy, vz) vitesse lineaire du centre de masse
%   w: (wx, wy, wz) vitesse angulaire de l objet
%   rcp: le vecteur de la distance entre le point de collision et le centre
%   de masse

vp = v + (cross(w,rcp));