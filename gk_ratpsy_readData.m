function data = gk_ratpsy_readData(dataPath, forceRecalc)
% USAGE: data = gk_ratpsy_readData(dataPath, forceRecalc)
%
% INPUT:
% - datapath : the fullpath to the data folder
% - forceRecalc: if true it will force are reimporting of all data files
%
% OUTPUT:
% - data : a structure containing the data read from the datafiles
%
% GAK 20 Apr 2020


if nargin==1
    forceRecalc=false;
end
%%  Data description and folders
d=Behavior_Datapaths(dataPath,0);
data.description=d;
%Create the folder where the analysis will be saved
if ~isfolder(fullfile(d.dataPath,'Analysis'))
    mkdir(fullfile(d.dataPath,'Analysis'));
end
if ~isfolder(fullfile(d.dataPath,'Analysis','logfiles'))
    mkdir(fullfile(d.dataPath,'Analysis','logfiles'));
end
if ~isfolder(fullfile(d.dataPath,'Analysis','Figures'));
    mkdir(fullfile(d.dataPath,'Analysis','Figures'));
end


%% GET ALL DATA
fields=fieldnames(d);
preFields=find(~cellfun(@isempty,cellfun(@(x) strfind(x,'pre'),fieldnames(d),'UniformOutput',false)));
postFields=find(~cellfun(@isempty,cellfun(@(x) strfind(x,'post'),fieldnames(d),'UniformOutput',false)));

if forceRecalc || ~isfile(fullfile(d.dataPath,'Analysis','data.mat'))
    imported_files=cell(1);
    imported_files{1,1}='importedFileList';
else
    load(fullfile(d.dataPath,'Analysis','data'));
end

for rat=[d.ratIDs]
    for ti=fields([preFields; postFields])'
        if isfield(d.(ti{1}),rat{1})      	
            if isempty(find(cellfun(@(x) strcmp(x,d.(ti{1}).(rat{1})),imported_files),1))
                saveFile=true;
                fprintf('\n\nPROCESSING:%s, %s\n',rat{1},ti{1});
                fprintf('Importing new file:%s\n',d.(ti{1}).(rat{1}))
                info.(ti{1}).(rat{1})=gk_pyControl_read(d.(ti{1}).(rat{1}));
                data.(ti{1}).(rat{1})=gk_ratpsy_data_import(info.(ti{1}).(rat{1}),str2num(rat{1}(6:7)));
                imported_files{end+1,1}=d.(ti{1}).(rat{1});
            else
                saveFile=false;
            end
        end
    end
end
if saveFile
    %Saving the data as a variable called 'data'
    save(fullfile(d.dataPath,'Analysis','data'),'data','imported_files');
end