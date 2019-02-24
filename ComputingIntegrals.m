%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%Computing Integral[W(s) dW(s),fs,0,Tg]%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
expiry=1;
nstep=10000;
nsimul=10;
%fix the time step
dt=expiry/nstep;
%simulate increments of the BM
dW=randn(nstep,nsimul)*dt^0.5;
%simulate the BM by cumulating the increments
W=[zeros(1,nsimul); cumsum(dW)];
%Approximated value of the stoch. integral by a sum
StocInt=sum(W(1:end-1,:).*dW)';
%Exact Value
ExactInt=(W(end-1,:).^2-expiry)'/2;
%Plot the result:
%The simulated values stay on the 45 degree red line.
h = figure('Color',[1 1 1]);
axis equal
plot(StocInt, ExactInt,'.')
hold on
fplot(@(x) x,[-1,6],'red')
ylabel('nint 0ˆt W(s)dW(s)')
print(h,'??dpng','FigStocIntegral')