close all;
%% ----------------------------TASK A -------------------------------------
% Filter Design
% Recursive filter: y(n) = 0.5*x(n) - 0.5*x(n-4) + y(n-1)
% Z- transform of eq: Y(z)=0.5X(z) − 0.5z^(-4)X(z) + z^(-1)Y(z)
% H(z) = Y(z)/X(z)
% Y(z) - z^(-1)Y(z) = (0.5 - 0.5z^(-4))X(z) % arrange equation
% Y(z)(1-z^(-1)) = (0.5 - 0.5z^(-4))X(z) % factor Y(z) 
% Transfer function: 
% H(z) = Y(z)/X(z) = (0.5 - 0.5z^(-4)) / (1 - z^(-1))
% Therefore numerator : 0.5 - 0.5z^(-4) : [0.5, 0, 0, 0, -0.5]
% Therefore denominator: 1 - z^(-1): [1, -1]

% Define parameters a and b (retrieved from method from individual work 4)
b = [0.5 0 0 0 -0.5]; % numerator : zeros
a = [1, -1]; % denominator : poles
N_imp = 200; % number of samples


% calculating impulse and frequency response (impz and freqz)
h1 = impz(b, a, N_imp); % impulse response
H1 = freqz(b, a, N_imp); % frequency response

% Plot: unit circle with zero points and poles
figure; 
zplane(roots(b), roots(a));
title('Pole-Zero Plot of the filter');
xlabel('Real');
ylabel('Imaginary');

% Plot: Module characteristic / Frequency response
figure;
plot(0:N_imp-1, abs(H1));
title('Module Characteristic (freqz)');
xlabel('k');
ylabel('|H(k)|')

% Plot: Impulse response 
figure;
stem(0:N_imp-1, h1);
title('Impulse Response (impz)');
xlabel('n');
ylabel('h(n)');

%% -----------------------------------TASK B ---------------------------------
% Signal parameters
N = 256;  % length of one segment
M = 50;   % number of segments
fs = 500;  % sampling frequency in Hz
t = (0:N*M-1)/fs;  % time vector for one segment

% Harmonic frequencies 
f1 = 50;   % frequency that will pass
f2 = 125;   % frequency that will be filtered out 

A1 = 5; % amplitude of first component
A2 = 5; % amplitude of second component

signal = A1*sin(2*pi*f1*t) + A2*sin(2*pi*f2*t);

sigma = sqrt(100); % variance
noise = sigma * randn(1, N*M); % Gaussian noise

noisysig = noise + signal;

%% Plot first segment of signal, noise, and noisy signal
figure;

% First segment indices
idx = 1:N;

subplot(3,1,1);
plot(t(idx), signal(idx));
title('Clean Signal - First Segment','FontSize',16);
xlabel('Time (s)','FontSize',14);
ylabel('Amplitude','FontSize',14);
grid on;

subplot(3,1,2);
plot(t(idx), noise(idx));
title('Noise - First Segment','FontSize',16);
xlabel('Time (s)','FontSize',14);
ylabel('Amplitude','FontSize',14);
grid on;

subplot(3,1,3);
plot(t(idx), noisysig(idx));
title('Noisy Signal - First Segment','FontSize',16);
xlabel('Time (s)','FontSize',14);
ylabel('Amplitude','FontSize',14);
grid on;

%% Plot full signal, noise, and noisy signal
figure;

subplot(3,1,1);
plot(t, signal);
title('Full Clean Signal','FontSize',20);
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,2);
plot(t, noisysig);
title('Full Noisy Signal','FontSize',20);
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,3);
plot(t, noise);
title('Noise','FontSize',20);
xlabel('Time (s)');
ylabel('Amplitude');

%% -----------------------------------TASK C ---------------------------------
% Filter the noisy signal using the designed filter
filtered_signal = filter(b, a, noisysig);

% Total number of samples
N_total = length(t);

% Compute FFTs and shift zero frequency to center
S = fftshift(fft(signal));          % clean signal
X = fftshift(fft(noisysig));        % noisy signal
Y = fftshift(fft(filtered_signal)); % filtered signal

% Frequency axis exactly from -fs/2 to fs/2
f_axis = linspace(-fs/2, fs/2, N_total);

%% Plot spectra
figure;
subplot(3,1,1);
plot(f_axis, abs(S)/N_total, 'LineWidth', 1.5);
title('Spectrum of Clean Signal s(t)');
xlabel('Frequency (Hz)');
ylabel('|S(f)|');
grid on;

subplot(3,1,2);
plot(f_axis, abs(X)/N_total, 'LineWidth', 1.5);
title('Spectrum of Noisy Signal x(t)');
xlabel('Frequency (Hz)');
ylabel('|X(f)|');
grid on;

subplot(3,1,3);
plot(f_axis, abs(Y)/N_total, 'LineWidth', 1.5);
title('Spectrum of Filtered Signal y(t)');
xlabel('Frequency (Hz)');
ylabel('|Y(f)|');
grid on;
