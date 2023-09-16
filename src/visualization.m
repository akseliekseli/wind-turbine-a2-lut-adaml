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