function [result] = InsulinIndependentGlucoseUtilization(y_3, U_b, C_2, V_g)

result = U_b*(1 - exp(-y_3/(C_2*V_g) ));

end