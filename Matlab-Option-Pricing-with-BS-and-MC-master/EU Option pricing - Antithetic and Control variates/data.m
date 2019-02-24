
%%THIS ARE THE DATA USED FOR THE SIMULATIN%%

r=0.02; % is the risk free rate (annual rate, expressed in terms of continuous compounding)
sigma=0.6; % is the volatility of returns of the underlying asset
S0=100; %is the spot price of the underlying asset
K=75; %is the strike price
T=1; %is the time to maturity, usually expressed T-t, T-maturity time, t-current time
N_Sim=1000000; % Number of simulations(More then 100000 it's very slow)


% Other values of the strike: K=75; 90; 100; 110; 125.