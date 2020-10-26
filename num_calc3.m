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


Wx_p = Wel*Wme*km;
Wf_p = ke;
% Wp = minreal(ke * Wx_p/(1+Wx_p*Wf_p));
Wp = minreal(Wx_p/(1+Wx_p*Wf_p));

Wc = P*(1 + 1/(TI*s));

Wx = minreal(Wc*Wp);
Wo = Wx/(1+Wx);
Wo = minreal(Wo)

% bode(Wo, [1, 1e6]);grid;
% margin(Wx);grid;

% impulse(Wo*wn/2);grid;
step(Wo*wn/2);grid;
title('')
ylabel('szögsebesség (rad/s)')
