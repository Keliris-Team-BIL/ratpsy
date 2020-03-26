function [timediff trialNum]=gk_pyControl_timediff(event1, event2)
% USAGE: [timediff trialNum]=gk_pyControl_timediff(event1, event2)
%
% INFO: This function calculates the time differences (i.e event1.times-event2.times)
% between two event structures. Make sure the events structures have the same number of
% trials. The code will also check if the trials are matching and will also
% return the trial numbers.
%
% INPUT:
% - event1 : The event structure returned by gk_pyControl_collapse_events.
% Note that it should inclde the trial numbers
%
% - event2 : a second event of the same type and same number of trials
%
% OUTPUT:
% - timediff : the vector of time-differnces
% - trialNum : a vector of the trial numbers
%
% v1.0 GAK 04 Mar 2020


% first check that the trial numbers are consistent
if ~isequal(event1.trialNum,event2.trialNum)
    fprintf('ERROR: Trial Numbers not matching\n');
    return
end
% calculate the difference
timediff=event1.times-event2.times;
% also return the trial numbers
trialNum=event1.trialNum;
return