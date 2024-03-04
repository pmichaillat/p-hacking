%% figure4.m
%
% Produce figures 4A, 4B, and 4C
%
%% Description
%
% This script produces figures 4A, 4B, and 4C. The figures describe the result of the iterative application of a Bonferroni correction against p-hacking when the p-hacker conducts a one-sided z-test with 5% significance level. Figure 4A displays the critical value obtained by Bonferroni correction at each step (there is no correction in step 1). Figure 4B displays the expected number of experiments run by a p-hacker when significance is determined by the critical value displayed in figure 4A. Expectations are taken under the null hypothesis. Figure 4C displays the probability of type 1 error at each step. The probability to complete an experiment is set to 80%.
% 
%% Output
%
% * Figure 4A is saved as figure4A.pdf. 
% * The data underlying figure 4A are saved in figure4A.csv.
% * Figure 4B is saved as figure4B.pdf. 
% * The data underlying figure 4B are saved in figure4B.csv.
% * Figure 4C is saved as figure4C.pdf. 
% * The data underlying figure 4C are saved in figure4C.csv.
%

clear

%% Calibrate model parameters

% Significance level
alpha = 0.05;

% Completion probability
gamma = 0.8;

%% Introduce functions related to the standard normal distribution

% Cumulative distribution function
F = @(z) normcdf(z);

% Survival function
S = @(z) 1 - normcdf(z);

% Inverse survival function
Z = @(a) norminv(1 - a);

%% Apply equation (9) to compute the critical value robust to p-hacking

zStar = Z(alpha .* (1 - gamma)./(1 - alpha .* gamma));

%% Apply equation (10) to compute the expected number of experiments with the robust critical value

NStar = (1 - alpha .* gamma)./ (1 - gamma);

%% Apply equation (3) to compute expected number of experiments with a generic critical value

N = @(z) 1./(1 - gamma .* F(z));

%% Apply equation (6) to compute the probability of type 1 error with a generic critical value

SStar = @(z) S(z) .* N(z);

%% Iterative application of Bonferroni correction against p-hacking

% Number of steps
nStep = 100;
stepArray = [1 : nStep];

% Initialization
zArray = [];
NArray = [1];
SStarArray = [];

% Iterations
for iStep = stepArray
	z = Z(alpha/NArray(iStep));
	zArray(iStep) = z;
	NArray(iStep+1) = N(z);
	SStarArray(iStep) = SStar(z);
end

%% Format figures, axes, and plot

visualDisplay

%% Produce figure 4A

figure(7)
clf
hold on

% Plot critical value obtained by Bonferroni correction
plot(stepArray, zArray, dashedLine{:})

% Populate axes
set(gca, stepAxis{:})
set(gca, 'yLim', [1.64, zStar], 'yTick', [1.64, 1.8:0.2:2.2, zStar],'yTickLabel', ['1.64';' 1.8'; ' 2.0'; ' 2.2'; '2.31'])
xlabel('Corrective step')
ylabel('Critical value')

% Print figure
print('-dpdf','figure4A.pdf')

%% Save data for figure 4A

file = 'figure4A.csv';

% Write header
header = {'Corrective step', 'Critical value'};
writecell(header, file, 'WriteMode', 'overwrite')

% Write results
result = [stepArray', zArray'];
writematrix(result, file, 'WriteMode', 'append')

%% Produce figure 4B

figure(8)
clf
hold on

% Plot expected number of experiments
plot(stepArray, NArray(2:end), dashedLine{:})

% Populate axes
set(gca, stepAxis{:})
set(gca, 'yLim', [4, NStar], 'yTick', [4,4.2,4.4,4.6,NStar], 'yTickLabel', ['4.0';'4.2'; '4.4'; '4.6'; '4.8'])
xlabel('Corrective step')
ylabel('Expected number of experiments')

% Print figure
print('-dpdf','figure4B.pdf')

%% Save data for figure 4B

file = 'figure4B.csv';

% Write header
header = {'Corrective step', 'Expected number of experiments'};
writecell(header, file, 'WriteMode', 'overwrite')

% Write results
result = [stepArray', NArray(2:end)'];
writematrix(result, file, 'WriteMode', 'append')

%% Produce figure 4C

figure(9)
clf
hold on

% Plot probability of type 1 error
plot(stepArray, SStarArray, dashedLine{:})

% Populate axes
set(gca, stepAxis{:})
set(gca, 'yLim', [0.05, 0.25], 'yTick', [0.05:0.05:0.25], 'yTickLabel', [' 5%';'10%'; '15%'; '20%'; '25%'])
xlabel('Corrective step')
ylabel('Probability of type 1 error')

% Print figure
print('-dpdf','figure4C.pdf')

%% Save data for figure 4C

file = 'figure4C.csv';

% Write header
header = {'Corrective step', 'Probability of type 1 error'};
writecell(header, file, 'WriteMode', 'overwrite')

% Write results
result = [stepArray', SStarArray'];
writematrix(result, file, 'WriteMode', 'append')