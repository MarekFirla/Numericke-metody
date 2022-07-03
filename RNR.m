%nelineární rovnice
%a)separace koøenù
clc
clear
format long

f=@(x) sqrt(x+2)-x/3-1;
f1=@(x) sqrt(x+2);  
f2=@(x) x/3+1;
x=-2:0.05:10;
osaX=zeros(1,length(x));
y=f(x);
y1=f1(x);
y2=f2(x);
figure
grid on
hold on
plot(x,y,'k')
plot(x,y1,'r')
plot(x,y2,'r')
plot(x,osaX,'b')

presnost=5*10^(-20);

%b)zpøesòování aproximací
%b)1)pùlení intervalù

Chyba=1;
PocetIteraci=0;

a=-2;
b=-1;

while (Chyba > presnost) & (PocetIteraci < 1000000)
   PocetIteraci=PocetIteraci+1;
    c=(a+b)/2;
    if (f(a)*f(c))>0
        a=c;
    else
        b=c;
    end
    Chyba=(b-a);
end
PocetIteraci
a
Chyba