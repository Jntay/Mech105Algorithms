# falsePosition
---
uses false position method to determine roots of a function

**input:**

- func - function name

- xl-lower bound, xu-upper bound

- es - desired error (default is 0.0001%)

- maxit - amount of iterations (default to 50)

- varargin - additional parameters


**output:**

- root - x-value of root approximation

- fx - value at estimated root

- ea - approximate relative error in %

- iter - number of iterations done

### To use:

In MATLAB, type:

\[root, fx, ea, iter\] = falsePosition\(*functionName,lowerBound,upperBound,desiredError,maximumIterations,additionalParameters*\)
