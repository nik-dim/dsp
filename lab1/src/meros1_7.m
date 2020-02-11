% 1.7

input_signal = load('my_touchtones.mat');
signal_1=input_signal.easySig;
signal_2=input_signal.hardSig;

result1=ttdecode(signal_1);
result2=ttdecode(signal_2);

disp(result1);
disp(result2);
