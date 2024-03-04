%% figure3B.m
%
% Produce figure 3B
%
%% Description
%
% This script produces figure 3B. The figure displays the expected number of experiments run by a p-hacker when significance is determined by a robust critical value against the expected number of experiments run by a p-hacker when significance is determined by a classical critical value. Expectations are taken under the null hypothesis. The significance level is set to 5%. 
% 
%% Output
%
% * The figure is saved as figure3B.pdf.
% * The underlying data are saved in figure3B.csv.
%

clear

%% Calibrate model parameters

% Significance level
alpha = 0.05;

% Range of completion probabilities
gammaArray = [0:0.01:0.99, 0.9999];

% Calibrated completion probability
gamma = 0.8;

% Index of calibrated completion probability in array
iGamma = find(gammaArray == gamma);

%% Apply equation (4) to compute the expected number of experiments with a  classical critical value

NClassicalArray = 1./(1 - (1 - alpha) .* gammaArray);
NClassical = NClassicalArray(iGamma);

%% Apply equation (10) to compute the expected number of experiments with a robust critical value

NRobustArray = (1 - (alpha .* gammaArray)) ./ (1 - gammaArray);
NRobust = NRobustArray(iGamma);

%% Format figure, axes, and plot

visualDisplay

%% Produce figure

figure(6)
clf
hold on

% Plot expected number of experiments
plot(NClassicalArray, NRobustArray, blackLine{:})
plot(NClassical, NRobust, blackDot{:})

% Plot 45-degree line
plot([0:0.1:20], [0:0.1:20], grayLine{:})

% Populate axes
set(gca, 'xLim', [1,11], 'xTick', [1:2:11])
set(gca, 'yLim', [1,11], 'yTick', [1:2:11])
xlabel('Experiments with classical critical value')
ylabel('Experiments with robust critical value')

% Print figure
print('-dpdf','figure3B.pdf')

%% Save data

file = 'figure3B.csv';

% Write header
header = {'Completion probability', 'Expected number of experiments with classical critical value', 'Expected number of experiments with robust critical value'};
writecell(header, file, 'WriteMode', 'overwrite')

% Write results
result = [gammaArray', NClassicalArray', NRobustArray'];
writematrix(result, file, 'WriteMode', 'append')