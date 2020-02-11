% meros 2.2 askhsh B
%___________________

[y_beamformer, Fs] = audioread('real_ds.wav');
[source, Fs] = audioread('Material\MicArrayRealSignals\source.wav');
[sensor_0, Fs] = audioread('Material\MicArrayRealSignals\sensor_0.wav');
[sensor_1, Fs] = audioread('Material\MicArrayRealSignals\sensor_1.wav');
[sensor_2, Fs] = audioread('Material\MicArrayRealSignals\sensor_2.wav');
[sensor_3, Fs] = audioread('Material\MicArrayRealSignals\sensor_3.wav');
[sensor_4, Fs] = audioread('Material\MicArrayRealSignals\sensor_4.wav');
[sensor_5, Fs] = audioread('Material\MicArrayRealSignals\sensor_5.wav');
[sensor_6, Fs] = audioread('Material\MicArrayRealSignals\sensor_6.wav');

N = 7;
Fs = 48000; %Hz
font = 24;
len = 2 * length(y_beamformer) - 1 ;

window_length = 0.03*Fs;
o = ones(window_length,1);
window = hamming(window_length,'symmetric');
overlap = 0.75;
w_p = hamming(0.005*Fs,'periodic');

% ypoerwthma 1
v = y_beamformer(1:window_length);
[v_PS,fs] = pwelch(v,w_p,[],2*length(v)-1,Fs);
y_framed = buffer(y_beamformer, window_length, overlap*window_length,'nodelay');
[m,numberOfWindows] = size(y_framed);
next = (1-overlap) * window_length;
out = zeros(next*numberOfWindows,1); %initialization
for k = 1:(numberOfWindows-3)
    sig = y_framed(:,k) .* window;
    sig_PS = pwelch(sig,w_p,[],2*length(v)-1,Fs);
    H_w = o - (v_PS ./ sig_PS);
    Sig = fft(sig);
    Y_out = Sig .* H_w;
    y_out = real(ifft(Y_out,length(Y_out)));
    for j = 1 : window_length
        out(j+(k-1)*next) = out(j+(k-1)*next) + y_out(j);
    end
end
audiowrite('real_mmse.wav',out,Fs);  %PARADOTEO

% ypoerwthma 2
%spectrograms
    figure(1)
spectrogram(source,[],[],[],Fs);
colormap jet;
colorbar('off');
xlabel('Frequency(KHz)','FontSize',font);
ylabel('Time(sec)','FontSize',font);
title('source','FontSize',font)
    figure(2)
spectrogram(sensor_3,[],[],[],Fs);
colormap jet; 
colorbar('off');
xlabel('Frequency(KHz)','FontSize',font);
ylabel('Time(sec)','FontSize',font);
title('sensor__3','FontSize',font)
    figure(3)
spectrogram(y_beamformer,[],[],[],Fs);
colormap jet; 
colorbar('off');
xlabel('Frequency(KHz)','FontSize',font);
ylabel('Time(sec)','FontSize',font);
title('Beamformer output=Wiener input','FontSize',font)
    figure(4)
spectrogram(out,[],[],[],Fs);
colormap jet; 
colorbar('off');
xlabel('Frequency(KHz)','FontSize',font);
ylabel('Time(sec)','FontSize',font);
title('Wiener output','FontSize',font)
%waveforms
t = linspace(1,length(source)/Fs,length(source));
    figure()
plot(t,source);
axis([1 max(t) min(source) max(source)]);
xlabel('time(sec)','FontSize',font)
title('source','FontSize',font)
    figure()
plot(t,sensor_3);
axis([1 max(t) min(sensor_3) max(sensor_3)]);
xlabel('time(sec)','FontSize',font)
title('sensor__3','FontSize',font)
    figure()
t0 = linspace(1,length(y_beamformer)/Fs,length(y_beamformer));
plot(t0,real(y_beamformer)); 
axis([1 max(t) min(y_beamformer) max(y_beamformer)]);
xlabel('time(sec)','FontSize',font)
title('Beamformer output=Wiener input','FontSize',font)
   figure()
t1 = linspace(1,length(out)/Fs,length(out));
plot(t1,real(out)); 
axis([1 max(t) min(out) max(out)]);
xlabel('time(sec)','FontSize',font)
title('Wiener output','FontSize',font)


% ypoerwthma 3
ssnr_in = ssnr_uncorrelated(y_beamformer,Fs);
ssnr_out =  ssnr_uncorrelated(out,Fs);

% ypoerwthma 4
ssnr_average = (ssnr_uncorrelated(sensor_0,Fs) + ssnr_uncorrelated(sensor_1,Fs) + ssnr_uncorrelated(sensor_2,Fs) + ssnr_uncorrelated(sensor_3,Fs) + ssnr_uncorrelated(sensor_4,Fs) + ssnr_uncorrelated(sensor_5,Fs) + ssnr_uncorrelated(sensor_6,Fs))/N; 

