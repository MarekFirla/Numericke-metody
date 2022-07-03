clc
clear
format long

A=[-1 1 3 2;3 2 1 -1; 2 3 -1 1; 1 -1 2 3];
b=[10; 0; 0 ;15];

b=A'*b;
A=A.'*A;

Presnost=5*10^(-7);
n=length(b);

%SSOR metoda
omega=1.3;
xp=zeros(n,1);
x=zeros(n,1);
x1=zeros(n,1);
AktChybSSOR=1;
IteraceSSOR=0;

while (AktChybSSOR > Presnost) && (IteraceSSOR<1000)
  
  for k=1:n
    x(k)=((omega/A(k,k))*(b(k)-A(k,1:k-1)*x(1:k-1)-A(k,k+1:n)*x(k+1:n)))+((1-omega)*x(k));
    x1(k)=((omega/A(k,k))*(b(k)-A(k,1:k-1)*x(1:k-1)-A(k,k+1:n)*x1(k+1:n)))+((1-omega)*x(k));
  end
    AktChybSSOR=norm(xp-x1);
    xp=x1;
    x=x1;
    IteraceSSOR=IteraceSSOR+1;
end
SSOR=x1;
omega
IteraceSSOR
AktChybSSOR

%SOR metoda
omega=1.3;
xp=0;
x=zeros(n,1);
AktChybSOR=1;
IteraceSOR=0;

while (AktChybSOR > Presnost) && (IteraceSOR<10000)
  
    for k=1:n
    x(k)=((omega/A(k,k))*(b(k)-A(k,1:k-1)*x(1:k-1)-A(k,k+1:n)*x(k+1:n)))+((1-omega)*x(k));
    end
    AktChybSOR=norm(x-xp);
    xp=x;
    IteraceSOR=IteraceSOR+1;
end
SOR=x
omega
IteraceSOR
AktChybSOR

%Gauss-Seidelova metoda
xp=0;
x=zeros(n,1);
AktChybGS=1; 
IteraceGS=0;
while (AktChybGS > Presnost) && (IteraceGS<10000)
    for k=1:n
    x(k)=((1/A(k,k))*(b(k)-A(k,1:k-1)*x(1:k-1)-A(k,k+1:n)*x(k+1:n)));
    end
    AktChybGS=norm(x-xp);
    xp=x;
    IteraceGS=IteraceGS+1;
end
GS=x
IteraceGS
AktChybGS