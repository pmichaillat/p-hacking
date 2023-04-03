%% figure3A.m
%
% Produce figure 3A
%
%% Description
%
% This script produces figure 3A. The figure displays the expected number of experiments run by a p-hacker when significance is determined by a robust critical value, as a function of the probability of completing an experiment. Expectations are taken under the null hypothesis.
% 
%% Requirements
%
% * outputFolder - Path to output folder (default: defined in main.m)
% * alpha, gamma, gammaArray, iGamma - Parameters (default: defined in main.m)
% * formatFigure.m - Predefine figure properties (default: run in main.m)
% 
%% Output
%
% * figure3A.pdf - PDF file with figure 3A
% * figure3A.csv - CSV file with data underlying figure 3A
%

%% Compute the expected number of experiments from equation (10)

NArray = (1 - (alpha .* gammaArray)) ./ (1 - gammaArray);
N = NArray(iGamma);

%% Specify figure ID

figureId = '3A';

%% Produce figure

% Set up figure window
figure('NumberTitle', 'off', 'Name', ['Figure ', figureId])
hold on

% Plot expected number of experiments
plot(gammaArray, NArray, blackLine{:})

% Mark calibrated completion probability
plot(gamma, N, blackDot{:})

% Format x-axis
set(gca, gammaAxis{:})

% Format y-axis
set(gca, ...
	'YLim', [1, 11], ...
	'YTick', 1 : 2 : 11 ...
)

% Populate labels
xlabel('Completion probability')
ylabel('Expected number of experiments')

% Save figure
print('-dpdf', fullfile(outputFolder, ['figure', figureId, '.pdf']))

%% Save figure data

header = {'Completion probability', 'Expected number of experiments'};
data = [gammaArray', NArray'];
writecell([header; num2cell(data)], fullfile(outputFolder, ['figure', figureId, '.csv']));