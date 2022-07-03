%Eulerova explicitní metoda EE
clc
clear

t0=0;                %poèáteèní èas
tk=60;               %koncový èas
tau=0.01;            %krok
t=t0:tau:tk;         %vektor uzlù

a=1;                  %zadánì koeficienty
b=0.03;
c=0.4;
p=0.01;

f=@(t,y) [a*y(1)-b*y(1)*y(2);-c*y(2)+p*y(1)*y(2)];  %zadání rovnice
ya=[15;15];         %poèáteèní podmínky

Q=length(t);        %inicializace øešení
y=zeros(length(ya),Q);
y(:,1)=ya;

for i=1:Q-1
  y(:,i+1)=y(:,i)+tau*f(t(i),y(:,i)); %metoda øešení
end
[tODEN,yODEN]=ode45(f,t,ya);    %srovnání s ode45

plot (t,y(1,:),'r',t,y(2,:),'b',tODEN,yODEN(:,1),'g',tODEN,yODEN(:,2),'k') %vykreslení grafù
legend('koøist EE','predátor EE','koøist ODE45','predátor ODE45')  