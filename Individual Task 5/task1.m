close all;
% Signal Parameters
fs = 5000; % Sampling frequency
N = 256; % Samples per section
M = 4;  % Number of sections (stated in question)
t = (0:N*M-1)/fs;

% Frequency of harmonic components 
% Notes are the harmonics of the low E string of a Bass guitar. 
f1 = 41; % E1
f2 = 2*f1; % 2nd harmonic
f3 = 3*f1; % 3rd harmonic
f4 = 4*f1; % 4th harmonic

% Amplitudes
A1 = 6;
A2 = 4.5;
A3 = 3;
A4 = 1.5;

% Clean Signal
signal = A1*sin(2*pi*f1*t) + A2*cos(2*pi*f2*t) + A3*sin(2*pi*f3*t) + A4*cos(2*pi*f4*t);

% noise 
sigma = 4; % Standard deviation (Variance = 2^2 = 4)
noise = sigma * randn(1, N*M);

% Noisy signal 
noisysig = noise + signal;


% Defining section indices to make life easier
s1_idx = 1:N;
s2_idx = N : 2*N;
s3_idx = 2*N : 3*N;
s4_idx = 3*N : 4*N;



% figure 1: Clean signal in 4 sections 
figure;

subplot(4,1,1);
plot(t(s1_idx), signal(s1_idx));
title('Clean Signal - section 1');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,2);
plot(t(s2_idx), signal(s2_idx));
title('Clean Signal - section 2');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,3);
plot(t(s3_idx), signal(s3_idx));
title('Clean Signal - section 3');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,4);
plot(t(s4_idx), signal(s4_idx));
title('Clean Signal - section 4');
xlabel('Time (s)');
ylabel('Amplitude');

% Figure 2: Noisy  signal in 4 sections 

figure;

subplot(4,1,1);
plot(t(s1_idx), noisysig(s1_idx));
title('Noisy Signal - section 1');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,2);
plot(t(s2_idx), noisysig(s2_idx));
title('Noisy Signal - section 2');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,3);
plot(t(s3_idx), noisysig(s3_idx));
title('Noisy Signal - section 3');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(4,1,4);
plot(t(s4_idx), noisysig(s4_idx));
title('Noisy Signal - section 4');
xlabel('Time (s)');
ylabel('Amplitude');

% Figure 3: Full clean signal, noisy signal, and noise 

figure;

subplot(3,1,1);
plot(t, signal);
title('Full Clean Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,2);
plot(t, noisysig);
title('Full Noisy Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,3);
plot(t, noise);
title('Noise');
xlabel('Time (s)');
ylabel('Amplitude');

% Figure 4: plot of individual harmonic components

figure; 
hold on;

plot(t, A1*sin(2*pi*f1*t));
plot(t, A2*sin(2*pi*f2*t));
plot(t, A3*sin(2*pi*f3*t));
plot(t, A4*sin(2*pi*f4*t));
title('Individual Harmonic Components');
xlabel('Time (s)');
ylabel('Amplitude');
legend('f1','f2','f3','f4');