%numerická integrace
clc
clear
format long

%obdelníková metoda
f = @ (x) (sin(x))/x;
a=1;
b=2;
n=40000;
h=(b-a)/n;
x=a:h:b;
for i=1:n
y(i)=f(x(i)+h/2);
end
Obdelnik=h*sum(y(1:n-1))

clear

%Lichobìžníková metoda
f = @ (x) (sin(x))/x;
a=1;
b=2;
n=40000;
h=(b-a)/n;
x=a:h:b;
for i=1:n
y(i)=f(x(i));
end
Lichobeznik=(h/2)*(f(x(1))+f(x(2))+2*sum(y(2:n-1)))

clear

%Simpsonova metoda
f = @ (x) (sin(x))/x;
a=1;
b=2;
n=40001;
h=(b-a)/n;
x=a:h:b;
for i=1:n
y(i)=f(x(i));
end
Simpson=h/3*(y(1)+2*sum(y(3:2:n-2))+4*sum(y(2:2:n-1))+y(n))

