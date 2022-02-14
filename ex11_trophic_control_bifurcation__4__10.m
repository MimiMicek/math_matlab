% leopard -> impala -> grass

% grass is population N in biomass per area
N0 = 100; %tones/100km2

% impala is the consumer C
C0 = 83;

% b clearance rate of consumer C
b_c = 0.5; % recalculate it with area later

% epsilon for C, reproductive efficiency
E_c = 0.08;

% death rate consumer
d_c = 1; % 1 per year

% grass' growth rate
r = 10; % this is for the grass

% grass' carrying capacity
K = 150;

% predator leopard
P0 = 2;

% predator's b clearance rate
b_p = 0.9; % recalculate it with area later

% predator's epsilon, reproductive efficiency
E_p = 0.015;

% predator's death rate
d_p = 1; % 1 per year

% we could do the following but as we already have the expressions defined,
% then we can just calculate the values for our case, this can however be
% used for checking if we want

% syms C N E b d r K
% 
% params = {E, b, d, r, K};
% usual_values = {0.01, 0.9, 1, 50, 150}; 
% 
% dCdt = E * b * C * N - d * C;            % impala population
% dNdt = r * (1 - N/K) * N - b * C * N;    % grass population
% 
% 
% mysymb_sol = solve([dCdt == 0, dNdt == 0], [C, N]);
% 
% mysubs_sol = subs({mysymb_sol.C, mysymb_sol.N}, params, usual_values);
% 
% sol_col1 = mysubs_sol(2,1); %(:,1) C
% sol_col2 = mysubs_sol(2,2); %(:,2) N
% 
% plot(sol_col1,sol_col2, 'rx','MarkerSize', 14)

% - - - - - - - - - - - - - - -
% calculating the equilibrium points for the values we already 
% have and the equations we were given

%Neq = d/E*b_c; % N equilibrium
%Ceq = r/b_c * (1 - d/(E*b_c*K)); %C equilibrium

% - - - - - - - - - - - - - - -
% this part is just for the equlibrium points, and I just used two k's
% instead of a look to see the diference
% tspan = 0:10;
% 
% [t, y] = ode45(@mytrophic, tspan, [N0 C0], [],  r, K, b_c, E_c, d_c);
%  
% K1 = 300;
% 
% [t1, y1] = ode45(@mytrophic, tspan, [N0 C0], [],  r, K1, b_c, E_c, d_c);
% 
% 
% plot(t,y, '--', 'MarkerSize', 16)
% hold on
% plot(t1,y1, 'MarkerSize', 16)
% title('Equilibrium for two different carrying capacity values','FontSize', 16)
% xlabel('Time in years', 'FontSize', 16)
% ylabel('Biomass (N) & Consumer (C)', 'FontSize', 16)
% set(gca,'FontSize',14)
% legend ('N at K = 150', 'C at K = 150', 'N1 at K = 300', 'C1 at K = 300', 'Location','NorthEastOutside','FontSize', 16)
% hold off
% % - - - - - - - - - - - - - - -

% this is the loop for
tspan = 1:100;

Kval=0:100;%b_consumer=0:0.01:2.5;
% for K = Kval
%     
% [t, y] = ode45(@mytrophic, tspan, [N0 C0], [], r, K, b_c, E_c, d_c);
% hold on
% plot(K,y(end,1), 'g.','MarkerSize',12)
% plot(K,y(end,2), 'r.','MarkerSize',12)
% title('Bifurcation diagram of resource and consumer','FontSize', 16)
% legend('Resource', 'Consumer', 'Location','NorthEastOutside','FontSize', 16)
% xlabel('K', 'FontSize', 16)
% ylabel('Biomass (N) & Consumer (C)', 'FontSize', 16)
% set(gca,'FontSize',14)
% t = text(30,23, '\leftarrow \fontname{Courier} Bifurcation change');
% t.FontSize = 14;
% %t.FontWeight = 'bold';
% hold off
% end

for K = Kval
    
[t, y] = ode45(@mytrophic, tspan, [N0 C0 P0], [], r, K, b_c, E_c, d_c, b_p, E_p, d_p);
hold on
plot(K,y(end,1), 'g.', 'MarkerSize',12)
plot(K,y(end,2), 'r.', 'MarkerSize',12)
%plot(t,y, 'MarkerSize',12)
title('Bifurcation diagram of resource, consumer and predator','FontSize', 16)
plot(K,y(end,3), 'b.', 'MarkerSize',12)
legend('Resource', 'Consumer',  'Predator', 'Location','NorthEastOutside', 'FontSize', 16)
xlabel('K', 'FontSize', 16)
ylabel('N C P', 'FontSize', 16)
set(gca,'FontSize',14)
% t = text(30,23, '\leftarrow \fontname{Courier} Bifurcation change');
% t.FontSize = 14;
%t.FontWeight = 'bold';
hold off
end



