function PMR = gk_ratpsy_get_prematureResponses(data)

d=data.description;
allDataPre=gk_ratpsy_collapseTimepoints(data,'allPre');
allDataPost=gk_ratpsy_collapseTimepoints(data,'allPost');

% get the PMR for different conditions (NOTE: J60rats and SALrats is now
% defined in the data.description

PMR.J60.pre.all=allDataPre.prematureResponses(ismember(allDataPre.ratNumber,d.J60rats));
PMR.J60.post.all=allDataPost.prematureResponses(ismember(allDataPost.ratNumber,d.J60rats));
PMR.SAL.pre.all=allDataPre.prematureResponses(ismember(allDataPre.ratNumber,d.SALrats));
PMR.SAL.post.all=allDataPost.prematureResponses(ismember(allDataPost.ratNumber,d.SALrats));

PMR.rat.pre.all=allDataPre.prematureResponses(ismember(allDataPre.ratNumber,d.J60rats));

