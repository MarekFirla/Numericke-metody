clc;close all; clear all;figure;
% Metoda secen pro OU ODR y''=f(t,y,y'), y(a)=ya, y(b)=yb 
a=0;
ya=0;
b=500;
yb=0;
t=a:1:b;
h=40;m=20;l=500;E=2.1*10^5;J=(m*h^3)/12;
Fq=7;
M=@(t) Fq/2*t*(l-t);
f=@(t,y,dy) M(t)/(E*J)*(1+(dy)^2)^(3/2)
% Prepis rovnice do systemu
F=@(t,y) [y(2,:);f(t,y(1,:),y(2,:))];
% pocatecni aproximace metody secen 
s(1)=1;
s(2)=2;
% odpovidajici pocatecni chyby
sol=ode45(F,[a,b],[ya;s(1)]);
chyba(1)=sol.y(1,end)-yb;
sol=ode45(F,[a,b],[ya;s(2)]);
chyba(2)=sol.y(1,end)-yb;
%pozadovana presnost
presnost=0.001;
k=2;
%pocatecni chyba
while (abs(chyba(k))>presnost) & (k<10) 
    %metoda secen pro urceni smernice
    s(k+1)=s(k)-chyba(k)*(s(k)-s(k-1))/(chyba(k)-chyba(k-1));
    [t,y]=ode45(F,[a,b],[ya;s(k+1)]);
    chyba(k+1)=y(end,1)-yb;
    k=k+1;
    %plot(t,y(:,1));
    hold on;
end
% reseni s pozadovanou chybou (ziskane z while cyklu)
[t,y]=ode45(F,[a,b],[ya;s(k)]);
% reseni pomoci implementovaného øešièe bvp4c
podm=@(ra,rb) [ra(1)-ya; rb(1)-yb];
solinit=bvpinit(linspace(a,b,20),[1 -1]); % inicializace 
sol=bvp4c(F,podm,solinit);                % reseni
plot(t,y(:,1),'r*',sol.x,sol.y(1,:),'b-');
pocetaprox=k-1
chyba(k)