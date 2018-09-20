function dy = lorenz(t,y)
dy = zeros(3,1);  %there are 3 parameters (equations) that we are solving for 
P = 10; %need to set some value for the constant
r = 28; %need to set some value for the constant
b = 8/3; %need to set some value for the constant
dy(1) = P*(y(2) - y(1));  %these are the actual equations using y(1), y(2), and y(3) for the parameters
dy(2) = -y(1)*y(3) + r*y(1) - y(2);
dy(3) = y(1)*y(2) - b*y(3);

end