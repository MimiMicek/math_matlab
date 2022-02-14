%population
N0 = 52000;

%birth rate
b = 1.9;

%death rate
d = 4.2;

%population growth rate
r = (b - d) / 25; %-0.092;
disp(r)

%carrying capacity
K = 100000;

%timespan in years
tspan = [0 50];

%logistic equation
[t,N] = ode45(@(t,N) r * N * (1 - N./K), tspan, N0);

%analytical solution
Nt = (N0 .* K .* exp(r*t))./(K+N0.*(exp(r*t)-1)); 
clf
plot(t,N)
title('Logistic growth of Steller sea lions')
xlabel('Time in years (t)')
ylabel('Population (N)')
grid on

hold on
%plotting the analytical solution
plot(t,Nt,'o')
hold off