clc
clear
format long
A=[-1 1 3 2;3 2 1 -1; 2 3 -1 1; 1 -1 2 3];
b=[10; 0; 0 ;15];
b=A'*b;
A=A.'*A;
D=diag(diag(A));
S=tril(A,-1);
H=triu(A,1);


xp=b;
Presnost=5*10^(-7);
AktChyb=1; 
Iterace=0;
while (AktChyb > Presnost) && (Iterace<10000)
    xn=(D+S)^(-1)*(b-H*xp);
    AktChyb=norm(xn-xp);
    xp=xn;
    Iterace=Iterace+1;
end
GaussSeidlSPesnosti=xn
Iterace
AktChyb