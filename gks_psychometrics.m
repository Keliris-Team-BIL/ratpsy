% be in code directory
forceRecalc=true;
data=gk_ratpsy_readData('C:/Neuroscience/GitHub/ratpsy/Data',forceRecalc);

%% Collapse pre and post data for population analysis
allDataPre=gk_ratpsy_collapseTimepoints(data,'allPre');
B.L=gk_ratpsy_collapseTimepoints(data,{'post21','post22','post23','post24'});
J60=gk_ratpsy_collapseTimepoints(data,{'post25','post26','post27','post28'});

%% plot the psychometric per rat
for rat=[19,20]
    display('_____________________________________________');
    fprintf('Processing rat: %d \n',rat);
    B.L=gk_get_psychometric(B.L(B.L.ratNumber==rat,:),1);
    J60=gk_get_psychometric(J60(J60.ratNumber==rat,:),1);
    
    figure(rat); hold on;
    display('-------B.L---------');
    gk_PAL_PFML(B.L,[1.0, 0.2, 0.2]);
    grid on;
    display('-------J60--------');
    gk_PAL_PFML(J60,[0.2, 0.2, 1.0]);
    
    title(['Rat ',num2str(rat)]);
    legend('B.L','B.L','J60','J60','Location','northwest');
end
