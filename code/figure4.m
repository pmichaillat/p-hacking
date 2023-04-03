%% figure4.m
%
% Produce figures 4A, 4B, and 4C
%
%% Description
%
% This script produces figures 4A, 4B, and 4C. The figures describe the result of the iterative application of a Bonferroni correction against p-hacking when the p-hacker conducts a one-sided z-test with 5% significance level:
%
% * Figure 4A displays the critical value obtained by Bonferroni correction at each step (there is no correction in step 1). 
% * Figure 4B displays the expected number of experiments run by a p-hacker when significance is determined by the critical value displayed in figure 4A. Expectations are taken under the null hypothesis. 
% * Figure 4C displays the probability of type 1 error at each step. The probability to complete an experiment is set to 80%.
% 
%% Requirements
%
% * outputFolder - Path to output folder (default: defined in main.m)
% * alpha, gamma, gammaArray, iGamma - Parameters (default: defined in main.m)
% * formatFigure.m - Predefine figure properties (default: run in main.m)
% 
%% Output
%
% * figure4A.pdf - PDF file with figure 4A
% * figure4A.csv - CSV file with data underlying figure 4A
% * figure4B.pdf - PDF file with figure 4B
% * figure4B.csv - CSV file with data underlying figure 4B
% * figure4C.pdf - PDF file with figure 4C
% * figure4C.csv - CSV file with data underlying figure 4C
%

%% Define functions related to the standard normal distribution

% Cumulative distribution function
F = @(z) normcdf(z);

% Survival function
S = @(z) 1 - normcdf(z);

% Inverse survival function
Z = @(a) norminv(1 - a);

%% Compute the critical value robust to p-hacking from equation (9)

zStar = Z(alpha .* (1 - gamma) ./ (1 - alpha .* gamma));

%% Compute the expected number of experiments under the robust critical value from equation (10)

NStar = (1 - alpha .* gamma) ./ (1 - gamma);

%% Compute the expected number of experiments under a generic critical value from equation (3)

N = @(z) 1 ./ (1 - gamma .* F(z));

%% Compute the probability of type 1 error under a generic critical value from equation (6) 

SStar = @(z) S(z) .* N(z);

%% Apply the Bonferroni correction against p-hacking iteratively

% Number of steps
nStep = 100;
stepArray = 1 : nStep;

% Initialization
zArray = zeros(1, nStep);
NArray = ones(1, nStep + 1);
SStarArray = zeros(1, nStep);

% Iterations
for iStep = stepArray
	z = Z(alpha ./ NArray(iStep));
	zArray(iStep) = z;
	NArray(iStep + 1) = N(z);
	SStarArray(iStep) = SStar(z);
end

%% Produce figure 4A

% Specify figure ID

figureId = '4A';

% Set up figure window
figure('NumberTitle', 'off', 'Name', ['Figure ', figureId])
hold on

% Plot critical value obtained by Bonferroni correction
plot(stepArray, zArray, dashedLine{:})

% Format x-axis
set(gca, stepAxis{:})

% Format y-axis
set(gca, ...
	'YLim', [1.64, zStar], ...
	'YTick', [1.64, 1.8, 2.0, 2.2, zStar], ...
	'YTickLabel', ["1.64", "1.8", "2.0", "2.2", "2.31"] ...
)

% Populate labels
xlabel('Corrective step')
ylabel('Critical value')

% Save figure
print('-dpdf', fullfile(outputFolder, ['figure', figureId, '.pdf']))

% Save figure data

header = {'Corrective step', 'Critical value'};
data = [stepArray', zArray'];
writecell([header; num2cell(data)], fullfile(outputFolder, ['figure', figureId, '.csv']));

%% Produce figure 4B

% Specify figure ID

figureId = '4B';

% Set up figure window
figure('NumberTitle', 'off', 'Name', ['Figure ', figureId])
hold on

% Plot expected number of experiments
plot(stepArray, NArray(2 : end), dashedLine{:})

% Format x-axis
set(gca, stepAxis{:})

% Format y-axis
set(gca, ...
	'YLim', [4, NStar], ...
	'YTick', [4, 4.2, 4.4, 4.6, NStar], ...
	'YTickLabel', ["4.0", "4.2", "4.4", "4.6", "4.8"] ...
)

% Populate labels
xlabel('Corrective step')
ylabel('Expected number of experiments')

% Save figure
print('-dpdf', fullfile(outputFolder, ['figure', figureId, '.pdf']))

% Save figure data

header = {'Corrective step', 'Expected number of experiments'};
data = [stepArray', NArray(2 : end)'];
writecell([header; num2cell(data)], fullfile(outputFolder, ['figure', figureId, '.csv']));

%% Produce figure 4C

% Specify figure ID

figureId = '4C';

% Set up figure window
figure('NumberTitle', 'off', 'Name', ['Figure ', figureId])
hold on

% Plot probability of type 1 error
plot(stepArray, SStarArray, dashedLine{:})

% Format x-axis
set(gca, stepAxis{:})

% Format y-axis
set(gca, ...
	'YLim', [0.05, 0.25], ...
	'YTick', 0.05 : 0.05 : 0.25, ...
	'YTickLabel', ["5%", "10%", "15%", "20%", "25%"] ...
)

% Populate labels
xlabel('Corrective step')
ylabel('Probability of type 1 error')

% Save figure
print('-dpdf', fullfile(outputFolder, ['figure', figureId, '.pdf']))

% Save figure data

header = {'Corrective step', 'Probability of type 1 error'};
data = [stepArray', SStarArray'];
writecell([header; num2cell(data)], fullfile(outputFolder, ['figure', figureId, '.csv']));