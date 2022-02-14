function dydt = mytrophic(t1, y1, r, K1, b, E, d)

N = y(1); % unpacking the vectors
C = y(2); % unpacking the vectors

% using the formulas
dNdt1 = r * (1 - N/K1) * N - b * C * N;    % grass population
dCdt1 = E * b * C * N - d * C;            % impala population

% outcome of the function
dydt = [dNdt1; dCdt1];
end
