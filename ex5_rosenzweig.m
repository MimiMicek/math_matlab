% r = 0.5; % growth rate
% epsilon = 0.2; % trophic efficency
% b = 0.4; % clearence rate
% Cm = 2; % max capacity
% d = 0.1 % death rate

v = struct('r', 0.5, 'epsilon', 0.2, 'b', 0.4, 'Cm', 2, 'd', 0.1, 'K', 25 )

% (N,P) is measured in mg/cubmeters, t is days
N0 = 5; 
%P0 = 1;

hold on
for P0 = [0 0.5 2 2.1 4]
    [t, Y] = ode45(@myrosenzweig, [0 100], [N0 P0], [], v);    
    N = Y(:,1); 
    P = Y(:,2);
    plot(N, P);
end


