function [SSOR,omega,IteraceSSOR] = SSORf (A,b,Presnost,maxIterace)
b=A'*b;
A=A.'*A;
  
n=length(b);

%SSOR metoda
omega=1.162;
xp=zeros(n,1);
x=zeros(n,1);
x1=zeros(n,1);
AktChybSSOR=1;
IteraceSSOR=0;

while (AktChybSSOR > Presnost) && (IteraceSSOR<maxIterace)
  
  for k=1:n
    x(k)=((omega/A(k,k))*(b(k)-A(k,1:k-1)*x(1:k-1)-A(k,k+1:n)*x(k+1:n)))+((1-omega)*x(k));
    x1(k)=((omega/A(k,k))*(b(k)-A(k,1:k-1)*x(1:k-1)-A(k,k+1:n)*x1(k+1:n)))+((1-omega)*x(k));
  end
    AktChybSSOR=norm(xp-x1);
    xp=x1;
    x=x1;
    IteraceSSOR=IteraceSSOR+1;
end
SSOR=x1;
omega;
IteraceSSOR;
AktChybSSOR;
endfunction