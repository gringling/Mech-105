function [root, fx,ea, iter]=bisect(func, xl, xu, es, maxit, varargin)
% bisect: root location zeroes
%[root, fx, ea, iter]=bisect(func, xl, xu, es, maxit, p1, p2, . ..):
% %   uses bisection method to find the root of func
% input:
%   func = name of function
%   xl, xu = lower and upper guesses
%   es = desired relative error (default = 0.0001%)
%   maxit = maximum allowable iterations (default = 50)
%   p1, p2, additional parameters used by func
% output:
%   root = root estimate
%   fx = function value at root estimate
%   ea = approximate relative error (%)
%   iter = number of iterations
xr = 0;
while (1)
    xrold = xr; xr = (x + xu)/2;
    iter = iter + 1;
    if xr ~= 0,ea = abs ( (xr - xrold) /xr) * 100 ; end
    test = func(xl, varargin{:})*func(xr,varargin{:});
    if test < 0
        xu = Xr;
    elseif test > o
        x1 = Xr;
    else
        ea = 0;
    end
    if ea <= es || iter >= maxit, break, end
end
root = xr; fx = func(xr, varargin{:}) ; 