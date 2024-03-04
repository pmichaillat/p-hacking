%% figure1B.m
%
% Produce figure 1B
%
%% Description
%
% This script produces figure 1B. The figure displays the probability of type 1 error for an hypothesis test reported by a p-hacker when significance is determined by a classical critical value, as a function of the probability of completing an experiment. The significance level is set to 5%.
% 
%% Output
%
% * The figure is saved as figure1B.pdf.
% * The underlying data are saved in figure1B.csv.
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

%% Apply equation (7) to compute the probability of type 1 error

errorArray = alpha ./ (1 - (1 - alpha) .* gammaArray);
error = errorArray(iGamma);

%% Format figure, axes, and plot

visualDisplay

%% Produce figure

figure(2)
clf
hold on

% Plot probability of type 1 error
plot(gammaArray, errorArray, blackLine{:})
plot(gamma, error, blackDot{:})

% Populate axes
set(gca, gammaAxis{:})
set(gca, 'yLim', [0.05,1], 'yTick', [0.05,0.2:0.2:1], 'yTickLabel', ['  5%';' 20%';' 40%';' 60%';' 80%';'100%'])
xlabel('Completion probability')
ylabel('Probability of type 1 error')

% Print figure
print('-dpdf','figure1B.pdf')

%% Save data

file = 'figure1B.csv';

% Write header
header = {'Completion probability', 'Probability of type 1 error'};
writecell(header, file, 'WriteMode', 'overwrite')

% Write results
result = [gammaArray', errorArray'];
writematrix(result, file, 'WriteMode', 'append')