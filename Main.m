% ----------------------------------------------------------- 	%
%  NOM DU FICHIER:   Main.m                               	    %
%                                                             	%
%  DESCRIPTION:      Script principal du devoir 2 de PHS4700    %
%                                                             	%
%  AUTEUR:           Rachel Côté Bessette 1721384,    			%
%                    Clarence Desmarais 1762064,                %
%                    Audrey Lebel-Richardson 1665999            %
% ----------------------------------------------------------- 	%
global positionsAutoA;
positionsAutoA = zeros(0,3); %0 rangees par 3 colonnes.. oui 
global positionsAutoB;
positionsAutoB = zeros(0,3);
global pointsAutoAInit;
pointsAutoAInit = zeros(1,3);
global pointsAutoBInit;
pointsAutoBInit = zeros(1,3);
global pointsAutoAFin;
pointsAutoAFin = zeros(1,3);
global pointsAutoBFin;
pointsAutoBFin = zeros(1,3);

%--------------------------------essai 1 -----------------------%

[rai, vai, rbi, vbi, tb] = getDonneesCas(1);
[Col1 tf raf vaf rbf vbf] = Devoir3(rai,vai,rbi, vbi, tb);
disp('------ Essai 1 ------');
disp('Col1');
disp(Col1);
disp('tf');
disp(tf);
disp('raf');
disp(raf);
disp('vaf');
disp(vaf);
disp('rbf');
disp(rbf);
disp('vbf');
disp(vbf); 

graphique();
%--------------------------------essai 2 -----------------------%
[rai, vai, rbi, vbi, tb] = getDonneesCas(2);
[Col1 tf raf vaf rbf vbf] = Devoir3(rai,vai,rbi, vbi, tb);



%--------------------------------essai 3 -----------------------%
[rai, vai, rbi, vbi, tb] = getDonneesCas(3);
[Col1 tf raf vaf rbf vbf] = Devoir3(rai,vai,rbi, vbi, tb);

%--------------------------------essai 4 -----------------------%
[rai, vai, rbi, vbi, tb] = getDonneesCas(4);
[Col1 tf raf vaf rbf vbf] = Devoir3(rai,vai,rbi, vbi, tb);

%--------------------------------essai 5 -----------------------%
[rai, vai, rbi, vbi, tb] = getDonneesCas(5);
[Col1 tf raf vaf rbf vbf] = Devoir3(rai,vai,rbi, vbi, tb);

%--------------------------------essai 6 -----------------------%
[rai, vai, rbi, vbi, tb] = getDonneesCas(6);
[Col1 tf raf vaf rbf vbf] = Devoir3(rai,vai,rbi, vbi, tb);
