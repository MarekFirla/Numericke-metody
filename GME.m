clear
clc
format long
A=[-1 1 3 2;3 2 1 -1; 2 3 -1 1; 1 -1 2 3];
b=[10; 0; 0 ;0.00015];
n=4;
for i=1:n-1
    for k=i+1:n
        c=A(k,i)/A(i,i);
        for j=i:n
            A(k,j)=A(k,j)-c*A(i,j);
        end
        b(k)=b(k)-c*b(i);
    end
end
A;
b;
x=zeros(n,1);
x(n)=b(n)/A(n,n);
for i=n-1:-1:1
    s=0;
    for j=i+1:n
        s=s+A(i,j)*x(j);
    end
    x(i)=(b(i)-s)/A(i,i);
end;
x
A=[-1 1 3 2;3 2 1 -1; 2 3 -1 1; 1 -1 2 3];
b=[10; 0; 0 ;15];
MathX=A\b
Mathx=inv(A)*b
