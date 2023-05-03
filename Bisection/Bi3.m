%determine max deflection

 w0 = 2.5;
 E = 50000;  
 I = 30000;  
 L=600;  
  
 xl = 0;  xu = 599; %Range for roots   
 while (abs((xl-xu)/xl)>0.0000001) %for keeping error below 0.000001    
  xr = (xl+xu)/2;                
  dy = (w0)/(120*E*I*L)*(-5*xr^4+6*L^2*xr^2-L^4);  %we require dy/dx = 0, equation of dy/dx 
 yl = (w0)/(120*E*I*L)*(-5*xl^4+6*L^2*xl^2-L^4);  %dydx value of a
 yb = (w0)/(120*E*I*L)*(-5*xu^4+6*L^2*xu^2-L^4);   %dydx value of b  
 if (sign(dy) ~= sign(yb))  %if the signs dont match          
    xl = xr; %xr becomes new lower bound          
 else           
    xu = xr; %xr becomes new upper bound 
 end  
 end    
 x = (xl+xu)/2; %final value of x
 y = (w0)/(120*E*I*L)*(-x^5+2*L^2*x^3-L^4*x); %final value of y
 fprintf("Point of maximum deflection in m: %f \nMaximum Deflection in m: %f", x/100, y/100)