function [ new_x ] = Gauss_Seidel(matrix,RHS,tol,x)
%Gauss Seidel iterative method implementation
%   This program is an iterative solver of linear systems of equations Ax=b
%   Matrix is the A matrix (assumed square)
%   RHS is the b vector
%   note that for gauss seidel, it will only converge if the matrix is
%   diagonal dominant, or symmetric and positive definite
%   x is the initial guess for the iterations
%   tol is the tolerance
%   checks use 2-norm
%   this program isn't very considerate of memory use (later edits)


length = size(matrix,1);
if(nargin<4)
    x = zeros(length,1); %if no inital input, make it all zeros
end

Lower = tril(matrix,0); % lower part of the matrix
Upper = triu(matrix,1);

while (true) %do while loop
    new_x = Lower\(RHS-Upper*x); %iterate
    test = norm(x-new_x)/norm(x);
    if test < tol
       break;
    end
    x = new_x;
end


end

