% script to extract the data on a trial by trial basis

% define the paths by calling the description file
d=Behavior_Datapaths('/Users/gkeliris/Documents/DATA/Ahmed/Feb2020',0);

% example to read the info from the first time point of the first rat
info=gk_pyControl_read(d.pre1.rat3907L);

% define reference events and prints via E_P_cells (i.e. {{Es},{Ps}}
trialStart={{},{'correct'}};
trialEnd={{'ITI','aborted_fixation','aborted_response'},{}};
trialNum={{},{'n_trials'}};
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
trNum=gk_pyControl_collapse_events(info,trialNum,trStart,trEnd);
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

trialNumber=trNum.trialNum;
trialTypes = gk_pyControl_getCategories(trType,{'C10','C1','C2','C3','C4','C5','C6','C7','C8','C9'});
pw_L = gk_pyControl_getCategories(trPWL);
pw_R = gk_pyControl_getCategories(trPWR);
[~,responses]=gk_pyControl_getCategories(trResponse,[],{'aF','aR','L','R','L','R'});
[~,outcome]=gk_pyControl_getCategories(trResponse,[],{'abort','abort','correct','correct','wrong','wrong'});

RT_stim=NaN(trialNumber(end),1); RT_stim(trials1)=stimRT;
RT_move=NaN(trialNumber(end),1); RT_move(trials2)=moveRT;

data=table(trialNumber,trialTypes,pw_L,pw_R,responses,outcome,RT_stim,RT_move);
