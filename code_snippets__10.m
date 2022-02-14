%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Collection of code snipptes shown at introductions to
%    Tuesday sessions, orgaized by session
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                          Session 2                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  ODE solver template 1 (file: myderiv.m)
%
%    dy1/dt = -3*y1 + 2*y2
%    dy2/dt =  2*y1 -   y2
%   
% [t,y] = ode45(@myderiv, [0 3], [1 1])
function dydt = anyname(t,y)
  y1    = y(1)         % unpack
  y2    = y(2)         % unpack
  dy1dt = -3*y1 + 2*y2 % dynamics for y1
  dy2dt =  2*y1 -   y2 % dynamics for y2         
dydt = [dy1dt dy2dt]'  % stack result into vector
end

%  ODE solver template 2 (file: myderiv2.m)
%
%    dy1/dt = -3*y1 + b*y2*sin(t)
%    dy2/dt =  a*y1 -   y2
%
%                          t interval  initval   options   parameters 
% [t,y] = ode45(@myderiv2, [0 3],      [1 1],    [],       1, 1.67)
  function dydt = anyname(t,y,a,b)
  y1    = y(1)         % unpack
  y2    = y(2)         % unpack
  dy1dt = -3*y1 + b*y2*sin(t)  % dynamics for y1
  dy2dt =  a*y1 -   y2         % dynamics for y2         
dydt = [dy1dt dy2dt]'  % stack result into vector
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                          Session 3                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a*x+b
syms a x b
solve(a*x+b == 0, x)
solve(a*x+b, x)         % == 0 implicit
simplify(b+b+b)
simplify(b+b+b+a)


subs(solve(a*x+b == 0, x), {a}, {3})
subs(solve(a*x+b == 0, x), {a,b}, {3,77})

param = {a,b}
usual_values = {3,77}
subs(solve(a*x+b == 0, x), param, usual_values)

double(subs(solve(a*x+b == 0, x), {a,b}, {3,77}))

xvals = 1:0.21:3
y = subs(a*x+b, {a,b,x}, {3,77,xvals})
plot(xvals, y)


%%%%%%%%%%%%%%%%% working on two figures  %%%%%%%%%%%%%%%%%%%%%%

x = 0:10
y = x.^2             % NB: dot = element-by-element
plot(x,y)

last = gcf           % save last figure 1 handler
new  = figure()      % create new figure 2
plot(x,sin(x))       % work in new figure 2
xlabel('x')          % label in figure 2
figure(last)         % go back to figure 1
xlabel('xlabel in figure 2')  % label in figure 2


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                          Session 4                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% ----------------- matrices and vectors recap -----------------
%
a = [1 2 7 8]
b = [1 2 7 8; 3 5 4 9]
a(3)       % third element
a(end)     % last element - same as a(length(a))
b(2,3)     % row=2, col=3
b(:,1)     % first col
b(2,:)     % second row
b(1,end)   % last element in first row
size(b)    % ask #rows,columns in matrix
%
%
% ----------------- putting things in a box: struct --------
%
mybox = struct('r', 6, 'u', 77)
mybox.r                    % get r from box 
mybox.u                    % get u from box
q = mybox.r + 3 + mybox.u  % use as any other
%
% ----------------- solve several eqs at once --------------
%
%         3*x  + 7*y - 7 == 0
%         22*x - 4*y - 6 == 0
% ----------------------------------------------------------
syms x y
[xsol,ysol] = solve(3*x + 7*y - 7 == 0, 22*x - 4*y - 6 == 0, [x,y])
sol         = solve(3*x + 7*y - 7 == 0, 22*x - 4*y - 6 == 0, [x,y])
sol.x     % same as xsol
sol.y     % same as ysol
%
% ----------------- solve two equations by elimination steps ("clines") --------------
%
eq1 = 3*x + 7*y - 7        % inherits symbolic type from x,y
eq2 = 22*x - 4*y - 6       % inherits symbolic type from x,y
x_from_eq1            = solve(eq1==0, x)
eliminated_x_in_eq2   = subs(eq2, x, x_from_eq1)           % contains only y - insert in eq2
ysol                  = solve(eliminated_x_in_eq2==0, y)   % solve for y
xsol                  = subs(x_from_eq1, y, ysol)          % plugin y=.. in eq 1
%
% ----------------- repeating stuff : for loops --------------
%
% what is 1 + 2 + 99 ?
%
sum = 0
for y = [1 2 99]
   sum = sum + y
end
% ---------------- coupling for loops with plot ----------------
hold on
x = 0:0.1:3
for k = [0.6 1 1.6]
   plot(x, sin(k*x))
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                          Session 5                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% function example defined in file: my_ode_a_in_file.m
%
function dydt = expgrowth(t,y)
  % parameter a defined in this file, not passed
  a = 3;
  dydt = a*y ;
end



% --------------------------------------------------
%     passing parameters to functions
% --------------------------------------------------

[t,y] = ode45(@my_ode_a_in_file, [0 2], 1)     % pamameter a defined in my_ode_a_in_file.m

a=3               % pamameter a defined here in main script

[t,y] = ode45(@(t,y) a*y, [0 2], 1)            % lambda form
[t,y] = ode45(@my_ode, [0 2], 1, [], a)        % extended parameter list to ode45
[t,y] = ode45(@(t,y) my_ode(t,y,a), [0 2], 1)  % pass a by intermediate lambda function

% --------------------------------------------------
%     nested for loops
% --------------------------------------------------

for x = 1:3
    z = x 
end



for x = 1:3
    for y = 1:2
    	z = [x y]
    end	
end


% --------------------------------------------------
%    branching out: if TRUE ...
% --------------------------------------------------
if 3   % anything non-zero considered true
  22
end


if 0    
  22
end


if x==2  !  comparison: == > <   ... notice == not =
  22
end

% ------ else if ------------
x = 3
if x==1
  1
elseif x==3
  4
end

% ------ else ------------
x = 3
if x==1
  1
elseif x==2
  4
else
  44
end

% ------ combinations with & and | ------------

for x = 0:10
if x>3 & x<7
  x
end
end

% ------ if with vector conditions : all elements must be true------
if [0 1]
 5
end

if [1 1]   
 5
end

if [2 2] == 2  % element-by-element test
 5

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                          Session 6                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ------------- file : explo.m -------------
function dydt = explo(t,y,r,K,p,b,c,k)
%
% ---- unpack y ----
%
  N    = y(1);   % fish / km2
  A    = y(2);   % boats / km2
%
% ---- rate eqautions ----
%

  dNdt =  r*N*(1-N/K) - b*A*N;
  dAdt =  k*(p*b*N/c - 1);
%
% ---- pack dydt as col vector
%
    dydt = [dNdt; dAdt];

end



% ------------- file : explo_safe.m --------------------------
function dydt = explo(t,y,r,K,p,b,c,k)
%
% ---- unpack y ----
%
  N    = y(1);   % fish / km2
  A    = y(2);   % boats / km2
%
% ---- rate eqautions ----
%

  dNdt =  r*N*(1-N/K) - b*A*N;
  dAdt =  k*(p*b*N/c - 1);
%
% --- if A is negative, dAdt should not be negative
%
  if A<0
    dAdt = max(dAdt, 0)     % dAdt > 0 is OK if A<0, allow fleet to rebuild
  end
%
% ---- pack dydt as col vector
%
    dydt = [dNdt; dAdt];

end



% ========================= exploited population =========================
r = 1           [1/year]          growth rate
K = 1e4         [fish/km2]        fish carrying capacity
p = 1           [$/fish]          catch price
b = 50*5*1e-2*1 [km2/boat/year]   habitat clearance rate (sail_days * fish_hours_pr_day * gear_width * sail_speed)   
c = 1e4         [$/year/boat]     operating cost
k = 0.2/3/2     [boats/km2/year]  sector adaptation rate (boat_dens / adapt_time / incentive_factor)

[t,y] = ode45(@(t,y) explo(t,y,r,K,p,b,c,k),   [0  48],  [1e4 0.2]);

plot(y(:,2), y(:,1)) % nice - no problems

c = 1e5  % moves equilib point to negative A
[t,y] = ode45(@(t,y) explo(t,y,r,K,p,b,c,k),   [0  48],  [1e4 0.2]);

plot(y(:,2), y(:,1)) % hmmm : negative A

%
% ======  1) ask ode45 to force N and A > 0 ======
%

option =  odeset('NonNegative',[1,2])     % variables number 1 and 2 must be positive
[t,y] = ode45(@(t,y) explo(t,y,r,K,p,b,c,k),   [0  48],  [1e4 0.2], option)

%
% ====== 2) fix ODE with if check so dAdt >= 0 when A negative ======
%

[t,y] = ode45(@(t,y) explo_safe(t,y,r,K,p,b,c,k),   [0  48],  [1e4 0.2])



% =========================================================================== 


  

% ----------------------------------------------------
% Iterate popdyn by hand
% ----------------------------------------------------
L = [0 12; 0.09 0.21]; 
y = [7; 1]; 
hold on; 
plot(y(1), y(2), '*'); 
y = L*y; plot(y(1), y(2), '*');

% ----------------------------------------------------
% get eigenvalues / eigenvectors of matrix
% ----------------------------------------------------

e     = eig(L) % returns a column vector containing the eigenvalues of square matrix L.
[V,D] = eig(L) % returns diagonal matrix D of eigenvalues and matrix V whose columns are
               % the corresponding right eigenvectors, so that A*V = V*D.
  
v1 = V(:,1)          % pick first eigen vector
sum(v1)              % NB not 1
sqrt(sum(v1 .* v1))  % geometric length 
  
% ----------------------------------------------------
% popdyn by loop
% ----------------------------------------------------
y = [3; 5]
for i = 1:10
    y = [y L*y(:,end)] % add coloumn
end

plot(y(1,:), y(2,:)) % phase portrait
plotv(y)             % plot as vectors


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                          Session 7                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%           Rosenzweig-MacArtur model : bifurcation at K ~ 14.8
r  = 0.5 ;
e  = 0.1 ;
b  = 0.4 ;
Cm = 2.0 ;
d  = 0.1 ;

syms N P K

Cpp  = b*N/(1+b*N/Cm)  ;      % consumption per predator; inherits Cpp symbolic type 
dNdt = r*(1-N/K)*N - Cpp*P ;  % dNdt inherits symbolic type 
dPdt = e*Cpp*P - d*P ;        % dPdt inherits symbolic type  


dydt = @(t,y) double(subs([dNdt; dPdt], {N,P,K}, {y(1),y(2),12}));
[t,y] = ode45(dydt, [0 1000], [5,2]);
plot(t,y)

figure()
dydt = @(t,y) double(subs([dNdt; dPdt], {N,P,K}, {y(1),y(2),15}));
[t,y] = ode45(dydt, [0 1000], [5,2]);
plot(t,y)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                          Session 9                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ---------------- plotting a surface ----------------
x = 1:6
t = 1:14
A = t' * x       % outer product
size(A)          % A(1:14, 1:6)
plot(x,A(2,:))   % plot constant t slice of A
plot(t,A(:,3))   % plot constant x slice of A
clf
surface(x,t,A)   % colored A boxes - notice index order of A
xlabel('x')
ylabel('t')
shading interp   % smooth surface plot
colorbar

%
% ---------------- random numbers ----------------
%
rand()         % a single random numbers
rand(5)        % matrix of random numbers
rand(1,5)      % vector of random numbers
x = 4:23
rand(size(x))  % use shape of x
