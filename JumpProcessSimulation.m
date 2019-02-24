%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% SIMULATING JUMP PROCESSES %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Assigning the number of simulated paths
%(nsimul), time to maturity (expiry), number of steps
%(nsteps), time step (dt)
%and observation times (timestep):
clear all; nsimul=5, expiry=1, nsteps=250;
dt=expiry/nsteps; timestep=[0:dt:expiry]';
%Assigning parameters
lambdaP=5; muZ=-0.05; sigmaZ=0.1; alpha=5; lambdaG=10;
%Simulate increments of the Poisson process
dN=poissrnd(lambdaP*dt,[nsteps,nsimul]);
%Simulate Poisson process
%(use cumulative sum of the increments):
cdN=[zeros(1,nsimul); cumsum(dN)];
%1. Simulate increments of the CPP
%for Gaussian jump sizes
dJ=muZ*dN+sigmaZ*sqrt(dN).*randn(nsteps,nsimul);
%2. Simulate CPP process
%(use cumulative sum of the increments):
cdJ=[zeros(1,nsimul); cumsum(dJ)];
%3. Simulate increments of the Gamma process:
dG=gamrnd(dt*alpha,1/lambdaG,[nsteps,nsimul]);
%4. Simulate Gamma process
%(use cumulative sum of the increments):
cdG=[zeros(1,nsimul); cumsum(dG)];
%Plot simulated paths:
h=figure('Color', [ 1 1 1])
subplot(3,1,1);plot(timestep, cdN);xlabel('Time (years)')
title('Simulated Paths of the Poisson Process')
subplot(3,1,2);plot(timestep, cdJ);xlabel('Time (years)')
title('Simulated Paths of the Compound Poisson Process')
subplot(3,1,3);plot(timestep, cdG);xlabel('Time (years)')
title('Simulated Paths of the Gamma Process')