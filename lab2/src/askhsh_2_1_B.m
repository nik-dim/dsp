% meros 2.1 askhsh B
%___________________
width = 1.5;
font = 24;
[source, Fs] = audioread('Material\MicArraySimulatedSignals\source.wav');
[sensor_3, Fs] = audioread('Material\MicArraySimulatedSignals\sensor_3.wav');
[y_beamformer, Fs] = audioread('sim_ds.wav');
s = source(0.75*Fs : 0.78*Fs);
x = sensor_3(0.75*Fs : 0.78*Fs);

l = 2 * length(s) -1 ;
% ypoerwthma 1
figure(1)
window = hamming(240,'periodic');
[s_PS,fs] = pwelch(s,window,[],l,Fs);
[x_PS,fs1] =  pwelch(x,window,[],l,Fs);
H_wiener = s_PS ./ x_PS;
pl = semilogy(fs,H_wiener);
axis([0 8000 min(10*log10(H_wiener)) max(10*log10(H_wiener))]);
pl.LineWidth = width;
title('H_{wiener}','FontSize',font);
xlabel('frequency','FontSize', font)
ylabel('dB','FontSize', font)

% ypoerwthma 2
figure(2)
n_sd = abs(1-H_wiener).^2;
pl = semilogy(fs,n_sd);
pl.LineWidth = width;
axis([0 8000 min(n_sd) max(n_sd)]);
title('n_{sd}', 'FontSize',font);
xlabel('frequency','FontSize', font)
ylabel('dB','FontSize', font)


% ypoerwthma 3
figure(3)
hold on
%s
pl = plot(fs, 10*log10(s_PS), 'm');
pl.LineWidth = width;
%x
pl = plot(fs, 10*log10(x_PS), 'r');
pl.LineWidth = width;
%y
X = fft(x);
Y = X .* H_wiener;
y = real(ifft(Y,length(s)));
[y_PS,fs] = pwelch(y,window,[],l,Fs);
pl = plot(fs, 10*log10(y_PS), 'k');
pl.LineWidth = width;
%v
[v_PS,fs] = pwelch(x-s,window,[],l,Fs);
pl = plot(fs, 10*log10(v_PS), 'g');
pl.LineWidth = width;
axis([0 8000 min(10*log10(x_PS)) max(10*log10(x_PS))]);
title('Power Spectrum Analysis','FontSize',font);
legend({'Source Signal','Central Microphone','Wiener Filter Output','Noise Signal'},'FontSize',font)
xlabel('frequency','FontSize', font)
ylabel('dB','FontSize', font)
hold off

% ypoerwthma 4
snr_wiener = snr ( s , y-s);
snr_x = snr(s, x-s);
snr_y_beamformer = snr(s, y_beamformer(0.75*Fs : 0.78*Fs)-s);

figure(4)
hold on
%s
pl = plot(fs1, 10*log10(s_PS), 'm');
pl.LineWidth = width;
%x
pl = plot(fs1, 10*log10(x_PS), 'r');
pl.LineWidth = width;
%y_wiener
[y_PS,fs] = pwelch(y,window,[],l,Fs);
pl = plot(fs, 10*log10(y_PS), 'y');
pl.LineWidth = width;
%y_beamformer
[y_beamformer_PS,fs2] = pwelch(y_beamformer(0.75*Fs : 0.78*Fs),window,[],l,Fs); 
pl = plot(fs2, 10*log10(y_beamformer_PS),'k');
pl.LineWidth = width;

axis([0 8000 min(10*log10(x_PS)) max(10*log10(x_PS))]);
title('Power Spectrum Comparison','FontSize',font);
legend({'Source Signal','Central Microphone','Wiener Filter Output','Beamformer Output'},'FontSize',font)

xlabel('frequency','FontSize', font)
ylabel('dB','FontSize', font)
hold off
