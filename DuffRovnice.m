clc
clear

a=0;
b=5*pi;
tau=0.001;
t=a:tau:b;          %vektor uzlù

f=@(t,y) [y(2);-y(1)-0.1*y(1)^3];    %zadání
ya=[0;1];

Q=length(t);        %inicializace øešení
y=zeros(length(ya),Q);
k1=zeros(1,length(t));
k2=zeros(1,length(t));
k3=zeros(1,length(t));

y(:,1)=ya;

c2= 1/2;
c3=3/4;

A=[1,1,1;0,c2,c3;0,c2^2,c3^2];
ps=[1;1/2;1/3];
x=A\ps;
b1=x(1);
b2=x(2);
b3=x(3);
a32=1/(6*b3*c2);
a21=c2;
a31=c3-a32;

for i=1:Q-1
k1=f(t(i),y(:,i));
k2=f(t(i)+c2*tau,y(:,i)+tau*a21*k1);
k3=f(t(i)+c3*tau,y(:,i)+tau*(k1*a31+a32*k2));
y(:,i+1)=y(:,i)+tau*(b1*k1+b2*k2+b3*k3);
end
[tODEN,yODEN]=ode45(f,[a,b],ya);

plot (t,y(1,:),tODEN,yODEN(:,1))