function [trouveCoinCoin, posCoinCoin, nCoinCoin] = verifierCoinCoin(matricePositionAutoA, matricePositionAutoB)
%
% Fonction qui verifie si deux coins se touchent.
%
%

%Initialisation
trouveCoinCoin = 0;
posCoinCoin = [0 0];
nCoinCoin = [0 0];

nbCoin = 4;
epsilon = 0.0001;

for i=1:nbCoin %Pour tous les coins de A

    for j=1:nbCoin %Pour tous les coins de B
        if(abs(matricePositionAutoA(1,i)-matricePositionAutoB(1,j)) <= epsilon ...
                && abs(matricePositionAutoA(2,i)-matricePositionAutoB(2,j)) <= epsilon )
            
            % Verifier qu il ne s agisse pas d un face face
            if(norm(matricePositionAutoA(:,5)-matricePositionAutoB(:,5)) ...
                    < (norm(matricePositionAutoA(:,i)-matricePositionAutoA(:,5))+norm(matricePositionAutoB(:,i)-matricePositionAutob(:,5))))
                %Il s agit d un face face, donc on sort.
                return;
            end
            
            trouveCoinCoin = 1;
            posCoinCoin = [matricePositionAutoA(1,i) matricePositionAutoA(2,i)];
            %Calcul de la normal (doit pointer vers l interieur de A pour
            %d autres calculs (voir vitessesfinales...)
            nCoinCoin = (matricePositionAutoA(:,5)-matricePositionAutoB(:,5))/norm(matricePositionAutoA(:,5)-matricePositionAutoB(:,5));
        end
    end

end