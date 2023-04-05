%% figure1A.m
%
% Produce figure 1A
%
%% Description
%
% This script produces figure 1A. The figure displays the average number of experiments run by a scientist who is p-hacking, when significance is determined by classical critical values. The average number of experiments is computed under the null hypothesis and displayed as a function of the probability of completing an experiment. The significance level is set to 5%. 
% 
%% Output
%
% * The figure is saved as figure1A.pdf.
% * The underlying data are saved in figure1A.xlsx.
%

close all
clear
clc

%% Calibrate model parameters

% Significance level
significance = 0.05;

% Completion probability
completion = [0:0.01:1];
completionMedian = 0.8;

% Index of median completion probability in completion array
iMedian = find(completion == completionMedian);

%% Compute average number of experiments from corrolary 1

experiments = 1./(1 - (1 - significance) .* completion);
experimentsMedian = experiments(iMedian);

%% Format plot

formatPlot

%% Produce figure

figure(1)
clf
hold on

% Plot average number of experiments
plot(completion, experiments, purpleSetting{:})
plot(completionMedian, experimentsMedian, scatterSetting{:})

% Populate axes
set(gca, xSetting{:})
set(gca,'yLim',[1,11],'yTick',[1:2:11])
xlabel('Completion probability')
ylabel('Experiments')

% Print figure
print('-dpdf','figure1A.pdf')

%% Save results

file = 'figure1A.xlsx';
sheet = 'Figure 1A';

% Write header
header = {'Completion probability', 'Number of experiments'};
writecell(header, file, 'Sheet', sheet, 'WriteMode', 'replacefile')

% Write results
result = [completion', experiments'];
writematrix(result, file, 'Sheet', sheet, 'WriteMode', 'append')