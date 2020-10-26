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


Wx_p = Wel*Wme*km;
Wf_p = ke;
Wp = minreal(Wx_p/(1+Wx_p*Wf_p));

Wc = P*(TD*s + 1)/(n*TD*s + 1);

Wx = minreal(Wc*Wp);
Wo = Wx/(1+Wx);
Wo = minreal(Wo)

% bode(Wo, [1, 1e6]);grid;
% margin(Wx);grid;

impulse(Wo*wn/2);grid;
% step(Wo*wn);grid;
title('')
ylabel('szögsebesség (rad/s)')
