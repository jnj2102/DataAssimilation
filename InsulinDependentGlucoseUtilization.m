function [result] = InsulinDependentGlucoseUtilization(y_2, C_3, V_g, U_0, U_m, kappa, beta)

result = 1/(C_3*V_g) *(U_0 + (U_m - U_0)/(1 + (kappa*y_2)^(-beta) ));

end