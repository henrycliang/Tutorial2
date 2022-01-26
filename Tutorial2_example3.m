%%% An example from Homework1 %%%%
%%% Distributed Power Control %%%%
clear; clc; % clear the working space and command window

%%% Declare the variables %%%
G=[ 1.0, 0.2, 0.4;
    0.3, 1.0, 0.2;
    0.2, 0.1, 1.0;];
gamma=[1.0; 1.6; 1.2];
noise=[0.1; 0.1; 0.1];
N=3;  % number of transmitters and receivers

%%% internal variables %%%%%%%%%%%%%%%%%%%%%%%%%%%%
f=ones(1,N);
D=diag(gamma);
F=(G-diag(diag(G)))./repmat(diag(G),1,3);
v=gamma.*noise./diag(G);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Solving with CVX %%%%%%%%%%
cvx_begin 
cvx_solver sedumi % default solver is sdpt3 
    variable p(N)
    minimize(f*p)
    subject to
    (eye(3)-D*F)*p>=v
cvx_end
%%% End of CVX %%%

disp('The optimal solution is:');
disp(p)



