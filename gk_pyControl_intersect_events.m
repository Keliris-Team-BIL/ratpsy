function clpsEvent = gk_pyControl_intersect_events(event, subevent)
% USAGE: clpsEvent = gk_pyControl_intersect_events(event, subevent)
%
% INPUT:
% - event     : the event struct returned by gk_pyControl_collapse_events
% - subevent  : the event struct () to be subtracted
% 
% IMPORTANT: both events should include the trialNum field
%
% OUTPUT:
% - clpsEvent       : the event structure of the event intersection
%
%
% v1.0 GAK 4 Mar 2020

[useTrials,IA]=intersect(event.trialNum,subevent.trialNum);
clpsEvent.times=event.times(IA);
clpsEvent.idx=event.idx(IA);
clpsEvent.values=event.values(IA);
clpsEvent.types=event.types(IA);
clpsEvent.trialNum=event.trialNum(IA);