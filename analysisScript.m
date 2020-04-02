% be in code directory
d=Behavior_Datapaths('/Users/gkeliris/Documents/DATA/Ahmed/preLesionRawData',0);
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
save(fullfile(d.dataPath,'Analysis','data'),'data');

%% LOAD ALL DATA (after 1st time)
load(fullfile(d.dataPath,'Analysis','data'));

%% POPULATION: ANALYSIS OF REACTION TIMES AND PREMATURE RESPONSES

allDataPre=[];
for pi={'pre1', 'pre2'}
    ratIDs=fieldnames(data.(pi{1}));
    for rat=[{ratIDs{:}}]
        allDataPre=cat(1,allDataPre,data.(pi{1}).(rat{1}));
    end
end

allDataPost=[];
for pi={'pre4', 'pre5'}
    ratIDs=fieldnames(data.(pi{1}));
    for rat=[{ratIDs{:}}]
        allDataPost=cat(1,allDataPost,data.(pi{1}).(rat{1}));
    end
end

% separate each post timepoint
for pi={'pre3', 'pre4', 'pre5'}
    ratIDs=fieldnames(data.(pi{1}));
    dataPost.(pi{1})=[];
    for rat=[{ratIDs{:}}]
        dataPost.(pi{1})=cat(1,dataPost.(pi{1}),data.(pi{1}).(rat{1}));
    end
end

save(fullfile(d.dataPath,'Analysis','data'),'allDataPre','allDataPost','dataPost','-append')

% plot only the correct trials
gk_plot_reactionTimes(allDataPre(allDataPre.outcome=='correct',:), allDataPost(allDataPost.outcome=='correct',:), {'pre','post'},'RT_stim');
gk_plot_reactionTimes(allDataPre(allDataPre.outcome=='correct',:), allDataPost(allDataPost.outcome=='correct',:), {'pre','post'},'RT_move');

%gk_plot_prematureResp(allDataPre(allDataPre.correct==1,:), allDataPost(allDataPost.correct==1,:), {'pre','post'});
% plot only the wrong trials
gk_plot_reactionTimes(allDataPre(allDataPre.outcome=='wrong',:), allDataPost(allDataPost.outcome=='wrong',:), {'pre','post'},'RT_stim');
gk_plot_reactionTimes(allDataPre(allDataPre.outcome=='wrong',:), allDataPost(allDataPost.outcome=='wrong',:), {'pre','post'},'RT_move');

%gk_plot_prematureResp(allDataPre(allDataPre.correct==0,:), allDataPost(allDataPost.correct==0,:), {'pre','post'});
% plot all the trials to the left
%gk_plot_reactionTimes(allDataPre(allDataPre.response==1,:), allDataPost(allDataPost.response==1,:), {'pre','post'});
%gk_plot_prematureResp(allDataPre(allDataPre.response==1,:), allDataPost(allDataPost.response==1,:), {'pre','post'});
% plot all the trials to the right
%gk_plot_reactionTimes(allDataPre(allDataPre.response==2,:), allDataPost(allDataPost.response==2,:), {'pre','post'});
%gk_plot_prematureResp(allDataPre(allDataPre.response==2,:), allDataPost(allDataPost.response==2,:), {'pre','post'});

%% ANALYSIS RAT BY RAT
for rat=[7,8,10,11,12,13,14,15,16,17,19,20]
    gk_plot_reactionTimes(allDataPre(allDataPre.ratNumber==rat & allDataPre.outcome=='correct',:),...
        allDataPost(allDataPost.ratNumber==rat & allDataPost.outcome=='correct',:), {'pre','post'},'RT_stim');
    title(['RT stim, outcome:correct, Rat number: ', num2str(rat)]);
end

% for rat=1:6
%     gk_plot_prematureResp(allDataPre(allDataPre.ratNumber==rat,:), allDataPost(allDataPost.ratNumber==rat,:), {'pre','post'},'RT_stim');
% end

% plot only the trials to the left
for rat=[7,8,10,11,12,13,14,15,16,17,19,20]
    gk_plot_reactionTimes(allDataPre(allDataPre.ratNumber==rat & allDataPre.response=='L',:),...
        allDataPost(allDataPost.ratNumber==rat & allDataPost.response=='L',:), {'pre','post'},'RT_stim');
    title(['RT stim, response:L, Rat number: ', num2str(rat)]);
end
% plot only the trials to the right
for rat=[7,8,10,11,12,13,14,15,16,17,19,20]
    gk_plot_reactionTimes(allDataPre(allDataPre.ratNumber==rat & allDataPre.response=='R',:),...
        allDataPost(allDataPost.ratNumber==rat & allDataPost.response=='R',:), {'pre','post'},'RT_stim');
    title(['RT stim, response:R, Rat number: ', num2str(rat)]);
end

% compare left-right
for rat=[7,8,10,11,12,13,14,15,16,17,19,20]
    gk_plot_reactionTimes(allDataPre(allDataPost.ratNumber==rat & allDataPost.response=='L',:),...
        allDataPost(allDataPost.ratNumber==rat & allDataPost.response=='R',:), {'left','right'},'RT_stim');
    title(['RT stim, L vs R, Rat number: ', num2str(rat)]);
end

%% PSYCHOMETRICS

% Get the data per rat and timepoint
for rat=[7,8,10,11,12,13,14,15,16,17,19,20]
    N.pre{rat,1} = gk_get_psychometric(allDataPre(allDataPre.ratNumber==rat,:));
    for pi={'pre3','pre4','pre5'}
        N.post{rat,str2double(pi{1}(end))} = ...
            gk_get_psychometric(dataPost.(pi{1})(dataPost.(pi{1}).ratNumber==rat,:));
    end
end

save(fullfile(d.dataPath,'Analysis','data'),'N','-append');

% Fit the psychometric curves per rat and create figures
diary(fullfile(d.dataPath,'Analysis','logfiles',['PF_',datestr(now,30),'.txt']))
diary ON
%figure;
for rat=[7,8,10,11,12,13,14,15,16,17,19,20]
   %subplot(2,3,rat); hold on;
   figure(100+rat);
   fprintf('\nFitting rat %d, pre\n_______\n',rat);
   [PF.pre.thresh(rat) PF.pre.slope(rat) PF.pre.SEthresh(rat)...
       PF.pre.SEslope(rat) PF.pre.Dev(rat) PF.pre.pDev(rat)] = ...
       gk_PAL_PFML(N.pre{rat}, [1 0.2 0.2]);
   for pst=3:5
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

diary(fullfile(d.dataPath,'Analysis','logfiles',['STATS_',datestr(now,30),'.txt']))
diary ON
for rat=[7,8,10,11,12,13,14,15,16,17,19,20]
    for pst=3:5
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