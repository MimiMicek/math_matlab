% N nutrients
N0 = 10; % mM m-3 minimoles per cubic meter

% P concentration of phytoplankton
P0 = 0.1; % mM m-3 minimoles per cubic meter

% half-saturation coefficient of phytoplantkon
% H = Cmax/b
Hp = 0.5; % mM m-3 minimoles per cubic meter

% half-saturation coefficient of zooplantkon
Hz = 1; % mM m-3 minimoles per cubic meter

% latitude
fi1 = 47; % degrees

% latitude
fi2 = 20; % degrees

% respiratory term
r = 0.07; % day-1

% mixing rate constant
m = 0.3; % meters per day-1

% depth of the mixed layer
M = 60; % meter

% depth of the mixed layer
M2 = 100; % meter

% maximum grazing rate
Cmax = 1; % day-1

% pi
p = pi;

% time span in days
tspan = 0:1000;

% grazing efficiency
E = 0.5;

% mortality - loss to carnivores
d = 0.07; % day-1

% change different values of fi
g_t_fi_M = @(t) exp(-0.025)*(1-0.8*sin((p*fi1)/180)*cos(2*p*(t/365)));
g_t_fi_M2 = @(t) exp(-0.025)*(1-0.8*sin((p*fi2)/180)*cos(2*p*(t/365)));

% different fi values where g changes over time
g = exp(-0.025)*(1-0.8*sin((p*fi1)/180)*cos(2*p*(tspan/365)));
g1 = exp(-0.025)*(1-0.8*sin((p*fi2)/180)*cos(2*p*(tspan/365)));

% hold on
% plot(tspan, g, 'LineWidth',2)
% plot(tspan, g1, '--', 'LineWidth',2)
% title('Maximum growth rate of phytoplankton over time','FontSize', 16)
% legend('Phytoplankton (P) mM m^{-3} \phi = 47°','Phytoplankton (P) mM m^{-3} \phi = 20°','FontSize', 16)
% xlabel('Time in days', 'FontSize', 16)
% ylabel('g day^{-1}', 'FontSize', 16)
% set(gca,'FontSize',14)
% hold off

% initial values should not be negative [1 1 1]
[t, y] = ode45(@myseasonalsucc, tspan, [1 1 1], [], g_t_fi_M, Hp, r, m, M, N0, Cmax, Hz, P0, E, d);
[t2, y2] = ode45(@myseasonalsucc2, tspan, [1 1 1], [], g_t_fi_M2, Hp, r, m, M, N0, Cmax, Hz, P0, E, d);

hold on
plot(t, y(:,1),'b','LineWidth',2);
plot(t, y(:,2), 'r','LineWidth',2);
plot(t, y(:,3), 'LineWidth',2, 'Color',[0, 0.5, 0]);
plot(t2, y2(:,1),'b--', 'LineWidth',2);
plot(t2, y2(:,2), 'g--', 'LineWidth',2);
plot(t2, y2(:,3), '--', 'LineWidth',2, 'Color',[0, 0.5, 0]);
title('Seasonal succession between nutrients','FontSize', 16)
legend('Nutrients (N)', 'Phytoplankton (P)', 'Zooplankton (Z)','FontSize', 16)
legend('Nutrients (N) \phi = 47°', 'Phytoplankton (P) \phi = 47°', 'Zooplankton (Z) \phi = 47°',...
       'Nutrients (N) \phi = 20°', 'Phytoplankton (P) \phi = 20°', 'Zooplankton (Z) \phi = 20°','FontSize', 16)
xlabel('Time in days', 'FontSize', 16)
ylabel('N P Z (mM m^{-3})', 'FontSize', 16)
set(gca,'FontSize',14)
hold off
