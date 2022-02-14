n = 100;
L = 20;
xgrid = linspace(0, L, n);
tspan = 0:0.25:10;

v = @(t,x,C) 0;
D = @(t,x,C) 1;
f = @(t,x,C) 0;

C0 = zeros(1,n);
C0(xgrid<L/4) = 4;

[t, C] = solvePDE(f, v, D, tspan, xgrid, C0);

hold on
plot(xgrid, C(1, :))
plot(xgrid, C(2, :))
plot(xgrid, C(end, :))
hold off