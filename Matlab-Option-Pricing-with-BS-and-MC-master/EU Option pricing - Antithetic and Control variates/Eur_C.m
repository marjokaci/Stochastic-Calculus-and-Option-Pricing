

function [P ,P_MC ,S_MC, time]=Eur_C(r,sigma,S0,K,T,N_Sim)
% This function computes the exact and MC price
% of a European PUT in a BS setting
disp('Black and Scholes price of the option and the Monte Carlo simulated price')

d1=(log(S0/K)+(r+1/2*sigma^2)*T)/(sigma*sqrt(T));
d2=(log(S0/K)+(r-1/2*sigma^2)*T)/(sigma*sqrt(T));
P=exp(-r*T)*K*normcdf(-d2)-S0*normcdf(-d1);



c=cputime; % PC time
mu=(r-1/2*sigma^2)*T;
s=sigma*sqrt(T);
% Preallocate the ST and PT
ST=zeros(N_Sim,1);
PT=zeros(N_Sim,1);

% For loop to generate S(T) and compute price
for i=1:N_Sim
ST(i)=S0.*exp(mu+s*randn);
PT(i)=exp(-r*T)*max(0,K-ST(i));
end
P_MC=mean(PT); % Price of the option using Monte Carlo
S_MC=std(PT);  % Standart deviation
time=cputime-c; % time of the simulation
end
