%% Visualization for the data:
addpath('data/')
WT2 = readmatrix("data/data.xlsx",'Sheet','No.2WT'); % Healthy turbine, drop last from this
WT3 = readmatrix("data/data.xlsx",'Sheet','No.3'); % drop this
WT14 = readmatrix("data/data.xlsx",'Sheet','No.14WT');
WT39 = readmatrix("data/data.xlsx",'Sheet','No.39WT');

%% Variable distributions
% Normalizing data:
norm_WT2 = zscore(WT2);
norm_WT14 = zscore(WT14);
norm_WT39 = zscore(WT39);

% Box plots:
boxplot(norm_WT2)
title('Healthy turbine (WT2)')
figure
boxplot(norm_WT14)
title('Faulty turbine (W14)')
figure
boxplot(norm_WT39)
title('Faulty turbine (WT39)')

%% Number of observations per wind turbine:
sizewt1 = size(WT2,1);
sizewt2 = size(WT3,1);
sizewt3 = size(WT14,1);
sizewt39 = size(WT39,1);

%% Type of measurements
% It's known that the data is time series (no time data, but measurements
% are every 10th second).

%% 
% WT3 data seems to not be in any consistent order compared to other
% datasets, and also has extra columns compared to them, so we are not
% using the data in this analysis.
% Dropping the last column from the WT2, because it is an extra quality
% variable and is not found from the remaining datasets.




% Time series plots:
figure
plot(norm_WT2)
