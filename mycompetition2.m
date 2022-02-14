function dydt2 = mycompetition2(t1, y1, Cmax1, Cmax2, b1, b2, E1, E2, d1, d2)

R1 = y1(1); % unpacking the vectors
R2 = y1(2); % unpacking the vectors
N11 = y1(3); % unpacking the vectors
N21 = y1(4); % unpacking the vectors

%calculating consumption for both predators
C1 = (b1*R1+b1*R2)*Cmax1./(Cmax1+b1*R1+b1*R2);
C11 = (b1*R1./(b1*R1+b1*R2)*C1);
C12 = (b2*R2./(b1*R1+b1*R2)*C1);

C2 = (b2*R1+b2*R2)*Cmax2./(Cmax2+b2*R1+b2*R2);
C21 = (b2*R1./(b2*R1+b2*R2)*C2);
C22 = (b1*R2./(b2*R1+b2*R2)*C2);

dR1dt = R1 - C11*N11 - C12*N21;
dR2dt = R2 - C21*N11 - C22*N21;

dN11dt = E1*C1*N11-d1*N11;
dN21dt = E2*C2*N21-d2*N21;

% outcome of the function
dydt2 = [dR1dt; dR2dt; dN11dt; dN21dt];
end