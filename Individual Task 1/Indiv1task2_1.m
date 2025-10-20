Ts = 0.01;
t = -5:Ts:5; % start, step-size, end
f = exp(j * pi * t);

subplot(2,1,1);
plot(t, real(f));
title("Real part of e^{j\pit} ");
xlabel("Time[s]");
ylabel("Real");

subplot(2,1,2);
plot(t,imag(f));
title("Imaginary Part of e^{j\pit}");
xlabel("Time[s]");
ylabel("Imaginary");
