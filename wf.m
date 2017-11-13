function [waf, wbf]=wf(wai,wbi,rap,rbp,Ia,Ib,n,vrmoins,j)
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

waf = wai + j*inv(Ia)*(transpose(cross(rap,n)));
wbf = wbi + j*inv(Ib)*(transpose(cross(rbp,n)));

