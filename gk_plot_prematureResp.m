function gk_plot_prematureResp(cond1, cond2, condNames)
% USAGE: gk_plot_prematureResp(cond1, cond2, condNames)
%
% GAK Aug 2019

% FIGURE PREMATURE RESPONSES (we don't count the non-premature here)
figure; hold on;
median_num_PM_cond1=median(cond1.preMature(cond1.preMature>0));
median_num_PM_cond2=median(cond2.preMature(cond2.preMature>0));
Ppm=ranksum(cond1.preMature(cond1.preMature>0), cond2.preMature(cond2.preMature>0));
histogram(cond1.preMature,0.5:1:15)
histogram(cond2.preMature,0.5:1:15);
xlabel('number premature responses');
ylabel('frequency');
title(['Rank sum test for equal medians: P < ',num2str(Ppm)]);
legend(['median numPM ', condNames{1}, ' = ',num2str(median_num_PM_cond1)],...
    ['median numPM ', condNames{2}, ' = ',num2str(median_num_PM_cond2)]);