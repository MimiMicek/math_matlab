% EQUILIBRIUM EQUATION
syms R N1 N2 r K b1 E1 Cmax1 d1 b2 E2 Cmax2 d2

params = {r, K, b1, E1, Cmax1, d1, b2, E2, Cmax2, d2};
usual_values = {1, 1000, 180, 1/10, 1.5*365, 1/50, 120, 1/5, 0.5*365, 1/25};

C1 = b1*R*Cmax1./(b1*R+Cmax1);
C2 = b2*R*Cmax2./(b2*R+Cmax2);

dRdt = r*R*(1-R./K)-C1*N1-C2*N2;
dN1dt = E1*C1*N1-d1*N1;
dN2dt = E2*C2*N2-d2*N2;

mysymb_sol = solve([dRdt == 0, dN1dt == 0, dN2dt == 0], [R, N1, N2]);

mysubs_sol = subs({mysymb_sol.R, mysymb_sol.N1, mysymb_sol.N2}, params, usual_values);

sol_col1 = mysubs_sol(2,1); %(:,1) R equilibrium point for resource
sol_col2 = mysubs_sol(2,2); %(:,2) N1 equilibrium point for orca
sol_col3 = mysubs_sol(2,3); %(:,2) N2 equilibrium point for shark


%resource growth rate
r = 1; % 1/year

%resource carrying capacity
K = 1000; %number of individuals

%consumer N1 clearance rate - orca
%3600km * 0.05
b1 = 180; %sqkms per year for the area of 100km2

%consumer N2 clearance rate - shark
% fraction of the habitat that orcas are using to hunt for seals
b2 = 120; %sqkms per year for the area of 100km2

%consumer N1 max consumption - orca
Cmax1 = 1.5*365; %no. of prey individuals per year

%consumer N2 max consumption - shark
Cmax2 = 0.5*365; %no. of prey individuals per year

%consumer N1 reproductive efficiency - orca
E1 = 1/10; % number of seals orcas need to consume in order to produce

%consumer N1 death rate - orca
d1 = 1/50; % 1/year

%consumer N2 reproductive efficiency - shark
E2 = 1/5; % number of seals sharks need to consume in order to produce

%consumer N2 death rate - shark
d2 = 1/25; % 1/year

[t, y] = ode45(@mycompetition, [0 500], [1 1 1], [], r, K, b1, E1, Cmax1, d1, b2, E2, Cmax2, d2);

R = y(:,1);
N1 = y(:,2);
N2 = y(:,3);

%plot(R, N1, ':')
% hold on
% title('Phase space plot')
%plot(t, y)
% plot(sol_col1, 'rx','MarkerSize', 14);
% plot(sol_col2, 'gx','MarkerSize', 14);
% plot(sol_col3, 'mx','MarkerSize', 14);
% plot(R, N1, 'r-', 'MarkerSize', 14)
% % plot(R, N2, 'b-', 'MarkerSize', 14)
% grid on
% grid minor
% set(gca, 'FontSize', 14)
% xlabel('Predator N1 - Orcas', 'FontSize', 14)
% ylabel('Resource', 'FontSize', 14)
% legend('Resources', 'Orcas', 'Sharks')
% hold off

% 2 species competing for 2 resources
[t1, y1] = ode45(@mycompetition2, [0 160], [1 1 1 1], [], Cmax1, Cmax2, b1, b2, E1, E2, d1, d2);

R1 = y1(:,1);
R2 = y1(:,2);
N11 = y1(:,3);
N21 = y1(:,4);

hold on
plot(t1, y1)
xlabel('Time in years ', 'FontSize', 14)
ylabel('Populations', 'FontSize', 14)
legend('Resource 1', 'Resource 2', 'Orcas', 'Sharks')
hold off



