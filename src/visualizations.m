%% Loading data
addpath('data/')
WT2 = readmatrix("data/data.xlsx",'Sheet','No.2WT'); % Healthy turbine, drop last from this
WT3 = readmatrix("data/data.xlsx",'Sheet','No.3'); % drop this
WT14 = readmatrix("data/data.xlsx",'Sheet','No.14WT');
WT39 = readmatrix("data/data.xlsx",'Sheet','No.39WT');

%% Variable distributions
% Normalizing data:
norm_WT2 = zscore(WT2);
norm_WT3 = zscore(WT3);
norm_WT14 = zscore(WT14);
norm_WT39 = zscore(WT39);

% Data distributions as box plots:
boxplot(norm_WT2), grid on
title('Healthy turbine (WT2)')
figure
boxplot(norm_WT3), grid on
title('Faulty turbine (WT3)')
figure
boxplot(norm_WT14), grid on
title('Faulty turbine (WT14)')
figure
boxplot(norm_WT39), grid on
title('Faulty turbine (WT39)')

% % Dropping the last column of WT2
% WT2(:,end) = [];

%% Number of observations per wind turbine:
sizewt2 = size(WT2,1); featurecountwt2 = size(WT2,2);
sizewt3 = size(WT3,1); featurecountwt3 = size(WT3,2);
sizewt14 = size(WT14,1); featurecountwt14 = size(WT14,2);
sizewt39 = size(WT39,1); featurecountwt39 = size(WT39,2);

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
%%
% Time series plots:
% ivals = [3:8,10:11, 15:22,24:25];
ivals = [3,5,7,10,16,17,19,20,21,22,24,25];
ivals = 1:2
for i = 1:length(ivals)
    subplot(1,2,i)
%     figure
    plotdata(norm_WT2,norm_WT14,norm_WT39,ivals(i))
end


%% 
% WT3 data seems to not be in any consistent order compared to other
% datasets, and also has extra columns compared to them, so we are not
% using the data in this analysis.
% Dropping the last column from the WT2, because it is an extra quality
% variable and is not found from the remaining datasets.

%% Pretreatment

function [H] = plotdata(WT2,WT14,WT39,column)
    hold on
    plot(WT2(:,column),'g-')
    plot(WT14(:,column),'r--')
    plot(WT39(:,column),'b--')
    title('Feature ',column)
    legend('WT2','WT14','WT39')
    grid on
end
