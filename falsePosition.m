function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
%inputs:
%   func = desired function
%   xl = lower bound
%   xu = upper bound
%   es = stopping criterion
%   maxit = maximum iterations (default 0.001%)
%outputs:
%   root = root of the function
%   fx = function value of the root
%   ea = relative error
%   iter = number of iterations

%extras notes:
%the general formula for false position is
% xr = xu - ((f(x)*(xl-xu))/(f(xl)-f(xu))


if nargin < 5 %if the user does not put in 5 inputs
    maxit = 200; %set the default iterations to 0
end
if nargin < 4 %if the user does not put in 4 inputs
    es = 0.0001; %set the default stopping criterion to 0.001
end
if nargin < 3 %if the user does not put in 3 inputs
    error('Error: minimum of 3 inputs')
end

%starting values
iter = 0; %starting with 0 iterations
xr = xl; %the guess that the lower bound is the root
ea = 100; %worst case scenario relative error


while ea > es && iter < maxit
    xr_o = xr; %the old guess becomes the guess of root
    iter = iter + 1;
    %false position formula
    xr = xu - (func(xu)*(xl-xu))/(func(xl)-func(xu));


    if func(xr)*func(xu) < 0
        xu = xr; %if the signs match xr becomes new upper bound
    else
        xl = xr; %otherwise it becomes new lower bound
    end
    %relative error
    ea = abs((xr-xr_o)/xr)*100;
end

root = xr;
fx = func(root);
iter = 1;

fprintf('The root is %f.\n', root);
fprintf('The method took %d iterations.\n', iter);
fprintf('The approximate error is %f.\n', ea);
fprintf('f is evaluated at the root as %f.\n', fx);
end




