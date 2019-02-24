%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%SIMULATING THE ARITHMETIC BROWNIAN MOTIONS%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
%Assign the number of simulated paths (nsimul)
nsimul=1000;
%Time to maturity (expiry)
expiry=1;
%number of steps (nsteps)
nsteps=250;
%time step (dt) and observation times (timestep):
dt=expiry/nsteps;
timestep=[0:dt:expiry]';
%model parameters
mu=0.2; sigma=0.3;
%Simulate increments ABM dX:
dX=mu*dt+sigma*randn(nsteps,nsimul)*dt^0.5;
%Simulate ABM process: cumulate increments
X=[zeros(1,nsimul); cumsum(dX)];
%compute theoretical expected value
EX=timestep*mu;
%Plot simulated paths:
h=figure('Color',[1 1 1]);
plot(timestep, X)
hold on
plot(timestep, EX,'r.')
title('Simulated Paths of the Arithmetic Brownian Process ABM(0.2, 0.3)')
xlabel('Time')
print(h,'??dpng','LecBMSimulatedABM')
%Sstimate mean of X(t) from the simulations
%and compare to the true one
SimulatedMean=mean(X')';
h=figure('Color',[1 1 1]);
plot(timestep, [SimulatedMean, EX])
xlabel('Time')
legend('Simulated expected value','Theoretical expected value')
title('Comparing the theoretical mean of the ABM with the one estimated via MC')
print(h,'??dpng','LecBM mean ABM')
%Now we repeat the calculation for the variance.
%compute theoretical variance
VX=timestep*sigma^2;
%estimate variance from the simulations
SimulatedVar=var(X')';
h=figure('Color',[1 1 1]);
plot(timestep, [SimulatedVar, VX])
xlabel('Time')
legend('Simulated variance','Theoretical variance','location','best')
title('Comparing the theoretical variance of the ABM with the one estimated via MC')