clear, clc
clf
%Vectoren zusammen fügen

load Versuch1_Aufgabe3_2_1.mat

A1 = A;
B1 = B; 
C1 = C;

load Versuch1_Aufgabe3_2_2.mat

A = [A1; A];
B = [B1; B];
C = [C1; C];

% Vectoren beschneiden
A = A((24759):end);
B = B((24759):end);
C = C((24759):end);

t = [1:1:length(A)];
ti = t;
t = t.*Tinterval;

v = A;
u = C;
y = B;

du = u-5;
dv = v-5;
dy = y - y(1);
 
% figure(1)
% hold on
% grid on
% plot(ti,u)
% plot(ti,v)
% plot(ti,y)



%% Plot
figure(2)
hold on
grid on
plot(t,dy)
plot(t,du)

