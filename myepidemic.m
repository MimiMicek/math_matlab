%                       time interval initval   options  parameters
%[t,y] = ode45(@myderiv, [0 3],    [1 1],       [],      1, 1.67)
%[t,y] = ode45(@myderiv, [0 100], [1 1 1], [], 1.5, 0.5,1.2,0.4)
%plot(t,y(:,1))
%plot(t,y(:,2))

function dydt = myepidemic(t,y,beta,nu)
S = y(1) %unpack
I = y(2) %unpack
R = y(3) %unpack
dSdt = -beta * S * I %dynamics for S
dIdt = beta * S * I - nu * I %dynamics for I
dRdt = nu * I %dynamics for R
dydt = [dSdt;dIdt;dRdt] %stack results into a vector
end