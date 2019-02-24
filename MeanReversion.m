%%%%%%%%%%%%%%%%%%%%%%
%%%%MEAN REVERSION%%%%
%%%%%%%%%%%%%%%%%%%%%%
clear all;expiry=10;
timestep=linspace(0,expiry,100)';
mu=100; alpha=1;
sol=@(x0,alpha,timestep) mu+(x0-mu)*exp(-alpha*timestep);
%Plot solutions:
h=figure('Color', [ 1 1 1]);
fplot(@(timestep) sol(100, alpha,timestep), [0 expiry])
hold on;
fplot(@(timestep) sol(120, alpha,timestep), [0 expiry],'g')
hold on;
fplot(@(timestep) sol(80, alpha,timestep), [0 expiry],'b')
hold on;
fplot(@(timestep) sol(120, 2*alpha,timestep), [0 expiry],'cyan')
hold on;
fplot(@(timestep) sol(80, 2*alpha,timestep), [0 expiry],'red')
xlabel('Time (years)'); ylabel('X(t)')
legend('Model 1: x 0=100, nmu = 100, nalpha = 1', ...
'Model 2: x 0=120, nmu= 100, nalpha = 1 ',...
'Model 3: x 0=80, nmu = 100, nalpha = 1',...
'Model 4: x 0=120, nmu = 100, nalpha = 2',...
'Model 5: x 0=80, nmu = 100, nalpha = 2')
title('Convergence of X(t) towards its long??run value')
print(h,'??dpng','LecBMFigMeanReversion.png')