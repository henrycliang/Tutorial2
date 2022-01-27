clear all;clc;

% An example given by CVX website
%%%%%%%% declare the variables %%%%%%%%%%%%%%%%%%%%%%
m=20;
n=10;
p=4;

A=randn(m,n);
b=randn(m,1);
C=randn(p,n);
d=randn(p,1);
e=rand;  % rand returns a random number evenly distributed in the interval (0,1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Solve the optimization problem with cvx
cvx_begin
    variable x(n)
    minimize( norm(A*x-b,2))
    subject to
        C*x==d
        norm(x, inf)<=e
cvx_end
%%%%% End of CVX %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


disp('The optimal solution is:')
disp(x);



