% 2.1.a

font_size=24;

fs=1000;
t = 0 : 1/fs : 2; 
x2 = 1.5*cos(2.*pi.*80.*t);

for i=1:length(x2)
   white_noise(i)=0.15*randn; 
end
mo=mean(white_noise);
for i=1:length(x2)
   x2(i)=x2(i)+(white_noise(i)-mo); %so that the mean of the white Gaussian noise is equal to zero
end

x2(0.625*fs)=x2(0.625*fs)+2;
x2(0.750*fs)=x2(0.750*fs)+2;

horizontal_axis=0:2*fs;
plot(horizontal_axis,x2)
title({'Sampling of' ; 'x(t)=1.5cos(2\pi80t)+0.15WhiteNoise(t)+2\delta(t-0.625)+2\delta(t-0.750)';' with F_{s}=1000Hz '},'FontSize',font_size)
ylabel('x[n]','FontSize',font_size);
xlabel('samples(n)','FontSize',font_size);

