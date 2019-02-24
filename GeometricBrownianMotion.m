%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%SIMULATING THE GEOMETRIC BROWNIAN MOTION %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Assign the number of simulated paths (nsimul)
nsimul=100;
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
dY=(mu-sigma^2/2)*dt+sigma*randn(nsteps,nsimul)*dt^0.5;
%Simulate ABM process: cumulate increments
Y=[zeros(1,nsimul); cumsum(dY)];
%Simulate the GBM: exponentiate the levels of the ABM
X0=100; %assign initial level
X=X0*exp(Y);
%Plot the simulated paths and we
%overimpose to it the expected value of the process
%Compute theoretical expected value
EX=X0*exp(timestep*mu);
%Plot simulated paths:
h=figure('Color',[1 1 1]);
plot(timestep, X)
hold on
plot(timestep, EX,'r.')
title('Simulated paths of the geometric Brownian Process GBM(0.2, 0.3)')
xlabel('Time'); ylabel('GBM(t)');
print(h,'??dpng','SimulatedGBM')