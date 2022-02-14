function dydt = mymultiple_eq(t, y, r, E)

N = y(1); % unpacking the vectors
P = y(2); % unpacking the vectors
b = y(3); % unpacking the vectors
d = y(4);

% using the formulas
dNdt = r*N - b*N*P;
dPdt = E*b*N*P - d*P;

% outcome of the function
dydt = [dNdt; dPdt];
end