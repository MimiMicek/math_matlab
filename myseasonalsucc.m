function dydt = myseasonalsucc(t, y, g_t_fi_M, Hp, r, m, M2, N0, Cmax, Hz, P0, E, d)

N = y(1); % unpacking the vectors
P = y(2); % unpacking the vectors
Z = y(3); % unpacking the vectors

% using the formulas
dNdt = -(g_t_fi_M(t) * (N / (Hp + N)) - r) * P + m/M2 * (N0 - N);                               % grass population
dPdt = (g_t_fi_M(t) * (N / (Hp + N)) - r) * P - max(0, Cmax * (P - P0/(Hz + P - P0))) * Z - (m/M2 * P);     % phytoplankton
dZdt = E * max(0, Cmax * (P - P0/(Hz + P - P0))) * Z - d * Z;                               % zooplankton

% outcome of the function
dydt = [dNdt; dPdt; dZdt];
end
