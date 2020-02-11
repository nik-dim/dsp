%3.2

font_size=24;
[y2,Fs] = audioread('music.wav');
t=0:8/length(y2):8-1/length(y2);
for i=20:30 %20ms-30ms
    L=i*16; %20ms*16KHz :  hamming window samples = fs*(window length)
    w=hamming(L);
    z=zeros(1,length(y2)-L);
    win=[transpose(w) z];
    
    figure(i)
    
    E=conv((w.^2),(y2.^2));
    
    subplot(2,1,1);
    plot(transpose(t),abs(E(1:length(y2))));
  
    title(['Short-Time Energy for Hamming Window length=' num2str(i) 'ms'],'FontSize',font_size);
    xlabel('time(s)','FontSize',font_size);
    ylabel('E_{n}','FontSize',font_size);
      
    
    subplot(2,1,2);
    sig=abs(sign([transpose(y2) 0])-sign([0 transpose(y2)]));%explanation: see report
    Z=conv(w,sig);
    plot(abs(Z(1:length(y2))));
    title(['Zero Crossing Rate for Hamming Window length=' num2str(i) 'ms'],'FontSize',font_size);
    xlabel('time(s)','FontSize',font_size);
    ylabel('Z_{n}','FontSize',font_size);

 
end
