function matrice5PointsClassee=classerPoints(matrice4Points, auto)
% Cette fonction prend 4 points classes nimporte comment 
% et les classe en ordre pour quils soient tous places
% un a cote de lautre. (utile pour dessiner voiture dans graphe final)
% 1---2
% 4---3
% matrice4Points : 4 points a classer
% exemple matrice4Points (peut etre utilisee pour tester
% matrice4Points = [0 0 0; ...
%                   1 1 0; ...
%                   1 0 0; ...
%                   0 1 0; ...
%                   ]
% retourne 5 points pour tracer une droite qui revient au point initial

hauteur = 0;
if(auto == 'a')
    [~, longueur, largeur, ~] = getDonneesAutoA(); 
else
    [~, longueur, largeur, ~] = getDonneesAutoB(); 
end


matrice5PointsClassee = zeros(0, 3);

%mettre le point 1 dans la matrice
point1 = matrice4Points(1,:);
matrice5PointsClassee = vertcat(matrice5PointsClassee, point1);

%enleve le point1
matrice4Points(1,:) = [];

%trouver parmis les points celui avec le meme x
for i=1:3
    pointEvalue = matrice4Points(i,:);
    distanceEntre2Points = getDistancesEntre2Points(pointEvalue, point1);
    if (round(distanceEntre2Points,1) == round(largeur,1))
        %mettre le point 2 dans la matrice
        matrice4Points(i,:) = []; %delete le point de la matrice jen ai plus besoin
        matrice5PointsClassee = vertcat(matrice5PointsClassee, pointEvalue);
        break;
    end
end

point2 = matrice5PointsClassee(2,:);
for i=1:2
    pointEvalue = matrice4Points(i,:);
    distanceEntre2Points = getDistancesEntre2Points(pointEvalue, point2);
    if (round(distanceEntre2Points,1) == round(longueur,1))
        %mettre le point3 dans la matrice
        matrice4Points(i,:) = []; %delete le points de la matrice que jai plus besoin
        matrice5PointsClassee = vertcat(matrice5PointsClassee, pointEvalue);
        break;
    end
end

matrice5PointsClassee = vertcat(matrice5PointsClassee, matrice4Points(1,:));

%remettre le point 1 dans la matrice
matrice5PointsClassee = vertcat(matrice5PointsClassee, matrice5PointsClassee(1,:));