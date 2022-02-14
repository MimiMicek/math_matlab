clearvars
close all
clc

% grid size
n = 100;
% domain size
L = 20;
% population
N = 25;
xgrid = linspace(0, L, n);
tspan = 0:0.25:1000;
r = 1; % one per year

v = @(t,x,C) 2;
D = @(t,x,C) 200;
f = @(t,x,C) r*(1-C/N)*C;

% C0 = 1+cos(pi*xgrid);
C0 = zeros(1,n);
C0(xgrid<3*L/4) = 4;

[t, C] = solvePDE(f, v, D, tspan, xgrid, C0);

hold on
% no. columns - spatial var, no. rows - time, concentration
title('Spatio-temporal population dynamics - surface plot','FontSize', 16)
% plot(xgrid, C(1,:), 'b','LineWidth',2);
% plot(xgrid, C(end,:), 'r','LineWidth',2);
%legend('Time 1', 'Time 2','FontSize', 16)
xlabel('x (m)', 'FontSize', 16)
ylabel('C (#m^{-3})', 'FontSize', 16)
surface(xgrid, tspan, C)
colorbar
shading interp
set(gca,'FontSize',14)
hold off

