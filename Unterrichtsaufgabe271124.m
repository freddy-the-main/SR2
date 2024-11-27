clear 
clc
clf

% ermitteln sie die abeleitung 1 und 2 von y=ln(t) t=1

Tinterval = 0.001;
t=[0:Tinterval:10];
y= log(t);

t0 = find(y>=0,1);

DelY = (y(t0+1)-y(t0-1))/(2*Tinterval)


plot(t,y)
grid
axis equal tight

