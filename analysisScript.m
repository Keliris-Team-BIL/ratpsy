% be in code directory
d=Behavior_Datapaths('/Users/gkeliris/GitHub/ratpsy/Data',0);

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


%% GET ALL DATA (1st time)
timepoints=fieldnames(d);
for rat=[d.ratIDs]
    for ti=[{timepoints{2:end}}]
        if isfield(d.(ti{1}),rat{1})
        	fprintf('\n\nPROCESSING:%s, %s\n',rat{1},ti{1});
            info.(ti{1}).(rat{1})=gk_pyControl_read(d.(ti{1}).(rat{1}));
            data.(ti{1}).(rat{1})=gk_ratpsy_data_import(info.(ti{1}).(rat{1}),str2num(rat{1}(6:7)));
        end
    end
end
%Saving the data as a variable called 'data'
save(fullfile(d.dataPath,'Analysis','data'),'data');

%% LOAD ALL DATA (after 1st time)

d=Behavior_Datapaths('/Users/gkeliris/GitHub/ratpsy/Data',0);
load(fullfile(d.dataPath,'Analysis','data')); % You can run this line straight away after loading the data for the first time

%% POPULATION: ANALYSIS OF REACTION TIMES AND PREMATURE RESPONSES

allDataPre=[];
%First create variales for the data form each rat per each timepoint pre
%and save the in the variable 'data'
for pi={'pre1', 'pre2', 'pre3', 'pre4', 'pre5'}
    ratIDs=fieldnames(data.(pi{1}));

    %collapse all the data pre and save it as the variable 'allDataPre'
    for rat=[{ratIDs{:}}]
        allDataPre=cat(1,allDataPre,data.(pi{1}).(rat{1}));
    end
end
%First create variales for the data form each rat per each timepoint post
%and save the in the variable 'data'
allDataPost=[];
for pi={'post1', 'post2', 'post3', 'post4', 'post5', 'post6'}
    ratIDs=fieldnames(data.(pi{1}));
    for rat=[{ratIDs{:}}]
        %collapse all the data post and save it as the variable 'allDataPost'

        allDataPost=cat(1,allDataPost,data.(pi{1}).(rat{1}));
    end
end

% separate each post timepoint post and save them as a variable 'dataPost'
for pi={'post1', 'post2', 'post3', 'post4', 'post5', 'post6'}
    ratIDs=fieldnames(data.(pi{1}));
    dataPost.(pi{1})=[];
    for rat=[{ratIDs{:}}]
        dataPost.(pi{1})=cat(1,dataPost.(pi{1}),data.(pi{1}).(rat{1}));
    end
end

save(fullfile(d.dataPath,'Analysis','data'),'allDataPre','allDataPost','dataPost','-append')

%%
% Split subjects into 2 groups and plot RT histograms  of all pre vs all post

% get the RT for different conditions (NOTE: J60rats and SALrats is now
% defined in the Behavior_Datapaths.m

RT.stim.J60.pre.correct  =allDataPre.RT_stim(ismember(allDataPre.ratNumber,d.J60rats) & allDataPre.outcome=='correct');
RT.stim.J60.post.correct =allDataPost.RT_stim(~ismember(allDataPost.ratNumber,d.J60rats) & allDataPost.outcome=='correct');
RT.stim.SAL.pre.correct  =allDataPre.RT_stim(ismember(allDataPre.ratNumber,d.SALrats) & allDataPre.outcome=='correct');
RT.stim.SAL.post.correct =allDataPost.RT_stim(~ismember(allDataPost.ratNumber,d.SALrats) & allDataPost.outcome=='correct');
RT.move.J60.pre.correct  =allDataPre.RT_move(ismember(allDataPre.ratNumber,d.J60rats) & allDataPre.outcome=='correct');
RT.move.J60.post.correct =allDataPost.RT_move(~ismember(allDataPost.ratNumber,d.J60rats) & allDataPost.outcome=='correct');
RT.move.SAL.pre.correct  =allDataPre.RT_move(ismember(allDataPre.ratNumber,d.SALrats) & allDataPre.outcome=='correct');
RT.move.SAL.post.correct =allDataPost.RT_move(~ismember(allDataPost.ratNumber,d.SALrats) & allDataPost.outcome=='correct');
RT.stim.J60.pre.wrong    =allDataPre.RT_stim(ismember(allDataPre.ratNumber,d.J60rats) & allDataPre.outcome=='wrong');
RT.stim.J60.post.wrong   =allDataPost.RT_stim(~ismember(allDataPost.ratNumber,d.J60rats) & allDataPost.outcome=='wrong');
RT.stim.SAL.pre.wrong    =allDataPre.RT_stim(ismember(allDataPre.ratNumber,d.SALrats) & allDataPre.outcome=='wrong');
RT.stim.SAL.post.wrong   =allDataPost.RT_stim(~ismember(allDataPost.ratNumber,d.SALrats) & allDataPost.outcome=='wrong');
RT.move.J60.pre.wrong    =allDataPre.RT_move(ismember(allDataPre.ratNumber,d.J60rats) & allDataPre.outcome=='wrong');
RT.move.J60.post.wrong   =allDataPost.RT_move(~ismember(allDataPost.ratNumber,d.J60rats) & allDataPost.outcome=='wrong');
RT.move.SAL.pre.wrong    =allDataPre.RT_move(ismember(allDataPre.ratNumber,d.SALrats) & allDataPre.outcome=='wrong');
RT.move.SAL.post.wrong   =allDataPost.RT_move(~ismember(allDataPost.ratNumber,d.SALrats) & allDataPost.outcome=='wrong');
RT.stim.J60.pre.all      =allDataPre.RT_stim(ismember(allDataPre.ratNumber,d.J60rats) & (allDataPre.outcome=='correct' | allDataPre.outcome=='wrong'));
RT.stim.J60.post.all     =allDataPost.RT_stim(~ismember(allDataPost.ratNumber,d.J60rats) & (allDataPost.outcome=='correct' | allDataPost.outcome=='wrong'));
RT.stim.SAL.pre.all      =allDataPre.RT_stim(ismember(allDataPre.ratNumber,d.SALrats) & (allDataPre.outcome=='correct' | allDataPre.outcome=='wrong'));
RT.stim.SAL.post.all     =allDataPost.RT_stim(~ismember(allDataPost.ratNumber,d.SALrats) & (allDataPost.outcome=='correct' | allDataPost.outcome=='wrong'));
RT.move.J60.pre.all      =allDataPre.RT_move(ismember(allDataPre.ratNumber,d.J60rats) & (allDataPre.outcome=='correct' | allDataPre.outcome=='wrong'));
RT.move.J60.post.all     =allDataPost.RT_move(~ismember(allDataPost.ratNumber,d.J60rats) & (allDataPost.outcome=='correct' | allDataPost.outcome=='wrong'));
RT.move.SAL.pre.all      =allDataPre.RT_move(ismember(allDataPre.ratNumber,d.SALrats) & (allDataPre.outcome=='correct' | allDataPre.outcome=='wrong'));
RT.move.SAL.post.all     =allDataPost.RT_move(~ismember(allDataPost.ratNumber,d.SALrats) & (allDataPost.outcome=='correct' | allDataPost.outcome=='wrong'));

RT.total.J60.pre.all     =allDataPre.RT_move(ismember(allDataPre.ratNumber,d.J60rats) & ~isnan(allDataPre.RT_move) & ~isnan(allDataPre.RT_stim)) +...
                            allDataPre.RT_stim(ismember(allDataPre.ratNumber,d.J60rats) & ~isnan(allDataPre.RT_move) & ~isnan(allDataPre.RT_stim));
RT.total.J60.post.all     =allDataPost.RT_move(~ismember(allDataPost.ratNumber,d.J60rats) & ~isnan(allDataPost.RT_move) & ~isnan(allDataPost.RT_stim)) +...
                            allDataPost.RT_stim(~ismember(allDataPost.ratNumber,d.J60rats) & ~isnan(allDataPost.RT_move) & ~isnan(allDataPost.RT_stim));
RT.total.SAL.pre.all      =allDataPre.RT_move(ismember(allDataPre.ratNumber,d.SALrats) & ~isnan(allDataPre.RT_move) & ~isnan(allDataPre.RT_stim)) +...
                            allDataPre.RT_stim(ismember(allDataPre.ratNumber,d.SALrats) & ~isnan(allDataPre.RT_move) & ~isnan(allDataPre.RT_stim));
RT.total.SAL.post.all     =allDataPost.RT_move(~ismember(allDataPost.ratNumber,d.SALrats) & ~isnan(allDataPost.RT_move) & ~isnan(allDataPost.RT_stim))+...
                            allDataPost.RT_stim(~ismember(allDataPost.ratNumber,d.SALrats) & ~isnan(allDataPost.RT_move) & ~isnan(allDataPost.RT_stim));

save(fullfile(d.dataPath,'Analysis','data'),'RT','-append')                        
                        
%% PLOT different combinations of pairs 
d=Behavior_Datapaths('/Users/gkeliris/GitHub/ratpsy/Data',0);
load(fullfile(d.dataPath,'Analysis','data')); % You can run this line straight away after loading the data for the first time

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



%title('title')
% plot only the correct trials of all pre vs all post for movement time
% gk_plot_reactionTimes(allDataPre(allDataPre.outcome=='correct',:), allDataPost(allDataPost.outcome=='correct',:), {'pre','post'},'RT_move');
%%
%gk_plot_prematureResp(allDataPre(allDataPre.correct==1,:), allDataPost(allDataPost.correct==1,:), {'pre','post'});



%% ANALYSIS RAT BY RAT: RT
for rat=[7,8,10,11,12,13,14,15,17,19]
    gk_plot_reactionTimes(allDataPre(allDataPre.ratNumber==rat & allDataPre.outcome=='correct',:),...
        allDataPost(allDataPost.ratNumber==rat & allDataPost.outcome=='correct',:), {'pre','post'},'RT_stim');
    %title(['RT stim, outcome:correct, Rat number: ', num2str(rat)]);
end
for rat=[7,8,10,11,12,13,14,15,17,19]
    gk_plot_reactionTimes(allDataPre(allDataPre.ratNumber==rat & allDataPre.outcome=='correct',:),...
        allDataPost(allDataPost.ratNumber==rat & allDataPost.outcome=='correct',:), {'pre','post'},'RT_move');
    %title(['RT move, outcome:correct, Rat number: ', num2str(rat)]);
end



%gk_plot_reactionTimes(dada(data.pre1.rat3907L & data.pre1.rat3907L.outcome=='correct',:),...
        %data(dada(data.pre2.rat3907L & data.pre1.rat3907L.outcome=='correct',:), {'pre1','pre2'},'RT_stim');
    %title(['RT stim, outcome:correct, Rat number: ', num2str(rat)]);v
% for rat=1:6
%     gk_plot_prematureResp(allDataPre(allDataPre.ratNumber==rat,:), allDataPost(allDataPost.ratNumber==rat,:), {'pre','post'},'RT_stim');
% end

% plot only the trials to the left
for rat=[7,8,10,11,12,13,14,15,17,19]
    gk_plot_reactionTimes(allDataPre(allDataPre.ratNumber==rat & allDataPre.response=='L',:),...
        allDataPost(allDataPost.ratNumber==rat & allDataPost.response=='L',:), {'pre','post'},'RT_stim');
    title(['RT stim, response:L, Rat number: ', num2str(rat)]);
end
% plot only the trials to the right
for rat=[7,8,10,11,12,13,14,15,17,19]
    gk_plot_reactionTimes(allDataPre(allDataPre.ratNumber==rat & allDataPre.response=='R',:),...
        allDataPost(allDataPost.ratNumber==rat & allDataPost.response=='R',:), {'pre','post'},'RT_stim');
    title(['RT stim, response:R, Rat number: ', num2str(rat)]);
end

% compare left-right
for rat=[7,8,10,11,12,13,14,15,17,19]
    gk_plot_reactionTimes(allDataPre(allDataPost.ratNumber==rat & allDataPost.response=='L',:),...
        allDataPost(allDataPost.ratNumber==rat & allDataPost.response=='R',:), {'left','right'},'RT_stim');
    title(['RT stim, L vs R, Rat number: ', num2str(rat)]);
end

%% ANALYSIS RAT BY RAT : Accuracy
%Accuracy
for rat=[7,8,10,11,12,13,14,15,17,19]

   Ncorrect= numel(allDataPre( allDataPre.outcome=='correct' & allDataPre.ratNumber==rat,1));
   Nwrong= numel(allDataPre( allDataPre.outcome=='wrong' & allDataPre.ratNumber==rat,1));

Accuracy = Ncorrect/(Ncorrect+ Nwrong) *100
end

%Or bettter use gk_get_psychometric function

for rat=[7,8,10,11,12,13,14,15,17,19]

Accuracy= gk_get_psychometric(allDataPre(allDataPre.ratNumber==rat,:),1);

end

%Anticipatory responses
for rat=[7,8,10,11,12,13,14,15,17,19]

   Nabort= numel(allDataPre( allDataPre.outcome=='abort' & allDataPre.ratNumber==rat,1));
   Ntrial=numel(allDataPre( allDataPre.trialNumber& allDataPre.ratNumber==rat,1));
anticipatoryRes = (Nabort/Ntrial) /((Ncorrect+ Nwrong)/Ntrial) *100
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
