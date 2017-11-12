function [vaf, vbf]=vf(rap,rbp,vapf,vbpf,waf,wbf)
%
% Cette fonction permet de calculer la vitesse angulaire finale
% La normale n est dirige vers l interieur du solide a.
% avec
%   wai      : vecteur vitesse angulaire avant colision
%   rap      : vecteur de la distance entre le point de collision et le
%               centre de masse de l auto a
%    n       : vecteur normal au plan de collision

vaf = vapf - cross(waf,rap);
vbf = vbpf - cross(wbf,rbp);

