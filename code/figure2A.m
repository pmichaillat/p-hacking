%% figure2A.m
%
% Produce figure 2A
%
%% Description
%
% This script produces figure 2A. The figure displays the critical value robust to p-hacking for a one-sided z-test with 5% significance level, as a function of the probability of completing an experiment.
% 
%% Requirements
%
% * outputFolder - Path to output folder (default: defined in main.m)
% * alpha, gamma, gammaArray, iGamma - Parameters (default: defined in main.m)
% * formatFigure.m - Predefine figure properties (default: run in main.m)
% 
%% Output
%
% * figure2A.pdf - PDF file with figure 2A
% * figure2A.csv - CSV file with data underlying figure 2A
%

%% Define the inverse survival function for the standard normal distribution

Z = @(x) norminv(1 - x);

%% Compute the robust critical value from equation (9)

zStarArray = Z(alpha .* (1 - gammaArray) ./ (1 - (alpha .* gammaArray)));
zStar = zStarArray(iGamma);

%% Specify figure ID

figureId = '2A';

%% Produce figure

% Set up figure window
figure('NumberTitle', 'off', 'Name', ['Figure ', figureId])
hold on

% Plot robust critical value
plot(gammaArray, zStarArray, blackLine{:})

% Mark calibrated completion probability
plot(gamma, zStar, blackDot{:})

% Format x-axis
set(gca, gammaAxis{:})

% Format y-axis
set(gca, ...
	'YLim', [1.64, 3.2], ...
	'YTick', [1.64, 1.96, 2.3 : 0.3 : 3.2] ...
)

% Populate labels
xlabel('Completion probability')
ylabel('Robust critical value')

% Save figure
print('-dpdf', fullfile(outputFolder, ['figure', figureId, '.pdf']))

%% Save figure data

header = {'Completion probability', 'Robust critical value'};
data = [gammaArray', zStarArray'];
writecell([header; num2cell(data)], fullfile(outputFolder, ['figure', figureId, '.csv']));