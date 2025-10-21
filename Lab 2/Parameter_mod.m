% Modifying parameters K and T 

Ts = 0.01;
t = 0:Ts:100;

K = 5000000;
T = 20;

s = tf('s');
H = K/(T*s+1);

[ht3, tout] = impulse(H, t);

plot(t, ht3, linewidth=2)
grid on
xlabel('t')
ylabel('h(t)')
hold on