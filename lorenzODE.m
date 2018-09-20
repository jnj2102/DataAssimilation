[t,y] = ode45('lorenz',[0 250], [1.0 1.0 1.0]);
subplot(221)
plot(y(:,1),y(:,2),'-');
xlabel('x(t)');
ylabel('y(t)');
title('Phase Plane Portrait for Lorenz attractor -- y(t) vs. x(t)');
subplot(222)
plot(y(:,1),y(:,3),'-');
xlabel('x(t)');
ylabel('z(t)');
title('Phase Plane Portrait for Lorenz attractor -- z(t) vs. x(t)');
subplot(223)
plot(y(:,2),y(:,3),'-');

xlabel('y(t)');
ylabel('z(t)');
title('Phase Plane Portrait for Lorenz attractor -- z(t) vs. y(t)');
subplot(224)
plot(0,0,'.');
xlabel('Edward Lorenz')
ylabel('Kitties');
title('Kitties vs. Lorenz');
