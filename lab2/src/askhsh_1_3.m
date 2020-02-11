% meros 1_4 askhsh 3
%___________________

% According to equation (19):
font = 20;
width = 2;
f = 2000; %f=2KHz 
c = 340;
theta = -pi:0.01:pi;
N = 8;
d = 0.04;
temp = pi.*f.*(cos(theta))/c;

figure()


theta_s = 0;
temp = pi.*f.*d.*(cos(theta) - cos(theta_s))/c;
B = sin(N.*temp)./(N.*sin(temp));
plot1 = semilogr_polar(theta, abs(B));
plot1.LineWidth = width;
title({'\theta_{s}  = 0 \circ'},'FontSize',font)
figure()
theta_s = pi/4;
temp = pi.*f.*d.*(cos(theta) - cos(theta_s))/c;
B = sin(N.*temp)./(N.*sin(temp));
plot2 = semilogr_polar(theta, abs(B), 'r');
plot2.LineWidth = width;
title({'\theta_{s} = 45 \circ'},'FontSize',font)
figure()
theta_s = pi/2;
temp = pi.*f.*d.*(cos(theta) - cos(theta_s))/c;
B = sin(N.*temp)./(N.*sin(temp));
plot3 = semilogr_polar(theta, abs(B), 'g');
plot3.LineWidth = width;
title({'\theta_{s}  = 90 \circ'},'FontSize',font)
