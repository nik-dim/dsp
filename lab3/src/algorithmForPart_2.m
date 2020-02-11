% algorithmForPart_2
%___________________
M=32;
L=2*M;
L1=512;
[lengthOfWindows,numberOfWindows] = size(buffered_signal);
total_bits = 0; %initialization
for window_number = 1:numberOfWindows
    x_1 = zeros(1,639); %639 = L1 + L + L -1
    x_2 = zeros(1,639);
    for k=1:M
        for n=1:L
            h(n) = sin(((n-1)+0.5)*pi/(2*M))* sqrt(2/M)* cos((2*(n-1)+M+1)*(2*(k-1)+1)*pi/(4*M));
        end
        for n=1:L
            g(n) = h(L-n+1);
        end
        % step 2.1
        u = conv(h,buffered_signal(:,window_number));
        y = downsample(u,M);
        heeeelp(:,window_number) = u;
        % step 2.2
        interval = 256/M;
        leng = 576 + L - 1;
        beginning = (k-1)*interval+1;
        ending = k*interval;
        help1(k) = min(T_g(beginning:ending));
        B(k,window_number) = ceil(15 - log2(help1(k))); %gia na vrw to MO
        total_bits = total_bits + B(k,window_number)*(length(y)) + 32; 
        range = max(y)-min(y);
        Delta_1 = range/2^B(k,window_number);
        Delta_2 = 2/2^8; %2 = +1-(-1)
        %XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        for j=1:18  %   (512+64)/32=18
            y_new_1(j) = Delta_1*floor(y(j)/Delta_1 + 0.5);
            for i = 1 :256
                quantized_values(i) = -1 + (i-1)*Delta_2;
                dif(i,j) = abs( y(j) - quantized_values(i));
            end
        end
        for j = 1:18
            [val,index] = min(dif(:,j));
            y_q_uniform(j) = quantized_values(index);
        end
        %XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
        w_1 = upsample(y_new_1,M);
        w_2 = upsample(y_q_uniform,M);
        x_1 = x_1 + conv(g,w_1);
        x_2 = x_2 + conv(g,w_2);
    end
    x_quantized_1(:,window_number) = x_1;
    x_quantized_2(:,window_number) = x_2;
end
start = window_number*lengthOfWindows;
for window_number = 1:numberOfWindows  %XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    for j=1:leng
        output_1(window_number*512 + j) = 0;
        output_2(window_number*512 + j) = 0;
    end
end
for window_number = 1:numberOfWindows
    for j=1:leng
        output_1((window_number-1)*512 + j) =  output_1((window_number-1)*512 + j) + x_quantized_1(j,window_number);
        output_2((window_number-1)*512 + j) =  output_2((window_number-1)*512 + j) + x_quantized_2(j,window_number);
    end
end
audiowrite('output_adaptive_quantizer.wav',output_1,Fs);
audiowrite('output_uniform_quantizer.wav',output_2,Fs);

