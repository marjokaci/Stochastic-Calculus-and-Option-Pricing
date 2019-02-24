%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%Plot GBM densities at different time horizons%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Fix the range and the number of points
gbmmin=0; gbmmax=max(max(X));nbins=100;
%Fix the times at which to plot the densities
horizon=[50, 125, 250]+1;
h=figure('Color',[1 1 1]);
for j=1:length(horizon)
  ndays=horizon(j);
  subplot(3,1,j);
  %theoretical distribution
  histogram(X(ndays,:),nbins,'Normalization','pdf');
  xlabel('GBM Values')
  hold on
  %theoretical distribution
  plot(edges,pdf('lognormal',edges,...
    log(X0)+(mu-sigma^2/2)*timestep(ndays),sigma*timestep(ndays).^0.5))
  xlim([gbmmin gbmmax]);
  legend('Simulated','Lognormal','location','best')
  title(strcat('Density in ', [' ' num2str(horizon(j)/horizon(end),2)], ' years'))
end
print(h,'-dpng','LecBMFigGBMDens')