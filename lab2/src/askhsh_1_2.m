% meros 1_4 askhsh 2
%___________________

% According to equation (19):
% theta_s = 0 => cos(theta_s) = 0
font = 20;
width = 2;
f = 2000; %f=2KHz 
c = 340;
theta = 0:0.01:pi;
N = 8;
temp = pi.*f.*(cos(theta))/c;

figure(1)

d = 0.04;
B = sin(N.*d.*temp)./(N.*sin(d.*temp));
plot1 = semilogr_polar(theta,abs(B));
plot1.LineWidth = width;
title({'d = 4cm'},'FontSize',font)
figure(2)
d = 0.08;
B = sin(N.*d.*temp)./(N.*sin(d.*temp));
plot2 = semilogr_polar(theta, abs(B), 'r');
plot2.LineWidth = width;
title({'d = 8cm'},'FontSize',font)
figure(3)
d = 0.16;
B = sin(N.*d.*temp)./(N.*sin(d.*temp));
plot3 = semilogr_polar(theta, abs(B), 'g');
plot3.LineWidth = width;
title({'d = 16cm'},'FontSize',font)
