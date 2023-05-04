function [L, A, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix

%Test%
if length(A) ~= height(A)
    error('matrix must be square')
end
P = eye(length(A));
L = eye(length(A));
U = A;
for m = 1:length(A)-1
    u = abs(U(m:end,m)); %--exclude previous row
    mA = find(u == max(u))+m-1; %--find pivot term
    P([m mA],:) = P([mA m],:); %--swap pivot term
    U ([m mA],:) = U([mA m],:); %to top column
    if m ~= 1
        L([m mA],1:m-1) = L([mA m],1:m-1); %--swap L matrix as well 
        %                                       (excluding top row)
    end
    for n = m+1:length(A) %Elimination
        f = (U(n,m)/U(m,m));%ie. "a_21/a_11"
        L(n,m) = f;%--add multipliers to L matrix
        U(n,:) = U(n,:) - (f*(U(m,:)));
    end
end
end
