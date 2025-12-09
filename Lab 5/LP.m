function [b,a]=LP(r,f,fs); % 2nd order Low-pass filter
% r ... distance of poles from origin (r<1)
% f ... very approximate cutoff frequency
% fs... sampling frequency
% b ... vector of numerator coefficients H(z)
% a ... vector of denominator coefficients H(z)
omT=2*pi*f/fvz;
b=[1 2 1];
a=[1 -2*r*cos(omT) r^2];
K=1/(sum(b)/sum(a));
b=b*K;
end
