%% Parts 1 and 2
t=M(:,1);
Signal=M(:,2);
index1 = find(t==0);
index2 = find(t==9.996);
time10s = t(index1:index2);
Window1= Signal(index1:index2);
index3 = find(t==10);
index4 = find(t==19.996);
time20s = t(index3:index4,1);
Window2= Signal(index3:index4);
index5 = find(t==20);
index6 = find(t==29.996);
time30s = t(index5:index6,1);
Window3= Signal(index5:index6);
index7 = find(t==30);
index8 = find(t==39.996);
time40s = t(index7:index8,1);
Window4= Signal(index7:index8);
index9 = find(t==40);
index10 = find(t==49.996);
time50s = t(index9:index10,1);
Window5= Signal(index9:index10);
index11 = find(t==50);
index12 = find(t==59.996);
time60s = t(index11:index12,1);
Window6= Signal(index11:index12);
index13 = find(t==60);
index14 = find(t==69.996);
time70s = t(index13:index14,1);
Window7= Signal(index13:index14);
index15 = find(t==70);
index16 = find(t==79.996);
time80s = t(index15:index16,1);
Window8= Signal(index15:index16);
index17 = find(t==80);
index18 = find(t==89.996);
time90s = t(index17:index18,1);
Window9= Signal(index17:index18);
index19 = find(t==90);
index20 = find(t==99.996);
time100s = t(index19:index20,1);
Window10= Signal(index19:index20);
index21 = find(t==100);
index22 = find(t==109.996);
time110s = t(index21:index22,1);
Window11= Signal(index21:index22);
index23 = find(t==110);
index24 = find(t==119.996);
time120s = t(index23:index24,1);
Window12= Signal(index23:index24);
figure
subplot(3,4,1)
plot(time10s,Window1)
title("0-10s window")
subplot(3,4,2)
plot(time10s,Window2)
title("10-20s window")
subplot(3,4,3)
plot(time10s,Window3)
title("20-30s window")
subplot(3,4,4)
plot(time10s,Window4)
title("30-40s window")
subplot(3,4,5)
plot(time10s,Window5)
title("40-50s window")
subplot(3,4,6)
plot(time10s,Window6)
title("50-60s window")
subplot(3,4,7)
plot(time10s,Window7)
title("60-70s window")
subplot(3,4,8)
plot(time10s,Window8)
title("70-80s window")
subplot(3,4,9)
plot(time10s,Window9)
title("80-90s window")
subplot(3,4,10)
plot(time10s,Window10)
title("90-100s window")
subplot(3,4,11)
plot(time10s,Window11)
title("100-110s window")
subplot(3,4,12)
plot(time10s,Window12)
title("110-120s window")

frequencies = linspace(0,1,length(Window1));
figure
subplot(2,1,1)
plot(frequencies,abs(fft(Window1)));
title("Frequency response of a window")
subplot(2,1,2)
pspectrum(abs(fft(Window1)));
title("Power Spectrum of a window")