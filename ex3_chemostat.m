%Solve the ODE system with initil condition B(0)=0.1 and S(0)=1 (bith in
%mg/l) for a time period of 48 hours. Plot B(t) and S(t) as functions of t.

% Defining parameters:
V = 1.5;                %[l]
D = 0.5 +(0.1*0.5);     %[l/h]      D = 0.5+(0.2*0.5) or D = 0.5+(1*0.5)
Si = 1.2;               %[mg/l]
r = 0.4;                %[l/mg*h]

[t, y] = ode45 (@mychemostat, [0 48], [0.1 1], [], V, D, Si, r);

B = y(:, 1);
S = y(:, 2);

% Plotting the ì 
plot(B, S)
xlabel('B')
ylabel('S')
legend('B = f(S)')

%  - - - point 1 from the exercise
syms V D Si r B S
params = {V, D, Si, r};
usual_values = {1.5, 0.5, 1.2, 0.4};
usual_values2 = {1.5, 1, 1.2, 0.4};

dBdt = r*S*B - (D/V)*B;
dSdt = -r*S*B + (D/V)*(Si-S);

%  - - - point 2 from the exercise
mysymb_sol = solve([dBdt == 0, dSdt == 0], [B, S]);

mysubs_sol = subs({mysymb_sol.B, mysymb_sol.S}, params, usual_values2);
%mysubs_sol

sol_col1 = mysubs_sol(:,1); % D = 1 => B < 0 so it is invalid 
sol_col2 = mysubs_sol(:,2); 

% phase plot using rx to add a red x sign in the plot
plot(sol_col1, sol_col2 ,'rx','MarkerSize', 14)
title('Equilibrium Points B S','FontSize',24) 
xlabel('B')
ylabel('S')

% D = 1 l/h
%  mysubs_sol_eqD1 = subs([mysymb_sol.B mysymb_sol.S], D, 1.0);
% mysubs_sol_eqD1 = subs([mysymb_sol.B mysymb_sol.S], params, usual_values);
% mysubs_sol_eqD1