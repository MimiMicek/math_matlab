
function dy2dt = myepidemic3(t, y2, b, n)
% t is time, b is beta, n is nu
% y is all three S, I, R
S = y2(1) % unpacking the vectors
I = y2(2) % unpacking the vectors

% using the formulas
dSdt = -b * S * I
dIdt = b * S * I - n * I

% outcome of the function
dy2dt = [dSdt; dIdt]
end