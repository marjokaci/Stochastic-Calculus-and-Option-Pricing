%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%SIMULATING THE CIR MODEL: GAUSSIAN APPROXIMATION %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; clc; close all
alpha=0.01; sigma=0.05; Xt=0.03; mu=0.05;
nstep=200; horizon=1;nsimul=100;
dt=horizon/nstep;
Xall=[];
for j=1:nsimul
  X=zeros(nstep+1,1); X(1)=Xt;
  for i=1:nstep
    m=exp(-alpha*dt)*X(i)+mu*(1-exp(-alpha*dt));
    v=r(i)*(sigma*sigma/alpha)*...
      (exp(-alpha*dt)-exp(-2*alpha*dt))...
      +mu*(sigma*sigma/(2*alpha))*...
      (1-exp(-alpha*dt))^2;
    X(i+1)=m + sqrt(v)*randn;
  end
  Xall=[Xall, X];
end
h=figure('Color',[1 1 1]);
plot(dt*[0:nstep]',Xall)
xlabel('Time')
title('Simulating the CIR model with exact moments')
print(h,'??dpng','FigshortrateCIR Gaussian')