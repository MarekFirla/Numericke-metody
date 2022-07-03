clc
clear
format long
A=[-1 1 3 2;3 2 1 -1; 2 3 -1 1; 1 -1 2 3];
b=[10; 0; 0 ;15];
b=A'*b;
A=A.'*A;
n=4;
D=diag(diag(A));
S=tril(A,-1);
H=triu(A,1);
x=b;
for i=1:100
   x=(D)^(-1)*(b-(S+H)*x);
end
Jacobi=x
x=b;
for i=1:100
   x=(D+S)^(-1)*(b-H*x);
end
GaussSeidl=x

%s pøesností
xp=b;
Presnost=5*10^(-7);
AktChyb=1; %Aktchyb>Pøesnost
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