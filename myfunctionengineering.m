
function dydt = myfunctionengineering(t, y, a)

S = y(1); % unpacking the vectors
I = y(2); % unpacking the vectors

% using the formulas
% dSdt = -b * S * I;
% dIdt = b * S * I - a * I;
b_t = 1.2*(10^-5) + 0.7*(10^-5)*cos((t-59)*(2*pi/365));

dSdt = -b_t * S * I;
dIdt = b_t * S * I - a * I;

% outcome of the function
dydt = [dSdt; dIdt];
end