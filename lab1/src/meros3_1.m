%3.1

font_size=24;
[y,Fs] = audioread('speech_utterance.wav');
t=0:8/length(y):8-1/length(y);
for i=20:30 %20ms-30ms
    L=i*16; %20ms*16KHz :  hamming window samples = fs*(window length)
    w=hamming(L);
    z=zeros(1,length(y)-L);
    win=[transpose(w) z];
    
    figure(i)
    E=conv((w.^2),(y.^2));
    subplot(2,1,1);
    plot(t,abs(E(1:length(y))));
    title(['Short-Time Energy for Hamming Window length=' num2str(i) 'ms'],'FontSize',font_size);
    xlabel('time(s)','FontSize',font_size);
    ylabel('E_{n}','FontSize',font_size)
  
    
    subplot(2,1,2);
    sig=abs(sign([transpose(y) 0])-sign([0 transpose(y)]));%explanation: see report
    Z=conv(w,sig);
    plot(t,abs(Z(1:length(y))));
    title(['Zero Crossing Rate for Hamming Window length=' num2str(i) 'ms'],'FontSize',font_size);
    xlabel('time(s)','FontSize',font_size);
    ylabel('Z_{n}','FontSize',font_size)
    
 
end
