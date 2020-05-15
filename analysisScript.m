% be in code directory
forceRecalc=false;
data=gk_ratpsy_readData('/Users/gkeliris/GitHub/ratpsy/Data',forceRecalc);

%% Collapse pre and post data for population analysis
% NOTE: instead of 'allPre' or 'allPost' one can specify the timepoints by
% hand i.e. {'pre1','post5','post6'} in arbitrary combinations
allDataPre=gk_ratpsy_collapseTimepoints(data,'allPre');
allDataPost=gk_ratpsy_collapseTimepoints(data,'allPost');
logPost=gk_ratpsy_collapseTimepoints(data,{'post13','post14','post15'});

dataPre=gk_ratpsy_collectTimepoints(data,'allPre');
dataPost=gk_ratpsy_collectTimepoints(data,'allPost');

%% POPULATION: ANALYSIS OF REACTION TIMES
RT = gk_ratpsy_get_reactionTimes(data);

% PLOT different combinations of pairs 
gk_plot_reactionTimes(RT.stim.J60.pre.correct,RT.stim.J60.post.correct,{'stmJ60PreC','stmJ60PostC'});
gk_plot_reactionTimes(RT.stim.SAL.pre.correct,RT.stim.SAL.post.correct,{'stmSALPreC','stmSALPostC'});
gk_plot_reactionTimes(RT.move.J60.pre.correct,RT.move.J60.post.correct,{'movJ60PreC','movJ60PostC'});
gk_plot_reactionTimes(RT.move.SAL.pre.correct,RT.move.SAL.post.correct,{'movSALPreC','movSALPostC'});
gk_plot_reactionTimes(RT.stim.J60.pre.wrong,RT.stim.J60.post.wrong,{'stmJ60PreW','stmJ60PostW'});
gk_plot_reactionTimes(RT.stim.SAL.pre.wrong,RT.stim.SAL.post.wrong,{'stmSALPreW','stmSALPostW'});
gk_plot_reactionTimes(RT.move.J60.pre.wrong,RT.move.J60.post.wrong,{'movJ60PreW','movJ60PostW'});
gk_plot_reactionTimes(RT.move.SAL.pre.wrong,RT.move.SAL.post.wrong,{'movSALPreW','movSALPostW'});
gk_plot_reactionTimes(RT.stim.J60.pre.all,RT.stim.J60.post.all,{'stmJ60PreA','stmJ60PostA'});
gk_plot_reactionTimes(RT.stim.SAL.pre.all,RT.stim.SAL.post.all,{'stmSALPreA','stmSALPostA'});
gk_plot_reactionTimes(RT.move.J60.pre.all,RT.move.J60.post.all,{'movJ60PreA','movJ60PostA'});
gk_plot_reactionTimes(RT.move.SAL.pre.all,RT.move.SAL.post.all,{'movSALPreA','movSALPostA'});
gk_plot_reactionTimes(RT.total.J60.pre.all,RT.total.J60.post.all,{'totJ60PreA','totJ60PostA'});
gk_plot_reactionTimes(RT.total.SAL.pre.all,RT.total.SAL.post.all,{'totSALPreA','totSALPostA'});

%% RAT BY RAT: ANALYSIS OF REACTION TIMES
% some examples...

% RT stim
for rat=[7,8,10,11,12,13,14,15,17,19]
    pre=allDataPre.RT_stim(allDataPre.ratNumber==rat & allDataPre.outcome=='correct');
    post=allDataPost.RT_stim(allDataPost.ratNumber==rat & allDataPost.outcome=='correct');
    gk_plot_reactionTimes(pre,post,{'pre','post'});
    XL=xlim; YL=ylim;
    text(0.05*XL(2),0.98*YL(2),['RT stim, outcome:correct, Rat number: ', num2str(rat)]);
end

% RT move
for rat=[7,8,10,11,12,13,14,15,17,19]
    pre=allDataPre.RT_move(allDataPre.ratNumber==rat & allDataPre.outcome=='correct');
    post=allDataPost.RT_move(allDataPost.ratNumber==rat & allDataPost.outcome=='correct');
    gk_plot_reactionTimes(pre,post,{'preM','postM'});
    XL=xlim; YL=ylim;
    text(0.05*XL(2),0.98*YL(2),['RT move, outcome:correct, Rat number: ', num2str(rat)]);
end

% compare left-right
for rat=[7,8,10,11,12,13,14,15,17,19]
    left=allDataPost.RT_stim(allDataPost.ratNumber==rat & allDataPost.response=='L');
    right=allDataPost.RT_stim(allDataPost.ratNumber==rat & allDataPost.response=='R');
    gk_plot_reactionTimes(left,right,{'left','right'});
    XL=xlim; YL=ylim;
    text(0.05*XL(2),0.98*YL(2),['RT stim, L vs R, Rat number: ', num2str(rat)]);
end


%% POPULATION: PREMATURE RESPONSES
PMR = gk_ratpsy_get_prematureResponses(data);

gk_plot_prematureResp(PMR.J60.pre.all,PMR.J60.post.all,{'pre','post'})


%% ANALYSIS RAT BY RAT : Accuracy
%Accuracy
for rat=[7,8,10,11,12,13,14,15,17,19]

   Ncorrect= numel(allDataPre( allDataPre.outcome=='correct' & allDataPre.ratNumber==rat,1));
   Nwrong= numel(allDataPre( allDataPre.outcome=='wrong' & allDataPre.ratNumber==rat,1));

   Accuracy{rat} = Ncorrect/(Ncorrect+ Nwrong) *100
end

%Or bettter use gk_get_psychometric function

for rat=[7,8,10,11,12,13,14,15,17,19]

    %Nacc(rat)= gk_get_psychometric(allDataPre(allDataPre.ratNumber==rat,:),1);
    Nacc(rat)= gk_get_psychometric(logPost(logPost.ratNumber==rat,:),1);

end

%Anticipatory responses
for rat=[7,8,10,11,12,13,14,15,17,19]
   Ncorrect= numel(allDataPre( allDataPre.outcome=='correct' & allDataPre.ratNumber==rat,1));
   Nwrong= numel(allDataPre( allDataPre.outcome=='wrong' & allDataPre.ratNumber==rat,1));
   Nabort= numel(allDataPre( allDataPre.outcome=='abort' & allDataPre.ratNumber==rat,1));
   anticipatoryRes{rat} = Nabort/(Ncorrect+ Nwrong)*100
end
%% PSYCHOMETRICS

% Get the data per rat and timepoint
for rat=[7,8,10,11,12,13,14,15,17,19]
    N.pre{rat,1} = gk_get_psychometric(allDataPre(allDataPre.ratNumber==rat,:));
    for pi={'post1','post2','post3','post4','post5','post6'}
        N.post{rat,str2double(pi{1}(end))} = ...
            gk_get_psychometric(dataPost.(pi{1})(dataPost.(pi{1}).ratNumber==rat,:));
    end
end

save(fullfile(d.dataPath,'Analysis','data'),'N','-append');
%%
% Fit the psychometric curves per rat and create figures
diary(fullfile(d.dataPath,'Analysis','logfiles',['PF_',datestr(now,30),'.txt']))
diary ON
%figure;
for rat=[7,8,10,11,12,13,14,15,17,19]
   %subplot(2,3,rat); hold on;
   figure(100+rat);
   fprintf('\nFitting rat %d, pre\n_______\n',rat);
   [PF.pre.thresh(rat) PF.pre.slope(rat) PF.pre.SEthresh(rat)...
       PF.pre.SEslope(rat) PF.pre.Dev(rat) PF.pre.pDev(rat)] = ...
       gk_PAL_PFML(N.pre{rat}, [1 0.2 0.2]);
   for pst=1:6
       fprintf('\nFitting rat %d, post %d\n_______\n',rat,pst);
       if ~isempty(N.post{rat,pst})
           [PF.post.thresh(rat,pst) PF.post.slope(rat,pst) PF.post.SEthresh(rat,pst)...
               PF.post.SEslope(rat,pst) PF.post.Dev(rat,pst) PF.post.pDev(rat,pst)] = ...
               gk_PAL_PFML(N.post{rat,pst},(1-[1/pst 1/pst 1/pst]).^1.5);
       end
   end
   title(['Rat number: ', num2str(rat)]);
   saveas(gcf,fullfile(d.dataPath,'Analysis','Figures',['psychometric_rat' num2str(rat) '.png']));
end
diary OFF
save(fullfile(d.dataPath,'Analysis','data'),'PF','-append')
%% The statistics
diary(fullfile(d.dataPath,'Analysis','logfiles',['STATS_',datestr(now,30),'.txt']))
diary ON
for rat=[7,8,10,11,12,13,14,15,17,19]
    for pst=1:3
        fprintf('\n________\nrat %d, pre vs post%d\n',rat,pst);
        if isempty(N.post{rat,pst})
            fprintf('Missing time point for this rat\n')
        else
            gk_ModelComparisonTwoConditions(N.pre{rat},N.post{rat,pst})
        end
    end
end
diary OFF







% %
% %
% % % prepare for psignfit
% % %N_pre.stimulus = [-log(1+abs(N_pre.stimulus(1:6))) log(1+N_pre.stimulus(7:12))];
% % P_pre=[N_pre.stimulus' N_pre.right' N_pre.total'];
% % P_post=[N_post.stimulus' N_post.right' N_post.total'];
% % P_post1=[N_post1.stimulus' N_post1.right' N_post1.total'];
% % % run psignfit
% % res_pre=psignifit(P_pre);
% % res_post=psignifit(P_post);
% % res_post1=psignifit(P_post1);
% % % plot
% % figure;
% % plotOptions.CIthresh=true;
% % plotPsych(res_pre,plotOptions);
% % hold on;
% % %figure; plotsModelfit(res_pre)
% %
% % plotOptions.dataColor=[0 1 0];
% % plotOptions.lineColor=[0 1 0];
% % plotOptions.CIthresh=true;
% % plotPsych(res_post,plotOptions);
% %
% % plotOptions.dataColor=[1 0 0];
% % plotOptions.lineColor=[1 0 0];
% % plotPsych(res_post1,plotOptions);
% %
% %
% % % USING PALAMEDES
% % PF=@PAL_CumulativeNormal;
% % [paramsValues LL exitflag] = PAL_PFML_Fit(N_pre.stimulus, ...
% %     N_pre.right,N_pre.total,[0 1 0 0],[1 1 0 0],PF)
% % Fit = PF(paramsValues,-8:0.01:8);
% % plot(-8:0.01:8,Fit,'b--','LineWidth',2)
% %
% % B = 400;
% % [SD paramsSim LLSim converged] =...
% %     PAL_PFML_BootstrapParametric(N_pre.stimulus, N_pre.total, ...
% %     paramsValues, [1 1 0 0], B, PF);
% %
% % B = 1000;
% % [Dev pDev DevSim converged] = ...
% %     PAL_PFML_GoodnessOfFit(N_pre.stimulus, N_pre.right, N_pre.total, ...
% %     paramsValues, [0 0 1 1], B, PF);
