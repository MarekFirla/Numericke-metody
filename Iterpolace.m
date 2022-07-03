clear
clc
clf
format long

x=[1 4 9];
y=[1 2 3];
L2=@(x)((x-4)*(x-9))/((1-4)*(1-9))+2*((x-1)*(x-9))/((4-1)*(4-9))+3*((x-1)*(x-4))/((9-1)*(9-4));
OL = L2(5)
Skutecna=5^(1/2)
x1=0:0.1:x(3);
y1=x;
for i=1:length(x1)
y1(i)=L2(x1(i));
end
hold on;
plot(x,y,'r+')  
plot(x1,y1,'r') 
plot(x1,x1.^(1/2))
grid on;


x=[0,1 4 9];
y=[0,1 2 3];
n=4;
p=zeros(n,n);
for i=1:n
p(i,1)=y(i);
end
for k=2:n
    for i=k:n
        p(i,k)=(p(i,k-1)-p(i-1,k-1))/(x(i)-x(i-k+1));
    end
end
for i=1:length(x1)
Nng(i)=p(1,1);
end
for i=1:length(x1)
    for k=2:n
        SouZav=1;
    for j=2:k
        SouZav=SouZav*(x1(i)-x1(j-1));
    end
    Nng(i)=Nng(i)+p(k,k)*SouZav;
    end
end
%%plot(x1,Nng,'k')


x=[1 4 9];
y=[1 2 3];
A=[1 1-4 (1-4)^2 (1-4)^3 (1-4)^4 (1-4)^5;1 0 0 0 0 0;1 9-4 (9-4)^2 (9-4)^3 (9-4)^4 (9-4)^5;0 1 2*(1-4) 3*(1-4)^2 4*(1-4)^3 5*(1-4)^4 ;0 1 0 0 0 0; 0 1 2*(9-4) 3*(9-4)^2 4*(9-4)^3 5*(9-4)^4];
b=[1;2;3;1/2;1/4;1/6];
a=A\b;
Hermit = @(x) a(1)+a(2)*(x-4)+a(3)*(x-4)^2+a(4)*(x-4)^3+a(5)*(x-4)^4+a(6)*(x-4)^5;
x=x(1):0.05:x(3);
Hng=x;
for i=1:length(x)
    Hng(i)=Hermit(x(i));
end
plot(x,Hng)
OH=Hermit(5)