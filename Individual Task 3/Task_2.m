clear; clc; close all; 

t = 0:0.01:20; % time vector 
%% ------------------- Varying xi values ---------------------------
% Parameters 
K = 1;
T = 5;
xi_values = [0.3 0.7 10]; % xi instead of  ξ

figure('Name', 'Varying ξ', 'NumberTitle', 'off');

% Impulse response
subplot(2,3,1);
hold on;
for xi = xi_values
    num = K;
    denom = [T^2 2*xi*T 1];
    syst = tf(num, denom);
    impulse(syst, t);
end
title('Impulse Response');
xlabel('Time(s)');
ylabel('Amplitude');
legend('\xi=0.3', '\xi=0.7', '\xi=10');


% Step response
subplot(2,3,2); 
hold on; 
grid on;
for xi = xi_values
    num = K;
    denom = [T^2 2*xi*T 1];
    syst = tf(num, denom);
    step(syst, t);
end
title('Step Response');
xlabel('Time (s)'); 
ylabel('Amplitude');
legend('\xi=0.3','\xi=0.7','\xi=10');


% Bode plot 
subplot(2,3,3); 
hold on; 
grid on;
for xi = xi_values
    num = K;
    denom = [T^2 2*xi*T 1];
    syst = tf(num, denom);
    bode(syst);
end
title('Bode Plot');
legend('\xi=0.3', '\xi=0.7', '\xi=10');


% Nyquist plot
subplot(2,3,4); 
hold on; 
grid on;
for xi = xi_values
    num = K;
    denom  = [T^2 2*xi*T 1];
    syst = tf(num, denom);
    nyquist(syst);
end
title('Nyquist Diagram');
legend('\xi=0.3', '\xi=0.7', '\xi=10');


% zero-pole 
subplot(2,3,5); 
hold on; 
grid on;
for xi = xi_values
    num = K;
    denom = [T^2 2*xi*T 1];
    syst = tf(num, denom);
    pzmap(syst);
end
title('Zero-Pole Map');
legend('\xi=0.3', '\xi=0.7', '\xi=10');


%% ------------------- Varying K ----------------------
T = 5;
xi = 0.5;
K_values = [1 -2 5];

figure('Name','Varying K','NumberTitle','off');

% Impulse response
subplot(2,3,1);
hold on;
grid on;
for K = K_values
    num = K;
    denom = [T^2 2*xi*T 1];
    syst = tf(num, denom);
    impulse(syst, t);
end
title('Impulse Response');
xlabel('Time(s)');
ylabel('Amplitude');
legend('K=1','K=-2','K=5');


% Step response
subplot(2,3,2);
hold on;
grid on;
for K = K_values
    num = K;
    denom = [T^2 2*xi*T 1];
    syst = tf(num, denom);
    step(syst, t);
end
title('Step Response');
xlabel('Time(s)');
ylabel('Amplitude');
legend('K=1','K=-2','K=5');


% Bode plot 
subplot(2,3,3);
hold on;
grid on;
for K = K_values
    num = K;
    denom = [T^2 2*xi*T 1];
    syst = tf(num, denom);
    bode(syst);
end
title('Bode Plot');
legend('K=1','K=-2','K=5');



% Nyquist Diagram
subplot(2,3,4);
hold on;
grid on;
for K = K_values
    num = K;
    denom = [T^2 2*xi*T 1];
    syst = tf(num, denom);
    nyquist(syst);
end
title('Nyquist Diagram');
legend('K=1','K=-2','K=5');



% Zero - Pole diagram
subplot(2,3,5);
hold on;
grid on;
for K = K_values
    num = K;
    denom = [T^2 2*xi*T 1];
    syst = tf(num, denom);
    pzmap(syst);
end
title('Zero-Pole Map');
legend('K=1','K=-2','K=5');


%% ------------------- Varying T ---------------------
K = 1;
xi = 0.5;
T_values = [1 2 5];

figure('Name','Varying T','NumberTitle','off');

% Impulse Response
subplot(2,3,1);
hold on;
grid on;
for T = T_values
    num = K;
    denom = [T^2 2*xi*T 1];
    syst = tf(num, denom);
    impulse(syst, t);
end
title('Impulse Response');
xlabel('Time(s)');
ylabel('Amplitude');
legend('T=1','T=2','T=5');


% Step Response
subplot(2,3,2);
hold on;
grid on;
for T = T_values
    num = K;
    denom = [T^2 2*xi*T 1];
    syst = tf(num, denom);
    step(syst, t);
end
title('Step Response');
xlabel('Time(s)');
ylabel('Amplitude');
legend('T=1','T=2','T=5');


% Bode plot
subplot(2,3,3);
hold on;
grid on;
for T = T_values
    num = K;
    denom = [T^2 2*xi*T 1];
    syst = tf(num, denom);
    bode(syst);
end
title('Bode Plot');
legend('T=1','T=2','T=5');


% Nyquist Diagram
subplot(2,3,4);
hold on;
grid on;
for T = T_values
    num = K;
    denom = [T^2 2*xi*T 1];
    syst = tf(num, denom);
    nyquist(syst);
end
title('Nyquist Diagram');
legend('T=1','T=2','T=5');


% Zero - Pole diagram
subplot(2,3,5);
hold on;
grid on;
for T = T_values
    num = K;
    denom = [T^2 2*xi*T 1];
    syst = tf(num, denom);
    pzmap(syst);
end
title('Zero-Pole Map');
legend('T=1','T=2','T=5');