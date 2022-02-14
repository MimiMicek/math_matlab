% EQUILIBRIUM EQUATIONS II
syms P2 N2 eps_r2 b2 d2 r2 Cmax 

params2 = {eps_r2, b2, d2, r2, Cmax};
usual_values2 = {0.1255, 50*365, 1/70, 0.60, 1.5*365}; % calculated eps_r = 0.2166

%C = Cmax * (b2 * N2 ./ (b2 * N2 + Cmax));

dPdt2 = eps_r2 * (Cmax * (b2 * N2 ./ (b2 * N2 + Cmax))) * P2 - d2 * P2; % predator population
dNdt2 = r2 * N2 - (Cmax * (b2 * N2 ./ (b2 * N2 + Cmax))) * P2; % prey population

mysymb_sol2 = solve([dPdt2 == 0, dNdt2 == 0], [P2, N2]);

mysubs_sol2 = subs({mysymb_sol2.P2, mysymb_sol2.N2}, params2, usual_values2);

sol_col3 = mysubs_sol2(:,1); 
sol_col4 = mysubs_sol2(:,2); 


%SPACE PHASE PLOT II
%extension used better for unicellar organisms
%for our case better to use E = no. predator / no. prey
eps_a2 = 0.1; % assimilation efficency
m_prey2 = 837; % mass in kg for adults
m_pred2 = 250; % mass in kg for offspring
surv_ch2 = 0.3; % survival chance 

% formula
eps_r2 = eps_a2*(m_prey2/m_pred2)*surv_ch2;  % calculating reproductive efficency
b2 = 50*365; % clearence rate as 50 as sqrKm/day (as area), calculated per year
r2 = 0.60;  % growth rate 1 per year
d2 = 1/50; %1/50 years; death rate
Cmax = 1.5*365;%maximum of seals an orca eats per day in a year

%initial values for phase space plot
P02 = r2/b2;
N02 = d2/(b2*eps_r2);

[t2, y2] = ode45(@mypred_prey2, [0 100], [0.7*P02 0.7*N02], [], eps_r2, b2, d2, r2, Cmax);

P2 = y2(:,1); 
N2 = y2(:,2);

title('Phase portrait(predators vs. prey)')
plot(P2, N2,'MarkerSize', 14)
set(gca, 'FontSize', 14)
grid on
grid minor
%%% Consumption instead of Predator?
xlabel('P - Predator', 'FontSize', 14)
ylabel('N - Prey', 'FontSize', 14)

%plot(t2, y2)
%legend('Predator', 'Prey')
