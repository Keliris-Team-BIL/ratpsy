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
    dataPath='C:/Neuroscience/Github/Keliris-Team-ratpsy-codeDev/Data';
end
dat.dataPath=dataPath;

% ANIMAL IDs
dat.ratIDs={'rat3907L','rat3908LR','rat3910LR','rat3911L','rat3912LR','rat3913L','rat3914LR','rat3915L','rat3916LR',...
            'rat3917L','rat3919L','rat3920LR'};
datafolders={'/Rat_07','/Rat_08','/Rat_10','/Rat_11','/Rat_12','/Rat_13','/Rat_14','/Rat_15','/Rat_16','/Rat_17',...
              '/Rat_19','/Rat_20'};
dat.J60rats=[12,13,14,17,19];
dat.SALrats=[7,8,10,11,15];

%
%% RAW DATA
% Raw data

%% Rat_07 Saline

dat.pre1.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-03-04-142547.txt');
dat.pre2.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-03-05-144514.txt');
dat.pre3.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-03-06-143114.txt');
dat.pre4.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-03-10-124030.txt');%182 S.F
dat.pre5.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-03-11-144015.txt');


dat.post1.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-03-25-134024.txt');
%dat.post2.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-03-26-133032.txt');%122 S.F
dat.post3.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-03-27-132906.txt');

dat.post4.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-04-01-122935.txt');
dat.post5.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-04-02-124353.txt');
dat.post6.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-04-03-123642.txt');

dat.post7.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-04-08-122931.txt');
dat.post8.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-04-09-122923.txt');
dat.post9.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L_-2020-04-10-130524.txt');

%Post experiment1: All saline
dat.post10.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-04-29-123627.txt');
dat.post11.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-04-30-124138.txt');
dat.post12.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-05-01-122905.txt');

%Experiment2: Logarithmic distribution
%dat.post13.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-05-13-125210.txt');
dat.post15.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-05-15-131520.txt');

%1st Rev
%dat.post16.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-05-19-131516.txt');%4 S.F
dat.post17.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-05-20-113938.txt');
dat.post18.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-05-21-105532.txt');

%New B.L
dat.post19.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-08-04-111923.txt');%133 S.F
dat.post20.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-08-05-113355.txt');
dat.post21.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-08-06-113959.txt');
dat.post22.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-08-07-114743.txt');
dat.post23.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-08-08-120852.txt');
dat.post24.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-08-09-121501.txt');

%2nd Rev
dat.post25.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-08-10-123331.txt');
dat.post26.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-08-11-122144.txt');
dat.post27.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-08-12-122328.txt');%53 S.F
dat.post28.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-08-13-124958.txt');%199 S.F
dat.post29.(dat.ratIDs{1})=cat(2,dataPath,datafolders{1},'/3907L-2020-08-14-130430.txt');

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

%Post experiment1: All saline
dat.post10.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-04-29-123627.txt');
dat.post11.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-04-30-124138.txt');
dat.post12.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-05-01-122905.txt');

%Experiment2: Logarithmic distribution
dat.post13.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-05-13-125210.txt');
dat.post14.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-05-14-125908.txt');
dat.post15.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-05-15-131520.txt');

%1st Rev
dat.post16.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-05-19-131516.txt');%137 S.F
dat.post17.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-05-20-113938.txt');
dat.post18.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-05-21-105532.txt');

%New  B.L
dat.post19.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-08-04-111923.txt');
dat.post20.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-08-05-113355.txt');
dat.post21.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-08-06-113959.txt');
dat.post22.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-08-07-114743.txt');%193 S.F
dat.post23.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-08-08-120852.txt');
dat.post24.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-08-09-121501.txt');

%2nd Rev
dat.post25.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-08-10-123331.txt');
dat.post26.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-08-11-122144.txt');
dat.post27.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-08-12-122328.txt');
dat.post28.(dat.ratIDs{2})=cat(2,dataPath,datafolders{2},'/3908LR-2020-08-13-124958.txt');%71 S.F

%% Rat_10 Saline

dat.pre1.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-03-04-142547.txt');%111 S.F
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

dat.post7.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-04-13-110059.txt');
dat.post8.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-04-14-105357.txt');
dat.post9.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-04-15-111138.txt');

%Post experiment1: All saline
dat.post10.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-05-04-110304.txt');
dat.post11.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-05-05-105918.txt');
dat.post12.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-05-06-110654.txt');

%Experiment2: Logarithmic distribution
dat.post13.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-05-18-110345.txt');
dat.post14.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-05-19-111332.txt');
dat.post15.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-05-20-102014.txt');

%1st Rev
dat.post16.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-05-25-114641.txt');
dat.post17.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-05-26-104900.txt');
dat.post18.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-05-27-110503.txt');%134 S.F

%New B.L
dat.post19.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-08-04-111923.txt');%137 S.F
dat.post20.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-08-05-113355.txt');
dat.post21.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-08-06-113959.txt');
dat.post22.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-08-07-114743.txt');
dat.post23.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-08-08-120852.txt');
dat.post24.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-08-09-121501.txt');

%2ND Rev
dat.post25.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-08-10-123331.txt');
dat.post26.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-08-11-122144.txt');
dat.post27.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-08-12-122328.txt');%76 S.F
dat.post28.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-08-13-124958.txt');%190 S.F
dat.post29.(dat.ratIDs{3})=cat(2,dataPath,datafolders{3},'/3910LR-2020-08-14-130430.txt');


%% Rat_11 Saline

dat.pre1.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-03-04-130720.txt');
dat.pre2.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-03-05-133922.txt');
dat.pre3.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-03-06-133540.txt');
dat.pre4.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-03-10-113424.txt');
dat.pre5.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-03-11-131003.txt');


dat.post1.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-03-24-151214.txt');%196 S.F
dat.post2.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-03-25-145135.txt');
dat.post3.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-03-26-144344.txt');

dat.post4.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-03-31-141824.txt');
dat.post5.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-04-01-140750.txt');
dat.post6.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-04-02-134858.txt');%171 S.F

dat.post7.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-04-07-135841.txt');
dat.post8.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-04-08-134440.txt');
dat.post9.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-04-09-133817.txt');

%Post experiment1: All saline
dat.post10.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-04-28-135616.txt');
dat.post11.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-04-29-135319.txt');
dat.post12.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-04-30-134851.txt');

%All saline_ New condtions +logarithmically distributed
dat.post13.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-05-12-135625.txt');
dat.post14.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-05-13-142349.txt');
dat.post15.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-05-14-140954.txt');

%1st Rev
dat.post16.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-05-19-144915.txt');
dat.post17.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-05-20-131630.txt');
dat.post18.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-05-21-115927.txt');%122 S.F

%New B.L

dat.post19.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-08-04-132456.txt');
dat.post20.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-08-05-131704.txt');
dat.post21.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-08-06-144742.txt');
dat.post22.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-08-07-133337.txt');%150 S.F
dat.post23.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-08-08-142541.txt');
dat.post24.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-08-09-141434.txt');%199 S.F

%2nd Rev
dat.post25.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-08-10-141612.txt');
dat.post26.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-08-11-141935.txt');
dat.post27.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-08-12-141905.txt');
dat.post28.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-08-13-144521.txt');
dat.post29.(dat.ratIDs{4})=cat(2,dataPath,datafolders{4},'/3911L-2020-08-14-145528.txt');

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

%Post experiment1: All saline
dat.post10.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-04-28-135616.txt');
dat.post11.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-04-29-135319.txt');
dat.post12.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-04-30-134851.txt');%164 S.F

%Experiment2: Logarithmic distribution
dat.post13.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-05-12-135625.txt');
dat.post14.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-05-13-142349.txt');
dat.post15.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/33912LR-2020-05-14-140954.txt');

%1st Rev
dat.post16.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-05-19-144915.txt');
dat.post17.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-05-20-131630.txt');
dat.post18.(dat.ratIDs{5})=cat(2,dataPath,datafolders{5},'/3912LR-2020-05-21-115927.txt');

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

%Post experiment1: All saline
dat.post10.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-04-29-123627.txt');%171 suc.Fix
dat.post11.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-04-30-124138.txt');%177 suc.Fix
dat.post12.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-05-01-122905.txt');

%Experiment2: Logarithmic distribution
dat.post13.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-05-13-125210.txt');
dat.post14.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-05-14-125908.txt');%190 S.F
dat.post15.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-05-15-143320.txt');%144 S.F
dat.post15.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-05-15-131520.txt');%78 S.F

%1st Rev
dat.post16.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-05-19-131516.txt');
dat.post17.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-05-20-113938.txt');%231 S.F
dat.post18.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-05-21-105532.txt');

%New B.L
dat.post19.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-08-04-132456.txt');%141 S.F
dat.post20.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-08-05-131704.txt');%121 S.F
dat.post21.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-08-06-144742.txt');
dat.post22.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-08-07-133337.txt');%152 S.F
dat.post23.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-08-08-142541.txt');
dat.post24.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-08-09-141434.txt');%150 S.F

%2nd Rev
dat.post25.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-08-10-141612.txt');
dat.post26.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-08-11-141935.txt');
dat.post27.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-08-12-141905.txt');
dat.post28.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-08-13-144521.txt');
dat.post29.(dat.ratIDs{6})=cat(2,dataPath,datafolders{6},'/3913L-2020-08-14-145528.txt');%0.1 J60


%% Rat_14 J60

dat.pre1.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-03-04-130720.txt');
dat.pre2.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-03-05-165539.txt');
dat.pre3.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-03-06-174728.txt');
dat.pre4.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-03-10-181148.txt');
dat.pre5.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-03-11-191942.txt');


%dat.post1.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-03-25-134024.txt');
%dat.post2.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-03-26-133032.txt');
dat.post3.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-03-27-132906.txt');%106 S.F

%dat.post4.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-04-01-122935.txt');
dat.post5.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-04-02-124353.txt');
dat.post6.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-04-03-123642.txt');

%dat.post7.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-04-08-122931.txt');
dat.post8.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-04-09-122923.txt');
%dat.post9.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-04-10-130524 (2).txt');

%Post experiment1: All saline
dat.post10.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-04-29-123627.txt');
dat.post11.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-04-30-124138.txt');
dat.post12.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-05-01-122905.txt');

%Experiment2: Logarithmic distribution
dat.post13.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-05-13-125210.txt');
dat.post14.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-05-14-125908.txt');
dat.post15.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-05-15-131520.txt');%163 S.F

%1st Rev
dat.post16.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-05-19-131516.txt');
dat.post17.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-05-20-113938.txt');
dat.post18.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-05-21-105532.txt');

%New B.L
dat.post19.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-08-04-132456.txt');%176 S.F
dat.post20.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-08-05-131704.txt');
dat.post21.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-08-06-144742.txt');
dat.post22.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-08-07-133337.txt');%100 S.F
dat.post23.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-08-08-142541.txt');%114 S.F
dat.post24.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-08-09-141434.txt');

%2nd Reversal
dat.post25.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-08-10-141612.txt');%143 S.F
dat.post26.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-08-11-141935.txt');
dat.post27.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-08-12-141905.txt');
dat.post28.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-08-13-144521.txt');
dat.post29.(dat.ratIDs{7})=cat(2,dataPath,datafolders{7},'/3914LR-2020-08-14-145528.txt');%0.1 J60


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

dat.post7.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-04-13-110059.txt');
dat.post8.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-04-14-105357.txt');
dat.post9.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-04-15-111138.txt');

%Post experiment1: All saline
dat.post10.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-05-04-110304.txt');
dat.post11.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-05-05-105918.txt');
dat.post12.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-05-06-110654.txt');

%Experiment2: Logarithmic distribution
dat.post13.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-05-18-110345.txt');
dat.post14.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-05-19-111332.txt');
dat.post15.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-05-20-102014.txt');

%1st Rev
dat.post16.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-05-25-114641.txt');%1 S.F
dat.post17.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-05-26-104900.txt');%171 S.F
dat.post18.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-05-27-110503.txt');

%New B.L
dat.post19.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-08-04-154625.txt');%150 S.F
dat.post20.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-08-05-151423.txt');
dat.post21.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-08-06-165012.txt');
dat.post22.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-08-07-164746.txt');
dat.post23.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-08-08-162537.txt');
dat.post24.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-08-09-164307.txt');%188 S.F

%2nd Rev
dat.post25.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-08-10-163530.txt');
dat.post26.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-08-11-162256.txt');
dat.post27.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-08-12-162114.txt');
dat.post28.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-08-13-163115.txt');
dat.post29.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-08-14-160959.txt');%0.1 J60-132 S.F
dat.post29.(dat.ratIDs{8})=cat(2,dataPath,datafolders{8},'/3915L-2020-08-14-163556.txt');%0.1 J60-135 S.F
%% Rat_16 got sacrificed

dat.pre1.(dat.ratIDs{9})=cat(2,dataPath,datafolders{9},'/3916LR-2020-03-04-160921.txt');
dat.pre2.(dat.ratIDs{9})=cat(2,dataPath,datafolders{9},'/3916LR-2020-03-05-152721.txt');
dat.pre3.(dat.ratIDs{9})=cat(2,dataPath,datafolders{9},'/3916LR-2020-03-06-161101.txt');
dat.pre4.(dat.ratIDs{9})=cat(2,dataPath,datafolders{9},'/3916LR-2020-03-10-143141.txt');
dat.pre5.(dat.ratIDs{9})=cat(2,dataPath,datafolders{9},'/3916LR-2020-03-11-181512.txt');

%% Rat_17 the worst performer - J60

dat.pre0.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-02-13-140051.txt');
dat.pre1.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-03-04-160921.txt');%103 S.F
dat.pre2.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-03-05-165539.txt');
dat.pre3.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-03-10-181148.txt');%184 S.F
dat.pre4.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-03-11-191942.txt');


%dat.post1.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-03-30-113411.txt');
dat.post2.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-03-31-105707.txt');
dat.post3.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-04-01-105717.txt');

dat.post4.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-04-06-110247.txt');
dat.post5.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/317L-2020-04-07-105810.txt');%179
dat.post6.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-04-08-105709.txt');

dat.post7.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-04-13-110059.txt');
dat.post8.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-04-14-105357.txt');
dat.post9.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-04-15-111138.txt');

%Post experiment1: All saline
dat.post10.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-05-04-110304.txt');%156 S.F
dat.post11.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-05-05-105918.txt');
dat.post12.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-05-06-110654.txt');

%Experiment2: Logarithmic distribution
dat.post13.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-05-18-110345.txt');
dat.post14.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-05-19-111332.txt');
dat.post15.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-05-20-102014.txt');

%1st Rev
%dat.post16.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-05-25-114641.txt');%3 S.F
dat.post17.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-05-26-104900.txt');
dat.post18.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-05-27-110503.txt');

%New B.L
%dat.post19.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-08-04-154625.txt');%66 S.F
dat.post20.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-08-05-151423.txt');%126 S.F
dat.post21.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-08-06-165012.txt');
dat.post22.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-08-07-164746.txt');%159 S.F
dat.post23.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-08-08-162537.txt');%134 S.F
dat.post24.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-08-09-164307.txt');%121 S.F
dat.post25.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-08-10-163530.txt');

%2nd Rev
dat.post26.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-08-11-162256.txt');%181 S.F
dat.post27.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-08-12-162114.txt');
dat.post28.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-08-13-163115.txt');
dat.post29.(dat.ratIDs{10})=cat(2,dataPath,datafolders{10},'/3917L-2020-08-14-163556.txt');%0.1 J60-3 S.F



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

dat.post4.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-03-31-155245.txt');%183 S.F
dat.post5.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-04-01-151922.txt');%122 S.F
dat.post6.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-04-02-145415.txt');%188 S.F
%succ. fix

dat.post7.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-04-07-152437.txt');
dat.post8.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-04-08-150848.txt');%192 S.F
%dat.post9.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-04-09-144335.txt');

%Post experiment1: All saline
dat.post10.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-04-28-150129.txt');
dat.post11.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-04-29-150422.txt');
dat.post12.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-04-30-145739.txt');%124 S.F

%Experiment2: Logarithmic distribution
%dat.post13.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-05-12-150050.txt');
dat.post14.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-05-13-153553.txt');
dat.post15.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-05-14-150223.txt');%195 succ.Fix

%1st Rev
dat.post16.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-05-19-160844.txt');
dat.post17.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-05-20-143341.txt');
dat.post18.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-05-21-130019.txt');%172 succ.Fix

%New B.L
dat.post19.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-08-04-154625.txt');%177 succ.Fix
%dat.post20.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-08-05-151423.txt');%70 succ.Fix
dat.post21.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-08-06-165012.txt');
dat.post22.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-08-07-164746.txt');%160 succ.Fix
dat.post23.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-08-08-162537.txt');
dat.post24.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-08-09-164307.txt');

%2nd Rev
dat.post25.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-08-10-163530.txt');
dat.post26.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-08-11-162256.txt');
%dat.post27.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-08-12-162114.txt');%52 succ.Fix
dat.post28.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-08-13-163115.txt');
dat.post29.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-08-14-160649.txt');%0.1 J60-7 S.F
dat.post29.(dat.ratIDs{11})=cat(2,dataPath,datafolders{11},'/3919L-2020-08-14-160959.txt');%0.1 J60-144 S.F


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
        if ischar(s{si}) && isempty(strfind(s{si},'ratIDs')) && ~strcmp(s{si},dat.dataPath)
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
