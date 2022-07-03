%pro ovìøení tuhosti úlohy
clear all
clc
    
t0=0;                   %zaèátek intervalu
tk=60;                  %konec intervalu

a=1;                    %zadané koeficienty
b=0.03;
c=0.4;
p=0.01;

f=@(t,y)[a*y(1)-b*y(1)*y(2);-c*y(2)+p*y(1)*y(2)]; %zadaná rovnice
y0=[15;15];                                       %poèáteèní podmínky

[t,y]=ode45(f,[t0 tk],y0);      %øešiè ode45 modre tecky
[tt,yy]=ode15s(f,[t0 tk],y0);   %øešiè ode15s cervene kolecka

plot(t,y,'rx',tt,yy,'bo')       %vykreslení grafu

s45=ode45(f,[t0 tk],y0); 
s15=ode15s(f,[t0 tk],y0);

stat45=sprintf('ode45: pk=%d, pf=%d.',s45.stats.nsteps,s45.stats.nfevals);stat45
stat15=sprintf('ode15: pk=%d, pf=%d.',s15.stats.nsteps,s15.stats.nfevals);stat15                                          