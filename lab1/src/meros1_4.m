% 1.4

%https://www.mathworks.com/matlabcentral/newsreader/view_thread/247723
%http://dsp.stackexchange.com/questions/9465/how-to-apply-hamming-window

L=length(y);
h=hamming(1000);
for i = 1:8
    
    beginning=(i-1).*(1000+100)+1;
    ending=(i-1).*(1000+100)+1000;
    y_used=y(beginning:ending);
    y_used= y_used.*transpose(h);
    Y_USED=fft(y_used,2000);%2000>=2*1000
   
    figure(i)      
    X_axis = linspace(0,2*pi,length(Y_USED));
    plot(X_axis,abs(Y_USED));
    title({'DFT of signal 06228045 with rectangular Hamming windows'; ['windowed signal for window number:',num2str(i)]},'FontSize', font_size);
    xlabel('\omega','FontSize', font_size);   
end