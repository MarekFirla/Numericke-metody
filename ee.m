clc
clear

a=0;
b=1;
tau=0.01;
t=a:tau:b;          %vektor uzlù

f=@(t,y)  -20*y;     %zadání
ya=1;

Q=length(t);        %inicializace øešení
y=zeros(1,Q);

y(1,1)=ya;

for i=1:Q-1
y(1,i+1)=y(1,i)+tau*f(t(i),y(1,i));
end
yp=exp(-20*t);
plot (t,y,t,yp)