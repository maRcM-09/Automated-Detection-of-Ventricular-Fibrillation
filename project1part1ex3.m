% 3-a
f = (1/8192:1/8192:1)*pi;
freqz(Chebychev1) %freq response in dB
[h, w] = freqz(Chebychev1); %freq response in Hz
figure(2)
plot(f,abs(h))
figure(3) 
impz(Chebychev1)

%% 3-b
t = M(:,1);
Wave1 = M(:,2);
N = 30000;

subplot(2,1,1)
plot(t,Wave1)
title("Signal before any filtering")
% figure(2)
% plot(f,abs(freqContent)/N)

%after filtering
filteredSignal = filter(Chebychev1,Wave1);
subplot(2,1,2)
plot(t,filteredSignal)
title("Filtered signal")


% filtered 10s signal 
index1 = find(t==80);
index2 = find(t==89.996);
time10s = t(index1:index2,1);
wave1Chopped = Wave1(index1:index2,1);

figure(2) 
subplot(3,3,1)
plot(time10s,wave1Chopped)
title("A ten seconds window (80-90s)")

subplot(3,3,2)
Nchopped = 2500;
fn = (1/Nchopped:1/Nchopped:1)*250;
plot(fn,abs(fft(wave1Chopped))/Nchopped)
title("frequency response of the window")

filteredWave = filter(Chebychev1,wave1Chopped);
subplot(3,3,3)
plot(time10s,filteredWave);
title("Filtered ten seconds window")

subplot(3,3,4)
plot(fn,abs(fft(filteredWave))/Nchopped)
title("Frequency response of the filtered window")

subplot(3,3,5)
filteredWave = filter(Chebychev1,wave1Chopped);
subplot(2,2,3)
plot(time10s,filteredWave,'r');hold on; plot(time10s,wave1Chopped,'b'); hold off;
title("Unfiltered over filtered ten seconds windows")

%% 4

f = (1/8192:1/8192:1)*pi;
freqz(EquiOrder452) %freq response in dB
[h, w] = freqz(EquiOrder452); %freq response in Hz
figure(2)
plot(f,abs(h));
title("FIR filter");
figure(3) 
impz(EquiOrder452)

%%
t = M(:,1);
Wave1 = M(:,2);
N = 30000;

figure(4)
subplot(2,1,1)
plot(t,Wave1)
title("Unfiltered Signal")
% figure(2)
% plot(f,abs(freqContent)/N)

%after filtering
filteredSignal = filter(EquiOrder452,Wave1);
subplot(2,1,2)
plot(t,filteredSignal)
title("Filtered Signal using FIR")


% filtered 10s signal 
index1 = find(t==80);
index2 = find(t==89.996);
time10s = t(index1:index2,1);
wave1Chopped = Wave1(index1:index2,1);

figure(5) 
subplot(2,2,1)
plot(time10s,wave1Chopped)
title("Unfiltered 10 seconds window")

subplot(2,2,2)
Nchopped = 2500;
fn = (1/Nchopped:1/Nchopped:1)*250;
plot(fn,abs(fft(wave1Chopped))/Nchopped)
title("Frequency response of the unfiltered window")

filteredWave = filter(EquiOrder452,wave1Chopped);
subplot(2,2,3)
plot(time10s,filteredWave);
title("Filtered window using FIR")

subplot(2,2,4)
plot(fn,abs(fft(filteredWave))/Nchopped)
title("Frequency response of the filtered window using FIR")

figure(6)
plot(time10s,filteredWave,'r');hold on; plot(time10s, wave1Chopped,'blue');hold off;
title("Filtered(red) vs Unfiltered Window(blue)")