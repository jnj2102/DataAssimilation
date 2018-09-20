function dy = NewtonCooling(t,T)
dy = zeros(1,1);  %there is 1 parameter (equation) that we are solving for 
k = 0.054; 
T_a = 5;
dy = -k * (T - T_a);

end
