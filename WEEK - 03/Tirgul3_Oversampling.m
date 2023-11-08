clear;clc
Fs = 10000;%Hz
t = 0:1/Fs:3-1/Fs;

x = sin(t.*2*2*pi);

noise = randn(1,length(x));

noisySignal = x + noise;

N = 10;% how many points to average
smooth_signal = [];
c = 0;
for i = 1:N:length(noisySignal)
    c = c+1;
    smooth_signal(c) = mean(noisySignal(i:i+N-1));
end

figure;
subplot(2,1,1)
plot(t, noisySignal);
xlabel('Time (sec)');ylabel('Amplitude')
title('Before averaging')

subplot(2,1,2)
t_smooth = 0:N/Fs:3-N/Fs;
plot(t_smooth, smooth_signal)
title('After averaging')
xlabel('Time (sec)');ylabel('Amplitude')

