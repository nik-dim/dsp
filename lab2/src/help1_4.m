% help1_4
% this script is used to produce the magnitude diagram of a delay-and-sum beam pattern 
% that has grating lobes
font = 20;
width = 2;
f = 2000; %f=2KHz 
c = 340;
theta = 0:0.01:pi;
N = 8;
d = 0.16;
theta_s = pi/3;
temp = pi.*f.*(cos(theta) - cos(theta_s))/c;


figure(1)

B = sin(N.*d.*temp)./(N.*sin(d.*temp));
plot3 = semilogr_polar(theta, abs(B), 'g');
plot3.LineWidth = width;
title({'d = 16cm , \theta_{s} = 60 \circ'},'FontSize',font)