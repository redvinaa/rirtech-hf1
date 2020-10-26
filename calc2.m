clc
disp('file: calc2.m')

syms s t
parameters;


Wel = 1/(Ra + La*s);
Wme = 1/(Ja*s);


%% 2/a
disp('2/a')

Wo = Wel*Wme*km;
Wf = ke;
Wx = simplify(Wo/(1+Wo*Wf));

X = un / s;
Y = Wx * X;

Y = partfrac(Y);
y = simplify(vpa(ilaplace(Y)));
latex(y)

% y_ = symfun(y, t)
% T_ = linspace(0, 1, 100);
% Y_ = y_(T_);
% plot(T_, Y_)

disp('kezdeti szögsebesség')
double(limit(Y*s, s, inf))
disp('állandósult szögsebesség')
double(limit(Y*s, s, 0))


%% 2/b
disp('2/b')

Wo = Wel;
Wf = km*ke*Wme;
Wx = simplify(Wo/(1+Wo*Wf));

X = un / s;
Y = Wx * X;

Y = partfrac(Y);
y = simplify(ilaplace(vpa(Y)));
latex(y)

% y_ = symfun(y, t)
% T_ = linspace(0, 1, 1000);
% Y_ = y_(T_);
% plot(T_, Y_);grid;

disp('kezdeti áram')
double(limit(Y*s, s, inf))
disp('állandósult áram')
double(limit(Y*s, s, 0))


%% 2/c
disp('2/c')

y = simplify(y*km);
latex(y)

% y_ = symfun(y, t)
% T_ = linspace(0, 1, 1000);
% Y_ = y_(T_);
% plot(T_, Y_);grid;

disp('kezdeti nyomaték')
double(limit(Y*s, s, inf))
disp('állandósult nyomaték')
double(limit(Y*s, s, 0))

%===============================================


% clc
% disp('file: num_calc2.m')

% s = tf('s');
% parameters;


% Wel = 1/(Ra + La*s);
% Wme = 1/(Ja*s);


% %% 2/a
% disp('2/a')

% Wo = Wel*Wme*km;
% Wf = ke;
% Wx = minreal(Wo/(1+Wo*Wf));

% step(Wx*un);grid;
% title('W u->w')
% xlabel('ido','interpreter','latex', 'FontWeight','bold')
% ylabel('szogsebesseg $\left(\frac{\mathrm{rad}}{\mathrm{s}}\right)$','interpreter','latex', 'FontWeight','bold')


% %% 2/b
% disp('2/b')

% Wo = Wel;
% Wf = km*ke*Wme;
% Wx = minreal(Wo/(1+Wo*Wf));

% X = un / s;
% Y = Wx*X
% step(Wx*un);grid;
% title('W u->i')
% xlabel('ido','interpreter','latex', 'FontWeight','bold')
% ylabel('aram (A)','interpreter','latex', 'FontWeight','bold')


% %% 2/c
% disp('2/c')

% step(Wx*un*km);grid;
% title('W u->t')
% xlabel('ido','interpreter','latex', 'FontWeight','bold')
% ylabel('nyomatek (Nm)','interpreter','latex', 'FontWeight','bold')
