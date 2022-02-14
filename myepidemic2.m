
function dy1dt = myepidemic2(t, y1, b, n)
% t is time, b is beta, n is nu
% y is all three S, I, R
S = y1(1) % unpacking the vectors
I = y1(2) % unpacking the vectors
R = y1(3) % unpacking the vectors

% using the formulas
dSdt = -b * S * I
dIdt = b * S * I - n * I
dRdt = n * I

% outcome of the function
dy1dt = [dSdt; dIdt; dRdt]
end