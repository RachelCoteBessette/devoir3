function res=g1(q0,~)
% Cette fonction calcul g (membre de droite de ED) pour le cas 1
% avec
%	q0	:   conditions initiales [q(t0)]
%	t0	:   intervalle de temps initial
%	w0	:   la vitesse angulaire initiale, elle est suppos�e constante

res = [ ... 
    0 ...
    0 ...
    (-9.8) ...
    q0(1) ...
    q0(2) ...
    q0(3) ...
];
