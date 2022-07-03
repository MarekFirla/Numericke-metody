function [t,y]=TR_s_f(a,b,tau,f,y0)
% Lichobìžníková metoda pro soustavu ODR1
% vzorove volani [t,y]=TR_s_f(0,2*pi,0.1,@(t,y) [y(2);-y(1)],[0,1])
t=a:tau:b;

Q=length(t);
y=zeros(length(y0),length(t));

y(:,1)=y0;

  for n=1:Q-1 
  y(:,n+1)=fsolve(@(z) z-y(:,n)-tau*0.5*(f(t(n),y(:,n))+f(t(n+1),z)),y(:,n));
  end
end