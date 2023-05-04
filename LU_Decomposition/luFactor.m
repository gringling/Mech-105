function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix

%check to ensure matrix is square
[m,n] = size(A);
if m ~= n
    error('Matrix dimensions must be a square')
end

[m,n] = size(A); %set m,n to the size of A
L = eye(n); %define the lower matrix
P = eye(n); %define the upper matrix
U=A; %define the upper matrix to start as A

for t=1:m-1 %loop the first column excluding the last row
    pivot = max(abs(U(t:m,t))); %the pivot is the max value in first row
    %perform partial pivoting
    for k=t:m
        if (abs(U(k,t))==pivot)
            ind = k;
            break;
        end
    end

    U([t,ind],t:m)=U([ind,t],t:m); %swaps the upper matrix accordingly
    L([t,ind],1:t-1)=L([ind,t],1:t-1);%swaps the lower matrix accordingly
    P([t,ind],:)=P([ind,t],:); %swaps the pivot matrix accordingly
    
    for k = t+1:m %elimination process
        L(k,t) = U(k,t)/U(t,t); %finds the a11/a21 value
        U(k,t:m) = U(k,t:m)-L(k,t)*U(t,t:m); %performs elimination
    end

end

