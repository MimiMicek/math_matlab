function dydt = mytragedy(t, y, r, K, b, k, p, c)

N = y(1); % unpacking the vectors
A = y(2); % unpacking the vectors

dNdt = r*N*(1-N./K)-b*A*N;
dAdt = k*(p*b*N./c-1);

if A<0
    dAdt = max(dAdt, 0);
end
% outcome of the function
dydt = [dNdt; dAdt];
end