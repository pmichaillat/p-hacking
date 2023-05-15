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
completionArray = [0:0.01:1];
completion = 0.8;

% Index of completion probability in completion array
iCompletion = find(completionArray == completion);

%% Compute type 1 error rate from corollary 2

type1Array = significance ./(1 - (1 - significance) .* completionArray);
type1 = type1Array(iCompletion);

%% Format plot

formatPlot

%% Produce figure

figure(1)
clf
hold on

% Plot type 1 error rate
plot(completionArray, type1Array, purpleProperties{:})
plot(completion, type1, scatterProperties{:})

% Populate axes
set(gca, xProperties{:})
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
result = [completionArray', type1Array'];
writematrix(result, file, 'Sheet', sheet, 'WriteMode', 'append')