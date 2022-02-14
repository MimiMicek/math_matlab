function dydt2 = myseasonalsucc2(t2, y2, g_t_fi_M2, Hp, r, m, M, N0, Cmax, Hz, P0, E, d)

N2 = y2(1); % unpacking the vectors
P2 = y2(2); % unpacking the vectors
Z2 = y2(3); % unpacking the vectors

% using the formulas
dNdt2 = -(g_t_fi_M2(t2) * (N2 / (Hp + N2)) - r) * P2 + m/M * (N0 - N2); % grass population
dPdt2 = (g_t_fi_M2(t2) * (N2 / (Hp + N2)) - r) * P2 - max(0, Cmax * (P2 - P0/(Hz + P2 - P0))) * Z2 - (m/M * P2); % phytoplankton
dZdt2 = E * max(0, Cmax * (P2 - P0/(Hz + P2 - P0))) * Z2 - d * Z2; % zooplankton

% outcome of the function
dydt2 = [dNdt2; dPdt2; dZdt2];
end
