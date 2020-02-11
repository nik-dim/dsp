%2.2.b

font_size=24;
n=1:2000;
window=fs*0.04;
noverlap=fs*0.02;
[s,f,time]=spectrogram(x2,window,noverlap,100,fs);
contour(time,f,abs(s));
title('STFT contour plot of x[n]','FontSize',font_size)
xlabel('time(t)','FontSize',font_size);
ylabel('frequency(f)','FontSize',font_size);
