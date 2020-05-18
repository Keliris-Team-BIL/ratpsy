% be in code directory
forceRecalc=false;
data=gk_ratpsy_readData('/Users/gkeliris/GitHub/ratpsy/Data',forceRecalc);

%% Collapse pre and post data for population analysis
allDataPre=gk_ratpsy_collapseTimepoints(data,'allPre');
linPost=gk_ratpsy_collapseTimepoints(data,{'post10','post11','post12'});
logPost=gk_ratpsy_collapseTimepoints(data,{'post13','post14','post15'});

%% plot the psychometric per rat
for rat=[7,8,11,19]
    display('_____________________________________________');
    fprintf('Processing rat: %d \n',rat);
    N_pre=gk_get_psychometric(allDataPre(allDataPre.ratNumber==rat,:),1);
    N_post=gk_get_psychometric(linPost(linPost.ratNumber==rat,:),1);
    N_postLog=gk_get_psychometric(logPost(logPost.ratNumber==rat,:),1);
    figure(rat); hold on;
    display('-------PRE---------');
    gk_PAL_PFML(N_pre,[1.0, 0.2, 0.2]);
    grid on;
    display('-------POST--------');
    gk_PAL_PFML(N_post,[0.2, 0.2, 1.0]);
    display('-------LOG---------');
    gk_PAL_PFML(N_postLog,[0.2, 1.0, 0.2]);
    title(['Rat ',num2str(rat)]);
    legend('pre','pre','post','post','postLog','postLog','Location','northwest');
end
