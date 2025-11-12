clear; clc; close all;

% DE: 5dy(t)/dt + y(t) = 10u(t)
% H(s) (TF) = 10 / (5s + 1)

num = 10;
denom = [5 1];
syst = tf(num, denom);

t = 0:0.01:20; % time vector from 0 to 20 seconds 

% Impulse response
imp = impulse(syst, t); % matlab function
hand_imp = 2 * exp(-t/5); % handwritten result  

% Step response
step = step(syst, t); % matlab function
hand_step = 10 * (1 - exp(-t/5)); % handwritten result 

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


