function [H, J] = getConstantesProbleme()
%
% Cette fonction retourne des constantes du probleme
%
% H = -pCvA/2   ou  p : masse volumique de l aire
%                   Cv: coefficient de traînée de la balle
%                   A : aire efficace de la balle
% A = pi*R^2    ou  R : rayon de la balle
%
% J =4piCm*p*R^3 ou Cm: coefficient magnus
% 

% Donnees du probleme
[R, ~] = getDonneesBalle();
p = 1.2;
Cv = 0.5;
A = pi*(R^2);
Cm = 0.29;

% Calcul des constantes

H = (-1)*(p*Cv*A)/2;

J = 4*pi*Cm*p*(R^3);
