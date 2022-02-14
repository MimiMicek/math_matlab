% seeds in biomass per area
S0 = 500; % kg/100km2

% consumer 1 - insects biomass
I0 = 300; % kg/100km2

% consumer 2 - voles biomass
V0 = 150*0.035; % # of voles * the mass - kg/100km2

% crops growth rate
r = 10; % 1/y

% crops carrying capacity
K = 500; % biomass in kg/100km2

% b clearance rate of insects
b_i = 0.6; % habitat fraction per 100km2

% b clearance rate of voles
b_v = 0.7; % habitat fraction per 100km2

% insects reproductive efficiency
E_i = 0.03;

% voles reproductive efficiency
E_v = 0.04;

% death rate insects
d_i = 1.5; % 1 per year

% death rate voles
d_v = 1.5; % 1 per year

% predator owl biomass
O0 = 10*0.62; % # of owls * the weight - kg/100km2

% predator's b clearance rate
b_o = 0.9; % habitat fraction per km2

% owls reproductive efficiency
E_o = 0.07;

% predator's death rate
d_o = 1; % 1 per year

tspan = 1:1000; %1000 real value

Eval=0:0.001:0.3; % Eval=0:0.001:0.3;

% loop for assimilation efficiency of the owl
for E = Eval
    
% when calculating over t dont forget to change E to E_o and vice versa,
% also in mythropicproject function
[t, y] = ode45(@mythropicproject, tspan, [S0 I0 V0 O0], [], r, K, b_i, E_i, d_i, b_v, E_v, d_v, b_o, E, d_o);
hold on
% plot(E, mean(y(150:end,1)),'g.', 'MarkerSize',14)
%%%%%%%%%% Plot I
subplot(2,2,[1,2])
plot(E, y(end,1),'g.', 'MarkerSize',16)     % seeds
plot(E, y(end,3), 'b.', 'MarkerSize',16)    % voles
plot(E, y(end,4), 'c.', 'MarkerSize',16)    % owls
ylabel('S. I. V. O. (kg/100km2)', 'FontSize',19)
yyaxis right
% range 0 - 10, plot so we see interesting things, where it oscillates
% include the graph where it shows when it oscillates
plot(E,y(end,2), 'r.', 'MarkerSize',16)      %insects
set(gca,'YColor','r');
ylim ([0 400])
title('Bifurcation diagram of a resource, two consumers and a predator','FontSize', 28)
legend('Owls', 'Insects', 'Seeds', 'Voles','Position',[0.0001 0.15 0.1 0.5],'FontSize', 22)%'Location','NorthEastOutside',
xlabel('E', 'FontSize', 24)
ylabel('S. I. V. O. (kg/100km2)','Color','r', 'FontSize', 19)
set(gca,'FontSize',24)
hold off
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hold on
%%%%%%%%% Plot II
subplot(2,2,[3,4])
plot(E, y(end,1),'g.', 'MarkerSize',16)
plot(E, y(end,3), 'b.', 'MarkerSize',16)
plot(E, y(end,4), 'c.', 'MarkerSize',16)
%ylabel('S. I. V. O. (kg/100km2)', 'FontSize', 19)
yyaxis right
plot(E,y(end,2), 'r.', 'MarkerSize',16)
set(gca,'YColor','r');
ylim ([-10 20])
%legend('Seeds', 'Voles', 'Owls', 'Insects', 'Location','NorthWest','FontSize', 24) %'Location','NorthEastOutside', 
xlabel('E', 'FontSize', 24)
ylabel('S. I. V. O. (kg/100km2)','Color','r', 'FontSize', 19)
set(gca,'FontSize',24)
hold off
end

% [t, y] = ode45(@mythropicproject, tspan, [S0 I0 V0 O0], [], r, K, b_i, E_i, d_i, b_v, E_v, d_v, b_o, E_o, d_o);
% hold on
% time_interval1 = (t>=0 & t<=20);
% time_interval2 = (t>=90 & t<=100);
% 
% tiledlayout(2,2,'TileSpacing','Compact');
% nexttile([1 2])
% plot(t,y(:,1), 'g', 'LineWidth',2)
% hold on
% plot(t,y(:,3), 'b', 'LineWidth',2)
% plot(t,y(:,4), 'c', 'LineWidth',2)
% xlabel('t (y)', 'FontSize', 20)
% ylabel('S. I. V. O. (kg/100km2)', 'FontSize', 20)
% ylim ([-10 500])
% yyaxis right
% plot(t,y(:,2),'r', 'LineWidth',2)
% ylabel('S. I. V. O. (kg/100km2)','Color','r', 'FontSize', 20)
% set(gca,'YColor','r');
% ylim ([-10 350])
% title('Populations biomass over time','FontSize', 30)
% legend('Seeds', 'Voles', 'Owls', 'Insects','Location','NorthEastOutside','FontSize', 22)%'Location','NorthEastOutside',
% set(gca,'FontSize',24)
% hold off
% 
% nexttile
% plot(t(time_interval1),y(time_interval1,1), 'g', 'LineWidth',2)
% hold on
% plot(t(time_interval1),y(time_interval1,3), 'b', 'LineWidth',2)
% plot(t(time_interval1),y(time_interval1,4), 'c', 'LineWidth',2)
% xlabel('t (y)', 'FontSize', 20)
% ylabel('S. I. V. O. (kg/100km2)', 'FontSize', 20)
% ylim ([-10 500])
% yyaxis right
% plot(t(time_interval1),y(time_interval1,2),'r', 'LineWidth', 2)
% ylabel('S. I. V. O. (kg/100km2)','Color','r', 'FontSize', 20)
% set(gca,'YColor','r');
% ylim ([-10 350])
% set(gca,'FontSize',24)
% hold off
% 
% nexttile
% plot(t(time_interval2),y(time_interval2,1), 'g', 'LineWidth',2)
% hold on
% plot(t(time_interval2),y(time_interval2,3), 'b', 'LineWidth',2)
% plot(t(time_interval2),y(time_interval2,4), 'c', 'LineWidth',2)
% xlabel('t (y)', 'FontSize', 20)
% ylabel('S. I. V. O. (kg/100km2)', 'FontSize', 20)
% ylim ([-10 50])
% yyaxis right
% plot(t(time_interval2),y(time_interval2,2),'r', 'LineWidth', 2)
% ylabel('S. I. V. O. (kg/100km2)','Color','r', 'FontSize', 20)
% set(gca,'YColor','r');
% ylim ([-10 20])
% set(gca,'FontSize',24)
% hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EQUILIBRIUM POINTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% syms S I V O r K b_i E_i d_i b_v E_v d_v b_o E_o d_o
% 
% params = {r, K, b_i, E_i, d_i, b_v, E_v, d_v, b_o, E_o, d_o};
% usual_values = {10, 500, 0.6, 0.03, 1.5, 0.7, 0.04, 1.5, 0.9, 0.07, 1}; 
% 
% dSdt = r * (1 - S/K) * S - b_i * I * S - b_v * V * S; 
% dIdt = E_i * b_i * I * S - d_i * I - b_v * V * I; % insects population
% dVdt = E_v * b_v * V * S - d_v * V - b_o * O * V + E_v * b_v * V * I; % voles population
% dOdt = E_o * b_o * O * V - d_o * O; % owls population
% 
% mysymb_sol = solve([dSdt == 0, dIdt == 0, dVdt == 0, dOdt == 0], [S, I, V, O]);
% 
% mysubs_sol = subs({mysymb_sol.S, mysymb_sol.I, mysymb_sol.V, mysymb_sol.O}, params, usual_values);
% 
% sol_col1 = mysubs_sol(end,1); % S
% sol_col2 = mysubs_sol(end,2); % I
% sol_col3 = mysubs_sol(end,3); % V
% sol_col4 = mysubs_sol(end,4); % O
% 
% hold on
% plot(sol_col1, 'gx','MarkerSize', 16)
% plot(sol_col2, 'rx','MarkerSize', 16)
% plot(sol_col3, 'bo','MarkerSize', 16)
% plot(sol_col4, 'cx','MarkerSize', 16)
% hold off





