clc
clear

a=0;
ua=0;
ub=-1;
b=3/2*pi;

Q=10*pi;
h=(b-a)/Q;

%difer. etoda pro (-pu?)?+pu=f, u(a)=ua u(b)=ub
p=@(x) -1*x.^0;
q=@(x) x.^0;
f=@(x) 0*x.^0;

alfa1=0;
beta1=1;

%uzly
x=[a+h:h:b-h];

%matice A
hldiag = [p(h/2)+h*alfa1+1/2*h.^2*q(h) , ((p(x-h/2)+p(x+h/2)+q(x)*h^2)/h^2) , 1];
doldiag = [-p(x-h/2)/h^2 , -p(h/2)/h^2];
hordiag = [ -p(h/2)/h^2 , -p(x+h/2)/h^2];

A=diag(hldiag)+diag(doldiag,-1)+diag(hordiag,1);

bb=[ua,f(x),ub]';

u=A\bb;

xx=[a:x:b];
plot(xx,u)
