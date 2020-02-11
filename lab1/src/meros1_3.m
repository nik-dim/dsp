% 1.3
%AM=06228045

z=zeros(1,100);
y=[d0 z d6 z d2 z d2 z d8 z d0 z d4 z d5]; %union of necessary signals
audiowrite( 'tone_sequence.wav',y,fs,'BitsPerSample',32);
plot(y);
title('tone sequence.wav', 'FontSize', font_size);
xlabel('samples(n)','FontSize', font_size)
