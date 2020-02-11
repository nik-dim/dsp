% meros 1_4 askhsh 1
%___________________

% According to equation (19):
% theta_s = 0 => cos(theta_s) = 0
font = 20;
width = 3;
f = 2000; %f=2KHz 
c = 340;
theta = 0:0.01:pi;
d = 0.04;
N = 16;
temp = pi.*f.*d.*(cos(theta))/c;
B = sin(N.*temp)./(N.*sin(temp));

figure(1)

plot1 = semilogr_polar(theta, abs(B));
plot1.LineWidth = width;
title({'N=16'},'FontSize',font)
figure(2)
N = 8;
B = sin(N.*temp)./(N.*sin(temp));
plot2 = semilogr_polar(theta, abs(B), 'r');
plot2.LineWidth = width;
title({'N=8'},'FontSize',font)
    
figure(3)
N = 4;
B = sin(N.*temp)./(N.*sin(temp));
plot3 = semilogr_polar(theta, abs(B), 'g');
plot3.LineWidth = width;

title({'N=4'},'FontSize',font)


