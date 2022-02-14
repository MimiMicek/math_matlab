%
% E&P model, including a fix for the flawed functional response
%


function [t,y] = NPZ(phi, bPlot)

arguments
    phi = 55; % Latitude with default value
    bPlot = true; % Whether to make the plot or not
end

%phi = 55; % Latitude in degrees
M = 60;  % Mixed layer depth in meters

Hp = 0.5;
r = 0.07;
m = 0.3/M;
N0 = 10;
HZ = 1;
d = 0.07;
c = 1;
e = 0.5;
P0 = 0.1;
% Growth rate:
g = @(t,phi) max(0, exp(-0.025*M)*(1 - 0.8*sin(pi*phi/180)*cos(2*pi*t/365)));

%
% Solve and plot system:
%
[t,y] = ode45(@deriv, 0:4*365, [0.1 0.1 0.01], odeset('nonnegative',[1 2 3]));

if bPlot
    semilogy(t,y, t,g(t,phi),'linewidth',2)
    legend('N','P','Z','growth rate')
    ylim([1e-1 10])
    xlim(365*[2 4])
end
%----------------------------------------
% Model equations
%----------------------------------------
    function dydt = deriv(t,y)
        N = y(1);
        P = y(2);
        Z = y(3);
        
        dNdt = -(g(t,phi)*N/(Hp + N) - r)*P + m*(N0-N);
        dPdt = (g(t,phi)*N/(Hp + N) - r)*P - max(0, (c*(P-P0))/(HZ+P-P0))*Z - m*P;
        dZdt = e*max(0, (c*(P-P0))/(HZ+P-P0))*Z - d*Z;
        
        dydt = [dNdt; dPdt; dZdt];
    end
end

