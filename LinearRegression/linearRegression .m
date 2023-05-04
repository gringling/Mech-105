function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination

x = [1 2 3 4 5 6];
y = [1 2 1.3 3.75 2.5 100];
%check if arrays match
if length(x) == length(y)
    x = x;
    y = y;
else
    error('array dimensions are not equal')
end
%sort the given data
[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);

%filtering things
%split data into the medians

med = median(sortedY); %median of sorted data

Q1 = median(sortedY(sortedY<med)); %first quartile
Q3 = median(sortedY(sortedY>med));%third quartile
IQR = Q3-Q1; %interquartile

upper = Q3 + 1.5*IQR; %evaluated values above this are outliers
lower = Q1 - 1.5*IQR; %evaluated values below this are outliers
outliers = sortedY < lower | sortedY > upper; %any values outside bounds
fY = sortedY(~outliers);%removes outliers from y values
fX = sortedX(~outliers); %removes outliers from x values

%linear regression
%components of linear regression things
n = length(fY);
sxy = sum(fX.*fY);
sx = sum(fX);
sy = sum(fY);
sx2 = sum(fX.^2);
sy2 = sum(fY.^2);

a1 = ((n*sxy-sx*sy)/(n*sx2-sx.^2)); %this is slope of the regression
a0 = mean(fY)-a1*mean(fX); %this is the intercept of regression
intercept = a0;
fx = @(x) a0+ a1*x;
slope = a1;

%R sqaured value
ybar = mean(fY); %mean of y values
SStot = sum((fY-ybar).^2);%sum of squares
SSres = sum((fY-fx(fX)).^2);%sum of residuals
Rsquared = 1 - SSres/SStot;





   


end
