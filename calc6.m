clc
disp('file: calc5.m')

num_Ra = 11.1;
num_La = 1.52e-3;
num_km = 0.0582;
num_ks = 17.17;
num_ke = 0.05822;
num_Ja = 4.46e-6;
num_wn = 463.91;
num_in = 0.804;
num_un = 36;
num_TI = 0.0145;
num_T0 = 1;
num_P = 0.05;
num_TD = 1.3825e-4;
num_n  = 40.827;


syms s Ra La km ke Ja TD n P T0 tau0 wn t;


Wel = 1/(Ra + La*s);
Wme = 1/(Ja*s);

%------------------------------

Uw = wn/(2*s);
Ut = tau0/s * exp(-T0*s);

Wo = ke * Wel*km*Wme
Wf = ke
Wp = simplify(Wo/(1+Wo*Wf));

Wo = -Wme;
Wf = -km*ke*Wel;
Wtw = simplify(Wo/(1+Wo*Wf));

Wc = P*(TD*s + 1)/(n*TD*s + 1);

%{{{ Plot 5-w %}
Yw = (Wp*Wc*Uw + Wtw*Ut)  /  (Wp*Wc + 1);
Yw = simplify(Yw)
% disp('Output')
% latex(Yw)

% num_Yw = subs(Yw, [Ra, La, km, ke, Ja, TD, n, P, T0, wn], [num_Ra, num_La, num_km, num_ke, num_Ja, num_TD, num_n, num_P, num_T0, num_wn]);
% num_Yw = vpa(num_Yw);
% yw = ilaplace(num_Yw, s, t);
% latex(yw)
% fun_yw = symfun(yw, [t tau0])

% t = linspace(0, 2, 1000);

% tau_i = [0.003 0.006 0.0101];

% hold on
% for i = 1:length(tau_i)
%     plot(t, fun_yw(t, tau_i(i)), 'LineWidth', 2);grid;
% end
% xlabel('idő (s)');
% ylabel('szögsebesség (rad/s)');
% legend('0.003', '0.006', '0.0101');
% grid;
% hold off;
%}}}

%{{{ Plot 5-i %}
Yi = ke*Wel*(Uw - Yw)
disp('Output')
latex(Yw);

num_Yi = subs(Yi, [Ra, La, km, ke, Ja, P, TD, n, T0, wn], [num_Ra, num_La, num_km, num_ke, num_Ja, num_P, num_TD, num_n, num_T0, num_wn]);
num_Yi = vpa(num_Yi)
yi = ilaplace(num_Yi, s, t)
fun_yi = symfun(yi, [t tau0])

t = linspace(0, 2, 1000);

tau_i = [0.003 0.006 0.0101];

hold on
for i = 1:length(tau_i)
	plot(t, fun_yi(t, tau_i(i)), 'LineWidth', 2);
end
xlabel('idő (s)');
ylabel('armatúra áram (A)');
legend('0.003', '0.006', '0.0101');
grid;
hold off;
%}}}

%{{{ tau_max %}
% Yi = ke*Wel*(Uw - Yw);

% num_Yi = subs(Yi, [Ra, La, km, ke, Ja, TD, n, P, T0, wn], [num_Ra, num_La, num_km, num_ke, num_Ja, num_TD, num_n, num_P, num_T0, num_wn]);
% num_Yi = vpa(num_Yi);
% yi = ilaplace(num_Yi, s, t)
% fun_yi = symfun(yi, [t tau0])

% t = linspace(0.99, 2, 100);
% tau_i = linspace(0, .1, 100);

% imax = 0;
% taumax = 0;
% tmax = 0;
% for i = 1:length(tau_i)
%     for j = 1:length(t)
%         I = abs(fun_yi(t(j), tau_i(i)));
%         if I > imax
%             imax = I;
%             taumax = tau_i(i);
%             tmax = t(j);
%         end
%         if I > num_in
%             disp('found max')
%             disp('imax:')
%             imax
%             disp('taumax')
%             taumax
%             disp('tmax')
%             tmax
%             return
%         end
%     end
% end
% disp('max not found')
% disp('imax:')
% imax
% disp('taumax')
% taumax
% disp('tmax')
% tmax
%}}}

%{{{ Trash

% Wo_p = Wel*Wme*km;
% Wf_p = ke;
% Wp = simplify(ke * Wo_p/(1+Wo_p*Wf_p));

% Wc = P*(1 + 1/(TI*s));

% Wo = Wc*Wp;
% Wx = Wo/(1+Wo);
% Wx = simplify(Wx);
% disp('Closed loop transfer function')
% latex(Wx)

% [Wx_num, Wx_den] = numden(Wx);
% disp('Karakterisztikus egyenlet')
% latex(Wx_den)

% num_Wx_den = subs(Wx_den, [Ja, Ra, TI, La, ke, km], [num_Ja, num_Ra, num_TI, num_La, num_ke, num_km])
% disp('Poles')
% pi = solve(num_Wx_den, s);
% pi = vpa(pi)

% arr_P = linspace(-20, 40, 1000);
% fun_p1 = symfun(pi(1), P);
% fun_p2 = symfun(pi(2), P);
% fun_p3 = symfun(pi(3), P);
% hold on
% plot(arr_P, real(fun_p1(arr_P)))
% plot(arr_P, real(fun_p2(arr_P)))
% plot(arr_P, real(fun_p3(arr_P)))
% legend('p1', 'p2', 'p3');grid;
% % xlim([-1 10]);
% % ylim([-200 10]);
% hold off
% title('')
% xlabel('körerősítés')
% ylabel('pólus valós része')



% % disp('dcgain')
% % abs(subs(Wx, s, 0))

% % pi = poles(Wx, s);
% % p2 = simplify(pi(1))
% % p1 = simplify(pi(2))
% % T2 = -1/p2
% % T1 = -1/p1

%}}}
