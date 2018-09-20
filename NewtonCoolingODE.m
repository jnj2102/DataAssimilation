[t,y] = ode45('NewtonCooling',[0 200], 100);
plot(t,y,'-');
xlabel('time');
ylabel('T');
title('This is the plot of Newton`s Law of Cooling');