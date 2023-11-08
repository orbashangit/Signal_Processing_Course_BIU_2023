clear;clc
pattern = randn(1,50);

fullSignal = [randn(1,100) pattern randn(1,100)];

figure;
subplot(3,1,1)
zeroPaddedPattern = [zeros(1,100) pattern zeros(1,100)];
plot(zeroPaddedPattern);
title('Pattern')
xlabel('Samples');ylabel('Amplitude')

subplot(3,1,2)
plot(fullSignal)
title('Full signal')
xlabel('Samples');ylabel('Amplitude')

cc = xcorr(fullSignal, zeroPaddedPattern);

subplot(3,1,3)
lag = [-length(fullSignal)+1 : length(fullSignal)-1];
plot(lag, cc)
title('CC')
xlabel('Lag');ylabel('Amplitude')
