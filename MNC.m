clc
clear
clf
format long

X=[-2 -1 0 1 2];
Y=[5.1 1.9 1.1 2.1 4.9];

figure
grid on
hold on
plot(X,Y,'r+')

fi0= ones(1,length(X));
fi1= X ;
fi2= X.^2;

A=zeros(3,3);

A(1,1)=dot(fi0,fi0);
A(1,2)=dot(fi0,fi1);
A(1,3)=dot(fi0,fi2);

A(2,1)=dot(fi1,fi0);
A(2,2)=dot(fi2,fi1);
A(2,3)=dot(fi2,fi2);

A(3,1)=dot(fi2,fi0);
A(3,2)=dot(fi2,fi1);
A(3,3)=dot(fi2,fi2);

b=zeros(3,1);

b(1)= dot(fi0,Y);
b(2)= dot(fi1,Y);
b(3)= dot(fi2,Y);

a=A\b;

x=X(1):0.05:X(5);

parabola=a(1)+a(2)*x+a(3)*x.^2;