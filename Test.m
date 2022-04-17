% Read standard sample tune that ships with MATLAB.
[dataIn, Fs] = audioread('1.mp3');
% Filter the signal
fc = 400; % Make higher to hear higher frequencies.
% Design a Butterworth filter.
[b, a] = butter(6,fc/(Fs/2));
%  [b,a] = cheby1(6,40,0.6);
fvtool(b,a);
figure(1);
freqz(b,a)
% Apply the Butterworth filter.
filteredSignal = filter(b, a, dataIn);
% Play the sound.
figure(2);

plot(dataIn);
title('frequency respones of input signal');
xlabel('frequency');ylabel('magnitude');
figure(3);

plot(filteredSignal);
title('frequency respones of filtered signal');
xlabel('frequency');ylabel('magnitude');

player = audioplayer(filteredSignal, Fs);
play(player);

