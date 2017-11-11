% ----------------------------------------------------------- 	%
%  NOM DU FICHIER:   Main.m                               	    %
%                                                             	%
%  DESCRIPTION:      Script principal du devoir 2 de PHS4700    %
%                                                             	%
%  AUTEUR:           Rachel Côté Bessette 1721384,    			%
%                    Clarence Desmarais 1762064,                %
%                    Audrey Lebel-Richardson 1665999            %
% ----------------------------------------------------------- 	%

%Remise à zéro : effacer les variables et le contenu de l'écran
clc;
format long
global positionsBalleOpt1 positionsBalleOpt2 positionsBalleOpt3;

%++++++++++++++++++++++++++ESSAI 1++++++++++++++++++++++++++	%
essai = 1;
rbi = [0.00 0.50 1.10];
vbi = [4.00 0.00 0.80];
wbi = [0.00 -70.00 0.00];

positionsBalleOpt1 = rbi;
positionsBalleOpt2 = rbi;
positionsBalleOpt3 = rbi;

nbOption = 3;
for option=1:nbOption
    [coup, tf, rbf, vbf] = Devoir2(option, rbi, vbi, wbi);

    fprintf('OPTION : %d , ESSAI : %d \n',option, essai);
    fprintf('Coup : %d \n',coup);
    fprintf('tf : %d \n',tf);
    disp('rbf :');
    disp(rbf);
    disp('vbf :');
    disp(vbf);
end
graphique(1);

%++++++++++++++++++++++++++ESSAI 2++++++++++++++++++++++++++	%
essai = 2;
rbi = [0.00 0.40 1.14];
vbi = [10.00 1.00 0.20];
wbi = [0.00 100.00 -50.00];

positionsBalleOpt1 = rbi;
positionsBalleOpt2 = rbi;
positionsBalleOpt3 = rbi;

nbOption = 3;
for option=1:nbOption
    [coup, tf, rbf, vbf] = Devoir2(option, rbi, vbi, wbi);

    fprintf('OPTION : %d , ESSAI : %d \n',option, essai);
    fprintf('Coup : %d \n',coup);
    fprintf('tf : %d \n',tf);
    disp('rbf :');
    disp(rbf);
    disp('vbf :');
    disp(vbf);
end
graphique(2);

%++++++++++++++++++++++++++ESSAI 3++++++++++++++++++++++++++	%
essai = 3;
rbi = [2.74 0.50 1.14];
vbi = [-5.00 0.00 0.20];
wbi = [0.00 100.00 0.00];

positionsBalleOpt1 = rbi;
positionsBalleOpt2 = rbi;
positionsBalleOpt3 = rbi;

nbOption = 3;
for option=1:nbOption
    [coup, tf, rbf, vbf] = Devoir2(option, rbi, vbi, wbi);

    fprintf('OPTION : %d , ESSAI : %d \n',option, essai);
    fprintf('Coup : %d \n',coup);
    fprintf('tf : %d \n',tf);
    disp('rbf :');
    disp(rbf);
    disp('vbf :');
    disp(vbf);
end
graphique(3);


% ++++++++++++++++++++++++++ESSAI 4++++++++++++++++++++++++++	%
essai = 4;
rbi = [0.00 0.30 1.00];
vbi = [10.00 -2.00 0.20];
wbi = [0.00 10.00 -100.00];

positionsBalleOpt1 = rbi;
positionsBalleOpt2 = rbi;
positionsBalleOpt3 = rbi;

nbOption = 3;

for option=1:nbOption
    [coup, tf, rbf, vbf] = Devoir2(option, rbi, vbi, wbi);

    fprintf('OPTION : %d , ESSAI : %d \n',option, essai);
    fprintf('Coup : %d \n',coup);
    fprintf('tf : %d \n',tf);
    disp('rbf :');
    disp(rbf);
    disp('vbf :');
    disp(vbf);
    
end
graphique(4);




