%% -----Modelling a Discrete-Time System----%
%% LDS : y(n) = 0.2x(n)-0.2x(n-5)+y(n-1)
%% Need to calculate transfer function H(n)

b = [1 0 0 0 0 -1] * 0.2;   % recursive numerator coefficients
a = [1 -1 0 0 0 0];          % recursive denominator coefficients
h = [1 1 1 1 1] * 0.2;       % FIR impulse response (non-recursive)
N = 200;                      % number of FFT point

%% Nonrecursive FIR system
H=fft(h,N); % frequency response using FFT 

%% Recursive IIR system
h1=impz(b,a,200); % calculate 200 sample impulse char. filter
H1=freqz(b,a,100); % calculate 100 sample frequency char. Filter

figure;

subplot(2,2,1);
plot(0:N-1, abs(H), 'LineWidth', 2);
title('Module characteristic (fft)');
xlabel('f');
ylabel('|H(f)|');
grid on;

subplot(2,2,2);
stem(h, 'LineWidth', 2);
title('Impulse Response h');
grid on;

subplot(2,2,3);
plot(0:100-1, abs(H1), 'LineWidth', 2);
title('Module characteristic (freqz)');
xlabel('f');
ylabel('|H(f)|');
grid on;

subplot(2,2,4);
stem(h1, 'LineWidth', 2);
title('Impulse Response h (impz)');
grid on;
xlim([0 15]);
