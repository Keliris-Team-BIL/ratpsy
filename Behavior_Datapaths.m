function dat = Behavior_Datapaths(dataPath,verbose)
% USAGE: dat = Behavior_Datapaths(dataPath,verbose)
%
% dataPath : full path to the raw data folder without / at the end

% Note: always use forward slashes (/) instead of backslashes (/) in path
% definitions as they work in both windows and linux platforms.

if ~exist('verbose','var')
    verbose=1;
end

%%% PATHS THAT POTENTIALLY NEED TO BE UPDATED %%%%%%%%%%%%%%%%%%%%%%%%%%%%
if nargin<1
    dataPath='C:/Neuroscience/Github/Data';
end
dat.dataPath=dataPath;

% ANIMAL IDs
dat.ratIDs={'rat3907L','rat3908LR','rat3910LR','rat3911L','rat3912LR','rat3913L','rat3914LR','rat3915L','rat3916LR',...
            'rat3917L','rat3919L','rat3920LR'};
datafolders={'/Rat_07','/Rat_08','/Rat_10','/Rat_11','/Rat_12','/Rat_13','/Rat_14','/Rat_15','/Rat_16','/Rat_17',...
              '/Rat_19','/Rat_20'};

%
%% RAW DATA
% Raw data

%% Rat_07 Saline

dat.pre1.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-03-04-142547.txt');
dat.pre2.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-03-05-144514.txt');
dat.pre3.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-03-06-143114.txt');
%dat.pre4.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-03-10-124030.txt');
dat.pre5.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-03-11-144015.txt');


dat.post1.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-03-25-134024.txt');
%dat.post2.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-03-26-133032.txt');
dat.post3.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-03-27-132906.txt');

dat.post4.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-04-01-122935.txt');
dat.post5.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-04-02-124353.txt');
dat.post6.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-04-03-123642.txt');

dat.post7.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-04-08-122931.txt');
dat.post8.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-04-09-122923.txt');
dat.post9.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L_-2020-04-10-130524.txt');



%% Rat_08 Saline

dat.pre1.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-03-04-142547.txt');
dat.pre2.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-03-05-144514.txt');
dat.pre3.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-03-06-143114.txt');
dat.pre4.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-03-10-124030.txt');
dat.pre5.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-03-11-144015.txt');


dat.post1.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-03-25-134024.txt');
dat.post2.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-03-26-133032.txt');
dat.post3.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-03-27-132906.txt');

dat.post4.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-04-01-122935.txt');
dat.post5.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-04-02-124353.txt');
dat.post6.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-04-03-123642.txt');

dat.post7.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-04-08-122931.txt');
dat.post8.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-04-09-122923.txt');
dat.post9.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR_-2020-04-10-130524.txt');



%% Rat_10 Saline

%dat.pre1.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-03-04-142547.txt');
dat.pre2.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-03-05-160738.txt');
dat.pre3.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-03-06-165118.txt');
dat.pre4.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-03-10-152349.txt');
dat.pre5.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-03-11-181512.txt');


dat.post1.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-03-30-113411.txt');
dat.post2.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-03-31-105707.txt');
dat.post3.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-04-01-105717.txt');

dat.post4.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-04-06-110247.txt');
dat.post5.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-04-07-105810.txt');
dat.post6.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-04-08-105709.txt');


%% Rat_11 Saline

dat.pre1.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-03-04-130720.txt');
dat.pre2.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-03-05-133922.txt');
dat.pre3.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-03-06-133540.txt');
dat.pre4.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-03-10-113424.txt');
dat.pre5.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-03-11-131003.txt');


%dat.post1.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-03-24-151214.txt');
dat.post2.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-03-25-145135.txt');
dat.post3.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-03-26-144344.txt');

dat.post4.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-03-31-141824.txt');
dat.post5.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-04-01-140750.txt');
%dat.post6.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-04-02-134858.txt');

dat.post7.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-04-07-135841.txt');
dat.post8.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-04-08-134440.txt');
dat.post9.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-04-09-133817.txt');



%% Rat_12 J60

dat.pre1.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-03-04-130720.txt');
dat.pre2.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-03-05-133922.txt');
dat.pre3.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-03-06-133540.txt');
dat.pre4.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-03-10-113424.txt');
dat.pre5.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-03-11-131003.txt');


%dat.post1.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-03-24-151214.txt');
%dat.post2.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-03-25-145135.txt');
%dat.post3.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-03-26-144344.txt');

dat.post4.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-03-31-141824.txt');
dat.post5.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-04-01-140750.txt');
dat.post6.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-04-02-134858.txt');

dat.post7.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-04-07-135841.txt');
dat.post8.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-04-08-134440.txt');
dat.post9.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-04-09-133817.txt');



%% Rat_13 J60

dat.pre1.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-03-04-142547.txt');
dat.pre2.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-03-05-160738.txt');
%dat.pre3.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-03-06-165118.txt');
% PROBLEMATIC FILE: some trial don't have ITI (See for example tr.10,11)
dat.pre4.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-03-10-152349.txt');
dat.pre5.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-03-11-181512.txt');


%dat.post1.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-03-25-134024.txt');
%dat.post2.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-03-26-133032.txt');
dat.post3.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-03-27-132906.txt');

dat.post4.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-04-01-122935.txt');
dat.post5.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-04-02-124353.txt');
dat.post6.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-04-03-123642.txt');

dat.post7.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-04-08-122931.txt');
dat.post8.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-04-09-122923.txt');
dat.post9.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-04-10-130524.txt');



%% Rat_14 J60

dat.pre1.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-03-04-130720.txt');
dat.pre2.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-03-05-165539.txt');
dat.pre3.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-03-06-174728.txt');
dat.pre4.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-03-10-181148.txt');
dat.pre5.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-03-11-191942.txt');


%dat.post1.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-03-25-134024.txt');
%dat.post2.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-03-26-133032.txt');
%dat.post3.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-03-27-132906.txt');

%dat.post4.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-04-01-122935.txt');
dat.post5.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-04-02-124353.txt');
dat.post6.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-04-03-123642.txt');

dat.post7.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-04-08-122931.txt');
%dat.post8.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-04-09-122923.txt');
%dat.post9.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-04-10-130524 (2).txt');



%% Rat_15 Saline

dat.pre1.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-03-04-160921.txt');
dat.pre2.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-03-05-152721.txt');
dat.pre3.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-03-06-161101.txt');
dat.pre4.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-03-10-143141.txt');
dat.pre5.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-03-11-181512.txt');


dat.post1.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-03-30-113411.txt');
dat.post2.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-03-31-105707.txt');
dat.post3.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-04-01-105717.txt');

dat.post4.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-04-06-110247.txt');
dat.post5.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-04-07-105810.txt');
dat.post6.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-04-08-105709.txt');


%% Rat_16 got sacrificed

dat.pre1.(dat.ratIDs{9})=cat(2,dataPath,datafolders{9},'/3916LR-2020-03-04-160921.txt');
dat.pre2.(dat.ratIDs{9})=cat(2,dataPath,datafolders{9},'/3916LR-2020-03-05-152721.txt');
dat.pre3.(dat.ratIDs{9})=cat(2,dataPath,datafolders{9},'/3916LR-2020-03-06-161101.txt');
dat.pre4.(dat.ratIDs{9})=cat(2,dataPath,datafolders{9},'/3916LR-2020-03-10-143141.txt');
dat.pre5.(dat.ratIDs{9})=cat(2,dataPath,datafolders{9},'/3916LR-2020-03-11-181512.txt');

%% Rat_17 the worst performer - J60

dat.pre0.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-02-13-140051.txt');
%dat.pre1.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-03-04-160921.txt');
dat.pre2.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-03-05-165539.txt');
%dat.pre3.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-03-10-181148.txt');
dat.pre4.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-03-11-191942.txt');


%dat.post1.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-03-30-113411.txt');
dat.post2.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-03-31-105707.txt');
dat.post3.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-04-01-105717.txt');

dat.post4.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-04-06-110247.txt');
%dat.post5.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/317L-2020-04-07-105810.txt');
dat.post6.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-04-08-105709.txt');



%% Rat_18 got sacrificed;


%% Rat_19 J60

dat.pre1.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-03-04-170101.txt');
dat.pre2.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-03-05-165539.txt');
dat.pre3.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-03-06-174728.txt');
dat.pre4.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-03-10-181148.txt');
dat.pre5.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-03-11-191942.txt');


%dat.post1.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-03-24-161716.txt');
%dat.post2.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-03-25-160121.txt');
%dat.post3.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-03-26-155041.txt');

%dat.post4.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-03-31-155245.txt');
%dat.post5.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-04-01-151922.txt');
%dat.post6.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-04-02-145415.txt');

dat.post7.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-04-07-152437.txt');
%dat.post8.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-04-09-144335.txt');



%% Rat_20 got sacrificed;

dat.pre1.(dat.ratIDs{12})=cat(2,dataPath,datafolders{12},'/3920LR-2020-03-04-170101.txt');
dat.pre2.(dat.ratIDs{12})=cat(2,dataPath,datafolders{12},'/3920LR-2020-03-05-165539.txt');
dat.pre3.(dat.ratIDs{12})=cat(2,dataPath,datafolders{12},'/3920LR-2020-03-06-174728.txt');
dat.pre4.(dat.ratIDs{12})=cat(2,dataPath,datafolders{12},'/3920LR-2020-03-10-181148.txt');
dat.pre5.(dat.ratIDs{12})=cat(2,dataPath,datafolders{12},'/3920LR-2020-03-11-191942.txt');

%% VERIFY THAT ALL FILES IN STRUCTURE ARE EXISTING
% Note: exclude fields that are not files (e.g. IDs)
% if verbose

if verbose
    clear global;
    global s;
    unfold(dat,false);

    for si=1:numel(s)
        if isempty(strfind(s{si},'ratIDs'))
            if ~isfile(s{si})
                fprintf('\nWARNING! NOT FOUND File: %s\n\n',...
                    s{si});
            else
                fprintf('VERIFIED File: %s\n',s{si});
            end
        end
    end
    clear global
end
