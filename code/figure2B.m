%% figure2B.m
%
% Produce figure 2B
%
%% Description
%
% This script produces figure 2B. The figure displays the critical value robust to p-hacking for a two-sided z-test with 5% significance level, as a function of the probability of completing an experiment.
% 
%% Output
%
% * The figure is saved as figure2B.pdf.
% * The underlying data are saved in figure2B.csv.
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

%% Introduce inverse survival function for the standard half-normal distribution

Z = @(x) norminv(1-x./2);

%% Apply equation (9) to compute the robust critical value

zStarArray = Z(alpha .* (1 - gammaArray) ./ (1 - (alpha .* gammaArray)));
zStar = zStarArray(iGamma);

%% Format figure, axes, and plot

visualDisplay

%% Produce figure

figure(4)
clf
hold on

% Plot robust critical value
plot(gammaArray, zStarArray, blackLine{:})
plot(gamma, zStar, blackDot{:})

% Populate axes
set(gca, gammaAxis{:})
set(gca, 'yLim', [1.64, 3.2], 'yTick', [1.64, 1.96, 2.3:0.3:3.2])
xlabel('Completion probability')
ylabel('Robust critical value')

% Print figure
print('-dpdf','figure2B.pdf')

%% Save data

file = 'figure2B.csv';

% Write header
header = {'Completion probability', 'Robust critical value'};
writecell(header, file, 'WriteMode', 'overwrite')

% Write results
result = [gammaArray', zStarArray'];
writematrix(result, file, 'WriteMode', 'append')