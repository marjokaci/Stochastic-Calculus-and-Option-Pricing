%CIR Parameters & time horizon
alpha=0.03; sigma=0.02; Xt=0.04; mu=0.03;
tau=[1 5 10 15 20 50];
%compute d
d=4 *alpha *mu/sigma^2;
%grid values for X
XT=linspace(0,0.12,200);
for i=1:length(tau)
lambda=4*alpha* Xt/(sigma^2 *(exp(alpha*tau(i))-1));
k=sigma^2 *(1-exp(-alpha*tau(i)))/(4*alpha);
pdfcir(:,i)=pdf('ncx2',XT/k,d,lambda)/k;
%check expected value
EXTnum(i)=trapz(XT,XT.*pdfcir(:,i)');
end
h=figure('Color', [ 1 1 1]);
plot(XT,pdfcir,'.'); xlabel('X'); ylabel('pdf')
legend('T-t=1','T-t=5','T-t=10','T-t=15','T-t=20','T-t=20')
title('The CIR pdf at different horizons')
print(h,'-dpng','FigshortrateCIR')