function distanceEntre2Points = getDistancesEntre2Points(point1, point2)

carreSoustractionX1X2 = (point1(1)-point2(1))^2;
carreSoustractionY1Y2 = (point1(2)-point2(2))^2;

distanceEntre2Points = sqrt(carreSoustractionX1X2 + carreSoustractionY1Y2);