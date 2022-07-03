clc
clear
clf
hold on

a=0;
b=1;
tau=0.0014729398999959901006;
t=a:tau:b;                                                            %vektor uzlù

f=@(t,y)[-0.04*y(1)+10^4*y(2)*y(3);0.04*y(1)-10^4*y(2)*y(3)-3*10^7*y(2)^2;3*10^7*y(2)^2];            %zadání
ya=[1;0;0];

Q=length(t);                                                       %inicializace øešení
y=zeros(length(ya),Q);
ys=zeros(length(ya),Q);
yss=zeros(length(ya),Q);

y(:,1)=ya;                                                            %poèáteèní podmínky
[tem2,yem2]=em2f(a,b,tau,f,ya);
y(:,2)=yem2(:,2);

for i=2:Q-1
ys(:,i+1)=y(:,i)+(1/2)*tau*(3*f(t(i),y(:,i))-f(t(i-1),y(:,i-1)));
fs(:,i+1)=f(t(i+1),ys(:,i+1));
yss(:,i+1)=y(:,i)+(1/2)*tau*(fs(:,i+1)+f(t(i),y(:,i)));
est(:,i)=(-1/6)*(yss(:,i+1)-ys(:,i+1));
y(:,i+1)=yss(:,i+1)+est(:,i);
end
[tode45,yode45]=ode45(f,[a,b],ya);


subplot(2,1,1)
plot (t,y,"red")
subplot(2,1,2)
plot(tode45,yode45,"black")
%plot(y(1,:),y(2,:))