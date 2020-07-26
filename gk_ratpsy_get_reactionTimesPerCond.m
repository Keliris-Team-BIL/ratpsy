function RT = gk_ratpsy_get_reactionTimesPerCond(allData)
% USAGE: RT = gk_ratpsy_get_reactionTimesPerCond(allData)
%
% example
% RT=gk_ratpsy_get_reactionTimesPerCond(allDataPre(allDataPre.ratNumber==7 & allDataPre.outcome=='correct',:))

conditions=categories(allData.trialType);
for c=1:length(conditions)
    RT.stim{c}=allData.RT_stim(allData.trialType==num2str(c));
    RT.move{c}=allData.RT_move(allData.trialType==num2str(c));
end
    






