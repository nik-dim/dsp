%2.1.c

font_size=24;
[s,f]=wavescales('morl',fs);

cwtstruct = cwtft({x1,1/fs},'Scales',s,'Wavelet','morl');
h=surf(t,f,abs(cwtstruct.cfs));
title('Wavelet Transform surface plot of x[n]','FontSize',font_size)
set(h,'LineStyle',':');
xlabel('time(t)','FontSize',font_size);
ylabel('frequency(f)','FontSize',font_size);
zlabel('|DT-CWT(x[n])|','FontSize',font_size);