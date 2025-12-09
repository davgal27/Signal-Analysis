[b,a]=BP(0.75, 50, 500); % [b,a]=pp(r,f,fs);
fs = 500;
N = 200;
h=impz(b,a,200); %calc. 200 samples impulse response of the filter
H=freqz(b,a,200); %calc. 200 samples frequency characteristic of the filter


figure;

subplot(2,3,1);
zplane(b,a);
title('BP(0.5,50,500)');

subplot(2,3,2);
stem(0:39,h(1:40),'o');
title('Impulse response h(n) of filter');

subplot(2,3,3);
plot(0:length(H)-1,abs(H)); 
title('Module freq. characteristics |H(f)| filter');


[b,a]=BP(0.9,50,500);
h=impz(b,a,200);
H=freqz(b,a,200);

subplot(2,3,4);
zplane(b,a);
title('BP(0.5,50,500)');

subplot(2,3,5);
stem(0:39,h(1:40),'o');
title('Impulse response h(n) of filter');

subplot(2,3,6);
plot(0:length(H)-1,abs(H));
title('Module freq. characteristics|H(f)| filter');


r_values = 0.5:0.1:0.9;
figure;

for k = 1:length(r_values)
    r = r_values(k);
    [b, a] = BP(r, 50, fs);
    h = impz(b, a, N);
    H = freqz(b, a, N);
    
    subplot(length(r_values), 3, 3*k-2);
    zplane(b, a);
    title(['Poles & Zeros, r=', num2str(r)]);

    subplot(length(r_values), 3, 3*k-1);
    stem(0:39, h(1:40), 'o');
    title(['Impulse Response, r=', num2str(r)]);
    
    subplot(length(r_values), 3, 3*k);
    plot(0:N-1, abs(H));
    title(['|H(f)|, r=', num2str(r)]);
end