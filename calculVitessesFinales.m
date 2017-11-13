function [vaf, vbf] = calculVitessesFinales(qaf,qbf,ptsCollision,n)
% Cette fonction calcul les vitesses finales apres collision
% angulaires et lineaires.
% avec
%	qaf: matrice q(tf) pour lauto A
%	qbf: matrice q(tf) pour lauto B
%   ptsCollision: vecteur du point de collision
%	n: vecteur normal au plan de collision, n doit pointer vers
%	l interieur de l auto a
vai = [qaf(1) qaf(2) 0];
vbi = [qbf(1) qbf(2) 0];
wai = [0 0 qaf(3)];
wbi = [0 0 qbf(3)];

% rca centre de masse de a
rca = [qaf(4) qaf(5) 0];
% rap vecteur centre de masse au point de collision
rap = ptsCollision - rca;

% rcb centre de masse de b
rcb = [qbf(4) qbf(5) 0];
% rap vecteur centre de masse au point de collision
rbp = ptsCollision - rcb;

% Calcul de vrmoins
vrmoins = dot(n,(vitessePointContact(vai,wai,ptsCollision)-vitessePointContact(vbi,wbi,ptsCollision)));

% Calcul de j
[ma,La,la,ha] = getDonneesAutoA();
[mb,Lb,lb,hb] = getDonneesAutoB();
[~,~,e] = getConstantesProbleme();
Ia = matriceInertie(ma,La,la,ha,qaf(6));
Ib = matriceInertie(mb,Lb,lb,hb,qbf(6));
Ga = dot(n,(cross(inv(Ia)*(transpose(cross(rap,n))),rap)));
Gb = dot(n,(cross(inv(Ib)*(transpose(cross(rbp,n))),rbp)));
j = (-1)*(1+e)*vrmoins/(1.0/ma+1.0/mb+Ga+Gb);

% vapi vitesse lineaire au point de collision pour l auto A avant la collision
vapi = vitessePointContact(vai,wai,rap);
% vbpi vitesse lineaire au point de collision pour l auto B avant la collision
vbpi = vitessePointContact(vbi,wbi,rbp);

% vapf vitesse lineaire au point de collision pour l auto A apres la collision
[vapf, vbpf] = calculVitessesLineairesPointCollision(vapi,vbpi,rap,rbp,Ia,Ib,n,j);

% Calcul des vitesses angulaires finales
[waf, wbf]=wf(wai,wbi,rap,rbp,Ia,Ib,n,vrmoins,j);

% Calcul des vitesses lineaires finales
[vaf, vbf]=vf(rap,rbp,vapf,vbpf,waf,wbf);

% Resultat
% vaf en sortie contient [vx vy wz]
vaf = [vaf(1) vaf(2) waf(3)];
vbf = [vbf(1) vbf(2) wbf(3)];


