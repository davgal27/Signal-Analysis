%% Generation of a Signal 
A = 15;
fs = 500;
f1 = 75;
f2 = 10;
N = 256;
M  = 10;
t = (0: N-1)/fs;

sig = (A * sin(2*pi*t*f1)) + (5 * cos(2*pi*t*f2));

figure;
subplot(3,1,1)
plot(t, sig, linewidth=2);
grid on;
xlabel('Time (s)')
ylabel('Amplitude')
title('Input signal')
hold on;

%% Add noise
noise = 10*randn(1,N);
noisysig = sig + noise;

subplot(3,1,2)
plot(t, noise, linewidth=2);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Noise');
hold on;


subplot(3,1,3)
plot(t, noisysig, linewidth=2);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Noisy Signal');