function [vaf, vbf]=vf(rap,rbp,vapf,vbpf,waf,wbf)
%
% Cette fonction permet de calculer la vitesse angulaire finale
% La normale n est dirige vers l interieur du solide a.
% avec
%   wai      : vecteur vitesse angulaire avant colision
%   rap      : vecteur de la distance entre le point de collision et le
%               centre de masse de l auto a
%    n       : vecteur normal au plan de collision

%to debug %waf should be 1x3 matrix not 3x3, erase tmps when finished
%debugging
tmp1 = cross(waf,transpose(rap));
tmp2 = vapf - tmp1;
vaf = vapf - cross(waf,rap);
vbf = vbpf - cross(wbf,rbp);

