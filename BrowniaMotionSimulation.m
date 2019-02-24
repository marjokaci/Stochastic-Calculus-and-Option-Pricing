%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%SIMULATING THE BROWNIAN MOTION%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nsimul=50; %Assigning the number of simulated paths
expiry=1; %time to maturity (expiry)
nsteps=250; %number of steps
dt=expiry/nsteps;%time step (dt)
timestep=[0:dt:expiry]';%observation times (timestep)
%Simulate increments of the BM setting:
dw=randn(nsteps,nsimul) * dt^0.5;
%Simulate Brownian motion process:
%use cumulative sum of the increments
cdW=[zeros(1,nsimul); cumsum(dw)];
%Plot simulated paths:
h=figure('Color', [ 1 1 1]); plot(timestep, cdW)
title('Simulated Paths of the Wiener Process');
xlabel('Time (years)')
%Save the figure in a png format
print(h,'??dpng','FigBMPaths')