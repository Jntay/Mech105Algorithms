function[root,fx,ea,iter] = bisect(func,xl,xu,es,maxit)
%uses bisection method to determine roots of a function
%input:
%func - function name
%xl-lower bound, xu-upper bound
%es - desired error (default is 0.0001%)
%maxit - amount of iterations (default to 50)
%
%output:
%root - x-value of root approximation
%fx - value at estimated root
%ea - approximate relative error in %
%iter - number of iterations done
%syms func(x)

if nargin < 3
    error('please input a function name upper and lower bounds')
end
test = func(xl)*func(xu);
if test > 0
    error('no sign change')
end
if nargin < 4 || isempty(es)
    es = 0.0001;
end
if nargin <5 || isempty(maxit)
    maxit = 50;
end
iter = 0; xr = xl; ea = 100;
while(1)
    xrold = xr; xr = (xl+xu)/2;
    iter = iter + 1;
    if xr ~= 0
        ea = abs((xr-xrold)/xr)*100;
    end
    test = func(xl)*func(xr);
    if test < 0
        xu=xr;
    elseif test > 0
        xl = xr;
    else
        ea=0;
    end
    if ea <= es || iter >= maxit, break, end
end
root = xr 
fx = func(xr)
display(iter)