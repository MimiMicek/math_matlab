% function dydt = myexamexamples(t,y,b,a)
% S = y(1); %unpack
% I = y(2); %unpack
% R = y(3); %unpack
% 
% dSdt = -b * S * I; %dynamics for S
% dIdt = (b * S - a) * I; %dynamics for I
% dRdt = a * I; %dynamics for R
% dydt = [dSdt;dIdt;dRdt]; %stack results into a vector
% end

% function dydt = myexamexamples(t,y,r,D,V,Si)
% B = y(1); %unpack
% S = y(2); %unpack
% 
% 
% dBdt = r * B * S - (D/V) * B; %dynamics for B
% dSdt = -r * B * S + (D/V) * (Si - S); %dynamics for S
% dydt = [dBdt;dSdt]; %stack results into a vector
% end

% function dydt = myexamexamples(t,y,lambda)
% B = y(1); %unpack
% 
% r = 1 * exp (-lambda*B)-1-1.5;
% 
% dBdt = r * B; %dynamics for B
% dydt = [dBdt]; %stack results into a vector
% end