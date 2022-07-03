function [t,y] = eesf(a,b,tau,f,ya)
t=a:tau:b;

Q=length(t);      
y=zeros(length(ya),Q);

y(:,1)=ya;

for i=1:Q-1
y(:,i+1)=y(:,i)+tau*f(t(i),y(:,i));
end
end
