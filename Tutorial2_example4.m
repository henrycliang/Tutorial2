close all;
clear;
clc;


%%% Declare the variables %%%
G=[ 1.0, 0.2, 0.4;
    0.3, 1.0, 0.2;
    0.2, 0.1, 1.0;];
gamma=[1.0; 1.6; 1.2];
noise=[0.1; 0.1; 0.1];
N=3;  % number of transmitters and receivers

T=20; %number of iterations
p=zeros(N,T+1);  %save the transmit power, since we are asked to write out the transmit power in Homework1
SIR=zeros(N,T);

p(:,1)=[1.0;1.0;1.0];
for t=1:T
    % compute the SIR
    receive_signal=diag(G).*p(:,t);
    interference_noise=G*p(:,t)-diag(G).*p(:,t)+noise;
    SIR(:,t)=receive_signal./interference_noise;
    
    % compute the transit power
    p(:,t+1)=gamma./SIR(:,t).*p(:,t);
end

% plot power
figure(1);hold on;
xlabel('Iteration (t)'); ylabel('Power (mW)');
title('Transmit Power');
grid on;
ylim([0 1.2]);
plot(0:1:T,p);
legend({'receiver 1','receiver 2','receiver 3'});


figure(2);hold on;
xlabel('Iteration (t)'); ylabel('SIR');
title('SIRs');
grid on
ylim([0.5 2.8]);
plot(0:1:(T-1), SIR);
legend({'receiver 1','receiver 2','receiver 3'});

%for i=1:T
%    fprintf('Power of Iteration %d is %f\n',i,p(:,1)); 
%end
disp('The optimal tranmit power is:');
disp(p(:,21));


    