function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

%Test
if length(x) ~= length(y)
    error('vectors must be the same size')
elseif isuniform(x) ~= 1
    error('x-vector must be evenly spaced')
end
lX = length(x); %length of x vector
if length(x) == 2 %Trap Rule (2 data points ONLY)
    warning('only 2 data points... Trap rule used')
    b = x(2); a = x(1);%establish endpoints
    I = (b - a)*(y(1)+y(2))/2;%Trap rule single app
elseif length(x) == 3 %Simpson's 1/3 for 3 data points
    b = x(end); a = x(1);%establish enpoints
    I = (b - a)*(y(1)+4*y(2)+y(3))/6;
            %Simpson's 1/3 for 3 Segments%
elseif mod(lX,2) == 0 %if there are an odd amount of segments
    warning(['uneven amount of segments... ' ...%Trap Rule required
        'Trap rule used for last segment'])     %for last segment
    sRule = x(1:end - 1); %new x-vector for simpson's 1/3 rule
    callVec = 1:length(sRule); %call vector ie. f(1,2,3....)
    b = sRule(end); a = sRule(1); %establish endpoints
    n = length(sRule) - 1; % # of segments
    oddS = callVec(2:2:end - 1); %creates a vector for calling odd values
    evenS = callVec(3:2:end - 2); %creates a vector for calling even values
    iSimp = (b - a)*(y(1)+4*sum(y(oddS))+2*sum(y(evenS)) ...
        +y(callVec(end)))/(3*n); %Simpson's 1/3 forr all but last segment
    iTrap = (x(end) - x(end -1))*(y(end)+y(end - 1))/2; %Trap rule for
    I = iSimp+iTrap;%combines Simpson's and Trap        last segment
else
    b = x(end); a = x(1);%establishes endpoints
    n = length(x) - 1;%# of segments
    callVec = 1:length(x);%call vector ie. f(1,2,3....)
    oddS = callVec(2:2:end - 1);%creates a vector for calling odd values
    evenS = callVec(3:2:end - 2);%creates a vector for calling even values
    I = (b - a)*(y(1)+4*sum(y(oddS))+2*sum(y(evenS))+y(end))/(3*n);
                        %Simpson's Rule%
end

end