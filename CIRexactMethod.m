%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%SIMULATING THE CIR MODEL: EXACT METHOD%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; clc
%CIR Parameters
alpha=0.01; sigma=0.05; Xt=0.03; mu=0.05;
nstep=200; horizon=1;nsimul=20;
dt=horizon/nstep;
X=zeros(nstep+1,1); X(1)=Xt;
Xall=[];
%compute d,k
d=4 *alpha *mu/sigma^2;
k=sigma^2 *(1-exp(-alpha*dt))/(4*alpha);
tic
for j=1:nsimul
  X=zeros(nstep+1,1); X(1)=Xt;
  for i=1:nstep
    lambda=4*alpha* X(i)/(sigma^2 *(exp(alpha*dt)-1));
    %%use the inverse of the non??central chi2
    X(i+1,:)=icdf('ncx2',rand,d,lambda)*k;
    %use the ncx2rnd command
    %X(i+1,:)=ncx2rnd(d,lambda)*k;
  end
  Xall=[Xall, X];
end
toc
h=figure('Color', [ 1 1 1]);
plot(dt*[0:nstep]',Xall); xlabel('Time')
title('Simulating the CIR model via Exact Simulation')
print(h,'??dpng','FigshortrateCIR Exact')