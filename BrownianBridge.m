%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%SIMULATING THE BROWNIAN BRIDGE %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Assigning the number of simulated paths
%(nsimul), time to maturity (expiry), number of steps
%(nsteps), time step (dt) and observation times (timestep):
clear all;
nsimul=10000, expiry=1, nsteps=250;
dt=expiry/nsteps;
timestep=[0:dt:expiry]';
Wt=zeros(nsteps+1,nsimul);
%Simulate the Brownian motion at T:
eY = randn(1,nsimul);
Wt(nsteps+1,:)= sqrt(expiry).*eY;
%Simulate the Brownian motion W(t):
for j=2:nsteps
deltat1=(nsteps+1-j)/(nsteps+1-j+1);
eYt = randn(1,nsimul);
Wt(j,:)=deltat1*Wt(j-1,:)+(1-deltat1)*Wt(nsteps+1,:)+sqrt(deltat1*dt)*eYt;
end
Bb=Wt;
%Plot simulated paths:
h=figure('Color',[1 1 1])
plot(timestep, Bb)
title('Simulated Paths of the Brownian motion via Brownian Bridge')
xlabel('Time (years)')