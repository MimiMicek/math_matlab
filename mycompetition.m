function dydt = mycompetition(t, y, r, K, b1, E1, Cmax1, d1, b2, E2, Cmax2, d2)

R = y(1); % unpacking the vectors
N1 = y(2); % unpacking the vectors
N2 = y(3); % unpacking the vectors

%calculate before
C1 = b1*R*Cmax1./(b1*R+Cmax1);
C2 = b2*R*Cmax2./(b2*R+Cmax2);

% using the formulas
% look for 0 
dRdt = r*R*(1-R./K)-C1*N1-C2*N2;
dN1dt = E1*C1*N1-d1*N1;
dN2dt = E2*C2*N2-d2*N2;

% outcome of the function
dydt = [dRdt; dN1dt; dN2dt];
end