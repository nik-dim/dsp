% algorithmForPart_1
%___________________

% step 1.0
clear all;
[sig,Fs] = audioread('music.wav');
signal = ( sig(:,1) + sig (:,2) )/2;
normalized_signal = signal / max(abs(signal)) ; 


% step 1.1
nfft = 512;
PN = 90.302;
for i = 1:(nfft/2)
    f(i) = ((i/nfft)*(Fs));
    bark(i) = 13*atan(0.00076*f(i)) + 3.5*atan((f(i)/7500)^2);
    T_q(i) = 3.64*((f(i)/1000)^(-0.8)) - 6.5*exp(-0.6*((f(i)/1000 - 3.3))^2) + 0.001*((f(i)/1000)^4);
end

hanning_window = hann (nfft);
buffered_signal = buffer(normalized_signal,nfft,0,'nodelay');
[m,n] = size(buffered_signal);
for kapa = 1 : n
    windowed_signal(:,kapa) = buffered_signal(:,kapa).*hanning_window;
end
fft_windowed_signal = fft(windowed_signal,nfft);
for kapa = 1 : n
    PSD(1:256,kapa) = PN + 20*log10(abs(fft_windowed_signal(1:256,kapa)));
end

% step 1.2
for kapa = 1 : n
    input = PSD(:,kapa);
    P_TM(:,kapa) = find_P_tm(input,PSD(:,kapa));
end

for kapa = 1 : n
    P_NM(:,kapa) = findNoiseMaskers(PSD(:,kapa),P_TM(:,kapa),bark);
end 
  
% step 1.3
for kapa = 1 : n
    temp1 = P_TM(:,kapa);
    temp1 = temp1';
    temp2 = P_NM(:,kapa);
    temp2 = temp2';
   [P_TM_checked(:,kapa),P_NM_checked(:,kapa)] = checkMaskers(temp1,temp2,T_q,bark);
end
% step 1.4
T_g = zeros(m/2,n);
for kapa = 1 : n
    T_TM = zeros(m/2,m/2);
    T_NM = zeros(m/2,m/2);
    for j = 1 : m/2
        if(P_TM_checked(j,kapa)>0)
            lower_limit = bark(j) - 3;
            upper_limit = bark(j) + 8;
            for i = 1 : m/2
                if(bark(i)>=lower_limit & bark(i)<= upper_limit)
                    Delta_b = bark(i) - bark(j);
                    if(Delta_b>=-3 & Delta_b<-1)
                        SF = 17*Delta_b -0.4*P_TM_checked(j,kapa) + 11;
                    elseif (Delta_b>=-1 & Delta_b<0)
                        SF = (0.4*P_TM_checked(j,kapa) + 6 )*Delta_b;
                    elseif (Delta_b>=0 & Delta_b<1)
                        SF = -17*Delta_b;
                    elseif (Delta_b>=1 & Delta_b<8)
                        SF = (0.15*P_TM_checked(j,kapa)-17)*Delta_b -0.15*P_TM_checked(j,kapa);
                    end
                    T_TM(i,j) = T_TM(i,j) + P_TM_checked(j,kapa) - 0.275*bark(j) + SF - 6.025;
                end
            end
        end
        if(P_NM_checked(j,kapa)>0)
            lower_limit = bark(j) - 3;
            upper_limit = bark(j) + 8;
            for i = 1 : m/2
                if(bark(i)>=lower_limit & bark(i)<= upper_limit)
                    Delta_b = bark(i) - bark(j);
                    if(Delta_b>=-3 & Delta_b<-1)
                        SF = 17*Delta_b -0.4*P_NM_checked(j,kapa) + 11;
                    elseif (Delta_b>=-1 & Delta_b<0)
                        SF = (0.4*P_NM_checked(j,kapa) + 6 )*Delta_b;
                    elseif (Delta_b>=0 & Delta_b<1)
                        SF = -17*Delta_b;
                    elseif (Delta_b>=1 & Delta_b<8)
                        SF = (0.15*P_NM_checked(j,kapa)-17)*Delta_b -0.15*P_NM_checked(j,kapa);
                    end
                    T_NM(i,j) = T_NM(i,j) + P_NM_checked(j,kapa) - 0.175*bark(j) + SF - 2.025;
                end
            end
        end
    end
    % step 1.5
    for i = 1 : m/2
        a = 10^(0.1*T_q(i));
        b=0;
        c=0;
        for j = 1 : m/2
            if(P_TM_checked(j,kapa)>0)
                b = b + 10^(0.1*T_TM(i,j));
            end
            if(P_NM_checked(j,kapa)>0)
                c = c + 10^(0.1*T_NM(i,j));
            end
        end
        T_g(i,kapa) = 10*log10(a+b+c);
    end
end

