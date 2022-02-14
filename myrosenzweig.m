function dYdt = myrosenzweig(t, Y, v)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

N = Y(1);
P = Y(2);

dNdt = v.r*(1 - N/v.K)*N - v.b*N/(1+v.b*N/v.Cm)*P
dPdt = v.epsilon*(v.b*N/(1+v.b*N/v.Cm))*P - v.d*P

dYdt = [dNdt; dPdt]
end

