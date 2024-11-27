clear, clc

%Vectoren zusammen fügen

load Versuch1_Aufgabe3_4_1.mat

A1 = A;
B1 = B; 
C1 = C;

load Versuch1_Aufgabe3_4_2.mat

A = [A1; A];
B = [B1; B];
C = [C1; C];

% Vectoren beschneiden
A = A(floor(3537-3/Tinterval):end);
B = B(floor(3537-3/Tinterval):end);
C = C(floor(3537-3/Tinterval):end);

t = [1:1:length(A)];
ti = t;
t = t.*Tinterval;

v = A;
u = C;
y = B;

Du = u-5;
Dv = v-5;
Dy = y - y(1);

% figure(11)
% hold on
% grid on
% plot(ti,u)
% plot(ti,v)
% plot(ti,y)

figure(12)

hold on
grid on
plot(t,Dy)
plot(t,Dv)
%plot(t,Du)



