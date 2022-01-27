clear all;clc;

%%%%% Declare variables %%%%%%%%%%%%%%%%%%%%%%%%%%
m=16;
n=8;

A=randn(m,n);
b=randn(m,1);
bnds=randn(n,2);
l=min(bnds,[],2);  %here min(bnds,[],2) means taking the minimal value in each row;
u=max(bnds,[],2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Solve the optimization problem with cvx %%%%%
cvx_begin
   variable x(n)
   minimize( norm(A*x-b))
   subject to
      l<=x<=u
cvx_end
%%% End of CVX %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('The optimal solution is:')
disp(x)


