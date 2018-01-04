% ----------------------------------------------------------- 	%
%  NOM DU FICHIER:   Main.m                               	    %
%                                                             	%
%  DESCRIPTION:      Script principal du devoir 3 de PHS4700    %
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
imprimerResultatFinal('1', Col1, tf, raf, vaf, rbf, vbf);

%--------------------------------essai 2 -----------------------%
reinitialiserMatricesGlobales();
[rai, vai, rbi, vbi, tb] = getDonneesCas(2);
[Col1 tf raf vaf rbf vbf] = Devoir3(rai,vai,rbi, vbi, tb);
imprimerResultatFinal('2', Col1, tf, raf, vaf, rbf, vbf);

%--------------------------------essai 3 -----------------------%
reinitialiserMatricesGlobales();
[rai, vai, rbi, vbi, tb] = getDonneesCas(3);
[Col1 tf raf vaf rbf vbf] = Devoir3(rai,vai,rbi, vbi, tb);
imprimerResultatFinal('3', Col1, tf, raf, vaf, rbf, vbf);
%--------------------------------essai 4 -----------------------%
reinitialiserMatricesGlobales();
[rai, vai, rbi, vbi, tb] = getDonneesCas(4);
[Col1 tf raf vaf rbf vbf] = Devoir3(rai,vai,rbi, vbi, tb);
imprimerResultatFinal('4', Col1, tf, raf, vaf, rbf, vbf);
%--------------------------------essai 5 -----------------------%
reinitialiserMatricesGlobales();
[rai, vai, rbi, vbi, tb] = getDonneesCas(5);
[Col1 tf raf vaf rbf vbf] = Devoir3(rai,vai,rbi, vbi, tb);
imprimerResultatFinal('5', Col1, tf, raf, vaf, rbf, vbf);
%--------------------------------essai 6 -----------------------%
reinitialiserMatricesGlobales();
[rai, vai, rbi, vbi, tb] = getDonneesCas(6);
[Col1 tf raf vaf rbf vbf] = Devoir3(rai,vai,rbi, vbi, tb);
imprimerResultatFinal('6', Col1, tf, raf, vaf, rbf, vbf);