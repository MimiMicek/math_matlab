function dydt = mytrophic(t, y, r, K, b_c, E_c, d_c, b_p, E_p, d_p)

N = y(1); % unpacking the vectors
C = y(2); % unpacking the vectors
P = y(3); % unpacking the vectors

% using the formulas
dNdt = r * (1 - N/K) * N - b_c * C * N;             % grass population
dCdt = E_c * b_c * C * N - d_c * C - b_p * P * C;   % impala population
dPdt = E_p * b_p * P * C - d_p * P;                 % jaguar population

% outcome of the function
dydt = [dNdt; dCdt; dPdt];
end
