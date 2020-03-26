function event = gk_pyControl_getTrialNum(trialStartEvent, event)
% USAGE: event = gk_pyControl_getTrialNum(trialStartEvent, event)
%
% INFO: this function appends a field event.trialNum to the event by
% assigning a trial number based on the latest trialStart time of the
% trialStartEvent
%
% INPUT:
% - trialStartEvent : the struct return by gk_pyControl_collapse_events for
% the relevant events that define trial starts (even if it is only one)
% - event           : the struct returned by gk_pyControl_collapse_events
% for the event of interest
%
% OUTPUT: 
% - event : The event of interest with appended .trialNum field
%
% v1.0 GAK 4 Mar 2020

for i=1:numel(event.times)
    previous_starts=find(trialStartEvent.idx<=event.idx(i)); % the equal is in the case you use the trialStartEvent as event
    event.trialNum(i,1)=previous_starts(end);
end