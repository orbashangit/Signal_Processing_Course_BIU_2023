%% Autocorrelation + ISI - Example 2:

clear all
close all
clc

signalLength=50000; % Length of signal in ms
poissRate=150/1000; % Base poissonic rate
reflen=10; % Length (in ms) of the refractory period

st=zeros(signalLength,1);
p=poissRate*ones(signalLength,1);%Probability vector

for i=1:signalLength
    if(rand<p(i))
        st(i)=1;
        p(i+1:i+reflen)=0; % Absolute refractory period
        p(i+1+reflen:i+2*reflen)=0.3*poissRate; % Relative refractory period
    end
end

figure;plot(st) % Plotting the spike train
xlabel('Time (ms)');ylabel('Amplitude');
title('Spike train')
ylim([-.2 1.2])


% Calculating the auto-correlation, in 1000ms window
ac=xcorr(st,st, 1000);
% We assign a zero value in time lag 0
ac(1000+1)=0;
timeVector = -1000:1000;
figure;
plot(timeVector, ac*1000/size(find(st),1)) % Plotting the auto-correlation, normalized to rate
hold all;
xlabel('Lag (ms)')
ylabel('Rate (Hz)')
plot([0 0], [min(ac) max(ac*1000/size(find(st),1))], 'k--')
title('Auto-correlation of the spike train')
%%
spktimes=find(st);
ISI=diff(spktimes); % Calculating the ISI
figure;
histogram(ISI,[0:5:150]) % Plotting ISI histogram
xlabel('ISI (ms)'); ylabel('Count');
title('ISI histogram')