function [fX, fY, slope, intercept, Rsquared] = linearRegression (x,y)
% linearRegression
% - Creates a line of least squares linear regression based off of data
% given by the user
%Inputs
% - x: data set of the independent variables
% - y: data set of the dependent variable evaluated @x
%Outputs
% - fX: x-values with the outlier removed
% - fY: y-values with the outlier removed
% - slope: slope of the line of linear regression
% - intercept: intercept from the linear regression line
% - Rsquared: coefficient of determination


%test and throw errors if necessary
if nargin ~= 2
    error('requires 2 data sets');
end
test = length(x) - length(y);
if test ~= 0
    error('length of data sets must be the same');
end
%correspond x values to sorted y values
[fY, sortOrder] = sort(y);
fX = x(sortOrder);
n = length(y);
%quartiles and interquatile range for y data
q1 = floor((n+1)/4);
q3 = floor((3*n+3)/4);
iqr = q3 - q1;
qU = 1.5*iqr + fY(q3);
qL = fY(q1) - 1.5*iqr;

% Create a vector with all outliers
oVec = fY > qU | fY < qL;
fX(oVec) = [];
fY(oVec) = [];

%Create and interperet Linear Regression Line
n = length(fY);
my = mean(fY);
slope = (n*sum(fX.*fY) - sum(fX)*sum(fY))/(n*sum(fX.^2)-(sum(fX).^2));
intercept = my - slope*mean(fX);
regLine = @(fX) intercept + slope*fX;
ssTot = sum((fY - my).^2);
ssRes = sum((fY - regLine(fX)).^2);
Rsquared = 1 - ssRes/ssTot;
%Coeffiecient of Determination

