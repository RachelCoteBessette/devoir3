function [trouveCoinCoin, posCoinCoin, nCoinCoin] = verifierCoinCoin(matricePositionAutoA, matricePositionAutoB)
%
% Fonction qui verifie si deux coins se touchent.
%
%
trouveCoinCoin = 0;
nbCoin = 4;

for i=1:nbCoin %Pour tous les coins de A

    for j=1:nbCoin %Pour tous les coins de B
        if(abs(matricePositionAutoA(i,1)-matricePositionAutoB(j,1)) <= 0.0001 ...
                && abs(matricePositionAutoA(i,2)-matricePositionAutoB(j,1)) <= 0.0001 )
            trouveCoinCoin = 1;
            posCoinCoin = [matricePositionAutoA(i,1) matricePositionAutoA(i,2)];
            %Calcul de la normal (doit pointer vers l interieur de A pour
            %d autres calculs (voir vitessesfinales...)
            nCoinCoin = (matricePositionAutoA(5)-matricePositionAutoB(5))/norm(matricePositionAutoA(5)-matricePositionAutoB(5));
        end
    end

end