clc
disp('file: num_calc2.m')

s = tf('s');
parameters;


Wel = 1/(Ra + La*s);
Wme = 1/(Ja*s);


%% 2/a
disp('2/a')

Wo = Wel*Wme*km;
Wf = ke;
Wx = minreal(Wo/(1+Wo*Wf));

step(Wx*un);grid;
title('W u->w')
xlabel('ido','interpreter','latex', 'FontWeight','bold')
ylabel('szogsebesseg $\left(\frac{\mathrm{rad}}{\mathrm{s}}\right)$','interpreter','latex', 'FontWeight','bold')


%% 2/b
disp('2/b')

Wo = Wel;
Wf = km*ke*Wme;
Wx = minreal(Wo/(1+Wo*Wf));

X = un / s;
Y = Wx*X
step(Wx*un);grid;
title('W u->i')
xlabel('ido','interpreter','latex', 'FontWeight','bold')
ylabel('aram (A)','interpreter','latex', 'FontWeight','bold')


%% 2/c
disp('2/c')

step(Wx*un*km);grid;
title('W u->t')
xlabel('ido','interpreter','latex', 'FontWeight','bold')
ylabel('nyomatek (Nm)','interpreter','latex', 'FontWeight','bold')
