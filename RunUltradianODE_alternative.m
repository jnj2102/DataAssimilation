% Test run of Ultradian Model
% Author: Jami Jackson Mulgrave
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Results for I = 216; % per the computer model paper I = 216 mg/min


Ip_0 = 90; % initial Cond (I.C)  plasma insulin milliUnits (note NOT per litre)
Ii_0 = 250; % I.C intertstitial insulin in milliUNits
G0=9000; % I.C. plasma glucose in mg this divided by volume later at time of plotting
X1_0=84; % Insulin values in distal compartments in milliUnits
X2_0=84; % X1,X2, X3 are variables introduced to model time delays
X3_0=84; %
alpha_initial=[Ip_0 Ii_0 G0 X1_0 X2_0 X3_0]; 
          % 6 X 1matrix which defines initial condition of 
          % plasma insulin , intercellular insulin plasma glucose and three
          % delay variables X1, X2, X3

t0=0;      % initial value of time from which we need solution and plots
tf=1000;   % final value of time till which we need solution and plots
N=1000;   % number of subdivisions of the time interval

h = (tf-t0)/N;        %the time step size
t(1) = t0;           %initialization of time 
y(:,1) = alpha_initial;     %initial conditions


%below in the 'for' loop we have iterations of 4th order runge kutta method 
%which returns y as a matrix which contains value of each variable at each
%time step

for i = 1:N
   k1 = h*ultradianODE_216_alternative(t(i), y(:,i));
   k2 = h*ultradianODE_216_alternative(t(i)+h/2, y(:,i)+0.5*k1);
   k3 = h*ultradianODE_216_alternative(t(i)+h/2, y(:,i)+0.5*k2); 
   k4 = h*ultradianODE_216_alternative(t(i)+h, y(:,i)+k3);
   y(:,i+1) = y(:,i) + (k1 + 2*k2 + 2*k3 + k4)/6;
   t(i+1) = t0 + i*h;
end

%[t' y'];   %  returns time and the matrix y which contains value of each variable
           %  at all time steps 

t_108(1) = t0;           %initialization of time 
y_108(:,1) = alpha_initial;     %initial conditions


%below in the 'for' loop we have iterations of 4th order runge kutta method 
%which returns y as a matrix which contains value of each variable at each
%time step

for i = 1:N
   k1 = h*ultradianODE_108_alternative(t_108(i), y_108(:,i));
   k2 = h*ultradianODE_108_alternative(t_108(i)+h/2, y_108(:,i)+0.5*k1);
   k3 = h*ultradianODE_108_alternative(t_108(i)+h/2, y_108(:,i)+0.5*k2); 
   k4 = h*ultradianODE_108_alternative(t_108(i)+h, y_108(:,i)+k3);
   y_108(:,i+1) = y_108(:,i) + (k1 + 2*k2 + 2*k3 + k4)/6;
   t_108(i+1) = t0 + i*h;
end


figure % plot of plasma glucose and plasma insulin on same graph 
subplot(211); %I = 108
[AX,H1,H2]=plotyy(t_108,y_108(3,:)/100,t_108,y_108(1,:)/3); % glucose plot on left y-axis, insulin on right y-axis                  
set(get(AX(1),'Ylabel'),'String','Plasma Glucose mg/dL') 
set(get(AX(2),'Ylabel'),'String','Plasma Insulin Ip - microU/L') 
title('Plasma Glucose/Insulin for I = 108');
%xlabel('minutes');
set(H1,'LineStyle','-','Linewidth',2 )
set(H2,'LineStyle','-.','Linewidth',2)
% plot(t,y(2,:)/11,'r','Linewidth',1);    % division by Volume to get conc units 
% title('Intercellular Insulin');
% xlabel('min');
% ylabel('microUnits/L');
%hold on
subplot(212);
[AX,H1,H2]=plotyy(t,y(3,:)/100,t,y(1,:)/3); % glucose plot on left y-axis, insulin on right y-axis                  
set(get(AX(1),'Ylabel'),'String','Plasma Glucose mg/dL') 
set(get(AX(2),'Ylabel'),'String','Plasma Insulin Ip - microU/L') 
title('Plasma Glucose/Insulin for I = 216');
%xlabel('minutes');
set(H1,'LineStyle','-','Linewidth',2 )
set(H2,'LineStyle','-.','Linewidth',2)


%Glucose versus time with I = 108
subplot(3,1,1)
plot(t_108, y_108(3,:), '-');
ylabel('I_p');
xlabel('t');
title('Glucose Concentration vs time with I = 108');

%Glucose versus time with I = 216
subplot(3,1,2)
plot(t, y(3,:),  '-');
ylabel('G');
xlabel('t');
title('Glucose Concentration vs time with I = 216');

%Histogram of Glucose

figure
histogram(y(3,:))
title('Histogram of Glucose at I = 216');

figure
histogram(y_108(3,:))
title('Histogram of Glucose at I = 108');

%Phase Plane Portraits for I = 216
subplot(421)
plot(y(:,1),y(:,2),'-');
xlabel('I_p(t)');
ylabel('I_i(t)');
title('Phase Plane Portrait for I_p(t) vs. I_i(t) for I = 216');  %Cool!  this is hyperbolic!

subplot(422)
plot(y(:,1),y(:,3),'-');
xlabel('I_p(t)');
ylabel('G(t)');
title('Phase Plane Portrait for I_p(t) vs. G(t) for I = 216');  %Cool!  this is hyperbolic!

subplot(423)
plot(y(:,2),y(:,3),'-');
xlabel('I_i(t)');
ylabel('G(t)');
title('Phase Plane Portrait for I_i(t) vs. G(t) for I = 216');  %Cool!  this is hyperbolic!

subplot(424)
plot(y(:,1),y(:,4),'-');
xlabel('I_i(t)');
ylabel('h_1(t)');
title('Phase Plane Portrait for I_i(t) vs. h_1(t) for I = 216');  %Cool!  this is hyperbolic!
