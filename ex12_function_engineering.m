% beta as the rate of transmition
b = 1.2*(10^-5); % 1/year/individual

% beta in summer
b_summer = 0.5*(10^-5); % 1/year/individual

% beta in winter
b_winter = 1.9*(10^-5); % 1/year/individual

b_t = @(t) b + 0.7*(10^-5)*cos((t-59)*(2*pi/365));

% average time of infection T = 1/a
T = 21; %days %0.058; % 3 weeks in years 3/52.14

tspan_days = [0 730];
% rate of infection
a =  1/T;% 1/year

% initial value of susceptible people
S0 = 5*(10^6); % number of individuals

% initial value of infected people
I0 = 10; % number of individuals

[t, y] = ode45(@myfunctionengineering, tspan_days, [S0 I0], [], a);

hold on
plot(t,y, 'LineWidth', 1.5,'MarkerSize',18)
plot(t,b_t(t), 'LineWidth', 1.5,'MarkerSize',18)
legend("dS/dt (susceptible)", "dI/dt (infected)", "b_t", 'FontSize',16)
xlabel('Time in years','FontSize',18)
ylabel('Population','FontSize',18)
hold off