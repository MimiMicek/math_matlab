% EQUILIBRIUM EQUATIONS I
syms P N eps_r b d r 

params = {eps_r, b, d, r};
usual_values = {0.2166, 70*365, 1/70, 0.98}; % calculated eps_r = 0.2166

dPdt = eps_r * b * N * P - d * P; % predator population
dNdt = r * N - b * N * P; % prey population

mysymb_sol = solve([dPdt == 0, dNdt == 0], [P, N]);

mysubs_sol = subs({mysymb_sol.P, mysymb_sol.N}, params, usual_values);

sol_col1 = mysubs_sol(:,1); %(:,1) P
sol_col2 = mysubs_sol(:,2); %(:,2) N

% space plot using rx to add a red x sign in the plot
plot(sol_col1,sol_col2, 'rx','MarkerSize', 14)

% PHASE SPACE PLOTS I
% sealions as prey, mass of 784kg/individual
% orcas as predator, mass of 181kg/individual offspring  *important that is
% the offspring for the predator

%extension used better for unicellar organisms
%for our case better to use E = no. predator / no. prey
eps_a = 0.1; % assimilation efficency
m_prey = 784; % mass in kg
m_pred = 181; % mass in kg for offspring
surv_ch = 0.5; % survival chance 

% calculating reproductive efficency
eps_r0 = eps_a*(m_prey/m_pred)*surv_ch;

% P nr of predators, N nr of prey, r population growth rate, 
% b clearance rate, d population death rate

% assumptions:
% population 40 indiv => P = 0.01 indiv/sqrKm; ,   

b0 = 70*365; % *365 clearence rate as 70 as sqrKm/day (as area), calculated per year
r0 = 0.98;  % growth rate 1 per year
d0 = 1/70; %1/70 years; death rate

%initial values for phase space plot
P0 = r0/b0 
N0 = d0/(b0*eps_r0)
% P = r/b
% N = d/(eps_r*b)
                                        %%%any numbers close to the
                                        %%%equilibrium points (1.2)
[t, y] = ode45(@mypred_prey, [0 100], [1.2*P0 1.2*N0], [], eps_r0, b0, d0, r0);

P = y(:,1);
N = y(:,2);

%%%%%%% POPULATION OVER TIME PLOTS
% hold on
% title('Number of prey and predators over time')
% plot(t, y)
% grid on
% grid minor
% set(gca, 'FontSize', 14)
% xlabel('Time in years', 'FontSize', 14)
% ylabel('Populations', 'FontSize', 14)
% legend('Predator', 'Prey')
% hold off

%%%%%% PHASE SPACE PLOTS
% hold on
% title('Phase portrait(predators vs. prey)')
% plot(P, N, 'm', 'MarkerSize', 10, 'linewidth', 2)
% plot(P(1,:), N(1,:), 'rx', 'MarkerSize', 10, 'linewidth', 2)
% plot(P(2,:), N(2,:),'bx', 'MarkerSize', 10, 'linewidth', 2)
% set(gca, 'FontSize', 14)
% grid on
% grid minor
% xlabel('P - Predator', 'FontSize', 14)
% ylabel('N - Prey', 'FontSize', 14)
% hold off

%%%%%%% EQUILIBRIUM EQUATION PLOTS
% hold on
% title('Equilibrium abundances of prey and predators')
% plot(sol_col1(1,:),sol_col2(1,:), 'rx','MarkerSize', 14)
% plot(sol_col1(2,:),sol_col2(2,:), 'bx','MarkerSize', 14)
% xlim([0 11])
% grid on
% grid minor
% set(gca, 'FontSize', 14)
% xlabel('P - Predator', 'FontSize', 14)
% ylabel('N - Prey', 'FontSize', 14)
% hold off


