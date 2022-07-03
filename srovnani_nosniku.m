clc
clear
clf
hold on

tau=0.1;
a=0;
b=500;
t=a:1:b;

Fq=7;
E=2.1*10^5;
h=40;
m=20;
J=(m*h^3)/12;

ya=0;
yb=0; 

fh=@(t,y)[y(2);0];    
podmh=[0 -5];

[t,yh]=ode45(fh,t,podmh);

f=@(t,y)[y(2);(Fq/2*t*(b-t))/E*J]; 
podm=[ya 1];

[t,yp]=ode45(f,t,podm);

c=(yb-yp(end,1))/yh(end,1);
y=c*yh+yp;
chyba=y(end,1)-yb
plot(t,y(:,1))


f=@(t,y,dy) ((Fq/2*t*(b-t))/(E*J)*(1+(dy)^2)^(3/2)
% Prepis rovnice do systemu
F=@(t,y) [y(2,:);f(t,y(1,:),y(2,:))];

podm=@(ra,rb) [ra(1)-ya; rb(1)-yb];
solinit=bvpinit(linspace(a,b,20),[1 -1]);
sol=bvp4c(F,podm,solinit);     