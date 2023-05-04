performs LU decomposition with pivoting

inputs:
- A = coefficient matrix

outputs:

- L = lower triangular matrix
- U = upper triangular matrix
- P = the permutation matrix

Syntax: luFactor(A)

Example:
> A = [10, 2, -1; 
    -3, -6, 2;
    1, 1, 5];
    
>b = [27; -61.5; -21.5]

>[L, U, P] = luFactor(A)
