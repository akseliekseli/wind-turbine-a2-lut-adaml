%% Visualization for the data:
addpath('data/')
WT2 = readmatrix("data/data.xlsx",'Sheet','No.2WT'); % Healthy turbine
WT3 = readmatrix("data/data.xlsx",'Sheet','No.3');
WT14 = readmatrix("data/data.xlsx",'Sheet','No.14WT');
WT39 = readmatrix("data/data.xlsx",'Sheet','No.39WT');


%% 
% WT3 data seems to not be in any consistent order compared to other
% datasets, and also has extra columns compared to them, so we are not
% using the data in this analysis.
% Dropping the last column from the WT2, because it is an extra quality
% variable and is not found from the remaining datasets.

% Dropping the last column of WT2
WT2(:,end) = [];

% Normalized datas:
norm_WT2 = zscore(WT2)
norm_WT14 = zscore(WT14)
norm_WT39 = zscore(WT39)

% Corresponding box plots:
boxplot(norm_WT2)
title('Healthy turbine (WT2)')
figure
boxplot(norm_WT14)
title('Faulty turbine (W14)')
figure
boxplot(norm_WT39)
title('Faulty turbine (WT39)')

%%
% Time series plots:
plotdata(norm_WT2,norm_WT14,norm_WT39,1)

%% Pretreatment

function [H] = plotdata(WT2,WT14,WT39,column)
    figure
    hold on
    plot(WT2(:,column),'g-')
    plot(WT14(:,column),'r--')
    plot(WT39(:,column),'b--')
    title('Time series for feature ',column)
    legend('WT2','WT14','WT39')
end
