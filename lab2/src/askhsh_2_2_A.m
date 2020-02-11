% meros 2.2 askhsh A
%___________________

font = 24;
c = 340;
N = 7;
d = 0.08;

[source, Fs] = audioread('Material\MicArrayRealSignals\source.wav');
[sensor_0, Fs] = audioread('Material\MicArrayRealSignals\sensor_0.wav');
[sensor_1, Fs] = audioread('Material\MicArrayRealSignals\sensor_1.wav');
[sensor_2, Fs] = audioread('Material\MicArrayRealSignals\sensor_2.wav');
[sensor_3, Fs] = audioread('Material\MicArrayRealSignals\sensor_3.wav');
[sensor_4, Fs] = audioread('Material\MicArrayRealSignals\sensor_4.wav');
[sensor_5, Fs] = audioread('Material\MicArrayRealSignals\sensor_5.wav');
[sensor_6, Fs] = audioread('Material\MicArrayRealSignals\sensor_6.wav');

% ypoerwthma 1
% theta = 90 => T_sensor[i] = 0 ,i=0,1,2,...6
y_beamformer = (sensor_0 +  sensor_1 +  sensor_2+  sensor_3 +  sensor_4 +  sensor_5 +  sensor_6)/N; 
audiowrite('real_ds.wav', y_beamformer, Fs);  %PARADOTEO

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
title('Beamformer output','FontSize',font)

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
plot(t,real(y_beamformer)); 
axis([1 max(t) min(y_beamformer) max(y_beamformer)]);
xlabel('time(sec)','FontSize',font)
title('Beamformer output','FontSize',font)

% ypoerwthma 3

ssnr_y_uncorrelated = ssnr_uncorrelated(y_beamformer,Fs);
ssnr_sensor_3_uncorrelated = ssnr_uncorrelated(sensor_3,Fs);

ssnr_y_correlated = ssnr_correlated(y_beamformer,Fs);
ssnr_sensor_3_correlated = ssnr_correlated(sensor_3,Fs);


