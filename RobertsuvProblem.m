clear all
clc

a=0;
b=1;  

f=@(t,y)[-0.04*y(1)+10^4*y(2)*y(3);0.04*y(1)-10^4*y(2)*y(3)-3*10^7*y(2)^2;3*10^7*y(2)^2];
y0=[1 0 0];

[t,y]=ode45(f,[a b ],y0); % resic v impl. v matlabu .. modre tecky
[tt,yy]=ode15s(f,[a b ],y0); % cervene kolecka

plot(t,y,'rx',tt,yy,'bo')

s45=ode45(f,[a b ],y0); 
s15=ode15s(f,[a b ],y0);

stat45=sprintf('ode45: pk=%d, pf=%d.',s45.stats.nsteps,s45.stats.nfevals);stat45
stat15=sprintf('ode15: pk=%d, pf=%d.',s15.stats.nsteps,s15.stats.nfevals);stat15