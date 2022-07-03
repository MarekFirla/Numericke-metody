clc
clear
clf
hold on

a=0;
b=15;
tau=0.1;
t=a:tau:b;                                                            %vektor uzlù

f=@(t,y) [y(2);-0.5*y(2)-y(1).^3-y(1)];                %zadání
ya=[1;1];

Q=length(t);                                                       %inicializace øešení
y=zeros(length(ya),Q);

y(:,1)=ya;                                                            %poèáteèní podmínky
[tem2,yem2]=em2f(a,b,tau,f,ya);
y(:,2)=yem2(:,2);

for i=2:Q-1
y(:,i+1)=y(:,i)+(3/2)*tau*f(t(i),y(:,i))-tau*(1/2)*f(t(i-1),y(:,i-1));
end
[tode45,yode45]=ode45(f,[a,b],ya);

plot (tem2(1,:),yem2(1,:),tode45(:,1),yode45(:,1))
plot(t,y(1,:))