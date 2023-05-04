function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

%% security checks
if length(x) ~= length(y)
    error('x and y inputs are not the same length')
end

%inputs equally spaced?
dx = diff(x);
if max(dx)-min(dx) ~= 0
    error('x needs to be equally spaced')
end

%% do the integration checks
if length(x) == 2
    warning("the trapezoidal is used in the case of 2 points")
    a = x(end-1);
    b = x(end);
    I = (b-a)*((y(1)+y(end))/2);

    
elseif length(x) == 3 % Use Simpson's 1/3 rule
    n = length(x)-1;
    a = x(1);
    b=x(end);
    I = (b-a)*(y(1) + (4*y(2))+y(3))/(3*n);

else
finalSeg = 0;

    if rem(length(x)-1, 2) ~= 0% even number of intervals (odd segments)
        c = x(end-1);
        d = x(end);
        finalSeg = (d-c)*(y(end-1)+y(end))/2;
        x(length(x)) = []; %sets empty x array
        y(length(y)) = []; %sets empty y array
        warning('Trapezoidal rule will be used on last interval due to odd segments')
    end
    n = length(x)-1;
    a = x(1);
    b = x(end);
    odd = [];
    even = [];

    %odd
    for i = 1:length(x) %for the length of x check if there is no remainder
        if rem(i,2) == 0
            odd(end+1) = y(i); 
        end
    end

    %even 
    for i = 2:length(x) %for the length of x check if there is a remainder
        if rem(i,2) ~= 0 
            even(end+1) = y(i);
        end
    end
I = (b-a) * (y(1) + 4*sum(odd)+2*sum(even) +y(end))/(n*3) + finalSeg;
end
   