falsePosition finds the root of a function using false position method

inputs
- func = desired function
- xl = lower bound
- xu = upper bound
- es = stopping criterion
- maxit = maximum iterations (default 0.001%)

outputs:
- root = root of the function
- fx = function value of the root
- ea = relative error
- iter = number of iterations 

Syntax: falsePosition(func, xl, xu, es, maxit, varargin)
Example: 

>fx = @(x) x^2 - 2
>
>root = falsePosition(fx, -2, 2, 0.01, 10) 
