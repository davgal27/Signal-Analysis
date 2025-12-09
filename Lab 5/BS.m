function [b,a]=BS(r,f,fvz); % 2nd order Band-stop
% r ... distance of poles from the origin affecting the bandwidth (r<1)
% f ... center frequency of the suppressed band
% fs... sampling frequency
% b ... vector of numerator coefficients H(z)
% a ... vector of denominator coefficients H(z)
omT=2*pi*f/fvz;
b=[1 -2*cos(omT) 1];
a=[1 -2*r*cos(omT) r^2];
K=sum(a)/sum(b); 
b=b*K; 
