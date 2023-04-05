%% figure2A.m
%
% Produce figure 2A
%
%% Description
%
% This script produces figure 2A. The figure displays the critical value robust to p-hacking for a one-sided z-test with 5% significance level. The robust critical value is displayed as a function of the probability of completing an experiment.
% 
%% Output
%
% * The figure is saved as figure2A.pdf.
% * The underlying data are saved in figure2A.xlsx.
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

%% Define inverse survival function for the standard normal distribution

Z = @(x) norminv(1-x);

%% Compute robust critical value from proposition 3

critical = Z(significance .* (1 - completion) ./ (1 - (significance .* completion)));
criticalMedian = critical(iMedian);

%% Format plot

formatPlot

%% Produce figure

figure(1)
clf
hold on

% Plot robust critical value
plot(completion, critical, purpleSetting{:})
plot(completionMedian, criticalMedian, scatterSetting{:})

% Populate axes
set(gca, xSetting{:})
set(gca, 'yLim', [1.64, 3.2], 'yTick', [1.64, 1.96, 2.3:0.3:3.2])
xlabel('Completion probability')
ylabel('Robust critical value')

% Print figure
print('-dpdf','figure2A.pdf')

%% Save results

file = 'figure2A.xlsx';
sheet = 'Figure 2A';

% Write header
header = {'Completion probability', 'Robust critical value'};
writecell(header, file, 'Sheet', sheet, 'WriteMode', 'replacefile')

% Write results
result = [completion', critical'];
writematrix(result, file, 'Sheet', sheet, 'WriteMode', 'append')