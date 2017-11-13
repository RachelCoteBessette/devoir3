function [vapf, vbpf] = calculVitessesLineairesPointCollision(vapi,vbpi,rap,rbp,Ia,Ib,n,j)
[ma,~,~,~]=getDonneesAutoA();
[mb,~,~,~]=getDonneesAutoB();

vapf = vapi + j*((n/ma)+(cross((inv(Ia)*(transpose(cross(rap,n)))),rap)));
vbpf = vbpi - j*((n/mb)+(cross((inv(Ib)*(transpose(cross(rbp,n)))),rbp)));