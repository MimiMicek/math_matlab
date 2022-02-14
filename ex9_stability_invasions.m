% Multiple equilibrium equations I
r = 0.4;
V =1.5;
Si = 1.2;

syms S B D dSdt

% dBdt = r * B *S - D/V * B; % prey population
dSdt = - r * B * S + D/V * (Si - S); % predator population

Sbar = solve(subs(dSdt, B, 0) == 0, S);

syms dBdt

dBst = r*B*S-(D/V)*B;

dBdt_div_B_at_Sbar = subs(simplify(dBdt/B), S, Sbar)

Dtest = 0.5:0.001:1

plot(Dtest, double(subs(dBdt_div_B_at_Sbar, D, Dtest)))