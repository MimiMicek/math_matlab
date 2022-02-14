function dydt = myexamfunc_1(t, y,r,K,b,C, E)

R = y(1); % unpacking the vectors
N = y(2); % unpacking the vectors

dRdt = r *(K-R)-(b * R* C./(b * R + C)) * N;
dNdt = E*(b* R * C./(b * R + C))* N - r * N;

% outcome of the function
dydt = [dRdt; dNdt];
end