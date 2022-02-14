function dydt = mythropicproject(t, y, r, K, b_i, E_i, d_i, b_v, E_v, d_v, b_o, E_o, d_o)

S = y(1); % unpacking the vectors
I = y(2); % unpacking the vectors
V = y(3); % unpacking the vectors
O = y(4); % unpacking the vectors

% using the formulas
dSdt = r * (1 - S/K) * S - b_i * I * S - b_v * V * S; 
%dSdt = r * S - b_i * I * S - b_v * V * S; % seeds
dIdt = E_i * b_i * I * S - d_i * I - b_v * V * I; % insects population
dVdt = E_v * b_v * V * S - d_v * V - b_o * O * V + E_v * b_v * V * I; % voles population
dOdt = E_o * b_o * O * V - d_o * O; % owls population
% outcome of the function
dydt = [dSdt; dIdt; dVdt; dOdt];
end
