function dydt2 = mypred_prey2(t2, y2, eps_r2, b2, d2, r2, Cmax)

P2 = y2(1); % unpacking the vectors
N2 = y2(2); % unpacking the vectors

% using the formulas
dPdt2 = eps_r2 * (Cmax .* (b2 * N2 ./ (b2 * N2 + Cmax))) .* P2 - d2 * P2;
dNdt2 = r2 * N2 - (Cmax .* (b2 * N2 ./ (b2 * N2 + Cmax))) .* P2;

% outcome of the function
dydt2 = [dPdt2; dNdt2];
end