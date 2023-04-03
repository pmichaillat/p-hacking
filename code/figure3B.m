%% figure3B.m
%
% Produce figure 3B
%
%% Description
%
% This script produces figure 3B. The figure displays the expected number of experiments run by a p-hacker when significance is determined by a robust critical value against the expected number of experiments run by a p-hacker when significance is determined by a classical critical value. Expectations are taken under the null hypothesis.
% 
%% Requirements
%
% * outputFolder - Path to output folder (default: defined in main.m)
% * alpha, gamma, gammaArray, iGamma - Parameters (default: defined in main.m)
% * formatFigure.m - Predefine figure properties (default: run in main.m)
% 
%% Output
%
% * figure3B.pdf - PDF file with figure 3B
% * figure3B.csv - CSV file with data underlying figure 3B
%

%% Compute the expected number of experiments under a classical critical value from equation (4)

NClassicalArray = 1 ./ (1 - (1 - alpha) .* gammaArray);
NClassical = NClassicalArray(iGamma);

%% Compute the expected number of experiments under a robust critical value from equation (10)

NRobustArray = (1 - (alpha .* gammaArray)) ./ (1 - gammaArray);
NRobust = NRobustArray(iGamma);

%% Specify figure ID

figureId = '3B';

%% Produce figure

% Set up figure window
figure('NumberTitle', 'off', 'Name', ['Figure ', figureId])
hold on

% Plot expected number of experiments
plot(NClassicalArray, NRobustArray, blackLine{:})

% Mark calibrated completion probability
plot(NClassical, NRobust, blackDot{:})

% Plot 45-degree line
plot(0 : 0.1 : 20, 0 : 0.1 : 20, grayLine{:})

% Format axes
set(gca, ...
	'XLim', [1, 11], ...
	'XTick', 1 : 2 : 11, ...
	'YLim', [1, 11], ...
	'YTick', 1 : 2 : 11 ...
)

% Populate labels
xlabel('Experiments with classical critical value')
ylabel('Experiments with robust critical value')

% Save figure
print('-dpdf', fullfile(outputFolder, ['figure', figureId, '.pdf']))

%% Save figure data

header = {'Completion probability', 'Expected number of experiments with classical critical value', 'Expected number of experiments with robust critical value'};
data = [gammaArray', NClassicalArray', NRobustArray'];
writecell([header; num2cell(data)], fullfile(outputFolder, ['figure', figureId, '.csv']));