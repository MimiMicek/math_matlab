% dB/dt = -D/V * B + r*S*B
% dS/dt = D/V * (S1-S) - r*S*B

%                       time interval initval   options  parameters
%[t,y] = ode45(@myderiv, [0 3],    [1 1],       [],      1, 1.67)
%[t,y] = ode45(@myderiv, [0 100], [1 1], [], 1.5, 0.5,1.2,0.4)
%plot(t,y(:,1))
%plot(t,y(:,2))
function dydt = myderiv(t,y,V,D,Si,r)
B = y(1) %unpack
S = y(2) %unpack
dBdt = -D/V * B + r*S*B %dynamics for B
dSdt = D/V * (Si-S) - r*S*B %dynamics for S
dydt = [dBdt;dSdt] %stack results into a vector
end