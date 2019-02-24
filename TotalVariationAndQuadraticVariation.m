%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%COMPUTING BY SIMULATION TOTAL VARIATION%%%
%%%AND QUADRATIC VARIATION OF THE BM%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
i=1; %Counter to be used in the for cycle
expiry=1; %Time horizon
nsimul=500;%Number of simulations
N=(50:50:10000);%number of points in the partition
for jstep=N %increase the number of steps (refine the partition)
dt=expiry/jstep; %reduce the time step
%simulate increments of the BM
dW=[zeros(1,nsimul); randn(jstep,nsimul)*dt^0.5];
%compute total variation
TV(i,:)=sum(abs(dW));
%compute quadratic variation
QV(i,:)=sum(dW.^2);
i=i+1; %update the counter
end
h=figure('Color',[1 1 1]);
plot(N, TV,'r')
hold on
plot(N,(N*expiry*2/pi).^0.5,'b') %this is the plot of the E[TV]
title('BM has unbounded total variation');
xlabel('Number of steps (Fixed time interval=1yr)')
print(h,'??dpng','LecBM fig TV')
h = figure('Color',[1 1 1]);
plot(N,QV,'r',N,expiry,'b.')
legend('Simulated QV', 'Theoretical QV')
title('BM has bounded quadratic variation');
xlabel('Number of steps (Fixed time interval=1yr)')