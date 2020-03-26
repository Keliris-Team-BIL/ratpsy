function [thresh slope SEt SEs Dev pDev] = gk_PAL_PFML(N, col)
% USAGE: [thresh slope SEt SEs Dev pDev] = gk_PAL_PFML(N, col)
%
% INFO
% function to perform psychometric fits using the PALAMEDES toolbox which
% should be in the path. It first fits the psychometrics using a Cumulative
% normal distribution (can be changed to other types inside), then
% estimates the parameter standard errors, the goodness of fit and plots
% the psychometric functions
%
% INPUT
% - N   :   returned by gk_get_psychometric.m
%
% - col :   a 3 element vector from 0 to 1 to define the color of the plot
%
% GAK Aug 2019

% the following variable will use a parametric fit if 1 otherwise non
% parametric
ParOrNonPar = 1;

% Set parameters to NaN in case not converge
thresh=nan; slope=nan; SEt=nan; SEs=nan; Dev=nan; pDev=nan;

%Stimulus intensities
StimLevels = N.stimulus; 

%Number of positive responses (e.g., 'right' or 'correct' at each of the 
%   entries of 'StimLevels'  
NumPos = N.right;                 

%Number of trials at each entry of 'StimLevels'
OutOfNum = N.total;         

%Use the cumulative normal function or other alternative
PF = @PAL_CumulativeNormal;  %Alternatives: PAL_Gumbel, PAL_Weibull,
                     %PAL_Quick, PAL_logQuick,
                     %PAL_Logistic, PAL_HyperbolicSecant

%Threshold and Slope are free parameters, guess and lapse rate are fixed
paramsFree = [1 1 0 0];  %1: free parameter, 0: fixed parameter
 
%Parameter grid defining parameter space through which to perform a
%brute-force search for values to be used as initial guesses in iterative
%parameter search.
searchGrid.alpha = [-1:1];
searchGrid.beta = logspace(0,3,101);
searchGrid.gamma = 0;  %scalar here (since fixed) but may be vector
searchGrid.lambda = 0.02;  %ditto

%Perform fit
disp('Fitting function.....');
[paramsValues LL exitflag] = PAL_PFML_Fit(StimLevels,NumPos, ...
    OutOfNum,searchGrid,paramsFree,PF);
if exitflag<1
    disp('Fitting not good')
    return;
end
disp('done:')

thresh=paramsValues(1);
slope=paramsValues(2);

message = sprintf('Threshold estimate: %6.4f',paramsValues(1));
disp(message);
message = sprintf('Slope estimate: %6.4f\r',paramsValues(2));
disp(message);

%Number of simulations to perform to determine standard error
B=400;                  

disp('Determining standard errors.....');

if ParOrNonPar == 1
    [SD paramsSim LLSim converged] = PAL_PFML_BootstrapParametric(...
        StimLevels, OutOfNum, paramsValues, paramsFree, B, PF, ...
        'searchGrid', searchGrid);
else
    [SD paramsSim LLSim converged] = PAL_PFML_BootstrapNonParametric(...
        StimLevels, NumPos, OutOfNum, [], paramsFree, B, PF,...
        'searchGrid',searchGrid);
end
SEt=SD(1);
SEs=SD(2);
disp('done:');
message = sprintf('Standard error of Threshold: %6.4f',SD(1));
disp(message);
message = sprintf('Standard error of Slope: %6.4f\r',SD(2));
disp(message);

%Distribution of estimated slope parameters for simulations will be skewed
%(type: hist(paramsSim(:,2),40) to see this). However, distribution of
%log-transformed slope estimates will be approximately symmetric
%[type: hist(log10(paramsSim(:,2),40)]. This might motivate using 
%log-scale for slope values (uncomment next three lines to put on screen):
% SElog10slope = std(log10(paramsSim(:,2)));
% message = ['Estimate for log10(slope): ' num2str(log10(paramsValues(2))) ' +/- ' num2str(SElog10slope)];
% disp(message);

%Number of simulations to perform to determine Goodness-of-Fit
B=1000;

disp('Determining Goodness-of-fit.....');

[Dev pDev] = PAL_PFML_GoodnessOfFit(StimLevels, NumPos, OutOfNum, ...
    paramsValues, paramsFree, B, PF, 'searchGrid', searchGrid);

disp('done:');

%Put summary of results on screen
message = sprintf('Deviance: %6.4f',Dev);
disp(message);
message = sprintf('p-value: %6.4f',pDev);
disp(message);
 
%Create simple plot
ProportionCorrectObserved=NumPos./OutOfNum; 
StimLevelsFineGrain=[min(StimLevels):max(StimLevels)./1000:max(StimLevels)];
ProportionCorrectModel = PF(paramsValues,StimLevelsFineGrain);
 
%figure('name','Maximum Likelihood Psychometric Function Fitting');
axes=gcf;
hold on
plot(StimLevelsFineGrain,ProportionCorrectModel,'-','color',col,'linewidth',3);
plot(StimLevels,ProportionCorrectObserved,'.','markersize',20,'MarkerEdgeColor',col);
set(gca, 'fontsize',16);
%set(gca, 'Xtick',[-6:-2 0 2:6]/6);
axis([-1.1 1.1 0 1]);
xlabel('Michelson contrast');
ylabel('proportion right');