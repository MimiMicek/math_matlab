% number of ants per 150m2 - 3000/60
R = 50; % ant per m2

% reproductive efficiency of mouse
E_r = 0.002; % no. of ants a mouse has to eat to reproduce 1/500

% max no. of ants a mouse can eat in a day
Cmax = 5*365; % no of max eaten ants per year

% clearance rate of mouse
b = 0.95; % 95% of 150m2 per year

% metabolic cost of being active - 70% because of speed
M = 0.7; 

% natural mortality risk
m_0 = 0.33; % 1/y

% risk of predation high because its small in size and has a larger no. of
% predators
m_p = 0.5; % 1/y

%m = m_0 + m_p;

theta = 0:200;
for T = theta
    % clearance rate depends on theta - the bigger the animal the larger clearance rate    
    b_theta = b*T;
    % mortality rate depends on theta - the bigger the animal, less predators
    m_p_theta = m_p*T;
    % metabolic cost rises with the size of the mouse
    M_theta = M*T;
    r = E_r*(Cmax*(b_theta*R/(b_theta*R+Cmax))-M_theta)-m_0 + m_p_theta;
    consumption = Cmax*(b_theta*R/(b_theta*R+Cmax));
    m = -m_0 + m_p_theta;
    hold on
    plot(T,sqrt(r),'b.', 'MarkerSize',10)
    plot(T,consumption,'r.', 'MarkerSize',10)
    plot(T, sqrt(M_theta),'m*', 'MarkerSize',10)
    plot(T,m,'c.', 'MarkerSize',10)
    title('Evolutionary theory','FontSize', 16)
    legend('Metabolic cost -M','Location','NorthEastOutside','FontSize', 16)
    xlabel('Theta (trait - body size)', 'FontSize', 16)
    ylabel('Growth rate (r)', 'FontSize', 16)
    set(gca,'FontSize',14)
    hold off
end
