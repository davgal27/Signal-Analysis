clearvars
clc
%% ------------------------- SIGNAL PARAMETERS ------------------------ %
a = 1;          % Half-duration of the non-zero part of the signal.
A = 2;          % Signal amplitude.
T = 10;         % The fundamental period of the signal.

%% --------------------- APPROXIMATION PARAMETERS --------------------- %
t_max = 5;      % Boundary on the time axis. (Maximal time displayed.)
Ts = 1e-2;      % Sampling period in the time domain.
M = 50;         % Approximation order. Try for instance 5; 50; 500.
w0 = 2*pi/T;    % Angular frequency
m = -M:M;       % Index of spectral coefficients c (a vector)
c =  ((A*w0*a)/pi) .* sinc((m*w0*a)/pi); % Spectral coefficients according to (1)

%% --------------------- PLOTTING --------------------- %
figure;
subplot(2,1,1);
stem(m, abs(c), "filled");
xlabel('m');
ylabel('C_m');
title('Amplitude Spectrum');
grid on;

subplot(2,1,2);
stem(m, angle(c), "filled");
xlabel('m');
ylabel('Theta');
title('Phase Spectrum');
grid on;

%% --------------------- INITIALIZATION OF VECTORS  --------------------- %
t = -t_max:Ts:t_max; % From – t_max to t_max with step Ts
f = c(m==0)*ones(size(t)); % Signal initialization by c0, according to (5)


%% Inverse Fourier series and displays follow
subplot(2,1,2) % Selection of the lower part of the figure
for n = 1:M

 % Here you should make use of the logical indexing of vector c:
 % f = f + ? + ?; % Write code for inv. Fourier series using (5)
    f = f + c(m == -n)*exp(-1j*w0*n*t) + c(m == n)*exp(1j*w0*n*t);
 % ? % Display current signal approximation
 plot (t, real(f));
 % ? % Add a label to x axis
 xlabel('Time (t)')
 y_label = ['f_{' num2str(n) '}(t)']; % Text string for the y axis
 ylabel(y_label) % Add label to y axis
 drawnow % Update figure
 pause(0.01) % Wait for 0.5 seconds. (Adjust if needed.)
end

%% OVERSHOOT % 
overshoot = max(real(f)) - A;
percentage = (overshoot / A)*100;
fprintf('Overshoot = %.3f%%', percentage);
