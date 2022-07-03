clc
clear

a=0;
b=2*pi;
tau=0.001;
t=a:tau:b;          %vektor uzl�

f=@(t,y) [y(2);-y(1)]     %zad�n�
ya=[0;1];

Q=length(t);        %inicializace �e�en�
y=zeros(length(ya),Q);

y(:,1)=ya;

for i=1:Q-1
y(:,i+1)=y(:,i)+tau*f(t(i),y(:,i));
end
yp=sin(t);
plot (t,y,t,yp)