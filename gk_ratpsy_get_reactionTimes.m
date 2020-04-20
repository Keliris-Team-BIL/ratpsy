function RT = gk_ratpsy_get_reactionTimes(data)

d=data.description;
allDataPre=gk_ratpsy_collapseTimepoints(data,'allPre');
allDataPost=gk_ratpsy_collapseTimepoints(data,'allPost');

% Split subjects into 2 groups and plot RT histograms  of all pre vs all post

% get the RT for different conditions (NOTE: J60rats and SALrats is now
% defined in the Behavior_Datapaths.m

RT.stim.J60.pre.correct  =allDataPre.RT_stim(ismember(allDataPre.ratNumber,d.J60rats) & allDataPre.outcome=='correct');
RT.stim.J60.post.correct =allDataPost.RT_stim(ismember(allDataPost.ratNumber,d.J60rats) & allDataPost.outcome=='correct');
RT.stim.SAL.pre.correct  =allDataPre.RT_stim(ismember(allDataPre.ratNumber,d.SALrats) & allDataPre.outcome=='correct');
RT.stim.SAL.post.correct =allDataPost.RT_stim(ismember(allDataPost.ratNumber,d.SALrats) & allDataPost.outcome=='correct');
RT.move.J60.pre.correct  =allDataPre.RT_move(ismember(allDataPre.ratNumber,d.J60rats) & allDataPre.outcome=='correct');
RT.move.J60.post.correct =allDataPost.RT_move(ismember(allDataPost.ratNumber,d.J60rats) & allDataPost.outcome=='correct');
RT.move.SAL.pre.correct  =allDataPre.RT_move(ismember(allDataPre.ratNumber,d.SALrats) & allDataPre.outcome=='correct');
RT.move.SAL.post.correct =allDataPost.RT_move(ismember(allDataPost.ratNumber,d.SALrats) & allDataPost.outcome=='correct');
RT.stim.J60.pre.wrong    =allDataPre.RT_stim(ismember(allDataPre.ratNumber,d.J60rats) & allDataPre.outcome=='wrong');
RT.stim.J60.post.wrong   =allDataPost.RT_stim(ismember(allDataPost.ratNumber,d.J60rats) & allDataPost.outcome=='wrong');
RT.stim.SAL.pre.wrong    =allDataPre.RT_stim(ismember(allDataPre.ratNumber,d.SALrats) & allDataPre.outcome=='wrong');
RT.stim.SAL.post.wrong   =allDataPost.RT_stim(ismember(allDataPost.ratNumber,d.SALrats) & allDataPost.outcome=='wrong');
RT.move.J60.pre.wrong    =allDataPre.RT_move(ismember(allDataPre.ratNumber,d.J60rats) & allDataPre.outcome=='wrong');
RT.move.J60.post.wrong   =allDataPost.RT_move(ismember(allDataPost.ratNumber,d.J60rats) & allDataPost.outcome=='wrong');
RT.move.SAL.pre.wrong    =allDataPre.RT_move(ismember(allDataPre.ratNumber,d.SALrats) & allDataPre.outcome=='wrong');
RT.move.SAL.post.wrong   =allDataPost.RT_move(ismember(allDataPost.ratNumber,d.SALrats) & allDataPost.outcome=='wrong');
RT.stim.J60.pre.all      =allDataPre.RT_stim(ismember(allDataPre.ratNumber,d.J60rats) & (allDataPre.outcome=='correct' | allDataPre.outcome=='wrong'));
RT.stim.J60.post.all     =allDataPost.RT_stim(ismember(allDataPost.ratNumber,d.J60rats) & (allDataPost.outcome=='correct' | allDataPost.outcome=='wrong'));
RT.stim.SAL.pre.all      =allDataPre.RT_stim(ismember(allDataPre.ratNumber,d.SALrats) & (allDataPre.outcome=='correct' | allDataPre.outcome=='wrong'));
RT.stim.SAL.post.all     =allDataPost.RT_stim(ismember(allDataPost.ratNumber,d.SALrats) & (allDataPost.outcome=='correct' | allDataPost.outcome=='wrong'));
RT.move.J60.pre.all      =allDataPre.RT_move(ismember(allDataPre.ratNumber,d.J60rats) & (allDataPre.outcome=='correct' | allDataPre.outcome=='wrong'));
RT.move.J60.post.all     =allDataPost.RT_move(ismember(allDataPost.ratNumber,d.J60rats) & (allDataPost.outcome=='correct' | allDataPost.outcome=='wrong'));
RT.move.SAL.pre.all      =allDataPre.RT_move(ismember(allDataPre.ratNumber,d.SALrats) & (allDataPre.outcome=='correct' | allDataPre.outcome=='wrong'));
RT.move.SAL.post.all     =allDataPost.RT_move(ismember(allDataPost.ratNumber,d.SALrats) & (allDataPost.outcome=='correct' | allDataPost.outcome=='wrong'));

RT.total.J60.pre.all     =allDataPre.RT_move(ismember(allDataPre.ratNumber,d.J60rats) & ~isnan(allDataPre.RT_move) & ~isnan(allDataPre.RT_stim)) +...
                            allDataPre.RT_stim(ismember(allDataPre.ratNumber,d.J60rats) & ~isnan(allDataPre.RT_move) & ~isnan(allDataPre.RT_stim));
RT.total.J60.post.all     =allDataPost.RT_move(ismember(allDataPost.ratNumber,d.J60rats) & ~isnan(allDataPost.RT_move) & ~isnan(allDataPost.RT_stim)) +...
                            allDataPost.RT_stim(ismember(allDataPost.ratNumber,d.J60rats) & ~isnan(allDataPost.RT_move) & ~isnan(allDataPost.RT_stim));
RT.total.SAL.pre.all      =allDataPre.RT_move(ismember(allDataPre.ratNumber,d.SALrats) & ~isnan(allDataPre.RT_move) & ~isnan(allDataPre.RT_stim)) +...
                            allDataPre.RT_stim(ismember(allDataPre.ratNumber,d.SALrats) & ~isnan(allDataPre.RT_move) & ~isnan(allDataPre.RT_stim));
RT.total.SAL.post.all     =allDataPost.RT_move(ismember(allDataPost.ratNumber,d.SALrats) & ~isnan(allDataPost.RT_move) & ~isnan(allDataPost.RT_stim))+...
                            allDataPost.RT_stim(ismember(allDataPost.ratNumber,d.SALrats) & ~isnan(allDataPost.RT_move) & ~isnan(allDataPost.RT_stim));
 
