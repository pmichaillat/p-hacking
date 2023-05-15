%% figure3B.m
%
% Produce figure 3B
%
%% Description
%
% This script produces figure 3B. The figure plots the average number of experiments run by a scientist who is p-hacking when significance is determined by robust critical values against the average number of experiments run by a scientist who is p-hacking when significance is determined by classical critical values. The average numbers of experiments are computed under the null hypothesis for a broad range of completionArray probabilities. The significance level is set to 5%. 
% 
%% Output
%
% * The figure is saved as figure3B.pdf.
% * The underlying data are saved in figure3B.xlsx.
%

close all
clear
clc

%% Calibrate model parameters

% Significance level
significance = 0.05;

% Completion probability
completionArray = [0:0.01:1];
completion = 0.8;

% Index of completion probability in completion array
iCompletion = find(completionArray == completion);

%% Compute average number of experiments under classical critical value from corrolary 1

experimentsClassicalArray = 1./(1 - (1 - significance) .* completionArray);
experimentsClassical = experimentsClassicalArray(iCompletion);

%% Compute average number of experiments under robust critical value from corrolary 3

experimentsRobustArray = (1 - (significance .* completionArray)) ./ (1 - completionArray);
experimentsRobust = experimentsRobustArray(iCompletion);

%% Format plot

formatPlot

%% Produce figure

figure(1)
clf
hold on

% Plot average numbers of experiments
plot(experimentsClassicalArray, experimentsRobustArray, purpleProperties{:})
plot(experimentsClassical, experimentsRobust, scatterProperties{:})
plot([0:0.1:20], [0:0.1:20], grayProperties{:})

% Populate axes
set(gca, 'xLim', [1,11], 'xTick', [1:2:11])
set(gca, 'yLim', [1,11], 'yTick', [1:2:11])
xlabel('Experiments under classical critical value')
ylabel('Experiments under robust critical value')

% Print figure
print('-dpdf','figure3B.pdf')

%% Save results

file = 'figure3B.xlsx';
sheet = 'Figure 3B';

% Write header
header = {'Completion probability', 'Number of experiments under classical critical value', 'Number of experiments under robust critical value'};
writecell(header, file, 'Sheet', sheet, 'WriteMode', 'replacefile')

% Write results
result = [completionArray', experimentsClassicalArray', experimentsRobustArray'];
writematrix(result, file, 'Sheet', sheet, 'WriteMode', 'append')