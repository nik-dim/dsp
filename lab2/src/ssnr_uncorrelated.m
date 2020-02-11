function  out  = ssnr_uncorrelated( sig , Fs )
% Summary: calculates the SSNR of a signal
% given that it is UNCORRELATED with the 
% noise signal 

threshold = -20; %dB
L = 0.03 * Fs;
M = floor(length(sig)/L);
noise = sig(1:L);
noise_e = sum(noise.^2);
ssnr_y = 0;
for i=1:M
    frame_s = sig( (i-1)*L +1  : i*L );
    frame_s_e = sum((frame_s).^2);
    temp = abs(frame_s_e-noise_e) ./ noise_e;
    local_SNR = 10*log10(temp);
    if ((local_SNR>= threshold)) % afthaireto
        if ((local_SNR>=35))
            ssnr_y = ssnr_y + 35;
        else
            ssnr_y = ssnr_y + local_SNR;
        end
    else
        ssnr_y = ssnr_y + threshold;
    end
end
out = ssnr_y / M;
end

