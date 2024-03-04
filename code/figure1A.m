%% figure1A.m
%
% Produce figure 1A
%
%% Description
%
% This script produces figure 1A. The figure displays the expected number of experiments run by a p-hacker when significance is determined by a classical critical value, as a function of the probability of completing an experiment. Expectations are taken under the null hypothesis. The significance level is set to 5%. 
% 
%% Output
%
% * The figure is saved as figure1A.pdf.
% * The underlying data are saved in figure1A.csv.
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

%% Apply equation (4) to compute the expected number of experiments

NArray = 1./(1 - (1 - alpha) .* gammaArray);
N = NArray(iGamma);

%% Format figure, axes, and plot

visualDisplay

%% Produce figure

figure(1)
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
print('-dpdf','figure1A.pdf')

%% Save data

file = 'figure1A.csv';

% Write header
header = {'Completion probability', 'Expected number of experiments'};
writecell(header, file, 'WriteMode', 'overwrite')

% Write results
result = [gammaArray', NArray'];
writematrix(result, file, 'WriteMode', 'append')