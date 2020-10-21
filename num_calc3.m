clc
disp('file: num_calc3')

s = tf('s');
P = 4.063
TI = 0.0145
parameters


Wel = 1/(Ra + La*s);
Wme = 1/(Ja*s);


%% 3/a
disp('3/a')


Wo_p = Wel*Wme*km;
Wf_p = ke;
Wp = minreal(ke * Wo_p/(1+Wo_p*Wf_p));

Wc = P*(1 + 1/(TI*s));

Wo = minreal(Wc*Wp);
Wx = Wo/(1+Wo);
Wx = minreal(Wx)

% bode(Wx, [1, 1e6]);grid;
% margin(Wo);grid;

% impulse(Wx*wn/2);grid;
step(Wx*wn/2);grid;
