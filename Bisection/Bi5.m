% %lots of freaking eqs

% Explanation
% The equation to be evaluated can be obtained by substituting equations (1) to (4) in equation (5) and rearranging.
% 
%  
% 
% 0=K1/10^6[H+]KHpco2+2K2K1/10^6[H+]2KHpco2+Kw/[H+] −[H+]−Alk
%  
% 
%  
% 
% The MATLAB function then becomes
% 
%  
% 
% function f = fpHAlk(pH,pCO2,Alk)
% 
% K1=10^-6.3;K2=10^-10.3;Kw=10^-14;
% 
% KH=10^-1.46;
% 
% H=10^-pH;
% 
% f=K1/(1e6*H)*KH*pCO2+2*K2*K1/(1e6*H^2)*KH*pCO2+Kw/H-H-Alk;
% 
%  
% 
% For 2008, the resulting pH can be determined with the bisect function given below:
% 
%  
% 
% function [root,fx,ea,iter]=bisect(func,xl,xu,es,maxit,varargin)
% % bisect: root location zeroes
% % [root,fx,ea,iter]=bisect(func,xl,xu,es,maxit,p1,p2,...):
% % uses bisection method to find the root of func
% % input:
% % func = name of function
% % xl, xu = lower and upper guesses
% % es = desired relative error (default = 0.0001%)
% % maxit = maximum allowable iterations (default = 50)
% % p1,p2,... = additional parameters used by func
% % output:
% % root = real root
% % fx = function value at root
% % ea = approximate relative error (%)
% % iter = number of iterations
% 
% if nargin<3,error('at least 3 input arguments required'),end
% test = func(xl,varargin{:})*func(xu,varargin{:});
% if test>0,error('no sign change'),end
% if nargin<4|isempty(es), es=0.0001;end
% if nargin<5|isempty(maxit), maxit=50;end
% iter = 0; xr = xl; ea = 100;
% while (1)
%     xrold = xr;
%     xr = (xl + xu)/2;
%     iter = iter + 1;
%     if xr ~= 0,ea = abs((xr - xrold)/xr) * 100;end
%     test = func(xl,varargin{:})*func(xr,varargin{:});
%     if test < 0
%         xu = xr;
%     elseif test > 0
%         xl = xr;
%     else
%         ea = 0;
%     end
%     if ea <= es | iter >= maxit,break,end
% end
% root = xr; fx = func(xr, varargin{:});
% 
%  
% 
% The MATLAB session gives
% 
%  
% 
% >> [pH2008 fx ea iter]=bisect(@fpHAlk,2,12,1e-8,50,386,0.5e-3) 
% 
% pH2008 =
% 
%     7.8685
% 
% fx =
% 
%     -4.9621E-13
% 
% ea =
% 
%     7.3975E-09
% 
% iter =
% 
%     34