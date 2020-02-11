%2.2.c

font_size=24;

[s,f]=wavescales('morl',fs);

cwtstruct = cwtft({x2,1/fs},'Scales',s,'Wavelet','morl');
contour(t,f,abs(cwtstruct.cfs));
title('WT contour plot of x[n]','FontSize',font_size)
xlabel('time(t)','FontSize',font_size);
ylabel('frequency(f)','FontSize',font_size);