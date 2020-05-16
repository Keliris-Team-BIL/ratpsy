% be in code directory
forceRecalc=false;
data=gk_ratpsy_readData('/Users/gkeliris/GitHub/ratpsy/Data',forceRecalc);

%% Collapse pre and post data for population analysis
allDataPre=gk_ratpsy_collapseTimepoints(data,'allPre');
logPost=gk_ratpsy_collapseTimepoints(data,{'post13','post14','post15'});

%% plot the psychometric per rat
for rat=[7,8,11,19]
    display('_____________________________________________');
    fprintf('Processing rat: %d \n',rat);
    N_pre=gk_get_psychometric(allDataPre(allDataPre.ratNumber==rat,:));
    N_post=gk_get_psychometric(logPost(logPost.ratNumber==rat,:));
    figure(rat); hold on;
    gk_PAL_PFML(N_pre,[1.0, 0.2, 0.2]);
    grid on;
    gk_PAL_PFML(N_post,[0.2, 0.2, 1.0]);
    legend('pre','pre','post','post');
end
