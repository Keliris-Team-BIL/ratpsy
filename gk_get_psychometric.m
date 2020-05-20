function N = gk_get_psychometric(data, printNumbers)
% USAGE: N = gk_get_psychometric(data, [printNumbers = false])
%
% Gets the numbers for calculating psychometric curves
%
% INPUT:
% -  data       :   the table returned by gk_ratpsy_data_import
%                   (or a concatenation or selection of rows from such a table)
%
% - printNumbers:   optional: prints output to screen if true
%
% GAK Aug 2019

if nargin<2
    printNumbers=false;
end

V_cts=categories(data.trialType);
for i=1:numel(V_cts)
    tmp=data.pw_L(data.trialType==V_cts(i));
    pw_L(1,i)=str2num(char(tmp(1)));
end
[pw_L, sortInd]=sort(pw_L);
N.trialType=V_cts(sortInd);
%pw_L=[70 73 76 79 82 88 91 94 97 100];
pw_R=fliplr(pw_L);
N.stimulus=gk_ratpsy_Michelson(pw_L,pw_R); % Michelson contrast = (Imax-Imin)/(Imax+Imin)

% Get the correct trials
data_correct=data(data.outcome=='correct',:);
data_completed=data(data.outcome=='correct'| data.outcome=='wrong',1);
% if no correct trial return an empty matrix
if isempty(data_correct)
    N=[];
    return;
end

if printNumbers
    overall_perf=height(data_correct)/height(data_completed);
    fprintf('\nOverall performance excluding aborts = %.2f %%\n',overall_perf*100);
end

if printNumbers
    fprintf('\nPer condition correct\n');
    fprintf('____________________________\n');
end
for tt=1:numel(N.stimulus)
    %cond{tt}=data(data.trialType==N.trialType(tt),:);

    N.correct(tt)=numel(find(data.trialType==N.trialType(tt) & data.outcome=='correct'));
    N.total(tt)=numel(find(data.trialType==N.trialType(tt) & (data.outcome=='correct' | data.outcome=='wrong')));
    N.right(tt)=numel(find(data.trialType==N.trialType(tt) & data.response=='R'));
    N.left(tt)=numel(find(data.trialType==N.trialType(tt) & data.response=='L'));
    N.percent(tt)=100*N.correct(tt)/N.total(tt);
    if printNumbers
        fprintf('Stim = %.2f : %d/%d = %.2f %% \n',N.stimulus(tt),N.correct(tt),N.total(tt), N.percent(tt));
    end
end

if printNumbers
    fprintf('\nPer condition Right\n');
    fprintf('____________________________\n');

    for tt=1:numel(N.stimulus)
        fprintf('Stim = %.2f : %d/%d = %.2f %% \n',N.stimulus(tt),N.right(tt),N.total(tt),100*N.right(tt)/N.total(tt));
    end

    fprintf('\nPer condition Left\n');
    fprintf('____________________________\n');
    for tt=1:numel(N.stimulus)
        fprintf('Stim = %.2f : %d/%d = %.2f %% \n',N.stimulus(tt),N.left(tt),N.total(tt),100*N.left(tt)/N.total(tt));
    end
end
