function [output] = step_function(t)
% STEP Heaviside step function.
% t – time vector
output = t >= 0;
end