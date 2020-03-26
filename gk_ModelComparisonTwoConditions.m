% ModelComparisonTwoConditions.m demonstrates how to perform model 
% comparisons using a simple two-condition example.
%
% Models are defined by specifying constraints on parameter values.
% Palamedes allows the user to specify constraints in three different
% ways (using verbal labels, model matrices or custom-defined 
% reparametrizations of parameters. These three ways differ in ease of use 
% but also in their flexibility. All three are demonstrated in this demo.
%
% More complex model comparisons are demonstrated in:
%
% PAL_PFLR_Demo: similar to this demo, but produces figures and performs
%   a few different model model comparisons.
%
% PAL_PFLR_FourGroupDemo: performs a trend analysis on the thresholds in
%   four experimental condition.
%
% PAL_PFLR_LearningCurve_Demo: tests whether transfer of learning occurred
%   by comparing a model in which thresholds in transfer condition adhere
%   to learning curve to a model in which they deviate from this curve.
%
% These and other example model comparisons are also shown here:
% www.palamedestoolbox.org/modelcomparisons.html
%
% NP (March 2017)


function [] = ModelComparisonTwoConditions(N1, N2)

if ~exist('PAL_version','file')
    disp('This demo requires the Palamedes toolbox to be installed and to be added ');
    disp('to Matlab''s search path. To download the Palamedes toolbox visit:');
    disp('www.palamedestoolbox.org');
    return;
end
if exist('chi2cdf','file')
%     disp('It appears you have the Matlab ''statistics'' toolbox. p-values will be');
%     disp('based on the theoretical chi-square distribution.');
    pfromChi2 = 1;
    numMCsimuls = 0;    %Do not perform Monte Carlo simulations
else
    disp('It appears you do not have the Matlab ''statistics'' toolbox. Palamedes will');
    disp('run Monte Carlo simulations in order to estimate p-values. Each p-value will');
    disp('be based on only 100 simulations in this demo (and not be very reliable for');
    disp('that reason), use a higher number of simulations for more reliable p-values.');
    pfromChi2 = 0;
    numMCsimuls = 100;  %Perform 100 Monte Carlo simulations for each p-value
end

%Data for a two condition experiment (each row of the arrays corresponds to one
%condition).
StimLevels = [N1.stimulus; N2.stimulus];
OutOfNum = [N1.total; N2.total];
NumPos =  [N1.right; N2.right];

%Parameter values (exact values to use for fixed parameters, guesses for free parameters)
%[threshold slope guess lapse] (may also specify different values for each condition using 
%array of size: number of conditions x 4)
parameterSeed = [0 1 0 0.02]; 

%Determine Log Likelihood and number of estimated parameters for saturated model
[LLSaturated, numParamsSaturated] = PAL_PFML_LLsaturated(NumPos, OutOfNum);

%Model fits and comparisons:

method = 1;
fprintf('\nWorking ....\n\n');


[paramsValuesLesser, LLLesser, ~, ~, ~, numParamsLesser] = ...
    PAL_PFML_FitMultiple(StimLevels, NumPos, OutOfNum, parameterSeed, @PAL_CumulativeNormal,...
    'thresholds','constrained',...
    'slopes','constrained',...
    'lapserates','fixed',...
    'guessrates','fixed');
[paramsValuesFuller, LLFuller, ~, ~, ~, numParamsFuller] = ...
    PAL_PFML_FitMultiple(StimLevels,NumPos,OutOfNum,paramsValuesLesser,@PAL_CumulativeNormal,...
    'thresholds','unconstrained',...
    'slopes','unconstrained',...
    'lapserates','fixed',...
    'guessrates','fixed');
[TLRFullervsLesser, pMCFullervsLesser] = PAL_PFLR_ModelComparison(StimLevels,NumPos,...
    OutOfNum,paramsValuesLesser,numMCsimuls,@PAL_CumulativeNormal,...
    'fullerthresholds','unconstrained',...
    'lesserthresholds','constrained',...
    'fullerslopes','unconstrained',...
    'lesserslopes','constrained',...
    'lesserguessrates','fixed',...
    'fullerguessrates','fixed',...
    'lesserlapserates','fixed',...
    'fullerlapserates','fixed');



%Determine Goodness-of-Fit of Fuller model
[DevFuller, pMCGOFFuller, DevSim, convergedGoF] = PAL_PFML_GoodnessOfFitMultiple(StimLevels,NumPos,OutOfNum,...
    paramsValuesFuller,numMCsimuls,@PAL_CumulativeNormal,...
    'thresholds',[1 0; 0 1],...
    'slopes',[1 0; 0 1],...     %identity matrix, same as 'unconstrained'
    'guessrates','fixed',...
    'lapserates','fixed');

%get p-value of model comparison 
if pfromChi2   %statistics toolbox installed, use theoretical chi-square distribution
    pFullervsLesser = 1-chi2cdf(TLRFullervsLesser,numParamsFuller-numParamsLesser);
    pGOFFuller = 1-chi2cdf(DevFuller,numParamsSaturated-numParamsFuller);
else   %statistics toolbox not installed, use Monte Carlo Based p-values found above
    pFullervsLesser = pMCFullervsLesser;
    pGOFFuller = pMCGOFFuller;
end

%print results to command window
fprintf('\nLesser model: \n\n');
fprintf('Thresholds/PSEs\tSlopes\t\tGuess rates\tLapse rates\n');
fprintf('%f\t',paramsValuesLesser(1,:))
fprintf('\n');
fprintf('%f\t',paramsValuesLesser(2,:))
fprintf('\nLog Likelihood: %f', LLLesser);
fprintf('\nNumber of free parameters: %d', numParamsLesser);
fprintf('\nAIC: %f', -2*LLLesser + 2*numParamsLesser);

fprintf('\n\n\nFuller model: \n\n');
fprintf('Thresholds/PSEs\tSlopes\t\tGuess rates\tLapse rates\n');
fprintf('%f\t',paramsValuesFuller(1,:))
fprintf('\n');
fprintf('%f\t',paramsValuesFuller(2,:))
fprintf('\nLog Likelihood: %f', LLFuller);
fprintf('\nNumber of free parameters: %d', numParamsFuller);
fprintf('\nAIC: %f', -2*LLFuller + 2*numParamsFuller);

fprintf('\n\n\nSaturated model: \n\n');
fprintf('Log Likelihood: %f', LLSaturated);
fprintf('\nNumber of free parameters: %d', numParamsSaturated);
fprintf('\nAIC: %f\n', -2*LLSaturated + 2*numParamsSaturated);

fprintf('\n(Models with lower AICs are preferred over models with higher AICs)\n\n');

%Model comparisons based on p-values
fprintf('Null Hypothesis test Fuller vs Lesser model:');
fprintf('\nTransformed Likelihood Ratio (asymptotically distributed as chi-square): %f.',...
    TLRFullervsLesser);
fprintf('\ndegrees of freedom: %d.', numParamsFuller - numParamsLesser);
fprintf('\np-value: %f\n', pFullervsLesser);

fprintf('\nNull Hypothesis test Fuller vs Saturated model (aka ''Goodness-of-Fit of Fuller Model''):');
fprintf('\nTransformed Likelihood Ratio (aka ''Deviance'' in context of Goodness-of-Fit: %f', DevFuller);
fprintf('\ndegrees of freedom: %d.', numParamsSaturated - numParamsFuller);
fprintf('\np-value: %f\n\n', pGOFFuller);

%Define custom reparameterizations
function param = reparameterizeFixed(theta)

param(1) = theta;
param(2) = theta;

function beta = reparameterizeSlopes(theta)

beta(1) = theta(1)+theta(2);
beta(2) = theta(1)-theta(2);