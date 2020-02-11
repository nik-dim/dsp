% MEROS 1o

% 1.1
filename = 'touchpad.mat';
m = matfile(filename);
touchpad=m.touchpad;

font_size=24;
fs=8192;
n = 1 : 1000;
pause_time=1;

d0 = sin(touchpad(10,1).*n) + sin(touchpad(10,2).*n);
sound(d0,fs,16);
pause(pause_time);
figure()
plot(n,d0);
title('d_{0}','FontSize',font_size);
xlabel('samples(n)','FontSize',font_size);
ylabel('amplitude','FontSize',font_size);

d1 = sin(touchpad(1,1).*n) + sin(touchpad(1,2).*n);
sound(d1,fs,16);
pause(pause_time);
figure()
plot(n,d1);
title('d_{1}','FontSize',font_size);
xlabel('samples(n)','FontSize',font_size);
ylabel('amplitude','FontSize',font_size);

d2 = sin(touchpad(2,1).*n) + sin(touchpad(2,2).*n);
sound(d2,fs,16);
pause(pause_time);
figure()
plot(n,d2);
title('d_{2}','FontSize',font_size);
xlabel('samples(n)','FontSize',font_size);
ylabel('amplitude','FontSize',font_size);

d3 = sin(touchpad(3,1).*n) + sin(touchpad(3,2).*n);
sound(d3,fs,16);
pause(pause_time);
figure()
plot(n,d3);
title('d_{3}','FontSize',font_size);
xlabel('samples(n)','FontSize',font_size);
ylabel('amplitude','FontSize',font_size);

d4 = sin(touchpad(4,1).*n) + sin(touchpad(4,2).*n);
sound(d4,fs,16);
pause(pause_time);
figure()
plot(n,d4);
title('d_{4}','FontSize',font_size);
xlabel('samples(n)','FontSize',font_size);
ylabel('amplitude','FontSize',font_size);

d5 = sin(touchpad(5,1).*n) + sin(touchpad(5,2).*n);
sound(d5,fs,16);
pause(pause_time);
figure()
plot(n,d5);
title('d_{5}','FontSize',font_size);
xlabel('samples(n)','FontSize',font_size);
ylabel('amplitude','FontSize',font_size);

d6 = sin(touchpad(6,1).*n) + sin(touchpad(6,2).*n);
sound(d6,fs,16);
pause(pause_time);
figure()
plot(n,d6);
title('d_{6}','FontSize',font_size);
xlabel('samples(n)','FontSize',font_size);
ylabel('amplitude','FontSize',font_size);

d7 = sin(touchpad(7,1).*n) + sin(touchpad(7,2).*n);
sound(d7,fs,16);
pause(pause_time);
figure()
plot(n,d7);
title('d_{7}','FontSize',font_size);
xlabel('samples(n)','FontSize',font_size);
ylabel('amplitude','FontSize',font_size);

d8 = sin(touchpad(8,1).*n) + sin(touchpad(8,2).*n);
sound(d8,fs,16);
pause(pause_time);
figure()
plot(n,d8);
title('d_{8}','FontSize',font_size);
xlabel('samples(n)','FontSize',font_size);
ylabel('amplitude','FontSize',font_size);

d9 = sin(touchpad(9,1).*n) + sin(touchpad(9,2).*n);
sound(d9,fs,16);
figure()
plot(n,d9);
title('d_{9}','FontSize',font_size);
xlabel('samples(n)','FontSize',font_size);
ylabel('amplitude','FontSize',font_size);



    

