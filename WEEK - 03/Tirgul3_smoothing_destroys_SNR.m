t = 0:1/100:5-1/100;
x = 15.*(gausswin(length(t)).^2);
noise = randn(length(x),1);
x = x+noise;

figure;
plot(t,x)
xlabel('Time (sec)');ylabel('Amplitude')

rectLength = 300;
rect = ones(1,rectLength)./rectLength;

x_smoothed = smooth(x,rectLength);
hold on;
plot(t, x_smoothed)


title('A guassian before and after smoothing')
legend('Before', 'After')