clc
disp('file: num_calc4')

s = tf('s');
n = 0.05
TD = 1.3825e-4
P = 40.827
parameters


Wel = 1/(Ra + La*s);
Wme = 1/(Ja*s);


%% 4/a
disp('4/a')


Wo_p = Wel*Wme*km;
Wf_p = ke;
Wp = minreal(ke * Wo_p/(1+Wo_p*Wf_p));

Wc = P*(TD*s + 1)/(n*TD*s + 1);

Wo = minreal(Wc*Wp);
Wx = Wo/(1+Wo);
Wx = minreal(Wx)

% bode(Wx, [1, 1e6]);grid;
% margin(Wo);grid;

% impulse(Wx*wn/2);grid;
step(Wx*wn);grid;
title('')
ylabel('szögsebesség (rad/s)')
