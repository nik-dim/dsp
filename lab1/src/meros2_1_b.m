% 2.1.b

font_size=24;
window=fs*0.04;
noverlap=fs*0.02;
[s,f,time]=spectrogram(x1,window,noverlap,100,fs); %100 >2*40
h=surf(time,f,abs(s));
set(h,'LineStyle',':'); %https://www.mathworks.com/matlabcentral/answers/100118-why-is-my-surface-black-when-plotting-with-the-surf-command-regardless-of-the-color-map-chosen
title('STFT surface plot of x[n]','FontSize',font_size)
xlabel('time(t)','FontSize',font_size);
ylabel('frequency(f)','FontSize',font_size);
zlabel('|STFT(x[n])|','FontSize',font_size);

