function[result] = RateofInsulinProduction(y_3, V_g, C_1, R_m, a_1)

result = R_m/(1 + exp(-y_3/(V_g*C_1) + a_1));

end