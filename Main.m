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
positionsAutoA = zeros(0,3); %initialisations des matrices
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
positionsAutoA = zeros(0,3); 
positionsAutoB = zeros(0,3);
pointsAutoAInit = zeros(1,3);
pointsAutoBInit = zeros(1,3);
pointsAutoAFin = zeros(1,3);
pointsAutoBFin = zeros(1,3);
[rai, vai, rbi, vbi, tb] = getDonneesCas(2);
[Col1 tf raf vaf rbf vbf] = Devoir3(rai,vai,rbi, vbi, tb);
disp('------ Essai 2 ------');
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

%--------------------------------essai 3 -----------------------%
positionsAutoA = zeros(0,3); 
positionsAutoB = zeros(0,3);
pointsAutoAInit = zeros(1,3);
pointsAutoBInit = zeros(1,3);
pointsAutoAFin = zeros(1,3);
pointsAutoBFin = zeros(1,3);
[rai, vai, rbi, vbi, tb] = getDonneesCas(3);
[Col1 tf raf vaf rbf vbf] = Devoir3(rai,vai,rbi, vbi, tb);
disp('------ Essai 3 ------');
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
%--------------------------------essai 4 -----------------------%
positionsAutoA = zeros(0,3);  
positionsAutoB = zeros(0,3);
pointsAutoAInit = zeros(1,3);
pointsAutoBInit = zeros(1,3);
pointsAutoAFin = zeros(1,3);
pointsAutoBFin = zeros(1,3);
[rai, vai, rbi, vbi, tb] = getDonneesCas(4);
[Col1 tf raf vaf rbf vbf] = Devoir3(rai,vai,rbi, vbi, tb);
disp('------ Essai 4 ------');
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
%--------------------------------essai 5 -----------------------%
positionsAutoA = zeros(0,3);  
positionsAutoB = zeros(0,3);
pointsAutoAInit = zeros(1,3);
pointsAutoBInit = zeros(1,3);
pointsAutoAFin = zeros(1,3);
pointsAutoBFin = zeros(1,3);
[rai, vai, rbi, vbi, tb] = getDonneesCas(5);
[Col1 tf raf vaf rbf vbf] = Devoir3(rai,vai,rbi, vbi, tb);
disp('------ Essai 5 ------');
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
%--------------------------------essai 6 -----------------------%
positionsAutoA = zeros(0,3); 
positionsAutoB = zeros(0,3);
pointsAutoAInit = zeros(1,3);
pointsAutoBInit = zeros(1,3);
pointsAutoAFin = zeros(1,3);
pointsAutoBFin = zeros(1,3);
[rai, vai, rbi, vbi, tb] = getDonneesCas(6);
[Col1 tf raf vaf rbf vbf] = Devoir3(rai,vai,rbi, vbi, tb);
disp('------ Essai 6 ------');
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