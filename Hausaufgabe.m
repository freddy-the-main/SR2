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

dyF = smoothdata(dy,'gaussian',100);
dyF = smoothdata(dyF,'gaussian',200);

DdyF = diff(dyF)./Tinterval;
dyF = dyF(1:end-2);
t = t(1:end-2);
du = du(1:end-2);
DdyF = smoothdata(DdyF, 'gaussian', 500);
DDdyF = diff(DdyF)./Tinterval;
DdyF = DdyF(1:end-1);
DDdyF = smoothdata(DDdyF, 'gaussian', 500);

%% Aufgabe A:
mat1 = [DdyF(:), dyF(:)];

x = inv(mat1'*mat1)*mat1'*du;

k = 1/x(1)
a = x(2)*k


%% Aufgabe B

mat2 = [DDdyF(:), DdyF(:), dyF(:)];

x2 = inv(mat2'*mat2)*mat2'*du;

gamma = 1/x2(1)
alpha = x2(2)*gamma
beta = x2(3)*gamma


%% Validierung

uu = (DDdyF + alpha * DdyF + beta * dyF) / gamma;

yPT1 = tf(k, [1 a]);
yPT2 = tf(gamma, [1 alpha beta]);

dyresponsept1 = lsim(yPT1, du, t);
dyresponsept2 = lsim(yPT2, du, t);



dy = dy(1:end-2);
%% Plot
figure(1)
hold on
grid on
plot(t,dy)
plot(t,dyF)
plot(t,DdyF)
plot(t,DDdyF)
plot(t,du)
axis equal
figure(2)
%plot(t,uu)
hold on
plot(t,dyresponsept1,'b')
plot(t,dyF,'r')

figure(3)
hold on
plot(t,dyresponsept2,'b')
plot(t, dyF,'r')

