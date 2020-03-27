
function data = gk_ratpsy_data_import(info,ratNum)
% USAGE: data = gk_ratpsy_data_import(info,[ratNum])
%
% INPUT:
% - info        :the matlab structure returned from gk_pyControl_read
% - ratNum      :[optional default=Nan] a number identifier the rat
%
% OUTPUT:
% - data        : a table with the relevant data
%
% v3.0 GAK 4 Mar 2020

if nargin==1
    ratNum=nan;
end


% define reference events and prints via E_P_cells (i.e. {{Es},{Ps}}
trialStart={{},{'correct'}};
trialEnd={{'ITI','aborted_fixation','aborted_response'},{}};
%trialNum={{},{'n_trials'}};
trialPWL={{},{'pW_L'}};
trialPWR={{},{'pW_R'}};
trialType={{},{'pW_L'}};
trialResponse={{},{'n_correct_left','n_correct_right','n_wrong_left',...
    'n_wrong_right','n_aborted_fixation','n_aborted_response'}};
trialSuccess={{'left_reward','right_reward'},{}};
trialWrong={{},{'n_wrong_left','n_wrong_right'}};
trialAbort={{},{'n_aborted_fixation','n_aborted_response'}};
trialStimON={{'display_stimulus'},{}};
trialActive={{'reward_available'},{}};
trialAbortResponse={{},{'n_aborted_response'}};


%%
trStart=gk_pyControl_collapse_events(info,trialStart);
trEnd=gk_pyControl_collapse_events(info,trialEnd,trStart);
%trNum=gk_pyControl_collapse_events(info,trialNum,trStart,trEnd);
trType=gk_pyControl_collapse_events(info,trialType,trStart,trEnd);
trResponse=gk_pyControl_collapse_events(info,trialResponse,trStart,trEnd);
trPWL=gk_pyControl_collapse_events(info,trialPWL,trStart,trEnd);
trPWR=gk_pyControl_collapse_events(info,trialPWR,trStart,trEnd);
trSuccess=gk_pyControl_collapse_events(info,trialSuccess,trStart,trEnd);
trWrong=gk_pyControl_collapse_events(info,trialWrong,trStart,trEnd);
trAbort=gk_pyControl_collapse_events(info,trialAbort,trStart,trEnd);
trAbortResponse=gk_pyControl_collapse_events(info,trialAbortResponse,trStart,trEnd);
trStimON=gk_pyControl_collapse_events(info,trialStimON,trStart,trEnd);
trActive=gk_pyControl_collapse_events(info,trialActive,trStart,trEnd);
trActiveMove=gk_pyControl_subtract_events(trActive,trAbortResponse);
trSidePoke=gk_pyControl_subtract_events(trResponse,trAbort);


[stimRT, trials1]=gk_pyControl_timediff(trActive,trStimON);
[moveRT, trials2]=gk_pyControl_timediff(trSidePoke,trActiveMove);


%% Define the variables to enter in the data table
trialNumber=trEnd.trialNum;
value_rename = {'70','1'; '73','2'; '76','3'; '79','4'; '82','5';...
                '88','6'; '91','7'; '94','8'; '97','9'; '100','10'};
trialType = gk_pyControl_getCategories(trType,value_rename);
pw_L = gk_pyControl_getCategories(trPWL);
pw_R = gk_pyControl_getCategories(trPWR);

type_rename1 = {'n_aborted_fixation','aF';'n_aborted_response','aR';...
                'n_wrong_left','L';'n_wrong_right','R';...
                'n_correct_left','L';'n_correct_right','R'};
[~,response]=gk_pyControl_getCategories(trResponse,[],type_rename1);
type_rename2 = {'n_aborted_fixation','abort';'n_aborted_response','abort';...
                'n_wrong_left','wrong';'n_wrong_right','wrong';...
                'n_correct_left','correct';'n_correct_right','correct'};
[~,outcome]=gk_pyControl_getCategories(trResponse,[],type_rename2);


RT_stim=NaN(trialNumber(end),1); RT_stim(trials1)=stimRT;
RT_move=NaN(trialNumber(end),1); RT_move(trials2)=moveRT;

ratNumber=repmat(ratNum,numel(trialNumber),1);

%% Create that data table
data=table(trialNumber,trialType,pw_L,pw_R,response,outcome,RT_stim,RT_move,ratNumber);

%data=table(trialType,stimType,response,correct,stimOnTime,reactionTime,trialStart,trialEnd,preMature,ratNumber);










