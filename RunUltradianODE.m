% Test run of Ultradian Model
% Author: Jami Jackson Mulgrave
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[t,y] = ode45('ultradianODE',[0 300], [20 20 20 40 40 40]);

subplot(221)
plot(y(:,1),y(:,2),'-');
xlabel('I_p(t)');
ylabel('I_i(t)');
title('Phase Plane Portrait for Ultradian Model -- I_p(t) vs. I_i(t)');  %Cool!  this is hyperbolic!

subplot(222)
plot(y(:,1),y(:,3),'-');
xlabel('I_p(t)');
ylabel('G(t)');
title('Phase Plane Portrait for Ultradian Model -- I_p(t) vs. G(t)');  %Cool!  this is hyperbolic!

subplot(223)
plot(y(:,2),y(:,3),'-');
xlabel('I_i(t)');
ylabel('G(t)');
title('Phase Plane Portrait for Ultradian Model -- I_i(t) vs. G(t)');  %Cool!  this is hyperbolic!

subplot(224)
plot(y(:,1),y(:,4),'-');
xlabel('I_i(t)');
ylabel('h_1(t)');
title('Phase Plane Portrait for Ultradian Model -- I_i(t) vs. h_1(t)');  %Cool!  this is hyperbolic!

