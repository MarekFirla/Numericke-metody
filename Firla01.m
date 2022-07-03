%Eulerova explicitn� metoda EE
clc
clear

t0=0;                %po��te�n� �as
tk=60;               %koncov� �as
tau=0.01;            %krok
t=t0:tau:tk;         %vektor uzl�

a=1;                  %zad�n� koeficienty
b=0.03;
c=0.4;
p=0.01;

f=@(t,y) [a*y(1)-b*y(1)*y(2);-c*y(2)+p*y(1)*y(2)];  %zad�n� rovnice
ya=[15;15];         %po��te�n� podm�nky

Q=length(t);        %inicializace �e�en�
y=zeros(length(ya),Q);
y(:,1)=ya;

for i=1:Q-1
  y(:,i+1)=y(:,i)+tau*f(t(i),y(:,i)); %metoda �e�en�
end
[tODEN,yODEN]=ode45(f,t,ya);    %srovn�n� s ode45

plot (t,y(1,:),'r',t,y(2,:),'b',tODEN,yODEN(:,1),'g',tODEN,yODEN(:,2),'k') %vykreslen� graf�
legend('ko�ist EE','pred�tor EE','ko�ist ODE45','pred�tor ODE45')  