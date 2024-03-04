%% figure3A.m
%
% Produce figure 3A
%
%% Description
%
% This script produces figure 3A. The figure displays the expected number of experiments run by a p-hacker when significance is determined by a robust critical value, as a function of the probability of completing an experiment. Expectations are taken under the null hypothesis. The significance level is set to 5%. 
% 
%% Output
%
% * The figure is saved as figure3A.pdf.
% * The underlying data are saved in figure3A.csv.
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

%% Apply equation (10) to compute the expected number of experiments

NArray = (1 - (alpha .* gammaArray)) ./ (1 - gammaArray);
N = NArray(iGamma);

%% Format figure, axes, and plot

visualDisplay

%% Produce figure

figure(5)
clf
hold on

% Plot expected number of experiments
plot(gammaArray, NArray, blackLine{:})
plot(gamma, N, blackDot{:})

% Populate axes
set(gca, gammaAxis{:})
set(gca, 'yLim', [1,11], 'yTick', [1:2:11])
xlabel('Completion probability')
ylabel('Expected number of experiments')

% Print figure
print('-dpdf','figure3A.pdf')

%% Save data

file = 'figure3A.csv';

% Write header
header = {'Completion probability', 'Expected number of experiments'};
writecell(header, file, 'WriteMode', 'overwrite')

% Write results
result = [gammaArray', NArray'];
writematrix(result, file, 'WriteMode', 'append')