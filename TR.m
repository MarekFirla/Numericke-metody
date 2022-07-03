clc
clear
clf
hold on

a=0;
b=2*pi;
tau=0.001;
t=a:tau:b;

f=@(t,y) [y(2);-y(1)+t];
ya=[0;1];
[tTRL,yTRL]=TR_s_f(a,b,tau,f,ya);
[tEEL,yEEL]=eesf(a,b,tau,f,ya);
[tODEL,yODEL]=ode45(f,[a,b],ya);

f=@(t,y) [y(2);-sin(y(1))+t];
ya=[0;1];
[tTRN,yTRN]=TR_s_f(a,b,tau,f,ya);
[tEEN,yEEN]=eesf(a,b,tau,f,ya);
[tODEN,yODEN]=ode45(f,[a,b],ya);

plot (tTRL,yTRL(1,:),"blue",tEEL,yEEL(1,:),"green",t,sin(t),"black",tTRN,yTRN(1,:),"red",tEEN,yEEN(1,:),tODEL,yODEL(:,1),tODEN,yODEN(:,1))