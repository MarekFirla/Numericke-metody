clc
clear

a=0;
b=1;
tau=0.2;

f=@(t,y) -10*y;     %zadání
ya=1;

[te,ye]=eef(a,b,tau,f,ya);
[ti,yi]=eif(a,b,tau,f,ya);

yp=exp(-10*te);
plot (te,ye,"b",ti,yi,"g",te,yp,"c")