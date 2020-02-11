function [ answer ] = find_P_tm( input , p )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
temp(1) = 0;
temp(2) = 0;
for i = 3 : 250
    a = (input(i)>p(i-1) & input(i)>p(i+1) & (input(i)>p(i-2)+7) & (input(i)>p(i+2)+7) );
    
    if i<=62
        S_t = a ;
    elseif i<=126
        S_t = (a & (input(i)>p(i-3)+7) & (input(i)>p(i+3)+7));
    else
        b = ( a & (input(i)>p(i-3)+7) & (input(i)>p(i+3)+7) & (input(i)>p(i-4)+7) & (input(i)>p(i+4)+7) );
        c = b & (input(i)>p(i-5)+7) & (input(i)>p(i+5)+7) & (input(i)>p(i-6)+7) & (input(i)>p(i+6)+7) ;
        S_t = c;
    end
    
    if S_t == 1
        a = 10^(0.1*input(i-1));
        b = 10^(0.1*input(i));
        c = 10^(0.1*input(i+1));
        temp(i) = 10*log10(a+b+c);
    else
        temp(i) = 0;
    end
    
end
for i = 251 : 256
    temp(i) = 0;
end
answer = temp;
end

