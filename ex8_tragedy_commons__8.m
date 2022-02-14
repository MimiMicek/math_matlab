% EXPLOITED POPULATION MODEL
%cow growth rate
r = 1; % 1/t per year
N0 = 100; % no. of cows per area sqkm
K = 100; % cows carrying capacity per area sqkm
E = 0.5; % constant harvesting effort 1/t per year
tspan = 0:20; % years

[t,N] = ode45(@(t,N) r*N*(1-N./K)-E*N, tspan, N0);

hold on
% plot(t,N, 'LineWidth',2);
% plot(t,E*N, 'LineWidth',2);
hold off
set(gca, 'FontSize', 14)
title('Population size and yield as a function of time','Fontsize',15);
xlabel('Time in years', 'FontSize', 14)
ylabel('Population per sqkm', 'FontSize', 14)
legend('Population per sqkm', 'Yield', 'FontSize', 14)


% OPEN EXPLOITATION
p = 120; % price per catch in $
b = 20/4; % area sqkm/year/no. agents
c = 15000; % cost in $ of exploitation per agent per time year
k = 0.01; % effort increase rate 1/t

% calculating profit per agent
P = p * b * N0 - c;

% increase the rate k

if P/c > 0
    k = 0.2;
elseif P/c < 0
    k = 0.001;
end

not_negative = odeset('NonNegative', [1,2]);

[t, y] = ode45(@(t,y) mytragedy(t, y, r, K, b, k, p, c), [0 50], [1 1], not_negative);

N = y(:,1);
A = y(:,2);


% EQUILIBRIUM EQUATIONS
% syms N2 A2 r K b k p c 
% 
% params = {r, K, b, k, p, c};
% usual_values = {1, 100, 20/4, 0.01, 120, 15000};
% 
% dN2dt = r*N2*(1-N2./K)-b*A2*N2; % equilibrium population
% dA2dt = k*(p*b*N2./c-1);  % equilibrium yield
% 
% mysymb_sol = solve([dN2dt == 0, dA2dt == 0], [N2, A2]);
% 
% mysubs_sol = subs({mysymb_sol.N2, mysymb_sol.A2}, params, usual_values);
% 
% sol_col1 = mysubs_sol(:,1); %(:,1) N2
% sol_col2 = mysubs_sol(:,2); %(:,2) A2
N1 = 293;

hold on
% plot(sol_col1, 'rx','MarkerSize', 14)
% plot(sol_col2, 'bx','MarkerSize', 14)
plot(N, N1, 'LineWidth',2);
% plot(A,'LineWidth',2);
hold off
set(gca, 'FontSize', 14)
title('Freely exploitable resource harvest','Fontsize',15);
xlabel('Population', 'FontSize', 14)
ylabel('Harvesting', 'FontSize', 14)
legend('N', 'A', 'FontSize', 14)