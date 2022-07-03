clc
clear
%neze tuhle úlohu øešit diff metodou 
a=0;
ua=0;
ub=0;
l=500;
b=l;
t=a:0.5:l;

Fq=7;
E=2.1*10^5;
h=40;
m=20;
J=(m*h^3)/12;
hh=1;

%difer. etoda pro (-pu´)´+pu=f, u(a)=ua u(b)=ub
p=@(x) -1*x.^0;
q=@(x) 0.*x.^0;
f=@(x) ((Fq*0.5).*x.*(l-x))/(E*J); 

%uzly
x=[a+hh:hh:b-hh];

%matice A
hldiag = [1 , ((p(x-h/2)+p(x+h/2)+q(x)*h^2)/h^2) , 1];
doldiag = [-p(x-h/2)/h^2 , 0];
hordiag = [0 , -p(x+h/2)/h^2];

A=diag(hldiag)+diag(doldiag,-1)+diag(hordiag,1);

bb=[ua,f(x),ub]';

u=A\bb;
xx=[a:x:b];

plot(u)