function [b,a]=BP(r,f,fvz); % 2nd order Band-pass filter
% r ... distance of poles from the origin, determining the bandwidth (r<1)
% f ... center frequency of the passband
% fs... sampling frequency
% b ... vector of numerator coefficients H(z)
% a ... vector of denominator coefficients H(z)
omT=2*pi*f/fvz;
b=[1 0 -1]; a=[1 -2*r*cos(omT) r^2];
K=1/abs((exp(i*omT)^2-1)/(exp(i*omT)^2-2*exp(i*omT)*r*cos(omT)+r^2));
b=b*K;
end
