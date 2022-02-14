% %infectious period in days
% t = 14;
% %recovering rate
% nu = 1/t;
% %number of infected individuals
% I0 = 15;
% %contact number
% Q0 = 1.8;
% %initial susceptible individuals
% S0 = 6*10^6;
% %initial number of individuals recovered
% R0 = 0;
% %probability of passing on the virus
% beta = (Q0*nu)./S0;
% %initial population
% N0 = S0 + I0;
% %susceptible fraction of the total population
% st = S0/N0;
% %infected fraction of the total population
% it = I0/N0;
% %recovered fraction of the total population
% rt = R0/N0;
% %calculating frequency dependent transmission
% delta = (beta*I0)./N0;
% 
% [t,y] = ode45(@myepidemic, [0 500], [S0 I0 R0], [], beta, nu);
% [t, y1] = ode45(@myepidemic2, [0 500], [S0 I0 R0], [], beta1, nu)
% 
% 
% %plotting the analytical solution
% plot(t,y(:,1));
% 
% hold on
% plot(t,y(:,2), 'o');
% hold off
% 
% hold on
% plot(t,y(:,3), ':');
% hold off
% 
% legend('S','I','R')
% 
% disp(beta)

% exercise 2 - epidemics --- SIR models

% in the current exercise we are dealing with a case of *herd imunity*
% that means that after having the disease the subject can not be infected
% again, or *complete subsequent immunity*

% ----------time in days
t0 = 0;
t1 = 14;
t2 = 365*2;

% ---------- time span
tspan = t0:0.25:t2;

% ---------- intial number of infection; number of people
I0 = 15;
I1 = 3;
I2 = 25;
I3 = 14;
I4 = 10;
I5 = 4;
I6 = 1;

% ---------- reproductive number
Q0 = 1.8;

% ----------susceptible population
S0 = 6 * 10^6;

% ---------- '\nu' as recovery rate?
nu = 1/t1;

% ---------- R number or recovered people;
R0 = nu * I0;

%---------- '\beta' as the rate of transmition
beta = (1.125 * nu)/S0;

%---------- '\beta'initial beta increased by 10%
beta1 = beta + (beta * 0.1);

beta2 = 

% ---------- Total population  ? N = 0 ?
% N0 = S0 + I0 + R0;



% the equation inputs, using the function in mysir.m (same folder)
[t, y] = ode45(@myepidemic, tspan, [S0 I0 R0], [], beta, nu)
% the equation inputs, using the function in mysir.m (same folder)
%[t, y1] = ode45(@myepidemic2, tspan, [S0 I0 R0], [], beta1, nu)


% max recovered 
max_recovered = max(y(:,3))
% remember to put in the presentation as percentage
percent_avoid_infection = round(100-(max_recovered/S0)*100)

% point (d)

% ---------- h are the infected with need for intensive care
% max infected
max_infected = max(y(:,2));

h = round(max_infected * 0.1);

% ---------- full capacity for intensive care
max_capacity = 900;



% %plot
% subplot(1,2,1)
% plot(t,y, 'LineWidth', 1.5,'MarkerSize',18)
% title('Inital Beta','FontSize',24) 
% xlabel('time','FontSize',18)
% ylabel('population','FontSize',18)
% grid on
% grid minor
% legend("dS/dt (susceptible)", "dI/dt (infected)","dR/dt (recovered or :( dead)", 'FontSize',16)
% set(gca,'FontSize',20)
% 
% subplot(1,2,2)
% plot(t,y1, 'LineWidth', 1.5,'MarkerSize',18)
% title('Beta increased by 10%','FontSize',24) 
% xlabel('time','FontSize',18)
% ylabel('population','FontSize',18)
% grid on
% grid minor
% legend("dS/dt (susceptible)", "dI/dt (infected)","dR/dt (recovered or :( dead)", 'FontSize',16)
% set(gca,'FontSize',20)

% intial_S = [t, y(1:20,1)]; 
% inital_I= [t, y(1:20,2)]; 

% using rx to add a red x sign in the plot
% plot(intial_S, inital_I, 'rx', 'MarkerSize',18)
% xlabel('S')
% ylabel('I = 15')








