%% Visualization for the data:
addpath('data/')
healthy = readmatrix("data/data.xlsx",'Sheet','No.2WT'); % Healthy turbine
WT3 = readmatrix("data/data.xlsx",'Sheet','No.3');
faulty14 = readmatrix("data/data.xlsx",'Sheet','No.14WT');
faulty39 = readmatrix("data/data.xlsx",'Sheet','No.39WT');


%% 
% WT3 data seems to not be in any consistent order compared to other
% datasets, and also has extra columns compared to them, so we are not
% using the data in this analysis.
% Dropping the last column from the healthy, because it is an extra quality
% variable and is not found from the remaining datasets.

% Dropping the last column of healthy
healthy(:,end) = [];

% Normalized datas:
norm_healthy = zscore(healthy)
norm_faulty14 = zscore(faulty14)
norm_faulty39 = zscore(faulty39)

% Corresponding box plots:
boxplot(norm_healthy)
title('Healthy turbine (WT3)')
figure
boxplot(norm_faulty14)
title('Faulty turbine (WT14)')
figure
boxplot(norm_faulty39)
title('Faulty turbine (WT39)')

%% Missing values
clc
missing_2 = sum(isnan(healthy))
missing_14 = sum(isnan(faulty14))
missing_39 = sum(isnan(faulty39))


%% Data summary

mean_2 = mean(healthy);
mean_14 = mean(healthy);
mean_39 = mean(healthy);

min_2 = min(healthy);
min_14 = min(faulty14);
min_39 = min(faulty39);

max_2 = max(healthy);
max_14 = max(faulty14);
max_39 = max(faulty39);


%%
% Time series plots:
plotdata(norm_healthy,norm_faulty14,norm_faulty39,1)

plotdata(norm_healthy,norm_faulty14,norm_faulty39,2)

plotdata(norm_healthy,norm_faulty14,norm_faulty39,3)


%%





%% Pretreatment

function [H] = plotdata(healthy,faulty14,faulty39,column)
    figure
    hold on
    plot(healthy(:,column),'g-')
    plot(faulty14(:,column),'r--')
    plot(faulty39(:,column),'b--')
    title('Time series for feature ',column)
    legend('healthy','faulty14','faulty39')
end
