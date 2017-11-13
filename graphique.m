function graphique()
global positionsAutoA; %ces donnees la sont deja stockees
global positionsAutoB; %ces donnees la sont deja stockees
global pointsAutoAInit; %ces donnees la sont deja stockees
global pointsAutoBInit; %ces donnees la sont deja stockees

% TODO : il semble y avoir une perte de precisions dans ces deux matrices ci
% ce qui fait planter (classerPoints) car les donnees qui a la dedans ne
% font pas de sens... voir pourquoi ca ne fait pas de sens 
global pointsAutoAFin;
global pointsAutoBFin;

mat5PtsPrTracerAInit = classerPoints(pointsAutoAInit);
mat5PtsPrTracerBInit = classerPoints(pointsAutoBInit);
mat5PtsPrTracerAFin = classerPoints(pointsAutoAFin); %investiguer via TODO
mat5PtsPrTracerBFin = classerPoints(pointsAutoBFin); %investiguer via TODO

%fonction officielle
figure
plot(positionsAutoA(:,1), positionsAutoA(:,2), '-red', ...
     positionsAutoB(:,1), positionsAutoB(:,2), '-blue', ...
     pointsAutoAInit(:,1), pointsAutoAInit(:,2), 'black',...
     pointsAutoAFin(:,1), pointsAutoAFin(:,2), 'black', ...
     pointsAutoBInit(:,1), pointsAutoBInit(:,2), 'black', ...
     pointsAutoBFin(:,1), pointsAutoBFin(:,2), 'black')
     
%-----------debut : effacer CECI quand on ne veut plus tester (dummy data)-----%
%{
matA = zeros(0,3);
pointIniA1 = [0,3,0];
pointIniA2 = [0, -3,0];
pointIniA3 = [2, 5, 0];
pointIniA4 = [5,5,0];
pointsA = zeros(0,3);
pointsA = vertcat(pointsA, pointIniA1, pointIniA2, pointIniA3, pointIniA4);

tmp1 = [0,0,0];
tmp2 = [10,15,0];
tmp3 = [15,20,0];
tmp4 = [30,18,0];
tmp5 = [40, 15, 0];
matA = vertcat(matA,tmp1,tmp2,tmp3,tmp4,tmp5);

matB = zeros(0,3);
tmp6 = [100, 10, 0];
tmp7 = [90, 5, 0];
tmp8 = [80, 10, 0];
tmp9 = [50, 15,0];
tmp10 = [40,20,0];
matB = vertcat(matB,tmp6,tmp7,tmp8,tmp9,tmp10);

figure
plot(matA(:,1), matA(:,2), '-r', ... %trajectoire centre de masse de a
     matB(:,1), matB(:,2), '-b', ... %trajectoire centre de masse de b
     pointsA(:,1), pointsA(:,2), 'c' ... %dessin de la voiture A 
     );
%}
%-----------fin : effacer CECI quand on ne test plus (dummy data)-----%
 
% nommer les axes 
xlabel('x');
ylabel('y');
zlabel('z');

%limites du graphe
limiteX = [0 100];
limiteY = [-45, 40];

xlim(limiteX);
ylim(limiteY);

grid on;
end