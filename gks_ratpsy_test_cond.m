filename='/Users/gkeliris/GitHub/ratpsy/Data/Rat_07/3907L-2020-05-15-131520.txt';

info=gk_pyControl_read(filename);
trialType={{},{'pW_L'}};
trType=gk_pyControl_collapse_events(info,trialType);
trialType = gk_pyControl_getCategories(trType,[],[],1);