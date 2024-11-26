clear, clc
 
%Vectoren zusammen fügen
 
load('Versuch1_Aufgabe3_4_1.mat')

t = (1:1:length(A));
t = t .* Tinterval;

v = A;
u = C;
y = B;
deltau = u -5;
deltav = v - 5;
deltay = y - y(1);

figure(1), clf

grid on
plot(t,deltay,t,deltav,t,deltau)
hold on