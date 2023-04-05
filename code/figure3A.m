%% figure3A.m
%
% Produce figure 3A
%
%% Description
%
% This script produces figure 3A. The figure displays the average number of experiments run by a scientist who is p-hacking, when significance is determined by robust critical values. The average number of experiments is computed under the null hypothesis and displayed as a function of the probability of completing an experiment. The significance level is set to 5%. 
% 
%% Output
%
% * The figure is saved as figure3A.pdf.
% * The underlying data are saved in figure3A.xlsx.
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

%% Compute average number of experiments from corrolary 3

experiments = (1 - (significance .* completion)) ./ (1 - completion);
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
print('-dpdf','figure3A.pdf')

%% Save results

file = 'figure3A.xlsx';
sheet = 'Figure 3A';

% Write header
header = {'Completion probability', 'Number of experiments'};
writecell(header, file, 'Sheet', sheet, 'WriteMode', 'replacefile')

% Write results
result = [completion', experiments'];
writematrix(result, file, 'Sheet', sheet, 'WriteMode', 'append')