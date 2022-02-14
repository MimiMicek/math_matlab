function dydt = mypred_prey(t, y, eps_r, b, d, r)

P = y(1); % unpacking the vectors
N = y(2); % unpacking the vectors

% using the formulas
dPdt = eps_r * b * N * P - d * P;
dNdt = r * N - b * N * P;

% outcome of the function
dydt = [dPdt; dNdt];
end