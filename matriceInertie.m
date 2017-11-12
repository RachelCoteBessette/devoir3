function [matriceInertie] = matriceInertie(masse, longueur, largeur, hauteur, omega)
% Cette fonction calcul I, la matrice d'inertie d'une voiture (prisme
% rectangulaire) dans le repere global.
% avec
%	masse: la masse de la voiture
%   longeur, largeur, hauteur: les dimensions de la voiture
%	omega: l'angle entre l'axe x et le côté droit de la voiture

Ixx = masse/12 * (largeur^2 + hauteur^2);
Iyy = masse/12 * (longueur^2 + hauteur^2);
Izz = masse/12 * (longueur^2 + largeur^2);

Ic = [ Ixx 0 0; ...
       0 Iyy 0; ...
       0 0 Izz];

matriceRotation = [ cos(omega) -sin(omega) 0; ...
                    sin(omega) cos(omega) 0; ...
                    0 0 1];

matriceInertie = Ic*matriceRotation;
