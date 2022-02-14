n = 1;
n2 = 2;
L = 10;
xgrid = linspace(0, L, 100);
tspan = 0:0.25:5;

v = @(t,x,C) 0;
D = @(t,x,C) 1;
f = @(t,x,C) 0;

C0 = 1 + cos(n2*pi*xgrid/L);

[t, C] = solvePDE(f, v, D, tspan, xgrid, C0);

hold on
% no. columns - spatial var, no. rows - time, concentration
plot(xgrid, C(1,:))
plot(xgrid, C(end,:))
% surface(xgrid, tspan, C)
hold off