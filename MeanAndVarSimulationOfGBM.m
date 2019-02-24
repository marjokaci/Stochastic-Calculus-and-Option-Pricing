%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%Plot Theoretical and Simulated values of E(X) and V(X)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%estimate mean from the simulations
SimulatedMean=mean(X')';
h=figure('Color',[1 1 1]);
plot(timestep, [SimulatedMean, EX])
xlabel('Time'); ylabel('E(X)')
legend('Simulated expected value','Theoretical expected value','location','best')
title('Comparing the theoretical mean of the GBM with the one estimated via MC')
print(h,'??dpng','LecBM mean GBM')
%%Now we repeat the calculation for the variance.
%compute theoretical variance
VX=X0^2*exp(timestep*2*(mu-sigma^2/2)+4*sigma^2/2*timestep)-EX.^2;
%estimate variance from the simulations
SimulatedVar=var(X')';
h=figure('Color',[1 1 1]);
plot(timestep, [SimulatedVar VX])
xlabel('Time');ylabel('V(X)');
legend('Simulated variance','Theoretical variance','location','best')
title('Comparing the theoretical variance of the GBM with the one estimated via MC')
print(h,'??dpng','LecBM var GBM')