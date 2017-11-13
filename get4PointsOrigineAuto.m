function points = get4PointsOrigineAuto(auto)
%auto est un parametre qui prend un char soit 'a' ou 'b' pour lauto 

% auto dans le repere lorsquelle est ramenee a lorigine du plan 
%                          y
%                   long   ^
%                  1-------|-------2   
%          largeur |       |       |
%         ---------|-------|-------|-------> x
%                  |       |       |
%                  4------ |-------3
%
if(auto == 'a')
    [~, longueur, largeur, ~] = getDonneesAutoA();
else
    [~, longueur, largeur, ~] = getDonneesAutoB();
end

point1 = [-longueur/2, largeur/2, 0];
point2 = [longueur/2, largeur/2, 0];
point3 = [longueur/2, -largeur/2, 0];
point4 = [-longueur/2, -largeur/2, 0];

%resultat final ressemble a 
%   1    2    3   4
% x -    -    -   -
% y -    -    -   -
% z -    -    -   -


points = transpose(vertcat(point1, point2, point3, point4));