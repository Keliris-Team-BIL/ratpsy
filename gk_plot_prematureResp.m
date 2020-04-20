function gk_plot_prematureResp(PM1, PM2, condNames)
% USAGE: gk_plot_prematureResp(PM1, [PM2], condNames)
%
% GAK Aug 2019

% FIGURE PREMATURE RESPONSES
figure; hold on;
median_PM1=median(double(PM1(PM1>0))); % we only consider the trials that had PMR
prcPM1=100*numel(find(PM1>0))./numel(PM1);
histogram(PM1,0.5:1:15)
xlabel('number premature responses');
ylabel('frequency');

if ~isempty(PM2)
    median_PM2=median(double(PM2(PM2>0)));
    prcPM2=100*numel(find(PM2>0))./numel(PM2);
    histogram(PM2,0.5:1:15);
    Ppm=ranksum(PM1(PM1>0), PM2(PM2>0));
    title(['Rank sum test for equal medians: P < ',num2str(Ppm),...
        ', ',condNames{1},' = ',num2str(prcPM1),'%, ',...
        condNames{2},' = ',num2str(prcPM2),'%']);
    legend(['median numPM ', condNames{1}, ' = ',num2str(median_PM1)],...
        ['median numPM ', condNames{2}, ' = ',num2str(median_PM2)]);
else
    title([condNames{1},' = ',num2str(prcPM1),'%, median = ',num2str(median_PM1)]);
end