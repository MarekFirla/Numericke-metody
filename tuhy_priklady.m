clear all
clc
a=0;
b=1;  %pro netuhy je potreba delsi interval, aby byl videt rozdil v poctu kroku

%f=@(t,y)[y(2);-y(1)];y0=[0 1]; %netuhy problem
f=@(t,y)[y(2);-1000*y(1)-1001*y(2)];y0=[1 1];% tuhy problem pr 1.1 skripta

[t,y]=ode45(f,[a b ],y0); % resic v impl. v matlabu .. modre tecky
[tt,yy]=ode15s(f,[a b ],y0); % cervene kolecka

plot(t,y,'rx',tt,yy,'bo')

s45=ode45(f,[a b ],y0); 
s15=ode15s(f,[a b ],y0);

stat45=sprintf('ode45: pk=%d, pf=%d.',s45.stats.nsteps,s45.stats.nfevals);stat45
stat15=sprintf('ode15: pk=%d, pf=%d.',s15.stats.nsteps,s15.stats.nfevals);stat15