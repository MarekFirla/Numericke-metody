function [t,y] = eif(a,b,tau,f,ya)
t=a:tau:b;

Q=length(t);      
y=zeros(1,Q);

y(1,1)=ya;

for i=1:Q-1
y(1,i+1)=fzero(@(z)z-y(1,i)-tau*f(t(i+1),z),y(1,i));
end
end