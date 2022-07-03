clc
clear

X=[-1 1 2]
Y=[-9 -11 18]
dY=[3 3 78]

A=zeros(6);
b=[-9;-11;18;3;3;78];

for i=0:5
A(i)=X(1)^i
end

A