function [waf, wbf]=wf(wai,wbi,rap,rbp,n,vrmoins)
%
% Cette fonction permet de calculer la vitesse angulaire finale
% La normale n est dirige vers l interieur du solide a.
% avec
%   wai      : vecteur vitesse angulaire avant colision
%   rap      : vecteur de la distance entre le point de collision et le
%               centre de masse de l auto a
%    n       : vecteur normal au plan de collision

% Initialisation des valeurs de retour
waf = [0 0 0];
wbf = [0 0 0];
% Calcul de j
[ma,~,~,~] = getDonneesAutoA();
[mb,~,~,~] = getDonneesAutoB();
[~,~,e] = getConstantesProbleme();
j = (-1)*(1+e)*vrmoins/(1.0/ma+1.0/mb);
Ia = matriceInertie();
Ib = matriceInertie();
waf = wai + j*inv(Ia)*(cross(rap,n));
wbf = wbi + j*inv(Ib)*(cross(rbp,n));

