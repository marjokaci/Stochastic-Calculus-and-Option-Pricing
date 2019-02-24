%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%Time evolution of the GBM density %%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Assign number of bins and the edges
gbmnin=30; gbmmax=270; nbins=100;
edges=linspace(gbmmin,gbmmax,nbins);
%Build theoretical pdf at each time step
for j=2:nsteps+1
pdf values(j,:)=pdf('lognormal',edges,...
  log(X0)+(mu-sigma*sigma/2)*timestep(j),sigma*timestep(j)^0.5);
end
steps=20;
%Finally, the plot
h=figure('Color',[1 1 1]);
surf(edges, timestep(steps:steps:end),pdf values(steps:steps:end,:))
ylabel('Time')
ylim([timestep(steps) timestep(end)])
xlim([gbmmin, gbmmax])
xlabel('GBM Values');
zlabel('Density');
title('Time evolution of the GBM density')
print(h,'-dpng','LecBMFigTimeGBMDens')