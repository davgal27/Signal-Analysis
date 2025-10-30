f = 440;        % freq 
fs = 44000;     % Sampling freq 
N = 1000;      % No. of Samples
Ts = 1/fs;      % Sampling Period 

t = 0:Ts:(N-1)*Ts;  % Time vector (0 is counted, so N-1)
ft = sin(2*pi*f*t); % Signal

figure;
subplot (2,1,1)
plot(t, ft, linewidth=2)
grid on
xlabel('Time (s)')
ylabel('Amplitude')
title('Signal as a function of time')
sound(ft, fs) % Hearing required setting samples to very high no.

spectrum = fft(ft);
spectrum_centered = fftshift(spectrum);
m = -N/2:N/2-1;
freq = m*(fs/N);
amplitude_spectrum = spectrum_centered/N;

subplot (2,1,2)
plot(freq, abs(amplitude_spectrum), 'r', linewidth=2) % absolute value (modulus of component) 
grid on
xlabel('Frequency(Hz)')
ylabel('Amplitude')
title('Amplitude Spectrum of signal')

% Result of amplitude spectrum evaluated:
% Manually: two components at +-440Hz with amplitude A/2
% Matlab: two components at +-440 Hz using frequency = m*(fs/N), each have
% amplitude A/2 (overall amplitude is always halved)

