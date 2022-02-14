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
beta = (Q0 * nu)/S0;

%---------- '\beta'initial beta increased by 10%
beta1 = beta + (beta * 0.1);

% ---------- Total population  ? N = 0 ?
% N0 = S0 + I0 + R0;



% the equation inputs, using the function in mysir.m (same folder)
%[t, y] = ode45(@mysir, tspan, [S0 I0 R0], [], beta, nu)
% the equation inputs, using the function in mysir.m (same folder)
%[t, y1] = ode45(@mysir2, tspan, [S0 I0 R0], [], beta1, nu)
[t, y1] = ode45(@mysir2, tspan, [S0 I1 R0], [], beta, nu)
[t, y2] = ode45(@mysir2, tspan, [S0 I2 R0], [], beta, nu)
[t, y3] = ode45(@mysir2, tspan, [S0 I3 R0], [], beta, nu)
[t, y4] = ode45(@mysir2, tspan, [S0 I4 R0], [], beta, nu)

% max infected 
max_recovered = max(y(:,3))
% remember to put in the presentation as percentage
percent_avoid_infection = round(100-((max_recovered/S0)*100))

% point (d)

% ---------- h are the infected with need for intensive care
%h = max_infected * 0.1;

% ---------- full capacity for intensive care
%max_capacity = 900;



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

intial_S = [t(,1), y(1:4,1)]; 
inital_I= [t(1,1), [y1(1,2), y2(1,2), y3(1,2), y4(1,2)]]; 

% using rx to add a red x sign in the plot
plot(intial_S, inital_I, 'rx', 'MarkerSize',18)
xlabel('S')
ylabel('I = 15')


