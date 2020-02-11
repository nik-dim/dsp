% fisrt run PARADOTEA_meros1 
run('algorithmForPart_2');
font_small = 18;
font = 24;
arxika_bits = 16*length(normalized_signal);
compression_ratio_adaptive = arxika_bits / total_bits;
mse = 0;
for i = 1 : length(signal)
    mse = mse + abs(normalized_signal(i) - output_1(63+i))^2;
end    
mse = mse/length(signal);

mse_uniform = 0;
for i = 1 : length(signal)
    mse_uniform = mse_uniform + abs(normalized_signal(i) - output_2(63+i))^2;
end    
mse_uniform = mse_uniform/length(signal);
time = linspace(0,length(normalized_signal)/Fs,length(normalized_signal));
figure()
plot(time,output_1(1:length(normalized_signal)));
xlabel('time(sec)', 'FontSize', font_small);
ylabel('Magnitude', 'FontSize', font_small);
title('Output Using Adaptive Quantizer','FontSize', font)
axis([0 length(normalized_signal)/Fs min(output_1) max(output_1)]);
figure()
plot(time,output_2(1:length(normalized_signal)));
xlabel('Time(sec)', 'FontSize', font_small);
ylabel('Magnitude', 'FontSize', font_small);
title('Output Using Uniform Quantizer','FontSize', font)
axis([0 length(normalized_signal)/Fs min(output_2) max(output_2)]);
figure()
plot(time,normalized_signal);
xlabel('Time(sec)', 'FontSize', font_small);
ylabel('Magnitude', 'FontSize', font_small);
title('normalized Input','FontSize', font)
axis([0 length(normalized_signal)/Fs min(normalized_signal) max(normalized_signal)]);

% ERRORS
figure()
plott = output_2(64:(length(normalized_signal)+63))-normalized_signal';
plot(time,plott);
xlabel('Time(sec)', 'FontSize', font_small);
ylabel('Magnitude', 'FontSize', font_small);
title('Error of Output Using Uniform Quantizer','FontSize', font)
axis([0 length(normalized_signal)/Fs min(plott) max(plott)]);
figure()
plott = output_1(64:(length(normalized_signal)+63))-normalized_signal';
plot(time,plott);
xlabel('Time(sec)', 'FontSize', font_small);
ylabel('Magnitude', 'FontSize', font_small);
title('Error of Output Using Adaptive Quantizer','FontSize', font)
axis([0 length(normalized_signal)/Fs min(plott) max(plott)]);
