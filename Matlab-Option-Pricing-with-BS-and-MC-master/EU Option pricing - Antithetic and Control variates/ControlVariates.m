%                       CONTROL VARIATES

% We could  use PT and ST generated when we use  Eur_C function or
% generate them with the following code:
disp('Price of the PUT option using CONTROL VARIATES estimator ')

%{ %}
z=cputime;
N_Sim1=1000000;


mu=(r-1/2*sigma^2)*T;
s=sigma*sqrt(T);
ST=zeros(N_Sim1,1); % the price of the underlying
PT=zeros(N_Sim1,1); % the option price of different simulations
for i=1:N_Sim1
ST(i)=S0.*exp(mu+s*randn);
PT(i)=exp(-r*T)*max(0,K-ST(i));
end



% Choose two outpus of N_Sim simulations
OP1=PT; % First output: prices of the dericative - vettore con tt i prezzi dell N_sim simulazioni
OP2=ST; % Second output is the price of the underlying with known mean.
% Calculate the covariance of the two inputs
VarOP2=S0^2*exp(2*r*T)*(exp(sigma^2*T)-1); %Variance of a log-normal distributed random variable  
Cov_matrix=cov(OP1,OP2);
COV=Cov_matrix(1,2);
% Calculate the mean of the second output
OP2_avg=S0*exp(r*T);

% This is the b for such the variance is minimal
b_min=COV/VarOP2;


% Define the estimator that will be used to reduce the variance
P_b=zeros(N_Sim,1);
ST=zeros(N_Sim,1);
PT=zeros(N_Sim,1);
for i=1:N_Sim
ST(i)=S0.*exp(mu+s*randn);
PT(i)=exp(-r*T)*max(0,K-ST(i));
P_b(i)=PT(i) - b_min*(ST(i) - OP2_avg);
end

P_MC_CV=mean(P_b);
S_MC_CV=std(P_b);


%Calculate time
time_CV=cputime-z;

