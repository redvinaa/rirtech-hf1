clc
disp('file: calc1.m')



%% 1/a
disp('1/a')

syms s Ra La km ke Ja;


Wel = 1/(Ra + La*s);
Wme = 1/(Ja*s);

%% 1/b
disp('1/b')

Wo = Wel*Wme*km;
Wf = ke;
Wx = simplify(Wo/(1+Wo*Wf));
disp('Closed loop transfer function')
latex(Wx)

disp('dcgain')
abs(subs(Wx, s, 0))

pi = poles(Wx, s);
p2 = simplify(pi(1))
p1 = simplify(pi(2))
T2 = -1/p2
T1 = -1/p1

%% 1/c
disp('1/c')

Wo = Wel;
Wf = km*ke*Wme;
Wx = simplify(Wo/(1+Wo*Wf));
disp('Closed loop transfer function')
latex(Wx)

disp('dcgain')
abs(subs(Wx, s, 0))

pi = poles(Wx, s);
p2 = simplify(pi(1))
p1 = simplify(pi(2))
T2 = -1/p2
T1 = -1/p1

%% 1/d
disp('1/d')

Wo = -Wme;
Wf = -km*ke*Wel;
Wx = simplify(Wo/(1+Wo*Wf));
disp('Closed loop transfer function')
latex(Wx)

disp('dcgain')
abs(subs(Wx, s, 0))

pi = poles(Wx, s);
p2 = simplify(pi(1))
p1 = simplify(pi(2))
T2 = -1/p2
T1 = -1/p1


%% 1/e
disp('1/e')

Wo = Wel*Wme*ke;
Wf = km;
Wx = simplify(Wo/(1+Wo*Wf));
disp('Closed loop transfer function')
latex(Wx)

disp('dcgain')
abs(subs(Wx, s, 0))

pi = poles(Wx, s);
p2 = simplify(pi(1))
p1 = simplify(pi(2))
T2 = -1/p2
T1 = -1/p1
