clear all   % clearing all previously defined variables 
close all   % All figures and windows will be closed 
clc         % Clears the command window
% Above 3 lines useful to have in scripts 

Ts = 0.01;
t = 0:Ts:10; % time vector t

K = 1;
T = 1;

% Task 1a
ht = K*(1-exp(-t/T)).*step_function(t);

figure
plot(t, ht, linewidth=2)
grid on 
xlabel('t [s]')
ylabel('h(t)')
hold on

% Task 1b
s = tf('s');
H = K/(T*s+1);

ht2 = lsim(H,step_function(t),t); % t is the time vector
plot(t, ht2, '--', linewidth=2)

% Task 1c
[ht3, tout] = step(H, t);

plot(t, ht3, 'g+', linewidth=0.5)