% 2.1.a

font_size=24;
fs=1000;
t = 0 : 1/fs : 2; 
x1 = 1.5*cos(2.*pi.*80.*t)  + 2.5*sin(2.*pi.*150.*t) ;
for i=1:length(x1)
   white_noise(i)=0.15*randn; 
end
mo=mean(white_noise);
for i=1:length(x1)
   x1(i)=x1(i)+(white_noise(i)-mo); %so that the mean of the white Gaussian noise is equal to zero
end

horizontal_axis=0:2*fs;
plot(horizontal_axis,x1);
title({'Sampling of' ; 'x(t)=1.5cos(2\pi80t)+2.5sin(2\pi150t)+0.15WhiteNoise(t)';' with F_{s}=1000Hz'},'FontSize',font_size)
ylabel('x[n]','FontSize',font_size);
xlabel('samples(n)','FontSize',font_size);
