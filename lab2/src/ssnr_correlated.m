function  out  = ssnr_correlated( sig , Fs )
% Summary: calculates the SSNR of a signal

threshold = -20; %dB
L = 0.03 * Fs; %length of window
M = floor(length(sig)/L);
noise = sig(1:L);
ssnr_s = 0;
for i=1:M
    frame_s = sig( (i-1)*L +1  : i*L );
    local_SNR = snr(frame_s - noise,noise);
    if ((local_SNR>= threshold)) % afthaireto
        if ((local_SNR>=35))
            ssnr_s = ssnr_s + 35;
        else
            ssnr_s = ssnr_s + local_SNR;
        end
    else
        ssnr_s = ssnr_s + threshold;
    end
end
out = ssnr_s / M;
end

