font_size=24;
[y,Fs] = audioread('speech_utterance.wav');
t=0:8/length(y):8-1/length(y);
for i=20:10:30
    L=i*16;
    w=hamming(L);
    z=zeros(1,length(y)-L);
    win=[transpose(w) z];
   
    E=conv((w.^2),(y.^2));
    hold on
    plot(t,abs(E(1:length(y))));
    title(['Short-Time Energy for Hamming Window length=20ms and 30ms'],'FontSize',font_size);
    xlabel('time(s)','FontSize',font_size);
    ylabel('E_{n}','FontSize',font_size)
    [out1,out2]=legend({'20ms','30ms'},'FontSize',font_size);
    set(out2,'linewidth',5);
    hold off
    
end
figure()
for i=20:10:30
    L=i*16;
    w=hamming(L);
    z=zeros(1,length(y)-L);
    win=[transpose(w) z];
   
    hold on
    sig=abs(sign([transpose(y) 0])-sign([0 transpose(y)]));
    Z=conv(w,sig);
    plot(t,abs(Z(1:length(y))));
    title(['Zero Crossing Rate for Hamming Window length=20ms and 30ms'],'FontSize',font_size);
    xlabel('time(s)','FontSize',font_size);
    ylabel('Z_{n}','FontSize',font_size)
    [out1,out2]=legend({'20ms','30ms'},'FontSize',font_size);
    set(out2,'linewidth',5);
    hold off
end
