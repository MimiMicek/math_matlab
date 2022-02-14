% Multiple equilibrium equations I
syms N P b r d E

params = {r, E};
usual_values = {1, 0.1};

dNdt = r*N - b*N*P; % prey population
dPdt = E*b*N*P - d*P; % predator population

mysymb_sol = solve([dNdt == 0, dPdt == 0], [N, P, b, d]);

mysubs_sol = subs({mysymb_sol.N, mysymb_sol.P, mysymb_sol.b, mysymb_sol.d}, params, usual_values);

sol_N = mysubs_sol(:,1); %(:,1) N
sol_P = mysubs_sol(:,2); %(:,2) P
sol_b = mysubs_sol(:,3); % b equilibrium of N or P
sol_d = mysubs_sol(:,4); % d equilibrium of N or P

%plot(sol_col1,sol_col2,sol_col3, sol_col4, 'bx','MarkerSize', 14)

c = 0.75; % ton-prey/ton-predator/day

if c > sol_b.*sol_N
    b2 = 0.5; % bs
    d2 = 0.025; % ds
elseif sol_b.*sol_N > c
    b2 = 1; % bf
    d2 = 0.1; %df
end

% Multiple equilibrium equations II
syms N2 P2 b2 r2 d2 E2

params2 = {r2, E2, b2, d2};
usual_values2 = {1, 0.1, b2, d2};

dN2dt = r2*N2 - b2*N2*P2; % prey population
dP2dt = E2*b2*N2*P2 - d2*P2; % predator population

mysymb_sol2 = solve([dN2dt == 0, dP2dt == 0], [N2, P2]);

mysubs_sol2 = subs({mysymb_sol2.N2, mysymb_sol2.P2}, params2, usual_values2);

sol_N2 = mysubs_sol(:,1); %(:,1) P
sol_P2 = mysubs_sol(:,2); %(:,2) N

plot(sol_N2,sol_P2, 'bx','MarkerSize', 14)

%growth rate
r = 1; % 1/day

%reproductive efficiency
E = 0.1; % no. of predators / no. of prey 

%prey encounter/clearance rate
bf = 1; % V/t*no. of predators

%death rate
df = 0.1; % 1/day

%prey encounter/clearance rate
bs = 0.5; % V/t*no. of predators

%death rate
ds = 0.025; % 1/day
