clc
clear

a=0;
b=80;
tau=0.01;

f=@(t,y) 0.1*y*(1-(y/100));
ya=30;
[t1,y1]=eef(a,b,tau,f,ya);
ya=150;
[t2,y2]=eef(a,b,tau,f,ya);
ya=100;
[t3,y3]=eef(a,b,tau,f,ya);
ya=0;
[t4,y4]=eef(a,b,tau,f,ya);
plot (t1,y1,t2,y2,t3,y3,t4,y4)