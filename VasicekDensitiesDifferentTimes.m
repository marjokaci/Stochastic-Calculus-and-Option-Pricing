%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%VASICEK densities at different time horizons%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
%Fix the time horizons
horizon=[0.25 0.5 0.75 1 5];
%Assign new parameters
mu=0.09; sg=0.05; a=0.8;X0=0.04;
%Compute Exp. Value and variance
meanVas=mu+exp(-a*horizon).*(X0-mu);
varVas=sg*sg*(1-exp(-2*a*horizon))/(2*a);
range=linspace(mu-3*sg/(2*a)^0.5,...
mu+3*sg/(2*a)^0.5,200);
pdfV=[];
for i=1:length(horizon)
meanV=meanVas(i);
stdV=varVas(i).^0.5;
pdfVas=pdf('norm', range,meanV,stdV);
pdfV=[pdfV;pdfVas];
end
h=figure('Color',[1 1 1]);
plot(range,pdfV)
title('PDF of X(t) at different horizons')
xlabel('X(t)');ylabel('pdf')
legend('0.25 yrs','0.5 yrs','0.75 yrs','1 years','5 yrs')
print(h,'??dpng','LecBMFigpdfVasicek')