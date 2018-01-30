function [ CR ] = consistency( M,q )
%consistency The function calculates the maximum eigenvalue for square matrix M,
%            from the eigenvalue and the order of the matrix, we get the 
%            consistency index (CI) of the matrix, from CI we can calculate
%            the decision consistency index (CR) for reaching final decision
%            q = N (number of solutions) for RP matrix, q = P (number of
%            objectives) for RI matrix
A = randn(50,q);
M_random = corrcoef(A);% create a random pairwise function
eigen_val = max(eig(M));
eigen_ran = max(eig(M_random));

CI = (real(eigen_val)-q)/(q-1);
CR = CI/eigen_ran;

end

