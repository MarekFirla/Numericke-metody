clc
clear
format short

A=[-1 1 3 2;3 2 1 -1; 2 3 -1 1; 1 -1 2 3];
b=[10; 0; 0 ;15];
Presnost=5*10^(-7);
maxIterace=10000;

b=A'*b;
A=A.'*A;
  
a=1;
krok=0.01;
c=1.999;
  
n=length(b);
o=a:krok:c;
m=length(o);
omegaplot=zeros(m,1);
IteraceSSORplot=zeros(m,1);
pocitadlo=1;
%SSOR metoda
for o=a:krok:c
omega=o;
xp=zeros(n,1);
x=zeros(n,1);
x1=zeros(n,1);
AktChybSSOR=1;
IteraceSSOR=0;

while (AktChybSSOR > Presnost) && (IteraceSSOR<maxIterace)
  
  for k=1:n
    x(k)=((omega/A(k,k))*(b(k)-A(k,1:k-1)*x(1:k-1)-A(k,k+1:n)*x(k+1:n)))+((1-omega)*x(k));
    x1(k)=((omega/A(k,k))*(b(k)-A(k,1:k-1)*x(1:k-1)-A(k,k+1:n)*x1(k+1:n)))+((1-omega)*x(k));
  end
    AktChybSSOR=norm(xp-x1);
    xp=x1;
    x=x1;
    IteraceSSOR=IteraceSSOR+1;
end
omegaplot(pocitadlo)=omega;
IteraceSSORplot(pocitadlo)=IteraceSSOR;
pocitadlo=pocitadlo+1;
end
[pocetiteraci,pozice]=min(IteraceSSORplot);
omegaoptimalni=omegaplot(pozice)