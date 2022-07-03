%Explicitní Runge-Kuttova metoda 3. øádu
clc
clear

t0=0;                   %poèáteèní èas
tk=60;                  %koncový èas
tau=0.1;                %krok
t=t0:tau:tk;            %vektor uzlù

a=1;                    %zadané koeficienty
b=0.03;
c=0.4;
p=0.01;

f=@(t,y) [a*y(1)-b*y(1)*y(2);-c*y(2)+p*y(1)*y(2)];    %zadáná rovnice
ya=[15;15];             %poèáteèní podmínky

Q=length(t);        %inicializace øešení
y=zeros(length(ya),Q);
k1=zeros(1,length(t));
k2=zeros(1,length(t));
k3=zeros(1,length(t));
y(:,1)=ya;

c2= 1/2;        %dopoèet koeficientù
c3=3/4;
A=[1,1,1;0,c2,c3;0,c2^2,c3^2];
ps=[1;1/2;1/3];
x=A\ps;
b1=x(1);
b2=x(2);
b3=x(3);
a32=1/(6*b3*c2);
a21=c2;
a31=c3-a32;

for i=1:Q-1         %metoda øešení
k1=f(t(i),y(:,i));
k2=f(t(i)+c2*tau,y(:,i)+tau*a21*k1);
k3=f(t(i)+c3*tau,y(:,i)+tau*(k1*a31+a32*k2));
y(:,i+1)=y(:,i)+tau*(b1*k1+b2*k2+b3*k3);
end

[tODEN,yODEN]=ode45(f,t,ya);    %srovnání s ODE45

plot (t,y(1,:),'r',t,y(2,:),'b',tODEN,yODEN(:,1),'g',tODEN,yODEN(:,2),'k') %vykreslení grafù
legend('koøist RK','predátor RK','koøist ODE45','predátor ODE45')                                                                           