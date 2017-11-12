function points = get4PointsOrigineAuto(auto)
%auto est un parametre qui prend un char soit 'a' ou 'b' pour lauto 

% auto dans le repere lorsquelle est ramenee a lorigine du plan 
%  3---2
%  |   |
%  4---1

if(auto == 'a')
    [masse, longueur, largeur, hauteur] = getDonneesAutoA()
else
    [masse, longueur, largeur, hauteur] = getDonneesAutoB()
end

point1 = [largeur/2, -longueur/2, 0];
point2 = [largeur/2, longueur/2, 0];
point3 = [-largeur/2, longueur/2, 0];
point4 = [-largeur/2, -longueur/2, 0];

points = [point1, point2, point3, point4];