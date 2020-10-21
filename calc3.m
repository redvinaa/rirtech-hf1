clc
disp('file: calc3.m')

num_Ra = 11.1;
num_La = 1.52e-3;
num_km = 0.0582;
num_ks = 17.17;
num_ke = 0.05822;
num_Ja = 4.46e-6;
num_wn = 463.91;
num_in = 0.804;
num_un = 36;
num_TI = 0.0145


%% 3/a
disp('3/a')

syms s Ra La km ke Ja TI P;


Wel = 1/(Ra + La*s);
Wme = 1/(Ja*s);


Wo_p = Wel*Wme*km;
Wf_p = ke;
Wp = simplify(ke * Wo_p/(1+Wo_p*Wf_p));

Wc = P*(1 + 1/(TI*s));

Wo = Wc*Wp;
Wx = Wo/(1+Wo);
Wx = simplify(Wx);
disp('Closed loop transfer function')
latex(Wx)

[Wx_num, Wx_den] = numden(Wx);
disp('Karakterisztikus egyenlet')
latex(Wx_den)

num_Wx_den = subs(Wx_den, [Ja, Ra, TI, La, ke, km], [num_Ja, num_Ra, num_TI, num_La, num_ke, num_km])
disp('Poles')
pi = solve(num_Wx_den, s);
pi = vpa(pi)

arr_P = linspace(-20, 40, 1000);
fun_p1 = symfun(pi(1), P);
fun_p2 = symfun(pi(2), P);
fun_p3 = symfun(pi(3), P);
hold on
plot(arr_P, real(fun_p1(arr_P)))
plot(arr_P, real(fun_p2(arr_P)))
plot(arr_P, real(fun_p3(arr_P)))
legend('p1', 'p2', 'p3');grid;
% xlim([-1 10]);
% ylim([-200 10]);
hold off
title('')
xlabel('körerősítés')
ylabel('pólus valós része')



% disp('dcgain')
% abs(subs(Wx, s, 0))

% pi = poles(Wx, s);
% p2 = simplify(pi(1))
% p1 = simplify(pi(2))
% T2 = -1/p2
% T1 = -1/p1

