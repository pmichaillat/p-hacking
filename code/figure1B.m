%% figure1B.m
%
% Produce figure 1B
%
%% Description
%
% This script produces figure 1B. The figure displays the probability of type 1 error for an hypothesis test reported by a p-hacker when significance is determined by a classical critical value, as a function of the probability of completing an experiment.
%
%% Requirements
%
% * outputFolder - Path to output folder (default: defined in main.m)
% * alpha, gamma, gammaArray, iGamma - Parameters (default: defined in main.m)
% * formatFigure.m - Predefine figure properties (default: run in main.m)
% 
%% Output
%
% * figure1B.pdf - PDF file with figure 1B
% * figure1B.csv - CSV file with data underlying figure 1B
%

%% Compute the probability of type 1 error from equation (7)

errorArray = alpha ./ (1 - (1 - alpha) .* gammaArray);
error = errorArray(iGamma);

%% Specify figure ID

figureId = '1B';

%% Produce figure

% Set up figure window
figure('NumberTitle', 'off', 'Name', ['Figure ', figureId])
hold on

% Plot probability of type 1 error
plot(gammaArray, errorArray, blackLine{:})

% Mark calibrated completion probability
plot(gamma, error, blackDot{:})

% Format x-axis
set(gca, gammaAxis{:})

% Format y-axis
set(gca, ...
	'YLim', [0.05,1], ...
	'YTick', [0.05, 0.2 : 0.2 : 1], ...
	'YTickLabel', ["5%", "20%", "40%", "60%", "80%", "100%"] ...
)

% Populate labels
xlabel('Completion probability')
ylabel('Probability of type 1 error')

% Save figure
print('-dpdf', fullfile(outputFolder, ['figure', figureId, '.pdf']))

%% Save figure data

header = {'Completion probability', 'Probability of type 1 error'};
data = [gammaArray', errorArray'];
writecell([header; num2cell(data)], fullfile(outputFolder, ['figure', figureId, '.csv']));