clear all   % clearing all previously defined variables 
close all   % All figures and windows will be closed 
clc         % Clears the command window
% Above 3 lines useful to have in scripts 

Ts = 0.01;
t = 0:Ts:10; % time vector t

K = 1;
T = 1;

% Task 1a
gt = K/T*exp(-t/T).*step_function(t);

figure
plot(t, gt, linewidth=2)
grid on 
xlabel('t [s]')
ylabel('h(t)')
hold on

% Task 1b
s = tf('s');
H = K/(T*s+1);

gt2 = lsim(H, 100*(step_function(t)-step_function(t-Ts)),t); % t is the time vector
plot(t, gt2, '--', linewidth=2)

% Task 1c
[gt3, tout] = step(H, t);

plot(t, gt3, 'g+', linewidth=0.5)