%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%SIMULATING THE CIR MODEL: EULER DISCRETIZATION %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; clc;
%Model parameters
alpha=0.01; sigma=0.05; Xt=0.03; mu=0.05;
%Simulation parameters
nstep=200; horizon=1;nsimul=100;
dt=horizon/nstep;
Xall=[];%variable to store simulated values
for j=1:nsimul
  X=zeros(nstep+1,1); X(1)=Xt;
  for i=1:nstep
    X(i+1)=X(i)+ alpha*(mu-X(i))*dt+...
    sigma *sqrt(X(i)*dt)*randn;
  end
  Xall=[Xall, X];
end
h=figure('Color',[1 1 1]);
plot(dt*[0:nstep]',Xall)
xlabel('Time')
title('Simulating the CIR model via Euler discretization')
print(h,'??dpng','FigshortrateCIR Euler')