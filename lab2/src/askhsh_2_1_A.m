% meros 2.1 askhsh A
%___________________

% ypoerwthma 1
% According to equation (16):
font = 24;
c = 340;
N = 7;
d = 0.04;

[source, Fs] = audioread('Material\MicArraySimulatedSignals\source.wav');
[sensor_0, Fs] = audioread('Material\MicArraySimulatedSignals\sensor_0.wav');
[sensor_1, Fs] = audioread('Material\MicArraySimulatedSignals\sensor_1.wav');
[sensor_2, Fs] = audioread('Material\MicArraySimulatedSignals\sensor_2.wav');
[sensor_3, Fs] = audioread('Material\MicArraySimulatedSignals\sensor_3.wav');
[sensor_4, Fs] = audioread('Material\MicArraySimulatedSignals\sensor_4.wav');
[sensor_5, Fs] = audioread('Material\MicArraySimulatedSignals\sensor_5.wav');
[sensor_6, Fs] = audioread('Material\MicArraySimulatedSignals\sensor_6.wav');

len = length(sensor_0);

for n=1:N
    T_sensor(n) = -(n-1-(N-1)/2)*d*cos(pi/4)/c; 
end
%T_source = -(3-(N-1)/2)*d*cos(pi/4)*Fs/c;

w = linspace(0,2*pi,len);

Y_help_0 = fft(sensor_0,len) .* exp(-1i*w.*T_sensor(1)*Fs)';
Y_help_1 = fft(sensor_1,len) .* exp(-1i*w.*T_sensor(2)*Fs)';
Y_help_2 = fft(sensor_2,len) .* exp(-1i*w.*T_sensor(3)*Fs)';
Y_help_3 = fft(sensor_3,len) .* exp(-1i*w.*T_sensor(4)*Fs)';
Y_help_4 = fft(sensor_4,len) .* exp(-1i*w.*T_sensor(5)*Fs)';
Y_help_5 = fft(sensor_5,len) .* exp(-1i*w.*T_sensor(6)*Fs)';
Y_help_6 = fft(sensor_6,len) .* exp(-1i*w.*T_sensor(7)*Fs)';

Y_beamformer = Y_help_0+Y_help_1+Y_help_2+Y_help_3+Y_help_4+Y_help_5+Y_help_6;
y_beamformer = real( ifft(Y_beamformer/N,len));
audiowrite('sim_ds.wav',y_beamformer,Fs);  %PARADOTEO
%_________________________________________________

audiowrite('check_if_only_noise.wav',y_beamformer - source,Fs);


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
axis([1 max(t) min(real(y_beamformer)) max(real(y_beamformer))]);
xlabel('time(sec)','FontSize',font)
title('Beamformer output','FontSize',font)

% ypoerwthma 3

snr_3 = snr (source , sensor_3 - source); 
snr_out = snr (source , y_beamformer - source); 
fprintf('%d\n', snr_3 ) ;
fprintf('%d\n',snr_out);

  