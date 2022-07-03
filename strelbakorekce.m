clc
clear
clf
hold on

tau=0.1;
a=1;
b=5;
t=a:tau:b;

ya=4;
yb=8; 

fh=@(t,y)[y(2);-sin(t)*y(2)-cos(t)*y(1)];    
podmh=[0 1];

[t,yh]=ode45(fh,t,podmh);

f=@(t,y)[y(2);-sin(t)*y(2)-cos(t)*y(1)+t]; 
podm=[ya 1];

[t,yp]=ode45(f,t,podm);

c=(yb-yp(end,1))/yh(end,1);
y=c*yh+yp;
chyba=y(end,1)-yb
plot(t,y(:,1))




