function graphique()
global positionsAutoA; 
global positionsAutoB; 
global pointsAutoAInit;
global pointsAutoBInit; 
global pointsAutoAFin;
global pointsAutoBFin;

% il faut dessiner les points representant les autos dans un ordre
mat5PtsPrTracerAInit = classerPoints(pointsAutoAInit, 'a');
mat5PtsPrTracerBInit = classerPoints(pointsAutoBInit, 'b');
mat5PtsPrTracerAFin = classerPoints(pointsAutoAFin, 'a'); 
mat5PtsPrTracerBFin = classerPoints(pointsAutoBFin, 'b'); 


figure
plot(positionsAutoA(:,1), positionsAutoA(:,2), '-red', ...
     positionsAutoB(:,1), positionsAutoB(:,2), '-blue', ...
     mat5PtsPrTracerAInit(:,1), mat5PtsPrTracerAInit(:,2), 'black',...
     mat5PtsPrTracerAFin(:,1), mat5PtsPrTracerAFin(:,2), 'black', ...
     mat5PtsPrTracerBInit(:,1), mat5PtsPrTracerBInit(:,2), 'black', ...
     mat5PtsPrTracerBFin(:,1), mat5PtsPrTracerBFin(:,2), 'black')
 
% nommer les axes 
xlabel('x');
ylabel('y');
zlabel('z');

%limites du graphe
limiteX = [-20 200];
limiteY = [-20, 180];

xlim(limiteX);
ylim(limiteY);

grid on;
end