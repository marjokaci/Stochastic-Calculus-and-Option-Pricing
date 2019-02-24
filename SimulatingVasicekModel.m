%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%SIMULATING THE VASICEK MODEL%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;close all
%Model: dX = a * (mu ?? X ) * dt + sg * dW
%Assign Inputs
X0=0.05; a=10; mu=0.07; sg=0.1; nstep=250; horizon=1;
nsimul=1000; dt=horizon/nstep; timestep=[0:nstep]*dt;
%Compute the variance of the increments
vol2=(1-exp(-2*a*dt))/(2*a);
Xall=[];%variable where to store the simulations
for j=1:nsimul
%Initialize the interest rate vector
X=zeros(nstep+1,1); X(1)=X0;
%Simulate the increments of the BM
dW=randn(nstep,1)*vol2^0.5;
%Start iteration
for i=1:nstep
X(i+1)=mu+exp(-a*dt)*(X(i)-mu)+sg*dW(i);
end
%store the simulated path
Xall=[Xall, X];
end
%Plot the sample paths
h=figure('Color',[1 1 1]);
%plot a limited number of simulations for better simulation
plot([0:nstep]*dt,[Xall(:,1:50), mu+(X0-mu)*exp(-a*timestep)']);
xlabel('Time')
legend('Simulated paths','Expected path')
print(h,'??dpng','LecBM SimVasicek new')