clear; clc; close all;

% DE: 5 dy(t)/dt = 10*u(t)
% H(s) (TF) = 2 / s

num = 2;
denom = [1 0];
syst = tf(num, denom);

t = 0:0.01:20; % time vector from 0 to 20 seconds 

% Impulse response
imp = impulse(syst, t); % matlab function
hand_imp = 2 * ones(size(t)); % handwritten result 

% Step response
step = step(syst, t); % matlab function
hand_step = 2 * t; % handwritten result 

% plot impulse and step
subplot(2,2,4);
plot(t, imp, 'b', 'Linewidth', 2); hold on;
plot(t, step, 'r', 'Linewidth', 2);
plot(t, hand_imp, 'r--', 'LineWidth', 3); %dotted to show that both lines printed
plot(t, hand_step, 'b--', 'LineWidth', 3);
xlabel('Time (s)');
ylabel('Amplitude');
title('Step and impulse responses');
grid on;
ylim([0 20]);

% plot nyquist
subplot(2,2,2);
nyquist(syst);
title('Nyquist Diagram');
grid on;

% plot bode
subplot(2,2,[1 3]);
bode(syst);
title('Bode plot');
grid on;


