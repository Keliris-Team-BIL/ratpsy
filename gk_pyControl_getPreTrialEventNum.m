function numEventsBeforeTrial = gk_pyControl_getPreTrialEventNum(trialEndEvent, trialStartEvent, event)
% USAGE: numEventsBeforeTrial = gk_pyControl_getPreTrialEventNum(trialEndEvent, trialStartEvent, event)
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
numEventsBeforeTrial(1)=0;
for i=2:numel(trialStartEvent.times)
    events=find(event.idx>trialEndEvent.idx(i-1) & event.idx<trialStartEvent.idx(i));
    numEventsBeforeTrial(i,1)=numel(events);
end