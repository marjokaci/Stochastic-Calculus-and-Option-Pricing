
% PRICING A EUROPEAN PUT OPTION USING BLACK AND SCHOLES AND VARIANCE REDUCTION TECHNIQUES

% HERE IS A LIST OF COMMANDS TO TRY:

data
[P ,P_MC ,S_MC, time]=Eur_C(r,sigma,S0,K,T,N_Sim)

antitheticV
P_MC_AV
S_MC_AV
time_AV

ControlVariates
P_MC_CV
S_MC_CV
time_CV


 disp('CHANGING THE SIGMA')
 
 sigma=0.2;
 [P ,P_MC ,S_MC, time]=Eur_C(r,sigma,S0,K,T,N_Sim)
ControlVariates
P_MC_CV
S_MC_CV
time_CV

 
 sigma=0.7;
[P ,P_MC ,S_MC, time]=Eur_C(r,sigma,S0,K,T,N_Sim)
ControlVariates
P_MC_CV
S_MC_CV
time_CV
