function gk_plot_reactionTimes(RT1, RT2, condNames)
% USAGE: gk_plot_reactionTimes(RT1, RT2, condNames)
%
% GAK Aug 2019

% FIGURE REACTION TIMES
figure; hold on;
median_RT1=median(RT1);
histogram(RT1,0:10:1000);
xlabel('time [ms]'); ylabel('frequency');

if ~isempty(RT2)
    median_RT2=median(RT2);
    histogram(RT2,0:10:1000);
    Prt=ranksum(double(RT1),double(RT2));
    title(['Rank sum test for equal medians: P < ',num2str(Prt)]);
    legend(['median RT ', condNames{1}, ' = ',num2str(median_RT1),' ms'],...
        ['median RT ', condNames{2}, ' = ',num2str(median_RT2),' ms']);
else
    title(['Reaction time distribution (',condNames{1},'), median = ',...
        num2str(median_RT1),' ms']);
end