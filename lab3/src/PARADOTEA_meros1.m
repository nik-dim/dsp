run('algorithmForPart_1');
font = 24;
font_small = 18;
width = 2;

p = PSD(:,1);
ptm = P_TM(:,1);
ptm(ptm==0)=nan;
pnm = P_NM(:,1);
pnm(pnm==0)=nan;

ptm_checked = P_TM_checked(:,1);
ptm_checked(ptm_checked==0)=nan;
pnm_checked = P_NM_checked(:,1);
pnm_checked(pnm_checked==0)=nan;

% PARADOTEA
figure(1)
plott = semilogx(f,(T_q)); 
plott.LineWidth = width ;
title( 'Absolute Threshold of Hearing T_{q}', 'FontSize', font);
xlabel('Frequency (Hz)', 'FontSize', font_small);
ylabel('Magnitude', 'FontSize', font_small);
axis([86 22500 min(T_q) max(T_q)])

figure(7)
pl = normalized_signal(1:512);
plott=plot(pl);
plott.LineWidth = width ;
title( 'Frame no. 1', 'FontSize', font);
xlabel('Samples', 'FontSize', font_small);
ylabel('Magnitude', 'FontSize', font_small);
axis([1 512 min(pl) max(pl)])


figure(2)
subplot(2,1,1)
hold on
stem(f,ptm,'x','LineWidth', width,'MarkerSize',5);
plot(f,T_q,'LineWidth', width);
plot(f,p(1:256),'LineWidth', width);
title( 'Tone Maskers (Hz)', 'FontSize', font);
xlabel('Frequency (Hz)', 'FontSize', font_small);
ylabel('Magnitude', 'FontSize', font_small);
hold off
subplot(2,1,2)
hold on
stem(bark,ptm,'x','LineWidth', width,'MarkerSize',5);
plot(bark,T_q,'LineWidth', width);
plot(bark,p(1:256),'LineWidth', width);
title( 'Tone Maskers (Bark)', 'FontSize', font);
xlabel('Frequency (Bark)', 'FontSize', font_small);
ylabel('Magnitude', 'FontSize', font_small);
hold off

figure(3)
subplot(2,1,1)
hold on
stem(f,pnm,'x','LineWidth', width,'MarkerSize',5);
plot(f,T_q,'LineWidth', width);
plot(f,p(1:256),'LineWidth', width);
title( 'Noise Maskers (Hz)', 'FontSize', font);
xlabel('Frequency (Hz)', 'FontSize', font_small);
ylabel('Magnitude', 'FontSize', font_small);
hold off
subplot(2,1,2)
hold on
stem(bark,pnm,'x','LineWidth', width,'MarkerSize',5);
plot(bark,T_q,'LineWidth', width);
plot(bark,p(1:256),'LineWidth', width);
title( 'Noise Maskers (Bark)', 'FontSize', font);
xlabel('Frequency (Bark)', 'FontSize', font_small);
ylabel('Magnitude', 'FontSize', font_small);
hold off

figure(4)
subplot(2,1,1)
hold on
stem(f,ptm_checked,'x','LineWidth', width,'MarkerSize',5);
plot(f,T_q,'LineWidth', width);
plot(f,p(1:256),'LineWidth', width);
title( 'Checked Tone Maskers (Hz)', 'FontSize', font);
xlabel('Frequency (Hz)', 'FontSize', font_small);
ylabel('Magnitude', 'FontSize', font_small);
hold off
subplot(2,1,2)
hold on
stem(bark,ptm_checked,'x','LineWidth', width,'MarkerSize',5);
plot(bark,T_q,'LineWidth', width);
plot(bark,p(1:256),'LineWidth', width);
title( 'Checked Tone Maskers (Bark)', 'FontSize', font);
xlabel('Frequency (Bark)', 'FontSize', font_small);
ylabel('Magnitude', 'FontSize', font_small);
hold off

figure(5)
subplot(2,1,1)
hold on
stem(f,pnm_checked,'LineWidth', width,'MarkerSize',5);
plot(f,T_q,'LineWidth', width);
plot(f,p(1:256),'LineWidth', width);
title( 'Checked Noise Maskers (Hz)', 'FontSize', font);
xlabel('Frequency (Hz)', 'FontSize', font_small);
ylabel('Magnitude', 'FontSize', font_small);
hold off
subplot(2,1,2)
hold on
stem(bark,pnm_checked,'LineWidth', width,'MarkerSize',5);
plot(bark,T_q,'LineWidth', width);
plot(bark,p(1:256),'LineWidth', width);
title( 'Checked Noise Maskers (Bark)', 'FontSize', font);
xlabel('Frequency (Bark)', 'FontSize', font_small);
ylabel('Magnitude', 'FontSize', font_small);
hold off

figure(6)
hold on
scatter(bark,ptm_checked,'x','LineWidth', width,'SizeData',100);
scatter(bark,pnm_checked,'LineWidth', width,'SizeData',100);
plot(bark,T_q,'LineWidth', width);
plot(bark,T_g(:,1),'LineWidth', width);
plot(bark,p(1:256),'LineWidth', width);
axis([1 25 min(T_q) max(T_q)])
xlabel('Frequency (Bark)', 'FontSize', font_small);
ylabel('Magnitude', 'FontSize', font_small);
legend({'Tones','Noise','ATH','Overall Threshold', 'Original PSD'}, 'FontSize', font);
hold off
