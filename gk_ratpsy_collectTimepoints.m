function res = gk_ratpsy_collectTimepoints(data, timepoints)
% USAGE: res = gk_ratpsy_collectTimePoints(data, timepoints)
%
% INPUT:
% - data        : the output of gk_ratpsy_readData.m
% - timepoints  : a cell array with timepoint names or 'allPre' or
%                 'allPost'. The two last will collect all pre or post
%
% OUTPUT:
% - res     : the result of the collect (i.e. a struct of tables)
%
% GAK 20 Apr 2020

fields=fieldnames(data)';
if strcmp(timepoints,'allPre')
    timePnts=fields(find(~cellfun(@isempty,cellfun(@(x) strfind(x,'pre'),fields,'UniformOutput',false))));
elseif strcmp(timepoints,'allPost')
    timePnts=fields(find(~cellfun(@isempty,cellfun(@(x) strfind(x,'post'),fields,'UniformOutput',false))));
else
    timePnts=timepoints;
end

res=[];
for pi=timePnts
    ratIDs=fieldnames(data.(pi{1}));
    res.(pi{1})=[];
    for rat=[{ratIDs{:}}]
        res.(pi{1})=cat(1,res.(pi{1}),data.(pi{1}).(rat{1}));
    end
end