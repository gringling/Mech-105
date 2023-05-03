%use a file to determine osf of 10,12,14
%starting parameters
osf=14;
f=@(T) (exp((-139.34411)+((1.575701*10^5)./(T+273.15))-((6.642308*10^7)./((T+273.15).^2))+((1.243800*10^10)./((T+273.15).^3))-((8.621949*10^11)./((T+273.15).^4)))-osf);
xl=0;xu=35; %bounds
z(1)=(a+b)/2; %
if (f(xl(1))*f(z(1)))<0
    xl(2)=xl(1);xu(2)=z(1);
else
    xl(2)=z(1);xu(2)=xu(1);
end
sol=zeros(1,100);
for i=2:100
    z(i)=(xl(i)+xu(i))./2;
    if (f(xl(i))*f(z(i)))<0
        xl(i+1)=xl(i);xu(i+1)=z(i);
    else
        xl(i+1)=z(i);xu(i+1)=xu(i);
    end
    if (z(i)-z(i-1))<=0.05
        sol(i)=z(i);
    end
end
display(sol(100));


%becharas answer
% function TC = TempEval(osf)
% % function to evaluate the temperature in degrees C based
% % on the oxygen saturation concentration in freshwater (osf).
% xl = 0 + 273.15; xu = 35 + 273.15;
% if fTa(xl,osf)*fTa(xu,osf)>0 %if guesses do not bracket
%     error('no bracket') %display an error message and terminate
% end
% xr = xl;
% for i = 1:10
%     xrold = xr;
%     xr = (xl + xu)/2;
%     if xr ~= 0, ea = abs((xr - xrold)/xr) * 100; end
%     test = fTa(xl,osf)*fTa(xr,osf);
%     if test < 0
%         xu = xr;
%     elseif test > 0
%         xl = xr;
%     else
%         ea = 0;
%     end
% end
% TC = xr - 273.15;
%  
% 
% function f = fTa(Ta, osf)
% f = -139.34411 + 1.575701e5/Ta - 6.642308e7/Ta^2;
% f = f + 1.2438e10/Ta^3 - 8.621949e11/Ta^4;
% f = f - log(osf);







