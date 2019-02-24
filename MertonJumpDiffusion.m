%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% SIMULATING THE MERTON JD Process %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Assigning the number of simulated paths
%(nsimul), time to maturity (expiry), number of steps
%(nsteps), time step (dt) and observation times (timestep):
clear all; nsimul=50; expiry=1; nsteps=250;
dt=expiry/nsteps; timestep=[0:dt:expiry]';
%Assigning parameters
mu=-0.0003; sigma=0.0425; lambda=0.5175;
muZ=0.0064; sigmaZ=0.1520;
%1. Simulate increments of the ABM
dW=mu*dt+sigma*sqrt(dt).*randn(nsteps,nsimul);
%2. Simulate increments of the CPP
dN=poissrnd(lambda*dt,[nsteps,nsimul]);
dJ=muZ*dN+sigmaZ*sqrt(dN).*randn(nsteps,nsimul);
dX=dW+dJ;
%3. Simulate MJD process
%(use cumulative sum of the increments):
cdX=[zeros(1,nsimul); cumsum(dX)];
%Plot simulated paths:
h=figure('Color', [ 1 1 1])
plot(timestep, cdX);xlabel('Time (years)')
xlabel('Time')
title('Simulated Paths of the Merton JD Process')
print(h,'??dpng','FigMJDPaths')