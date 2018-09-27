function[result] = DelayedInsulinDependentGlucoseUtilization(y_6, R_g, alpha, C_5, V_p)

result = R_g/(1 + exp(alpha*(y_6/(C_5*V_p) - 1)));

end