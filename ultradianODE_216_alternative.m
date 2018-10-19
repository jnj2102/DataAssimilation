function [dy] = ultradianODE_216_alternative(t, y)

dy = zeros(6,1);

V_g = 10; %10 liters 
C_1 = 300; %300 mg l^-1
R_m = 209; % 209 mU min^-1
a_1 = 6.67; % exponential constant
E   = 0.2; % 0.2l min^-1
V_p = 3; % 3 liters
V_i = 11; %11 liters
t_p = 6; % 6 min
I = 216;
t_i = 100; % 100 min
R_g = 180; %180 mg min^-1
alpha = 7.5;
C_5 = 26; %26  mU l^-1
t_d = 12; % 12 min
beta = 1.77;
C_4 = 80; %80 mU l^-1
kappa = 1/C_4*(1/V_i + 1/(E*t_i));
U_m = 94; % 94 mg min^-1
U_0 = 4; %4 mg min^-1
C_3 = 100; % 100 mg l^-1
C_2 = 144; % 144 mg l^-1
U_b = 72; % 72 mg min^-1

%Define the four functions
f1 = R_m/(1 + exp(-y(3)/(V_g*C_1) + a_1)); %rate of insulin production
f2 = U_b*(1 - exp(-y(3)/(C_2*V_g) ));   %insulin-independent glucose utilization
f3 = 1/(C_3*V_g) *(U_0 + (U_m - U_0)/(1 + (kappa*y(2))^(-beta) )); % insulin-dependent glucose utilization
f4 = R_g/(1 + exp(alpha*(y(6)/(C_5*V_p) - 1)));
%f4 = R_g/(1+exp(alpha*((y(6)/V_p)-C_5)));

%System of Ordinary Differential Equations
dy(1) = f1 - E*(y(1)/V_p - y(2)/V_i) - y(1)/t_p;
dy(2) = E*(y(1)/V_p - y(2)/V_i) - y(2)/t_i;
dy(3) = f4 + I - f2 - f3*y(3);
dy(4) = 1/t_d *(y(1) - y(4));
dy(5) = 1/t_d * (y(4) - y(5));
dy(6) = 1/t_d * (y(5) - y(6));

end