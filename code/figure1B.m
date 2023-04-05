%% figure1B.m
%
% Produce figure 1B
%
%% Description
%
% This script produces figure 1B. The figure displays the type 1 error rate for hypothesis tests conducted by a scientist who is p-hacking, when significance is determined by classical critical values. The type 1 error rate is displayed as a function of the probability of completing an experiment. The significance level is set to 5%.
% 
%% Output
%
% * The figure is saved as figure1B.pdf.
% * The underlying data are saved in figure1B.xlsx.
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

%% Compute type 1 error rate from proposition 2

type1 = significance ./(1 - (1 - significance) .* completion);
type1Median = type1(iMedian);

%% Format plot

formatPlot

%% Produce figure

figure(1)
clf
hold on

% Plot type 1 error rate
plot(completion, type1, purpleSetting{:})
plot(completionMedian, type1Median, scatterSetting{:})

% Populate axes
set(gca, xSetting{:})
set(gca,'yLim',[0.05,1],'yTick',[0.05,0.2:0.2:1],'yTickLabel',['  5%';' 20%';' 40%';' 60%';' 80%';'100%'])
xlabel('Completion probability')
ylabel('Type 1 error rate')

% Print figure
print('-dpdf','figure1B.pdf')

%% Save results

file = 'figure1B.xlsx';
sheet = 'Figure 1B';

% Write header
header = {'Completion probability', 'Type 1 error rate'};
writecell(header, file, 'Sheet', sheet, 'WriteMode', 'replacefile')

% Write results
result = [completion', type1'];
writematrix(result, file, 'Sheet', sheet, 'WriteMode', 'append')