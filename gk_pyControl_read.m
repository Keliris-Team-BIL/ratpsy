function info = gk_pyControl_read(fileIn)
% USAGE: info = gk_pyControl_read(fileIn)
%
% INPUT:
% - fileIn      :the fullpath of the pyControl datafile
%
% OUTPUT:
% - info        :the information and data from the datafile
%
% v1.0 GAK 27 Feb 2020

fid=fopen(fileIn);
% read the INFO lines
exp_name=textscan(fid,'I Experiment name :%s',1);
task_name=textscan(fid,'I %s%s',1,'delimiter',':');
subj_id=textscan(fid,'I %s%s',1,'delimiter',':');
date_time=textscan(fid,'I Start date : %{yyyy/MM/dd}D%{HH:mm:ss}D',1);
info.exp_name=exp_name{1}{1};
info.task=task_name{2}{1};
info.rat=subj_id{2}{1};
info.date=date_time{1};
info.time=date_time{2};

% Get the event names, codes, and types (S or E)
tmp=textscan(fid,'S { %[^}]','Headerlines',1);
S=textscan(tmp{1}{1},'%q %d','delimiter',':,');
for i=1:size(S{1},1)
    info.events.names{i,1}=S{1}{i}(2:end-1);
    info.events.codes.(info.events.names{i,1})=S{2}(i);
    info.events.types.(info.events.names{i,1})='S';
end
tmp=textscan(fid,'E { %[^}]','Headerlines',1);
E=textscan(tmp{1}{1},'%s %d','delimiter',':,');
for i=1:size(E{1},1)
    info.events.names{size(S{1},1)+i,1}=E{1}{i}(2:end-1);
    info.events.codes.(info.events.names{size(S{1},1)+i,1})=E{2}(i);
    info.events.types.(info.events.names{size(S{1},1)+i,1})='E';
end

% The following skips the first 2 lines, then reads the whole file in 3
% columns (a character, a double and a string) skipping the rest of things
% if some columns have more that 3 fields
t=textscan(fid,'%c %d %s %s %*[^\n]','HeaderLines',2);

% find the lines starting with D as they only have a number in third column
% and this makes things easier to look for
Ds=find(t{1}=='D');
eventTimes=t{2}(Ds);
events=cellfun(@str2num,t{3}(Ds));

% Get the data (D_index, times) for each event
for i=1:numel(info.events.names)
    D_idx=find(events==info.events.codes.(info.events.names{i}));
    info.events.data.(info.events.names{i}).idx=Ds(D_idx);
    info.events.data.(info.events.names{i}).times=eventTimes(D_idx);
end

Ps=find(t{1}=='P');
printTimes=t{2}(Ps);
extraprints=find(~cellfun(@isempty,t{4}(Ps))); %this is because some lines in P have 4 columns
% below we attach the 4th column to the 3rd to make things more easy for
% later processintg
t{3}(Ps(extraprints))=cellfun(@(x,y) cat(2,x,y),t{3}(Ps(extraprints)),t{4}(Ps(extraprints)),'UniformOutput',false);
prints=t{3}(Ps);
% now separate the printed things in name:value pairs
print_pairs=cellfun(@(x) textscan(x,'%s','delimiter',':'),prints,'UniformOutput',false);
for i=1:numel(print_pairs)
    print_names{i,1}=print_pairs{i}{1}{1};
    if numel(print_pairs{i}{1})==2
        print_values{i,1}=print_pairs{i}{1}{2};
    else
        print_values{i,1}='N/A';
    end
end
Pnames=categorical(print_names);
info.prints.names=categories(Pnames);
for i=1:numel(info.prints.names)
    P_idx=find(Pnames==info.prints.names{i});
    info.prints.data.(info.prints.names{i}).idx=Ps(P_idx);
    info.prints.data.(info.prints.names{i}).values=print_values(P_idx);
    info.prints.data.(info.prints.names{i}).times=printTimes(P_idx);
end

Vs=find(t{1}=='V');
vTimes=t{2}(Vs);
Vprints=t{3}(Vs);
Vnums=t{4}(Vs);

Vnames=categorical(Vprints);
Vvalues=categorical(Vnums);
info.Vs.names=categories(Vnames);
for i=1:numel(info.Vs.names)
    V_idx=find(Vnames==info.Vs.names{i});
    info.Vs.data.(info.Vs.names{i}).idx=Vs(V_idx);
    info.Vs.data.(info.Vs.names{i}).values=Vvalues(V_idx);
    info.Vs.data.(info.Vs.names{i}).times=vTimes(V_idx);
end


return

