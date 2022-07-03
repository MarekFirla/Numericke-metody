clc
clear
clf
hold on

a=1;
b=5;

f=@(t,y)[y(2);-sin(t)*y(2)-cos(t)*y(1)+t];            %zadání
ya=4;
yb=8;

presnost=0.01;
 yaa=1; 
 chyba=100;
 
while 1
if chyba<presnost
    break

elseif chyba>presnost
 yaa=yaa-0.001; 
podminky=[ya,yaa];
[t,y]=ode45(f,[a,b],podminky);
chyba=y(end,1)-yb
end
end

plot(t,y)


