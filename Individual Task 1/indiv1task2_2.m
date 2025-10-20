f = 50; % Fundemental freq = cycles per second
fs = 5000; %Sampling freq = samples per second
A = 3;
T = 1/f; % fundemental period
Ts = 1/fs;
t = 0:Ts:2*(T);

P1 = A * sin(2*pi*50*t);
P2 = A * sin(2*pi*50*t - 2*pi/3);
P3 = A * sin(2*pi*50*t + 2*pi/3);

plot(t, P1, 'r'); hold on;
plot(t, P2, 'g');
plot(t, P3, 'b');
grid on;
title("Three-phase signal (two periods each)");
xlabel("Time[s]");
ylabel("Amplitude");
xlim([0 2*T]); %limit to show only 2 periods
legend ('P1', 'P2', 'P3');