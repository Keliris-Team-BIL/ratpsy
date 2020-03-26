function clpsEvent = gk_pyControl_collapse_events(info, E_P_cell, trStartEvent, trEndEvent)
% USAGE: clpsEvent = gk_pyControl_collapse_events(info, E_P_cell, trStartEvent, trEndEvent)
%
% INPUT:
% - info       : the structure returned by gk_pyControl_read
% - E_P_cell   : a 1x2 cell with the event names in the first and prints in
%                the second
%
% OUTPUT:
% - clpsEvent       : a structure with the times, idx, types of the joined
%
% EXAMPLE(S)
%   a)  E_P_cell={{'ev1','ev2','ev3'},{}};              % only events
%   b)  E_P_cell={{},{'pr1','pr2'}};                    % only prints
%   c)  E_P_cell={{'ev1','ev2','ev3'},{'pr1','pr2'}};   % both
%
% v1.0 GAK 4 Mar 2020

if nargin==2
    trStartEvent=[];
end
if nargin<4
    trEndEvent=[];
end
    

idx=[];
times=[];
types={};
values={};

for i=1:numel(E_P_cell{1})
    idx=[idx; info.events.data.(E_P_cell{1}{i}).idx];
    times=[times; info.events.data.(E_P_cell{1}{i}).times];
    types=[types; repmat(E_P_cell{1}(i),numel(info.events.data.(E_P_cell{1}{i}).idx),1)];
    values=[values; repmat({['Ecode_',num2str(info.events.codes.(E_P_cell{1}{i}))]},numel(info.events.data.(E_P_cell{1}{i}).idx),1)];
end

for i=1:numel(E_P_cell{2})
    if isfield(info.prints.data,(E_P_cell{2}{i}))
    idx=[idx; info.prints.data.(E_P_cell{2}{i}).idx];
    times=[times; info.prints.data.(E_P_cell{2}{i}).times];
    values=[values; info.prints.data.(E_P_cell{2}{i}).values];
    types=[types; repmat(E_P_cell{2}(i),numel(info.prints.data.(E_P_cell{2}{i}).idx),1)];
    end
end

[clpsEvent.times,I]=sort(times);
clpsEvent.idx=idx(I);
clpsEvent.values={values{I}}';
clpsEvent.types={types{I}}';
clpsEvent.trialNum=[];

if ~isempty(trStartEvent)
    clpsEvent=gk_pyControl_getEventTrialNum(trStartEvent,clpsEvent);
end
if ~isempty(trEndEvent)
    clpsEvent=gk_pyControl_intersect_events(clpsEvent,trEndEvent);
end
    
return