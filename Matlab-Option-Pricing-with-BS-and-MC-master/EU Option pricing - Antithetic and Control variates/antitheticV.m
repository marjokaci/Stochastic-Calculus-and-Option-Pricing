%                     ANTITHETIC VARIABLES

u=cputime;
disp('Price of the PUT option using ANTITHETIC VARIABLES estimator ')
mu=(r-1/2*sigma^2)*T; 
s=sigma*sqrt(T);

% X e Y is the F^-1(U1) and F^-1(U2) which are negatively correlated
X=randn(N_Sim,1); 
Y=-X;
% ST1 and ST2 need to be correlated to get a smaller variance and they are
% since X and Y are negatively correlated.
ST1=S0.*exp(mu+s.*X);
ST2=S0.*exp(mu+s.*Y);

% Price of the put option for different simulations using a different estimator
P=exp(-r*T).*(max(0,K-ST1)+max(0,K-ST2))/2;

% Price of the option  using Antithetic variables
P_MC_AV=mean(P); 
% Variance using Antithetic variables
S_MC_AV=std(P);

%Calculate time
time_AV=cputime-u;



