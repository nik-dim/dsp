% 1.2
font_size=20;
x_axis = linspace(0,2*pi,1000);

figure  
D3=fft(d3);
plot(x_axis,abs(D3));
title('D_{3}','FontSize',font_size)
ylabel('|D_{3}(f)|','FontSize',font_size);
xlabel('0 \leq \omega \leq 2\pi','FontSize',font_size);

figure
D7=fft(d7);
plot(x_axis,abs(D7));      
title('D_{7}','FontSize',font_size)
ylabel('|D_{7}(f)|','FontSize',font_size);
xlabel('0 \leq \omega \leq 2\pi','FontSize',font_size);
