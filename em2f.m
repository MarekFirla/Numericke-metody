function [t,y] = em2f(a,b,tau,f,ya)
t=a:tau:b;   
Q=length(t);        %inicializace øešení
y=zeros(length(ya),Q);
k1=zeros(1,length(t));
k2=zeros(1,length(t));

y(:,1)=ya;

for i=1:Q-1
k1=f(t(i),y(:,i));
k2=f(t(i)+2/3*tau,y(:,i)+tau*2/3*k1);
y(:,i+1)=y(:,i)+1/4*tau*(k1+3*k2);
end
end

