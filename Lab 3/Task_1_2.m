%%------De-Convlution and Auto-Correlation% 
% Task 1:Compute convolution and deconvolution:
%a. 𝑥(𝑛) = {2, −1,3} and ℎ(𝑛) = {1,2,2,3}
x = [2,-1,3];
h = [1,2,2,3];
y = conv(x,h)
%b. ℎ(𝑛) = {2,5,0,4} and 𝑥(𝑛) = {4,1,3}
h = [2,5,0,4];
x = [4,1,3];
y = conv(x,h)
%c. 𝑥(𝑛) = {2,5,0,4} and 𝑦(𝑛) = {8,22,11,31,4,12}
x = [2,5,0,4];
y = [8,22,11,31,4,12];
[h_result, r] = deconv(y,x) 

% Task 2: Compute autocorrelation of sequence x 
x = [3 2 3 2 3 2 2 2 2 3];
Rxx = xcorr(x); % Using correlation
r_conv = conv(x, fliplr(x)); % using convolution

figure;
% original sequence
subplot(3,1,1);
stem(x, 'linewidth', 2);
title('Sequence x');
grid on;

%Autocorrelation using correlation(xcorr)
subplot(3,1,2);
stem([-9:1:9], Rxx, 'LineWidth',2); 
title('Autocorrelation Rxx, xcorr');
grid on;

% Autocorrelation using convolution
subplot(3,1,3)
stem([-9:1:9], r_conv, 'LineWidth',2);
title('Autocorrelation RXX, conv'); 
grid on;